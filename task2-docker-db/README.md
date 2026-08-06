# Task 2: Multi-Container Python App with PostgreSQL

A dynamic web application built using Python Flask connected to a PostgreSQL database, featuring persistent volumes and custom network service discovery.

---

## ⚡ Features

* **Dynamic Data**: Reads content dynamically from PostgreSQL instead of hardcoded strings.
* **Data Persistence**: Uses a named Docker volume (`pgdata`) to preserve database state across container deletions.
* **Service Discovery**: Operates within a user-defined bridge network (`app-net`) allowing app-to-db communication by container name.

---

## 🚀 How to Setup and Run

### 1. Create Network and Volume

```bash
docker network create app-net
docker volume create pgdata
```

### 2. Run PostgreSQL Container

```bash
docker run -d   --name postgres-db   --network app-net   -v pgdata:/var/lib/postgresql/data   -e POSTGRES_USER=myuser   -e POSTGRES_PASSWORD=mypassword   -e POSTGRES_DB=namedb   postgres:15-alpine
```

### 3. Initialize Table & Data

```bash
docker exec -it postgres-db psql -U myuser -d namedb -c "CREATE TABLE users (id SERIAL PRIMARY KEY, name VARCHAR(100));"
docker exec -it postgres-db psql -U myuser -d namedb -c "INSERT INTO users (name) VALUES ('Abdelrahman Awad');"
```

### 4. Build and Run Web Server Container

```bash
cd ~/task2-docker-db
docker build -t dynamic-app:v1 .
docker run -d --name dynamic-web-app --network app-net -p 8086:5000 dynamic-app:v1
```

### 5. Verify Application

```bash
curl http://localhost:8086
```
