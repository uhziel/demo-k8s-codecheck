init: redis clone

redis:
	kubectl apply -f s2-redis-deployment.yaml -f s2-redis-service.yaml

clone:
	kubectl apply -f s2-clone-repo-job.yaml -f s2-clone-repo-pvc.yaml

pushworks:
	kubectl delete -f s2-push-work-items-job.yaml || true
	kubectl apply -f s2-push-work-items-job.yaml

cppcheck:
	kubectl apply -f s2-cppcheck-job.yaml

cppcheckp:
	kubectl apply -f s2-cppcheck-parallelism-job.yaml

clean:
	kubectl delete -f s2-push-work-items-job.yaml \
		-f s2-cppcheck-job.yaml -f s2-cppcheck-parallelism-job.yaml
