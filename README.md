# Aleo_prover
```shell
tcp_server=aleo.hk.zk.work:10002
ssl_server=aleo.hk.zk.work:10003
```
## GPU Performance
### aleo_prover v0.0.1
- 8 * `NVIDIA GeForce RTX 4090`
- epoch: 1825
- epoch hash: `ab15lkhs9yya5k7njqm75et7hkzarkrw09a970hv9506s28re4drsyqyspc7f`
  
<table>
  <tr>
   <td><strong>Name & Version</strong>
   </td>
   <td><strong>Performance</strong>
   </td>
  </tr>
  <tr>
   <td>aleo_prover v0.0.1
   </td>
   <td>650w
   </td>
  </tr>
</table>


## Requirements
- OS Version: Ubuntu 20.04 +

- Nvidia Driver Version: 535.54.03 +

## Usage
```shell
The zk.work team <zk.work@6block.com>

USAGE: aleo_prover [OPTIONS] --address <ADDRESS>

OPTIONS:
      --address <ADDRESS>          Specify this as a mining node, with the given aleo address
      --tcp_server <TCP_SERVERS>   Specify the pool(tcp) that the worker is contributing to
      --ssl_server <SSL_SERVERS>   Specify the pool(ssl) that the worker is contributing to
      --ssl                        If the flag is set, the worker will use ssl link
      --verbosity <VERBOSITY>      Specify the verbosity of the node [options: 0, 1, 2, 3] [default: 0]
      --custom_name <CUSTOM_NAME>  Specify the custom name of this worker instance [default: sixworker]
  -g, --gpu_index <GPU_INDEXES>    Specify gpu index to solve puzzle, all gpus are used by default, eg. -g 0 -g 1 -g 2 ...
  -h, --help                       Print help
  -V, --version                    Print version
```

## HiveOS 
### 1. Get a wallet
### 2. Add New Flight Sheet
Setup Miner Config

TCP Configuration:
- Installation URL: https://github.com/6block/zkwork_aleo_gpu_worker/releases/download/v0.0.1/aleo_prover.tar.gz
- Hash algorithm: aleo
- Wallet and worker template: %WAL%
- Pool URL:  aleo.hk.zk.work:10002
- Extra config arguments: TCP

SSL Configuration:
:
- Installation URL: https://github.com/6block/zkwork_aleo_gpu_worker/releases/download/v0.0.1/aleo_prover.tar.gz
- Hash algorithm: aleo
- Wallet and worker template: %WAL%
- Pool URL:  aleo.hk.zk.work:10003
- Extra config arguments: SSL
### 3. Start Flight Sheet