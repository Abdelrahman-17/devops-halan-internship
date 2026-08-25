# Task 4: Kubernetes RKE Cluster Implementation & Workload Management

## 📌 Project Overview
Comprehensive hands-on implementation of an **RKE (Rancher Kubernetes Engine)** cluster version `v1.30.2`, including full lifecycle management of microservices, distributed storage, Helm deployments, autoscaling, and networking rules.

---

## 🛠 Sub-Tasks Executed

### 1. Cluster Setup & Upgrade
- Provisioned RKE 1.30 cluster using `cluster.yml`.
- Configured local environment access via exported `KUBECONFIG`.
- Verified nodes availability (`controlplane`, `etcd`, `worker`).

### 2. Workload Deployments & Scaling (Helm)
- Created dedicated namespace: `app`.
- Deployed **Nginx** via Helm chart and scaled to **5 replicas**.
- Deployed **MongoDB Replica Set** (3 instances + 1 arbiter) using Helm.
- Performed container debugging using `kubectl exec`.

### 3. Resources & Autoscaling (HPA)
- Applied CPU/Memory `requests` & `limits` on application deployments.
- Configured **Horizontal Pod Autoscaler (HPA)** for dynamic scaling based on resource metrics.

### 4. Configuration & Secrets Management
- Defined `Secret` object for sensitive database credentials.
- Created `ConfigMap` for application configuration and mounted environment parameters.

### 5. Persistent Storage with Longhorn
- Installed and configured **Longhorn** storage provider.
- Created `PersistentVolumeClaim (PVC)` backed by Longhorn distributed storage.

### 6. Jobs, Scheduling & Ingress
- Executed one-time batch `Job`.
- Configured `CronJob` scheduled to execute every 5 minutes.
- Configured **Nginx Ingress Controller** to route external domain `rke-app.local`.
- Managed pod scheduling constraints using **Taints & Tolerations**.

---

## 💻 Verification Commands

```bash
# Verify cluster node status
kubectl get nodes -o wide

# Check all running pods across namespaces
kubectl get pods -A

# Inspect Longhorn PVCs
kubectl get pvc -n app
