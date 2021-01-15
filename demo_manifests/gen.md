# pod with port
k run web --image=nginx:1.19.0 --port=80 --dry-run=client -o yaml

# pod with limits
k run web --image=nginx:1.19.0 --port=80 --limits=cpu=1 --requests=cpu=0.5 --dry-run=client -o yaml

# pod with env
k run web --image=nginx --port=80 --env=version=2 --dry-run=client -o yaml | k apply -f -

# deploy
k create deploy webdeploy --image=nginx --dry-run=client -o yaml
# update image with container name web
k set image deploy webdeploy web=nginx:1.19.0
k scale --replicas=3 deploy webdeploy 

# rollout
k rollout history deploy webdeploy
k rollout undo deploy webdeploy

# svc
k expose deploy webdeploy --name websvc --port=80 --target-port=80 --type=ClusterIP --dry-run=client -o yaml > svc.yaml

# svc
k expose pod web --name=websvc --port=80 --dry-run=client -o yaml

# labels
k label po web1 app=v2 --overwrite
k get po --show-labels
k get po -l app=v2

# annotations
k annotate po web1 description="my desc"
k describe po web1 | grep -i "annotations"

# wget
k run busybox --rm --image=busybox -it --restart=Never -- sh
wget -q -O - mysvc.mynamespace