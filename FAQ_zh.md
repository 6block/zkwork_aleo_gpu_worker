### Q1: 为什么同一台矿机挖 Aleo 的算力随时间波动很大？

A: Aleo 的挖矿原理是每个 epoch（约 20 分钟到 1 小时）网络会随机产生一个 puzzle，矿工需要计算该 puzzle 的 solution。由于 puzzle 的随机性会导致计算难度不同，因此同一挖矿软件在不同 epoch 的算力也会有所波动。通常谈论算力时，会附带 epoch hash 以表示在哪个 epoch 下的算力。


### Q2: 算力单位 c/s、s/s、h/s 的区别是什么？

A: 
- **c/s（commitment per second）**：此前 testnet3 的挖矿是计算 KZG commitment（主网已经不再采用此机制），因此有了这个单位。
- **s/s（solution per second）**：由于官方称挖矿过程为计算 puzzle 的 solution，因此也可以这样表示算力单位。
- **h/s（hash per second）**：这是其他 PoW 网络挖矿中常见的单位，有时也用于 Aleo 挖矿中。


### Q3: 单位算力的挖矿收益目前是多少？

A: 可以访问我们浏览器 [aleo.info](https://aleo.info/) 的首页 24 Hour Data 栏目查看，目前单位算力收益为 3 ALEO/MH。


### Q4: 矿机明明在运行，矿池的 dashboard 页面为何却显示为离线状态？

A: 矿池根据矿机提交的 solution 来判断是否在线。如果矿机在 10 分钟内未提交 solution，则会被判定为离线。这可能是由于矿机算力过低或与矿池的网络连接断开所致。


### Q5: 挖矿奖励何时打款？

A: 目前 zk.work 每 3 小时向矿工支付一次奖励，直接打入启动挖矿软件时填写的 address。如果待支付金额不足 30 ALEO，将不会支付。相关参数可能会根据 Aleo 的 gas 情况随时调整。


### Q6: 矿池页面显示已打款，但是钱包内没有收到？
A: 首先访问我们浏览器 [aleo.info](https://aleo.info/) 搜索收币地址，看是否已经打款。如果浏览器显示已打款，而钱包未收到的话，通常是因为钱包不支持Aleo主网。请使用支持Aleo主网的钱包，例如 [FoxWallet](https://foxwallet.com/)，导入同样的助记词后即可看到地址下的余额。


### Q7: 挖矿软件接入鱼池时为何会遇到 “Authorized error” 报错？

A: 通常是因为矿机的 IP 地理位置（如中国或美国）被鱼池屏蔽。可以尝试使用其他地区的代理，例如 [Svipminer](https://www.svipminer.com/) 提供的代理：`proxy.svipminer.com:3920`。
