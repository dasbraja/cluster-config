## Cluster Config

    ### Bootstrap FluxCD:
        Execute this step to bootstrap flux in kubernetes. This will ensure cluster-config configuration will stay in git repo named cluster-config.

        export  GITHUB_TOKEN=<YOUR_PERSONAL_ACCESS_TOKEN>

        flux bootstrap github \
        --components-extra=image-reflector-controller,image-automation-controller \
        --token-auth \
        --owner=<GITHUB_USER_NAME> \
        --repository=cluster-config \
        --branch=main \
        --namespace=cluster-config \
        --path=clusters/dev-kube-cluster-abcde \
        --personal

        Once this is installed you can find out following service running in cluster-config namespace.
        
        `kubectl get pods -n cluster-config`

        helm-controller-65b47945dd-s75hb               1/1     Running   0          53m
        image-automation-controller-654ffc76c6-45pnb   1/1     Running   0          53m
        image-reflector-controller-96fb4fbfd-xh2sm     1/1     Running   0          53m
        kustomize-controller-85c76d65cd-8pz5g          1/1     Running   0          53m
        notification-controller-58ffd586f7-mmxgp       1/1     Running   0          53m
        source-controller-547ddc6885-rbbm6             1/1     Running   0          53m
    
    ### Execute secret_replication.sh following to copy secrets into different namespace.
    ### If you use AWS, ECR credentials need to get synced , so run ecr_sync.yaml in eks. this will schedule kubernetes jobs to refresh your ECR credentials.
    ### If you would like to iintegration with MSTeams for notification, you need to create webhook in MSTeams and need to execute teams_notifications.yaml.

