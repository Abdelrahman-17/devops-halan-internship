# 🚀 Production-Ready RKE Kubernetes Cluster with GitOps, Storage & Observability

An end-to-end Kubernetes practical implementation featuring an RKE (Rancher Kubernetes Engine) v1.30 deployment, managed fully via GitOps with ArgoCD, integrated persistent storage using Longhorn, dynamic scaling (HPA), automated batch workloads, and full observability (ELK Stack + Prometheus Monitoring).

---

## 🏗️ Architecture & Core Components

- **Cluster Management:** RKE (v1.30) Engine
- **GitOps Continuous Delivery:** ArgoCD
- **Persistent Storage:** Longhorn CSI (Distributed Block Storage)
- **Database Layer:** Stateful MongoDB Cluster (3 Replicas) via Helm
- **Ingress & Networking:** Nginx Ingress Controller
- **Auto-Scaling:** Horizontal Pod Autoscaler (HPA) with CPU/Memory requests & limits
- **Cron/Jobs Automation:** Scheduled cluster health & automated workloads
- **Observability & Logging:**
  - **ELK Stack:** Elasticsearch & Kibana (Centralized Log Analytics)
  - **Monitoring:** Prometheus Metrics Exporter

---

## 🛠️ Repository Structure

```text
.
├── cluster.yml                 # RKE Cluster Configuration File
├── kube_config_cluster.yml    # Kubernetes Auth Credentials
└── manifests/                  # GitOps Declarative Manifests
    ├── 01-namespace.yaml       # Application Isolation Scope
    ├── 02-secret-configmap.yaml# App Configurations & Encrypted Credentials
    ├── 03-longhorn-pvc.yaml    # Storage Claim for Persistent Data
    ├── 04-jobs-cronjobs.yaml   # Batch Processing & Health Automation
    ├── 05-ingress.yaml         # L7 Domain Traffic Routing
    ├── elk-stack.yaml          # Elasticsearch & Kibana Manifests
    └── monitoring.yaml         # Prometheus Monitoring Pipeline
🚀 Key Implementation Highlights
1. GitOps Workflow via ArgoCD
Applications and infrastructure components are fully synchronized from this repository via ArgoCD using automated sync policies.

2. High-Availability Storage & DB
Deployed a 3-replica MongoDB database powered by Longhorn Persistent Volume Claims (PVC), ensuring data resilience across node failures.

3. Dynamic Scaling & Resource Management
Configured CPU/Memory Resource Requests and Limits, paired with HPA for auto-scaling under peak traffic conditions.

4. Enterprise Observability
Centralized log aggregation using Elasticsearch and Kibana (logging namespace).

Metrics collection using Prometheus (monitoring namespace).

🚦 Verification Commands
Bash
# Check Application Workloads & Storage
kubectl get pods,pvc,ingress -n app

# Verify Centralized Logging (ELK)
kubectl get pods -n logging

# Verify Monitoring Stack
kubectl get pods -n monitoring

# Check ArgoCD Deployment Tree
argocd app get my-k8s-apps tree
