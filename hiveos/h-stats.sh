#!/usr/bin/env bash

source /hive/miners/custom/aleo_prover/aleo_prover.conf

gpu_stats_nvidia=$(jq '[.brand, .temp, .fan, .power, .busids, .mtemp, .jtemp] | transpose | map(select(.[0] == "nvidia")) | transpose' <<< $gpu_stats)
gpu_temp=$(jq -c '[.[1][]]' <<< "$gpu_stats_nvidia")
gpu_fan=$(jq -c '[.[2][]]' <<< "$gpu_stats_nvidia")
gpu_bus=$(jq -c '[.[4][]]' <<< "$gpu_stats_nvidia")
gpu_count=$(jq '.busids | select(. != null) | length' <<< $gpu_stats)
hs_units="hs"

total_hashrate=$(tail -n 50 ${CUSTOM_LOG_BASENAME}.log | grep -F "gpu[*]:" | tail -n 1 | awk '{print $5}')
khs=$(echo "scale=5; $total_hashrate/1000" | bc)

declare -A hs  # Declare an associative array to store hashrate values

# Get GPU 1m values
readarray -t gpu_values < <(tail -n 50 ${CUSTOM_LOG_BASENAME}.log | sed -n '/gpu\[0\]/,/gpu\[\*\]/p' | head -n -1 | tac | awk '/gpu\[\*]/{exit} {print}' | tac | sed 's/.*1m - \([0-9]*\).*/\1/')

uptime=$(ps -o etimes= -C $CUSTOM_NAME | awk '{print $1}')

gpu_count=${#gpu_values[@]}

for (( i=0; i < ${gpu_count}; i++ )); do
   busid=$(jq .[$i] <<< "$gpu_bus")
   bus_numbers[$i]=`echo $busid | cut -d ":" -f1 | cut -c2- | awk -F: '{ printf "%d\n",("0x"$1) }'`
   gpu_1m_values[$i]=${gpu_values[$i]}
   hs[$i]=${gpu_1m_values[$i]}
   echo "GPU[$i] - Bus: ${bus_numbers[$i]}, 1m value: ${gpu_1m_values[$i]}"
done

ac=$(grep -i 'found a solution' "${CUSTOM_LOG_BASENAME}.log" | wc -l)
rj=0
stats=$(jq -nc \
        --arg total_khs "$khs" \
        --arg khs "$khs" \
        --arg hs_units "$hs_units" \
        --argjson hs "$(echo "${hs[@]}" | jq -Rcs 'split(" ")')" \
        --argjson temp "${gpu_temp}" \
        --argjson fan "${gpu_fan}" \
        --arg uptime "$uptime" \
        --arg ver "${CUSTOM_VERSION}" \
        --arg ac "$ac" --arg rj "$rj" \
        --arg algo "${CUSTOM_ALGO}" \
        --argjson bus_numbers "`echo ${bus_numbers[@]} | tr " " "\n" | jq -cs '.'`" \
        '{$total_khs, $khs, $hs_units, $hs, $temp, $fan, $uptime, $ver, ar: [$ac, $rj], $algo, $bus_numbers}')

[[ -z $khs ]] && khs=0
[[ -z $stats ]] && stats="null"
echo $stats
echo $khs
