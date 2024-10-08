#!/usr/bin/env bash
#set -x

source /hive/miners/custom/aleo_prover/aleo_prover.conf

logPart=$(tail -n 50 ${CUSTOM_LOG_BASENAME}.log)

#################################################################################################################################################
#The main reason of error like "an illegal memory access was encountered" and other is too high OC. It's ok.
#But you need to fix error handling inside miner (you just need to implement correct an exception handling and stop miner instead of send error message continously).
#Since miner is not open sourced all what I can do to prevent RAM\HDD overflowing and freezeing - to grab the error message from logs and restart miner.
#This small fix does its job pretty well though. :)

[[ -n $(echo "$logPart" | grep "Failed find valid proof target in range") ]] && \

#This part is optional. It just saves BUSID of faulted GPUs to the logfile for further OC adjusting.
echo -e "\n$(date +"%Y-%m-%d %H:%M:%S") GPU FAULT" >> /home/user/gpu_fault.log && \
dmesg -T | grep "Xid" | tail -n 1 >> /home/user/gpu_fault.log && \

rm -f /run/hive/miner.1 && \
/hive/bin/miner restart
#################################################################################################################################################

gpu_stats=$(< $GPU_STATS_JSON)
gpu_stats_nvidia=$(jq '[.brand, .temp, .fan, .busids] | transpose | map(select(.[0] == "nvidia")) | transpose' <<< $gpu_stats)
busids=($(jq -r '.[3][]' <<< "$gpu_stats_nvidia"))
temps=($(jq -r '.[1][]' <<< "$gpu_stats_nvidia"))
fans=($(jq -r '.[2][]' <<< "$gpu_stats_nvidia"))
#gpu_count=${#busids[@]}

hash_arr=()
busid_arr=()
fan_arr=()
temp_arr=()

miner_stats=$(echo "$logPart" | sed -n '/gpu\[0\]/,/gpu\[\*\]/p' | head -n -1 | tac | awk '/gpu\[\*]/{exit} {print}' | tac)
while read -r string; do
	[[ ! $(echo $string | grep 'gpu') ]] && continue
	gpu_index=$(echo $string | awk -F'[][]' '{print $2}')
	gpu_hr=$(echo $string | awk -F'1m - ' '{print $2}' | awk '{print $1}')
	[[ "$gpu_hr" == "N/A" ]] && gpu_hr=0
	[[ "${busids[$gpu_index]}" =~ ^([A-Fa-f0-9]+): ]]
	busid_arr+=($((16#${BASH_REMATCH[1]})))
	hash_arr+=($gpu_hr)
	temp_arr+=(${temps[$gpu_index]})
	fan_arr+=(${fans[$gpu_index]})
done <<< $miner_stats

hash_json=$(printf '%s\n' "${hash_arr[@]}" | jq -cs '.')
bus_numbers=$(printf '%s\n' "${busid_arr[@]}"  | jq -cs '.')
fan_json=$(printf '%s\n' "${fan_arr[@]}"  | jq -cs '.')
temp_json=$(printf '%s\n' "${temp_arr[@]}"  | jq -cs '.')
uptime=$(( `date +%s` - `stat -c %Y $CUSTOM_CONFIG_FILENAME` ))
#I think it's better to implement accepted shares counter in miner's output and parse it as GPU indexes and hashrates. 
ac=$(grep -i 'found a solution' "${CUSTOM_LOG_BASENAME}.log" | wc -l)
rj=0
hs_units="hs"
total_hashrate=$(echo "$logPart" | grep -F "gpu[*]:" | tail -n 1 | awk '{print $5}')
[[ -n "$total_hashrate" ]] && khs=$(echo "scale=5; $total_hashrate/1000" | bc) || khs=0

stats=$(jq -nc \
	--arg total_khs "$khs" \
	--arg khs "$khs" \
	--arg hs_units "$hs_units" \
	--argjson hs "$hash_json" \
	--arg ver "$CUSTOM_VERSION" \
	--arg ac "$ac" \
	--arg rj "$rj" \
	--argjson bus_numbers "$bus_numbers" \
	--argjson fan "$fan_json" \
	--argjson temp "$temp_json" \
	--arg uptime "$uptime" \
	--arg algo "${CUSTOM_ALGO}" \
	'{$total_khs, $khs, $hs_units, $hs, $temp, $fan, $uptime, $ver, ar: [$ac, $rj], $algo, $bus_numbers}')

[[ -z $khs ]] && khs=0
[[ -z $stats ]] && stats="null"

echo Debug info:
echo Log file : $CUSTOM_LOG_BASENAME.log
echo KHS : $khs
echo AC \ RJ: $ac \ $rj
echo Output : $stats
