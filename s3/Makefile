init: rancher redis clone

rancher:
	kubectl apply -f rancher-local-path-storage.yaml

redis:
	kubectl apply -f s3-redis-deployment.yaml -f s3-redis-service.yaml

clone:
	kubectl apply -f s3-clone-repo-job.yaml -f s3-clone-repo-pvc.yaml

pushworks:
	kubectl delete -f s3-push-work-items-job.yaml || true
	kubectl apply -f s3-push-work-items-job.yaml

cppcheck:
	kubectl apply -f s3-cppcheck-job.yaml

cppcheckp:
	kubectl apply -f s3-cppcheck-parallelism-job.yaml

clean:
	kubectl delete -f s3-push-work-items-job.yaml \
		-f s3-cppcheck-job.yaml -f s3-cppcheck-parallelism-job.yaml
