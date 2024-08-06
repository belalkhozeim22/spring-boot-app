Automated Deployment Documentation for Spring Boot Application

Overview

This document outlines the end-to-end automated deployment process for a Spring Boot application using Azure DevOps for CI/CD, Docker for containerization, Docker Hub for image storage, and Google Kubernetes Engine (GKE) for deployment. Terraform is used to manage infrastructure.

Prerequisites

GitHub Repository: Contains the Spring Boot application code, Dockerfile, and pipeline files.
Azure DevOps: Azure DevOps project with two pipelines set up.
Docker: Docker service connection created in Azure DevOps.
Docker Hub: Account for storing Docker images.
Google Cloud Platform (GCP): Service connection created in Azure DevOps.
Terraform: Service connection created in Azure DevOps for infrastructure management.
GCP VM: Linux VM used as a self-hosted agent to run Azure DevOps pipelines.

1. Code Commit & Build

1.1 Developer Actions

Code Changes: Developers commit code changes to the GitHub repository.
1.2 Continuous Integration (CI) Pipeline

Trigger: A commit triggers the CI pipeline in Azure DevOps.
Pipeline Configuration:

Checkout Code: Pulls the latest code from the GitHub repository.
Build: Executes build scripts to compile the Spring Boot application.

Docker Build:
Dockerfile: Defines the steps to build the Docker image.
Docker Push: Pushes the Docker image to Docker Hub.

2. Continuous Deployment (CD)

2.1 CD Pipeline

Trigger: On successful build and push, triggers the CD pipeline in Azure DevOps.
Pipeline Configuration:

Terraform Deployment:
Authenticate: Set up authentication and project configuration with GCP.
Initialize Terraform: Prepare Terraform for execution.
Apply Terraform Configuration: Apply the Terraform configuration to deploy infrastructure.

Kubernetes Deployment:
Update Kubernetes Manifests: Modify Kubernetes manifests to use the new Docker image.
Apply Kubernetes Manifests: Apply the updated manifests to the GKE cluster.
Manage Kubernetes Service Accounts: Set up service accounts and permissions.

3. Branches & Pipelines

Branches: Two branches in GitHub - dev and main.
Infrastructure Folder: Contains Terraform files for infrastructure deployment.

Deployment Folders:
dev-deployment: Contains manifests for development deployments.
prod-deployment: Contains manifests for production deployments.

Azure DevOps Pipelines:
Dev Pipeline: Includes stages for testing, infrastructure deployment, and development deployment.
Production Pipeline: Includes stages for testing and production deployment.
Approvals: Both pipelines include approval stages.

5. Conclusion
This document provides a comprehensive overview of the automated deployment pipeline for a Spring Boot application. By following these steps, teams can achieve a streamlined and reliable deployment process using modern DevOps practices and tools.
