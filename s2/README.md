# 试验分布式的效果

环境：minikube 单节点集群

操作步骤

1. make init
2. make pushworks # 推送 工作到工作队列
3. make cppcheck # 单 pod 测试
4. make cppcheckp # 多 pod 并发测试
5. make clean # 清理环境

## 结果

```
$ kubectl get all
NAME                                READY   STATUS      RESTARTS   AGE
pod/redis-576f7ddf7-kmjsz           1/1     Running     0          44m
pod/s2-clone-repo-lh8jf             0/1     Completed   0          19m
pod/s2-cppcheck-parallelism-dq994   0/1     Completed   0          14m
pod/s2-cppcheck-parallelism-pwmxh   0/1     Completed   0          14m
pod/s2-cppcheck-rq57d               0/1     Completed   0          9m49s
pod/s2-push-work-items-qn469        0/1     Completed   0          9m53s

NAME            TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)    AGE
service/redis   ClusterIP   10.107.46.174   <none>        6379/TCP   44m

NAME                    READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/redis   1/1     1            1           44m

NAME                              DESIRED   CURRENT   READY   AGE
replicaset.apps/redis-576f7ddf7   1         1         1       44m

NAME                                COMPLETIONS   DURATION   AGE
job.batch/s2-clone-repo             1/1           12s        19m
job.batch/s2-cppcheck               1/1           7m36s      9m49s
job.batch/s2-cppcheck-parallelism   2/2           4m1s       14m
job.batch/s2-push-work-items        1/1           2s         9m53s
```
