# 🚀 DevOps Halan Internship - Hands-on Tasks

This repository contains practical, production-ready DevOps implementation tasks covering containerization, multi-container setups, continuous integration pipelines, continuous delivery, persistent storage, security best practices, dynamic auto-scaling, and cluster observability.

---

## 🛠️ Tech Stack & Overview

| Domain | Technologies Used |
| :--- | :--- |
| **Containerization & Orchestration** | Docker, Docker Compose, Kubernetes (RKE v1.30), Helm |
| **GitOps & CI/CD** | ArgoCD, GitHub Actions |
| **Storage & Persistence** | Docker Named Volumes, Longhorn Distributed Storage (CSI) |
| **Observability & Logging** | ELK Stack (Elasticsearch & Kibana), Prometheus Monitoring |
| **Networking & Ingress** | Custom Bridge Networks, Nginx Ingress Controller |
| **Databases & Backend** | PostgreSQL, Stateful MongoDB (3 Replicas), Python (Flask) |

---

## 📁 Repository Structure

```text
devops-halan-internship/
├── task1-dockerize-web-server/       # Task 1: Basic Python Flask Server Containerization
├── task2-docker-db/                  # Task 2: Multi-Container Setup with PostgreSQL
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
```

---

## 🚀 Tasks Execution & Verification Guide

### 🟢 Task 1: Dockerize Web Server

#### 1. Run / Deploy
```bash
cd task1-dockerize-web-server
docker build -t my-web-server:v1 .
docker run -d -p 8085:5000 --name web-server-app my-web-server:v1
```

#### 2. Verification
```bash
# Check HTTP response
curl http://localhost:8085

# Verify container is running under restricted non-root user (appuser)
docker exec -it web-server-app whoami
```

---

### 🔵 Task 2: Multi-Container Python App with PostgreSQL

#### 1. Run / Deploy
```bash
cd task2-docker-db

# Create isolated bridge network and persistent volume
docker network create app-net
docker volume create pgdata

# Run PostgreSQL container
docker run -d   --name postgres-db   --network app-net   -v pgdata:/var/lib/postgresql/data   -e POSTGRES_USER=myuser   -e POSTGRES_PASSWORD=mypassword   -e POSTGRES_DB=namedb   postgres:15-alpine

# Build and run Flask application connected to PostgreSQL
docker build -t dynamic-app:v1 .
docker run -d --name dynamic-web-app --network app-net -p 8086:5000 dynamic-app:v1
```

#### 2. Verification
```bash
# Initialize schema & insert sample record
docker exec -it postgres-db psql -U myuser -d namedb -c "CREATE TABLE users (id SERIAL PRIMARY KEY, name VARCHAR(100));"
docker exec -it postgres-db psql -U myuser -d namedb -c "INSERT INTO users (name) VALUES ('Abdelrahman Awad');"

# Test dynamic endpoint fetching data from PostgreSQL
curl http://localhost:8086
```

---

### ⚙️ Task 3: CI/CD Pipeline & Automated Registry Push


#### 1. Run / Deploy
Automated via GitHub Actions on every Pull Request and push to `main`.

#### 2. Verification
* Check pipeline status in the **Actions** tab on GitHub.
* Verify public Docker image availability:
  ```bash
  docker pull abdelrahmana890/myapp:latest
  ```

---

### 🔴 Task 4: Enterprise RKE Cluster, GitOps & Observability

#### 1. Run / Deploy
```bash
cd task4-kubernetes-rke-cluster/rke-cluster

# Provision Kubernetes cluster
rke up --config cluster.yml
export KUBECONFIG=$(pwd)/kube_config_cluster.yml

# Apply all manifests (Namespaces, PVCs, Ingress, CronJobs, Logging & Monitoring)
kubectl apply -f manifests/
```

#### 2. Verification
```bash
# Check status of application workloads and ingress
kubectl get pods,pvc,ingress -n app

# Verify GitOps synchronization status via ArgoCD
argocd app get my-k8s-apps tree

# Check centralized logging pipeline (ELK Stack)
kubectl get pods -n logging

# Check cluster metrics monitoring pipeline (Prometheus)
kubectl get pods -n monitoring
```

---

## 🧹 Cleanup Guide

To stop and wipe out all local test containers, networks, and storage volumes:

```bash
docker rm -f web-server-app dynamic-web-app postgres-db
docker network rm app-net
docker volume rm pgdata
```
