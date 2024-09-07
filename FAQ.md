### Q: Why does the hashrate of the same mining machine fluctuate significantly over time when mining Aleo?

A: Aleo’s mining principle is that each epoch (around 20 minutes to 1 hour) the network randomly generates a puzzle, and miners need to compute the solution to this puzzle. Due to the randomness of the puzzle, the difficulty of computation varies, which results in fluctuations in hashrate across different epochs for the same mining software. When discussing hashrate, it's common to include the epoch hash to indicate the hashrate for a specific epoch.

### Q: What is the difference between the units c/s, s/s, and h/s?

A: 
- **c/s (commitment per second)**: In testnet3, mining involved computing KZG commitments (this mechanism is no longer used in the mainnet), which is where this unit comes from.
- **s/s (solution per second)**: Since the mining process involves computing the solution to the puzzle, this unit can also be used to express hashrate.
- **h/s (hash per second)**: This is a common unit in other PoW networks and is sometimes used in Aleo mining as well.

### Q: What is the current mining reward per unit of hashrate?

A: You can check the homepage of our explorer [aleo.info](https://aleo.info/) under the "24 Hour Data" section. Currently, the reward per unit of hashrate is 3 ALEO/MH.

### Q: Why does the mining pool’s dashboard show my machine as inactive even though it’s running?

A: Mining pools determine if a machine is online based on whether it submits solutions. If a machine doesn’t submit a solution within 10 minutes, it is considered offline. This could be due to low hashrate or a broken network connection to the pool.

### Q: When are mining rewards paid?

A: Currently, zk.work pays miners every 3 hours, with payments sent directly to the address entered when the mining software was started. If the amount to be paid is less than 30 ALEO, no payment will be made. These parameters may be adjusted based on Aleo's gas conditions.

### Q: Why do I encounter an "Authorized error" when connecting mining software to F2Pool?

A: This usually happens because the miner’s IP location (e.g., China or the United States) is blocked by F2Pool. You can try using a proxy from a different region, such as the one provided by [Svipminer](https://www.svipminer.com/): `proxy.svipminer.com:3920`.
