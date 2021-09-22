# 试验分布式的效果

环境：rancher rke 双节点集群

* node1: 192.168.7.189。部署了集群外 nfs service，192.168.7.189:/home/nfs_shared
* node2: 192.168.7.28

操作步骤

1. make init
2. make pushworks # 推送 工作到工作队列
3. make cppcheck # 单 pod 测试
4. make cppcheckp # 多 pod 并发测试
5. make clean # 清理环境

## 结果

cJSON 代码量太少，效果不是很明显。

```
$ kubectl get all
NAME                                READY   STATUS      RESTARTS   AGE
pod/redis-576f7ddf7-mhnd7           1/1     Running     0          34m
pod/s2-cppcheck-parallelism-4wg6d   0/1     Completed   0          3m26s
pod/s2-cppcheck-parallelism-dvgk4   0/1     Completed   0          3m26s
pod/s2-cppcheck-parallelism-skxbn   0/1     Completed   0          3m26s
pod/s2-cppcheck-parallelism-wlsbt   0/1     Completed   0          3m26s
pod/s3-clone-repo-zkbmr             0/1     Completed   0          36m
pod/s3-cppcheck-ts57l               0/1     Completed   0          7m20s
pod/s3-push-work-items-npzgh        0/1     Completed   0          4m46s

NAME            TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)    AGE
service/redis   ClusterIP   10.43.172.167   <none>        6379/TCP   48m

NAME                    READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/redis   1/1     1            1           48m

NAME                              DESIRED   CURRENT   READY   AGE
replicaset.apps/redis-576f7ddf7   1         1         1       48m

NAME                                COMPLETIONS   DURATION   AGE
job.batch/s2-cppcheck-parallelism   4/4           52s        3m26s
job.batch/s3-clone-repo             1/1           24s        36m
job.batch/s3-cppcheck               1/1           2m3s       7m20s
job.batch/s3-push-work-items        1/1           1s         4m46s
```
