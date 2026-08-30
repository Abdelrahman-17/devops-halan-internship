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

## 📌 Tasks Detail & Execution

### 🟢 Task 1: Dockerize Web Server
A minimal, secure Python Flask web server running under a restricted non-root user (`appuser`).

* **Run Container:** `docker run -d -p 8085:5000 --name web-server-app my-web-server:v1`
* **Verify App:** `curl http://localhost:8085`
* **Verify Non-Root User:** `docker exec -it web-server-app whoami` *(Output: appuser)*

---

### 🔵 Task 2: Multi-Container Python App with PostgreSQL
A dynamic web application connected to a PostgreSQL database with persistent volume storage and isolated bridge network.

* **Create Infrastructure:** 
  * Network: `docker network create app-net`
  * Volume: `docker volume create pgdata`
* **Deploy PostgreSQL & App:** 
  * `docker run -d --name postgres-db --network app-net -v pgdata:/var/lib/postgresql/data -e POSTGRES_USER=myuser -e POSTGRES_PASSWORD=mypassword -e POSTGRES_DB=namedb postgres:15-alpine`
  * `docker run -d --name dynamic-web-app --network app-net -p 8086:5000 dynamic-app:v1`

---

### ⚙️ Task 3: CI/CD Pipeline & Automated Registry Push


An automated GitHub Actions workflow configured for code quality and continuous delivery.

1. **Linting:** Code formatting checks via `ruff`.
2. **Build & Health Check:** Verifies container build and `/health` response.
3. **Deployment:** Pushes image to Docker Hub (`abdelrahmana890/myapp:latest`).

---

### 🔴 Task 4: Enterprise RKE Kubernetes Cluster, GitOps & Observability

Production-ready Kubernetes setup provisioned via **RKE**, fully automated with **ArgoCD** and monitored with **ELK & Prometheus**.

#### 🔑 Key Features
* **GitOps Continuous Delivery:** ArgoCD automatically syncs manifests from Git.
* **Storage & Databases:** Longhorn CSI backing a 3-replica MongoDB database.
* **Traffic & Scaling:** Nginx Ingress routing combined with Horizontal Pod Autoscaler (HPA).
* **Observability:** Centralized logging with ELK Stack and metrics export via Prometheus.

#### 🧪 Verification Commands

```bash
# Verify Application Workloads & Storage
kubectl get pods,pvc,ingress -n app

# Verify Centralized Logging (ELK)
kubectl get pods -n logging

# Verify Monitoring Stack (Prometheus)
kubectl get pods -n monitoring
```

---

## 🧹 Cleanup Guide

```bash
docker rm -f web-server-app dynamic-web-app postgres-db
docker network rm app-net
docker volume rm pgdata
```
