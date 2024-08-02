#!/bin/bash

# Variables
SERVICE_ACCOUNT_NAME="azure-pipelines-deploy"
SECRET_NAME="azure-pipelines-deploy-token"
CLUSTER_NAME="your-cluster-name"
CLUSTER_ZONE="your-cluster-zone"  # or REGION
KUBECONFIG="/path/to/your/kubeconfig"

# Authenticate with GKE
gcloud container clusters get-credentials $CLUSTER_NAME --zone $CLUSTER_ZONE

# Create the service account
kubectl create serviceaccount $SERVICE_ACCOUNT_NAME

# Create the secret
kubectl create secret generic $SECRET_NAME --type=kubernetes.io/service-account-token --dry-run -o yaml \
  | kubectl annotate --local -o yaml -f - kubernetes.io/service-account.name=$SERVICE_ACCOUNT_NAME \
  | kubectl apply -f -

# Create the cluster role binding
kubectl create clusterrolebinding $SERVICE_ACCOUNT_NAME --clusterrole=cluster-admin --serviceaccount=default:$SERVICE_ACCOUNT_NAME

# Get the secret and output it
kubectl get secret $SECRET_NAME -o yaml
