# DevOps Halan Internship - Hands-on Tasks

This repository contains practical DevOps tasks covering containerization, database integration, persistent storage, security best practices, and custom network management using Docker.

---

## 🛠️ Tech Stack & Skills

* **Containerization:** Docker
* **Backend:** Python (Flask)
* **Database:** PostgreSQL
* **Networking:** User-Defined Docker Bridge Networks (DNS Service Discovery)
* **Storage:** Named Docker Volumes
* **Security:** Non-root Container Execution ()

---

## 📁 Repository Structure

```text
devops-halan-internship/
├── task1-dockerize-web-server/   # Task 1: Basic Python Flask Server Containerization
│   ├── Dockerfile
│   ├── app.py
│   ├── requirements.txt
│   └── README.md
└── task2-docker-db/              # Task 2: Multi-Container Setup with PostgreSQL
    ├── Dockerfile
    ├── app.py
    ├── requirements.txt
    └── README.md
```

---

## 🚀 Getting Started

Follow these steps to run the tasks locally on your environment.

### 📋 Prerequisites

* Docker installed and running on your system.
* Git installed.

---

### 🟢 Task 1: Dockerize Web Server

A minimal, secure Python Flask web server running under a restricted non-root user ().

#### Steps to Run:

1. **Navigate to Task 1 Directory:**
   ```bash
   cd task1-dockerize-web-server
   ```

2. **Build the Docker Image:**
   ```bash
   docker build -t my-web-server:v1 .
   ```

3. **Run the Container:**
   ```bash
   docker run -d -p 8085:5000 --name web-server-app my-web-server:v1
   ```

4. **Verify Application:**
   ```bash
   curl http://localhost:8085
   ```

5. **Verify Security (Non-Root User):**
   ```bash
   docker exec -it web-server-app whoami
   # Output: appuser
   ```

---

### 🔵 Task 2: Multi-Container Python App with PostgreSQL

A dynamic web application connected to a PostgreSQL database with persistent volume storage and custom network isolation.

#### Steps to Run:

1. **Create Docker Network & Volume:**
   ```bash
   docker network create app-net
   docker volume create pgdata
   ```

2. **Run PostgreSQL Database:**
   ```bash
   docker run -d      --name postgres-db      --network app-net      -v pgdata:/var/lib/postgresql/data      -e POSTGRES_USER=myuser      -e POSTGRES_PASSWORD=mypassword      -e POSTGRES_DB=namedb      postgres:15-alpine
   ```

3. **Initialize Database Table and Seed Data:**
   ```bash
   docker exec -it postgres-db psql -U myuser -d namedb -c "CREATE TABLE users (id SERIAL PRIMARY KEY, name VARCHAR(100));"
   docker exec -it postgres-db psql -U myuser -d namedb -c "INSERT INTO users (name) VALUES ('Abdelrahman Awad');"
   ```

4. **Build and Run Web Server Container:**
   ```bash
   cd task2-docker-db
   docker build -t dynamic-app:v1 .
   docker run -d --name dynamic-web-app --network app-net -p 8086:5000 dynamic-app:v1
   ```

5. **Verify Application:**
   ```bash
   curl http://localhost:8086
   ```

---

## 🧹 Cleanup Guide

To stop and remove all running containers, networks, and volumes:

```bash
# Stop and remove containers
docker rm -f web-server-app dynamic-web-app postgres-db

# Remove network and volume
docker network rm app-net
docker volume rm pgdata
```
