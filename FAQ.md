### Q1: What is the download link for Aleo mining software?

A: As follows:
- GitHub download page: [zkwork_aleo_gpu_worker](https://github.com/6block/zkwork_aleo_gpu_worker/releases)
- If the mining rig network cannot connect to GitHub, you can try using a GitHub file proxy, such as by concatenating the following download link through [ghp.ci](https://ghp.ci/): [https://ghp.ci/https://github.com/6block/zkwork_aleo_gpu_worker/releases/download/v0.2.3/aleo_prover-v0.2.3_full.tar.gz](https://ghp.ci/https://github.com/6block/zkwork_aleo_gpu_worker/releases/download/v0.2.3/aleo_prover-v0.2.3_full.tar.gz)

We also recommend following our [Twitter](https://x.com/ZKWorkHQ) and [Discord](https://discord.com/invite/pKufwyjGFF) for updates on new versions.


### Q2: Why does the hashrate of the same mining machine fluctuate significantly over time when mining Aleo?

A: Aleo’s mining principle is that each epoch (around 20 minutes to 1 hour) the network randomly generates a puzzle, and miners need to compute the solution to this puzzle. Due to the randomness of the puzzle, the difficulty of computation varies, which results in fluctuations in hashrate across different epochs for the same mining software. When discussing hashrate, it's common to include the epoch hash to indicate the hashrate for a specific epoch.


### Q3: What is the difference between the units c/s, s/s, and h/s?

A: They are just different names for the Aleo computing power unit, but they represent the same meaning:
- **c/s (commitment per second)**: In testnet3, mining involved computing KZG commitments (this mechanism is no longer used in the mainnet), which is where this unit comes from.
- **s/s (solution per second)**: Since the mining process involves computing the solution to the puzzle, this unit can also be used to express hashrate.
- **h/s (hash per second)**: This is a common unit in other PoW networks and is sometimes used in Aleo mining as well.


### Q4: What is the current mining reward per unit of hashrate?

A: You can check the homepage of our explorer [aleo.info](https://aleo.info/) under the "24 Hour Data" section. Currently, the reward per unit of hashrate is 3 ALEO/MH.


### Q5: How long does it take to see my hashrate on zk.work after launching the mining software?

A: First, wait for the log to display "Found a solution." Then, search for the `--address` you provided on zk.work, and you will be able to see the hashrate.


### Q6: Why does the mining pool’s dashboard show my machine as inactive even though it’s running?

A: Mining pools determine if a machine is online based on whether it submits solutions. If a machine doesn’t submit a solution within 10 minutes, it is considered offline. This could be due to low hashrate or a broken network connection to the pool.


### Q7: Why is the hashrate in the miner log different from that on the website?

A: The hashrate in the miner log represents the number of solutions calculated by the miner per second, while the hashrate shown by the mining pool is an estimate based on the number of solutions submitted by the miner over a given time.

For example, if a miner calculates 100 solutions per second, the miner log will display a hashrate of 100. According to the current difficulty, theoretically, 10 out of 100 solutions should meet the difficulty requirement. However, sometimes, due to luck, 20 solutions may meet the requirement and get submitted to the mining pool, and other times, none might meet the requirement. In those cases, the mining pool would show a hashrate of 200 and 0, respectively.

Additionally, rewards are distributed based on the mining pool's data. The ratio between the pool data and the log data is often referred to as the Luck.


### Q8: When are mining rewards paid?

A: Currently, zk.work pays miners every 24 hours, with payments sent directly to the address entered when the mining software was started. If the amount to be paid is less than 3 ALEO, no payment will be made. 

Every day at 0:00 UTC+0 / 8:00 AM UTC+8 the profits for the past 24 hours are settled, and then the payout queue starts at 1:00 AM UTC+0 / 9:00 AM UTC+8. Payouts are usually completed within 3 hours.

Sometimes the payout transaction cannot be found in the explorer, which is usually because the Aleo network dropped the transaction. This is a known bug acknowledged by Aleo, and you can search for 'ghost transactions' in the Aleo Discord. In such cases, we usually start resending at 8:00 AM UTC / 4:00 PM UTC+8.

Note that these parameters may be adjusted based on Aleo's network conditions.


### Q9: The mining pool page shows the payment has been made, but the wallet hasn't received it?

A: First, visit our explorer [aleo.info](https://aleo.info/) and search for the receiving address to check if the payment has been made. If the explorer shows the payment has been made but the wallet hasn't received it, it is usually because the wallet does not support the Aleo mainnet. Please use a wallet that supports the Aleo mainnet, such as [FoxWallet](https://foxwallet.com/), and import the same mnemonic to see the balance under the address.


### Q10: Why is my "pool fee rate" not 1%?

A: zk.work offers customized software services to large-client miners, which come with different pool fee rates. This situation occurs due to the use of services for large clients. If you wish to continue using them, please contact [6BlockBD](https://t.me/sixblockofficial).


### Q11: Why does the high-performance version (pre/boost) have CPU requirements?

A: Aleo requires different computations for each epoch (see Q2 for details), so the mining software can be pre-warmed and tuned to the optimal state for the current epoch at the start of each epoch. This pre-warming process relies on the CPU, and during this time, GPU hashrate remains relatively low. If the CPU is too weak, it may lead to an excessively long or incomplete pre-warming process, which negatively impacts overall mining performance.
The log entry for the start of pre-warming is `Notify from Pool Server, job_id`, indicating that a new epoch task has been received from the mining pool. The log entry `Kernel is ready for new job` signals that pre-warming has been completed.


### Q12: How to resolve the "version `GLIBC_2.29' not found" error?
A: You can choose one of the following three solutions to resolve the issue:
1. Upgrade HiveOS to the latest version.
2. Use the following command on HiveOS.
```
hive-replace --stable -y
```
3. Install libc6 with the following command: 
```
apt update && apt upgrade && echo "deb http://cz.archive.ubuntu.com/ubuntu jammy main" >> /etc/apt/sources.list && apt update && apt install libc6 -y
```


### Q13: How to resolve the "Failed to find valid proof target in range" error?
A: Some community members reported that the error was caused by overclocking, and simply disabling overclocking resolves it. Others reported that reinstalling various dependencies using the following commands can fix the error. The exact cause of this error has not yet been identified.
```
apt update && apt upgrade && echo "deb http://cz.archive.ubuntu.com/ubuntu jammy main" >> /etc/apt/sources.list && apt update && apt install tmux -y && apt install libc6 -y
grep -qxF "deb http://cz.archive.ubuntu.com/ubuntu jammy main" /etc/apt/sources.list || echo "deb http://cz.archive.ubuntu.com/ubuntu jammy main" | sudo tee -a /etc/apt/sources.list && sudo apt update && sudo apt install -y  libssl3 libssl-dev g++-11 libc6
```


### Q14: Why is the profit per hashrate decreasing every day?

A: On the miner's profit page, the average hashrate and profit of the past 24 hours from the daily settlement time (0:00 UTC+0) are displayed, and their ratio (profit divided by average hashrate, in ALEO/MH) changes daily. Reasonable ratios can be referenced on the following pages (note that they are all estimated values):

1. The right side of the [zk.work Aleo page](https://zk.work/aleo/) shows the profit per hashrate of the past 24 hours from the last settlement time for the mining pool.
2. The right side of the [aleo.info homepage](https://aleo.info/) shows the profit per hashrate of the past 24 hours from now for the entire network.
3. The Mining Profit chat at [aleo.info charts page](https://aleo.info/charts) shows the profit per hashrate of past 24 hours from the daily settlement time in history.
4. The [Aleoscan calculator](https://aleoscan.io/calc) shows the estimated profit per hashrate at the current moment.

Miner's `profit ÷ average_hashrate ÷ (1 - pool_fee_rate)` should be close to the values displayed on these three pages. Therefore, even with the same hashrate, daily profit fluctuates.
