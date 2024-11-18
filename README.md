# Aleo_prover
```shell
pool_address=aleo.hk.zk.work:10003
pool_address=aleo.asia1.zk.work:10003
pool_address=aleo.jp.zk.work:10003
```

## Latest version

- Nvidia: [v0.2.5](https://github.com/6block/zkwork_aleo_gpu_worker/releases/download/cuda-v0.2.5/aleo_prover-v0.2.5_cuda_full.tar.gz)
- AMD: [v0.2.4](https://github.com/6block/zkwork_aleo_gpu_worker/releases/download/ocl-v0.2.4/aleo_prover-v0.2.4_ocl.tar.gz)

## Release-notes

- aleo_prover cuda-v0.2.5
  - 6%+ performance improvement on RTX3080/4090 etc
  - 30%+ performance improvement on RTX2080Ti/50hx etc

- aleo_prover cuda-v0.2.4
  - 6%-25% performance improvement on different epoch

- aleo_prover ocl-v0.2.4
  - The first release version for AMD GPUs

- aleo_prover v0.2.3-fix
  - Improve mining dashboard on HiveOS
  - Add support for extra config on HiveOS like `-g 0 -g 1 --custom_name zkwork_worker`

- aleo_prover v0.2.3
  - ~10% performance improvement on different GPUs
  - Improve network stability, miner will choose the best service among all provided pools, avoiding single-node issue
  - Recommended to run with all available pools as follows

`./aleo_prover --pool aleo.asia1.zk.work:10003 --pool aleo.hk.zk.work:10003 --pool aleo.jp.zk.work:10003 --address aleoxxx`

- aleo_prover v0.2.2
  - 15%-25% performance improvement on different GPUs
  - v0.2.2-lite size: 39M, v0.2.2-full size: 482M 
  - v0.2.2-lite takes about 2 mins to warmup during first run, and this process maybe longer on old CPUs
  - v0.2.2-lite requires nvidia driver version >= 545.23.06 

- aleo_prover v0.2.1
  - 75%+ performance improvement on low-end graphics cards like RTX2080Ti/50hx etc
  - Run your own tests on high-end graphics cards like RTX4090 etc

- aleo_prover v0.2.0
  - Completely fix invalid share issue
  - Reduce warmup time from about 1 min to less than 1 second, which improves mining efficiency by 3%~10%
  - Fix issue that all GPUs stop mining when one GPU crashes
  - Compatible with any CPUs
  - Compatible with nvidia-driver version since 535.54.03 in our test, try for yourselves

- aleo_prover v0.1.3-boost
  - Network optimization version of v0.1.2-pre, use if you have network problems

- aleo_prover v0.1.3-stable
  - Network optimization version of v0.1.2-stable, use if you have network problems

- aleo_prover v0.1.2-pre
  - 20%+ performance improvement than v0.1.2-stable
  - Longer warmup time than v0.1.2-stable
  - Invalid share issue still under development with <1% chance of occurrence
  - Recommended for CPU with more than 16 cores

- aleo_prover v0.1.2-stable
  - Completely solve CPU usage on old CPUs, compatible with any CPUs since this version
  - Fix segment fault issue in some epochs
  - Fix invalid share issue in some epochs
  - Network reconnection improvemnt, remove unnecessary warmup after reconnection which brings higher mining performance
  - Recommended for CPU with less than 16 cores

- aleo_prover v0.1.1-hot/v0.1.0-hot
  - Lower CPU usage
  - Lower GPU memory usage
  - Better network connectivity
  - New service node: aleo.asia1.zk.work:10003 

- aleo_prover v0.1.1
  - 70%+ performance improvement on RTX2080TI
  - 20%+ performance improvement on 30 and 40 series

- aleo_prover v0.1.0
  - Performance improvement, hashrate doubled compare to v0.0.2

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
`./aleo_prover --pool aleo.aisa1.zk.work:10003 --pool aleo.hk.zk.work:10003 --pool aleo.jp.zk.work:10003 --address aleoxxx --custom_name myprover`

### On Ubuntu

1. Get an Aleo wallet address on [foxwallet](https://foxwallet.com/), [leowallet](https://www.leo.app/), [puzzle wallet](https://puzzle.online/) etc.
2. Download zkwork Nvidia miner: `wget https://github.com/6block/zkwork_aleo_gpu_worker/releases/download/cuda-v0.2.5/aleo_prover-v0.2.5_cuda_full.tar.gz`.
3. Download zkwork AMD miner: `wget https://github.com/6block/zkwork_aleo_gpu_worker/releases/download/ocl-v0.2.4/aleo_prover-v0.2.4_ocl.tar.gz`.
4. On Nvidia: `tar -zvxf aleo_prover-v0.2.5_cuda_full.tar.gz && cd aleo_prover`, on AMD: `tar -zvxf aleo_prover-v0.2.4_ocl.tar.gz && cd aleo_prover`.
5. Update your Aleo address in `inner_prover.sh` and set custom name for mining server.
6. Start mining with `sudo chmod +x run_prover.sh && ./run_prover.sh`.
7. Check mining log with `tail -f prover.log`.

### On HiveOS 
1. Choose your download url for your gpu.
  ```
  DOWNLOAD_URL for Nvidia: https://github.com/6block/zkwork_aleo_gpu_worker/releases/download/cuda-v0.2.5/aleo_prover-v0.2.5_cuda_full.tar.gz
  DOWNLOAD_URL for AMD: https://github.com/6block/zkwork_aleo_gpu_worker/releases/download/ocl-v0.2.4/aleo_prover-v0.2.4_ocl.tar.gz
  ```
2. Get an Aleo wallet address on foxwallet, leowallet, puzzle wallet etc.
3. Add New Flight Sheet with config as follows.


Configuration:
- Installation URL: DOWNLOAD_URL
- Hash algorithm: aleo
- Wallet and worker template: %WAL%


3. Start Flight Sheet


## FAQ
[English](./FAQ.md), [中文](./FAQ_zh.md)
