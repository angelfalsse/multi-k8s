docker build -t inudog/multi-client -f ./client/Dockerfile ./client
docker build -t inudog/multi-server -f ./server/Dockerfile ./server
docker build -t inudog/multi-worker -f ./worker/Dockerfile ./worker
docker push inudog/multi-client
docker push inudog/multi-server
docker push inudog/multi-worker
kubectl apply -f k8s
kubectl rollout restart deployment/server-deployment
kubectl rollout restart deployment/client-deployment
kubectl rollout restart deployment/worker-deployment