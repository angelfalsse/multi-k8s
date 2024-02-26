docker build -t inudog/multi-client:latest -t inudog/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t inudog/multi-server:latest -t inudog/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t inudog/multi-worker:latest -t inudog/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push inudog/multi-client
docker push inudog/multi-server
docker push inudog/multi-worker
kubectl apply -f k8s
kubectl rollout restart -f k8s/server-deployment.yml
kubectl rollout restart -f k8s/client-deployment.yml
kubectl rollout restart -f k8s/worker-deployment.yml
