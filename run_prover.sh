# server list
pool=aleo.hk.zk.work:10003

# use your own aleo reward_address
reward_address=aleo1xxx...

# set your own custom name
custom_name="zkwork_worker"

ps -ef|grep prover|awk '{print $2}'|xargs kill
nohup ./aleo_prover --address $reward_address --pool $pool --custom_name $custom_name >> prover.log 2>&1 &
