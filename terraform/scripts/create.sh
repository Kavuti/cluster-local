flux check --pre --context=$CLUSTER_LOCAL_NAME
flux bootstrap github \
    --owner=$CLUSTER_LOCAL_GITHUB_OWNER \
    --repository=$CLUSTER_LOCAL_GITHUB_REPOSITORY \
    --private=$CLUSTER_LOCAL_GITHUB_REPOSITORY_PRIVATE \
    --context=$CLUSTER_LOCAL_NAME \
    --path=$CLUSTER_LOCAL_PATH \
    --branch=$CLUSTER_LOCAL_GITHUB_REPOSITORY_BRANCH \
    --personal=true \
