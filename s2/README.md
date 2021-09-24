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
pod/redis-576f7ddf7-kmjsz           1/1     Running     0          2d18h
pod/s2-clone-repo-lh8jf             0/1     Completed   0          2d18h
pod/s2-cppcheck-2kdgz               0/1     Completed   0          22s
pod/s2-cppcheck-parallelism-jrtcg   0/1     Completed   0          21m
pod/s2-cppcheck-parallelism-pqz8j   0/1     Completed   0          21m
pod/s2-push-work-items-p7vqc        0/1     Completed   0          37s

NAME            TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)    AGE
service/redis   ClusterIP   10.107.46.174   <none>        6379/TCP   2d18h

NAME                    READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/redis   1/1     1            1           2d18h

NAME                              DESIRED   CURRENT   READY   AGE
replicaset.apps/redis-576f7ddf7   1         1         1       2d18h

NAME                                COMPLETIONS   DURATION   AGE
job.batch/s2-clone-repo             1/1           12s        2d18h
job.batch/s2-cppcheck               1/1           12s        22s
job.batch/s2-cppcheck-parallelism   2/2           9s         21m
job.batch/s2-push-work-items        1/1           2s         37s
```
