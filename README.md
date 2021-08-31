# demo-k8s-codecheck

## 介绍

试验如何利用 k8s 的调度能力，分布式检查项目代码，提高检查速度。

### 需要试验的地方

在 k8s 环境下，将项目代码以只读方式挂载到 /code 并使用 [codeclimate-cppcheck](https://docs.codeclimate.com/docs/cppcheck) 进行检查，获取其输出。

编写 go client  程序，在 k8s 环境中新建 Jobs 切分任务，收集输出并且上报到一个地方。

转换输出为 codechecker 要求的格式，并上报到其中。

