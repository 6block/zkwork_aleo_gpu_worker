### Q1: Aleo挖矿软件的下载地址是什么？

A: 下载最新软件的Github地址：
- 连接zk.work矿池：[zkwork_aleo_gpu_worker](https://github.com/6block/zkwork_aleo_gpu_worker/releases)
- 连接f2pool矿池：[f2pool_prover](https://github.com/6block/f2pool_prover/releases)

并建议关注我们的 [Twitter](https://x.com/ZKWorkHQ) 和 [Discord](https://discord.com/invite/pKufwyjGFF) 以接收新版本的消息推送。


### Q2: 为什么同一台矿机挖 Aleo 的算力随时间波动很大？

A: Aleo 的挖矿原理是每个 epoch（约 20 分钟到 1 小时）网络会随机产生一个 puzzle，矿工需要计算该 puzzle 的 solution。由于 puzzle 的随机性会导致计算难度不同，因此同一挖矿软件在不同 epoch 的算力也会有所波动。通常谈论算力时，会附带 epoch hash 以表示在哪个 epoch 下的算力。


### Q3: 算力单位 c/s、s/s、h/s 的区别是什么？

A: 它们只是对于Aleo算力单位的不同称呼，但表示的意思是相同的：
- **c/s（commitment per second）**：此前 testnet3 的挖矿是计算 KZG commitment（主网已经不再采用此机制），因此有了这个单位。
- **s/s（solution per second）**：由于官方称挖矿过程为计算 puzzle 的 solution，因此也可以这样表示算力单位。
- **h/s（hash per second）**：这是其他 PoW 网络挖矿中常见的单位，有时也用于 Aleo 挖矿中。


### Q4: 单位算力的挖矿收益目前是多少？

A: 可以访问我们浏览器 [aleo.info](https://aleo.info/) 的首页 24 Hour Data 栏目查看，目前单位算力收益为 3 ALEO/MH。


### Q5: 挖矿软件启动后，多久可以在 zk.work 网页上看到算力？

A: 首先等待日志中出现 “Found a solution”。其次在 zk.work 中搜索软件启动时填写的 `--address` 地址，即可看到算力。


### Q6: 矿机明明在运行，矿池的 dashboard 页面为何却显示为离线状态？

A: 矿池根据矿机提交的 solution 来判断是否在线。如果矿机在 10 分钟内未提交 solution，则会被判定为离线。这可能是由于矿机算力过低或与矿池的网络连接断开所致。


### Q7: 为什么矿机日志中的算力和网页中的不一致？

A: 矿机日志中的算力表示矿机每秒计算 solution 的个数，矿池显示的算力来自矿机单位时间内提交的 solution 估算得到。
比如，矿机每秒计算 100 个 solution，矿机日志就会显示 100 的算力；
按照当前难度，每 100 个 solution 理论上有 10 个符合难度要求，但实际上有的时候幸运一些得到 20 个符合难度要求的 solution 提交给矿池，有的时候不幸一些一个都没得到，那矿池就会分别显示 200 的算力和 0 的算力。
另外，分发奖励是以矿池数据为准，矿池数据和日志数据的比值通常称作幸运值。


### Q8: 挖矿奖励何时打款？

A: 目前 zk.work 每 24 小时向矿工支付一次奖励，直接打入启动挖矿软件时填写的 address。如果待支付金额不足 3 ALEO，将不会支付。相关参数可能会根据 Aleo 的 gas 情况随时调整。


### Q9: 矿池页面显示已打款，但是钱包内没有收到？

A: 首先访问我们浏览器 [aleo.info](https://aleo.info/) 搜索收币地址，看是否已经打款。如果浏览器显示已打款，而钱包未收到的话，通常是因为钱包不支持Aleo主网。请使用支持Aleo主网的钱包，例如 [FoxWallet](https://foxwallet.com/)，导入同样的助记词后即可看到地址下的余额。


### Q10: 为什么我的 ”pool fee rate“ 不是 1%？

A: zk.work 对大客户矿工提供了定制化的软件服务，并且收取不同的 pool fee rate。出现这种情况是由于使用了大客户的服务所致，如需继续使用请联系 [6BlockBD](https://t.me/sixblockofficial)。


### Q11: 挖矿软件接入鱼池时为何会遇到 “Authorized error” 报错？

A: 通常是因为矿机的 IP 地理位置（如中国或美国）被鱼池屏蔽。可以尝试使用其他地区的代理，例如 [Svipminer](https://www.svipminer.com/) 提供的代理：`proxy.svipminer.com:3920`。


### Q12: 为什么高性能版（pre/boost）挖矿软件对CPU有要求？

A: Aleo在每个epoch都需要进行不同的运算（详见Q2），所以可以在epoch开始时将挖矿软件预热调试至最适合当前epoch的状态。这个预热过程要借助CPU，且在完成预热前GPU算力都比较低。CPU太弱会造成预热时间过长甚至无法完成预热，影响整体挖矿性能。
预热开始的日志是`Notify from Pool Server, job_id`，表示从矿池接收了新的epoch任务；结束的日志是`Kernel is ready for new job`，表示已经完成预热。
