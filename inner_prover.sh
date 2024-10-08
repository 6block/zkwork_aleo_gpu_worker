# use your own aleo reward_address
reward_address=aleo1xxx...

# set your own custom name
custom_name="zkwork_worker"

pids=$(ps -ef | grep aleo_prover | grep -v grep | awk '{print $2}')
if [ -n "$pids" ]; then
    echo "$pids" | xargs kill
    sleep 5
fi

while true; do
    target=`ps aux | grep aleo_prover | grep -v grep`
    if [ -z "$target" ]; then
        ./aleo_prover --address $reward_address --pool aleo.asia1.zk.work:10003 --pool aleo.hk.zk.work:10003 --pool aleo.jp.zk.work:10003 --custom_name $custom_name
        sleep 5
    fi
    sleep 60
done

