# Aleo_prover
```shell
pool_address=aleo.hk.zk.work:10003
```

## Release-notes

- aleo_prover v0.0.2
  - Slight performance improvement.
  - Deprecate complicated pool connection options `--tcp_server` and `--ssl_server`.
  - Introduce new connection flag `--pool`.

- aleo_prover v0.0.1
  - The first pre-mainnet version with 80w + hashrate on RTX 4090

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

Usage: aleo_prover [OPTIONS] --address <ADDRESS>

Options:
      --address <ADDRESS>          Specify this as a mining node, with the given aleo address
      --pool <SERVERS>             Specify the pool address that the worker is contributing to
      --verbosity <VERBOSITY>      Specify the verbosity of the node [options: 0, 1, 2, 3] [default: 0]
      --custom_name <CUSTOM_NAME>  Specify the custom name of this worker instance [default: sixworker]
  -g, --gpu_index <GPU_INDEXES>    Specify gpu index to solve puzzle, all gpus are used by default, eg. -g 0 -g 1 -g 2 ...
      --network <NETWORK>          Aleo Network(Testnet, Mainnet, Canary) , current default testnet [default: Testnet]
  -h, --help                       Print help
  -V, --version                    Print version
```

## Mining Tutorial

Oneline command to start:
`./aleo_prover --pool aleo.hk.zk.work:10003 --address aleoxxx --custom_name myprover`

### On Ubuntu

1. Get an Aleo wallet address on [foxwallet](https://foxwallet.com/), [leowallet](https://www.leo.app/), [puzzle wallet](https://puzzle.online/) etc.
2. Download zkwork miner with `wget https://github.com/6block/zkwork_aleo_gpu_worker/releases/download/v0.0.2/aleo_prover.tar.gz`.
3. `tar -zvxf aleo_prover.tar.gz && cd aleo_prover`.
4. Update your Aleo address in `run_prover.sh` and set custom name for mining server.
5. Start mining with `sudo chmod +x run_prover.sh && ./run_prover.sh`.
6. Check mining log with `tail -f prover.log`.

### On HiveOS 
1. Get an Aleo wallet address on foxwallet, leowallet, puzzle wallet etc.
2. Add New Flight Sheet with config as follows.

Configuration:
- Installation URL: https://github.com/6block/zkwork_aleo_gpu_worker/releases/download/v0.0.2/aleo_prover.tar.gz
- Hash algorithm: aleo
- Wallet and worker template: %WAL%
- Pool URL:  aleo.hk.zk.work:10003


3. Start Flight Sheet