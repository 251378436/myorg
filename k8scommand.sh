# az acr build --registry todosbolong -f ./apps/todos/Dockerfile --image todosbolong:latest .

docker build -f ./apps/todos/Dockerfile -t todosbolong:latest .
# docker run -p 8888:80 todosbolong:latest
docker tag todosbolong:latest todosbolong.azurecr.io/todosbolong:latest

docker push todosbolong.azurecr.io/todosbolong:latest

docker build -f ./apps/todos2/Dockerfile -t todos2bolong:latest .

docker tag todos2bolong:latest todosbolong.azurecr.io/todos2bolong:latest

docker push todosbolong.azurecr.io/todos2bolong:latest

docker build -t todosapi:latest .

docker run -p 8888:80 todosapi:latest

docker tag todosapi:latest todosbolong.azurecr.io/todosapi:latest

docker push todosbolong.azurecr.io/todosapi:latest

# az acr login --name todosbolong --expose-token

# az acr login --name todosbolong

# az aks update -n bolongcluster -g SecureUploadPortal --attach-acr todosbolong

# try different imagePullPolicy if error happens
kubectl apply -f deployment-azure-app.yaml

kubectl set image deployment todosapp todosapp=todosbolong.azurecr.io/todosbolong:latest

kubectl rollout restart deployment/todosapp