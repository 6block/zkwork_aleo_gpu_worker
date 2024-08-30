# server list
tcp_server=aleo.hk.zk.work:10002
ssl_server=aleo.hk.zk.work:10003

# use your own aleo reward_address
reward_address=aleo1xxx...

# set your own custom name
custom_name=""

# try change --gpu_index to select the gpu you want to solve puzzle
# tcp connected
./aleo_prover --address $reward_address --tcp_server $tcp_server --custom_name $custom_name 2>&1
# ssl connected
./aleo_prover --address $reward_address --ssl  --ssl_server $ssl_server --custom_name $custom_name 2>&1
