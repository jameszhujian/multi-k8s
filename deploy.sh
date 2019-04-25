docker build -t jameszj/multi-client:latest -t jameszj/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t jameszj/multi-server:latest -t jameszj/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t jameszj/multi-worker:latest -t jameszj/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push jameszj/multi-client:latest
docker push jameszj/multi-server:latest
docker push jameszj/multi-worker:latest
docker push jameszj/multi-client:$SHA
docker push jameszj/multi-server:$SHA
docker push jameszj/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=jameszj/multi-server:$SHA
kubectl set image deployments/client-deployment client=jameszj/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=jameszj/multi-worker:$SHA
