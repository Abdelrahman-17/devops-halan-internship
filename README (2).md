# 🚀 DevOps Halan Internship - Hands-on Tasks

This repository contains practical, production-ready DevOps implementation tasks covering containerization, multi-container setups, continuous integration pipelines, continuous delivery, persistent storage, security best practices, dynamic auto-scaling, and cluster observability.

---

## 🛠️ Tech Stack & Skills

* **Containerization:** Docker, Docker Compose
* **Orchestration:** Kubernetes (RKE v1.30 Engine), Helm
* **GitOps & Delivery:** ArgoCD, GitHub Actions CI/CD
* **Storage:** Named Docker Volumes, Longhorn Distributed Storage (CSI)
* **Observability & Logging:** ELK Stack (Elasticsearch & Kibana), Prometheus Monitoring
* **Networking & Ingress:** Custom Bridge Networks (DNS Service Discovery), Nginx Ingress Controller
* **Databases:** PostgreSQL, Stateful MongoDB (3 Replicas)
* **Backend:** Python (Flask)
* **Security:** Non-root Container Execution, Sealed Secrets, RBAC Policies

---

## 📁 Repository Structure

```text
devops-halan-internship/
├── task1-dockerize-web-server/       # Task 1: Basic Python Flask Server Containerization
│   ├── Dockerfile
│   ├── app.py
│   ├── requirements.txt
│   └── README.md
├── task2-docker-db/                  # Task 2: Multi-Container Setup with PostgreSQL
│   ├── Dockerfile
│   ├── app.py
│   ├── requirements.txt
│   └── README.md
├── .github/workflows/ci.yml          # Task 3: CI/CD Pipeline & Automated Registry Push
└── task4-kubernetes-rke-cluster/     # Task 4: Production-Ready RKE Cluster with GitOps & Observability
    └── rke-cluster/
        ├── cluster.yml
        ├── kube_config_cluster.yml
        └── manifests/
            ├── 01-namespace.yaml
            ├── 02-secret-configmap.yaml
            ├── 03-longhorn-pvc.yaml
            ├── 04-jobs-cronjobs.yaml
            ├── 05-ingress.yaml
            ├── elk-stack.yaml
            └── monitoring.yaml
🚀 Getting Started & Task Walkthroughs
📋 Prerequisites
Docker & Docker Compose installed and running.

Kubernetes CLI (kubectl), RKE CLI, and helm installed.

ArgoCD CLI configured.

Git installed.

🟢 Task 1: Dockerize Web Server
A minimal, secure Python Flask web server running under a restricted non-root user (appuser).

Steps to Run:
Navigate to Task 1 Directory:

Bash
cd task1-dockerize-web-server
Build the Docker Image:

Bash
docker build -t my-web-server:v1 .
Run the Container:

Bash
docker run -d -p 8085:5000 --name web-server-app my-web-server:v1
Verify Application:

Bash
curl http://localhost:8085
Verify Security (Non-Root User):

Bash
docker exec -it web-server-app whoami
# Output: appuser
🔵 Task 2: Multi-Container Python App with PostgreSQL
A dynamic web application connected to a PostgreSQL database with persistent volume storage and custom network isolation.

Steps to Run:
Create Docker Network & Volume:

Bash
docker network create app-net
docker volume create pgdata
Run PostgreSQL Database:

Bash
docker run -d \
  --name postgres-db \
  --network app-net \
  -v pgdata:/var/lib/postgresql/data \
  -e POSTGRES_USER=myuser \
  -e POSTGRES_PASSWORD=mypassword \
  -e POSTGRES_DB=namedb \
  postgres:15-alpine
Initialize Database Table and Seed Data:

Bash
docker exec -it postgres-db psql -U myuser -d namedb -c "CREATE TABLE users (id SERIAL PRIMARY KEY, name VARCHAR(100));"
docker exec -it postgres-db psql -U myuser -d namedb -c "INSERT INTO users (name) VALUES ('Abdelrahman Awad');"
Build and Run Web Server Container:

Bash
cd task2-docker-db
docker build -t dynamic-app:v1 .
docker run -d --name dynamic-web-app --network app-net -p 8086:5000 dynamic-app:v1
Verify Application:

Bash
curl http://localhost:8086
⚙️ Task 3: CI/CD Pipeline & Automated Registry Push
An automated GitHub Actions workflow configured to trigger on Pull Requests and Pushes to the main branch.

Pipeline Workflow Steps:
Linting: Code quality and formatting checks using ruff.

Docker Build & Health Check: Builds the target container locally and verifies the /health endpoint response.

Registry Deployment: Automatically logs in and pushes the built image to Docker Hub upon merging PRs into main.

📌 Docker Hub Repository: abdelrahmana890/myapp:latest

🔴 Task 4: Production-Ready RKE Kubernetes Cluster, GitOps & Observability
An enterprise-grade Kubernetes cluster provisioned via RKE (v1.30), featuring automated GitOps continuous delivery with ArgoCD, high-availability persistent storage, auto-scaling, and central observability.

Architectural Highlights:
GitOps Continuous Delivery: ArgoCD continuously monitors and synchronizes cluster manifests directly from Git.

Persistent Storage & HA Databases: Deployed Longhorn CSI for distributed volume management, backing a 3-replica MongoDB cluster deployed via Helm.

Traffic Management & Scaling: Configured Nginx Ingress Controller for domain routing and Horizontal Pod Autoscaler (HPA) for dynamic workload response.

Automated Batch Tasks: Deployed Kubernetes Jobs & CronJobs for periodic health checks and maintenance.

Observability Pipeline: Centralized logging with ELK Stack (Elasticsearch & Kibana) and cluster metrics exporter with Prometheus.

Steps to Verify Workloads:
Bash
# Verify Application & Ingress Resources
kubectl get pods,pvc,ingress -n app

# Verify Centralized Logging Stack (ELK)
kubectl get pods -n logging

# Verify Metrics Monitoring Stack
kubectl get pods -n monitoring

# Check ArgoCD Deployment Tree
argocd app get my-k8s-apps tree
🧹 Cleanup Guide
To stop and remove all local containers, networks, and resources:

Bash
# Stop and remove Task 1 & Task 2 Containers
docker rm -f web-server-app dynamic-web-app postgres-db

# Remove Docker Network & Volume
docker network rm app-net
docker volume rm pgdata