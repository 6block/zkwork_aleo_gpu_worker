### Q1: What is the download link for Aleo mining software?

A: The Github links for downloading the latest software are:
- To connect to the zk.work pool: [zkwork_aleo_gpu_worker](https://github.com/6block/zkwork_aleo_gpu_worker/releases)
- To connect to the f2pool pool: [f2pool_prover](https://github.com/6block/f2pool_prover/releases)

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


### Q7: When are mining rewards paid?

A: Currently, zk.work pays miners every 24 hours, with payments sent directly to the address entered when the mining software was started. If the amount to be paid is less than 3 ALEO, no payment will be made. These parameters may be adjusted based on Aleo's gas conditions.


### Q8: The mining pool page shows the payment has been made, but the wallet hasn't received it?

A: First, visit our explorer [aleo.info](https://aleo.info/) and search for the receiving address to check if the payment has been made. If the explorer shows the payment has been made but the wallet hasn't received it, it is usually because the wallet does not support the Aleo mainnet. Please use a wallet that supports the Aleo mainnet, such as [FoxWallet](https://foxwallet.com/), and import the same mnemonic to see the balance under the address.


### Q9: Why is my "pool fee rate" not 1%?

A: zk.work offers customized software services to large-client miners, which come with different pool fee rates. This situation occurs due to the use of services for large clients. If you wish to continue using them, please contact [6BlockBD](https://t.me/sixblockofficial).


### Q10: Why do I encounter an "Authorized error" when connecting mining software to F2Pool?

A: This usually happens because the miner’s IP location (e.g., China or the United States) is blocked by F2Pool. You can try using a proxy from a different region, such as the one provided by [Svipminer](https://www.svipminer.com/): `proxy.svipminer.com:3920`.
