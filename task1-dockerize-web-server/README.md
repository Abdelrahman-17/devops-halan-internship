# Task 1: Dockerize Your Own Web Server

A minimal, secure Python Flask web server containerized with Docker, running under a non-root user.

---

## Difference Between .gitignore and .dockerignore

* **.gitignore**: Prevents unwanted or sensitive local files from being committed and tracked.
* **.dockerignore**: Prevents unnecessary host files from being copied into the Docker build context.

---

## Project Structure

```text
.
├── Dockerfile
├── .dockerignore
├── .gitignore
├── README.md
├── app.py
└── requirements.txt
```

---

## How to Build and Run

### 1. Build the Docker Image

Execute the build command to package the application into a container image:

```bash
docker build -t my-web-server:v1 .
```

### 2. Run the Container

Launch the application in detached mode on port 8085:

```bash
docker run -d -p 8085:5000 --name web-server-app my-web-server:v1
```

### 3. Verify Application

Test the HTTP response using curl:

```bash
curl http://localhost:8085
```

### 4. Verify Non-Root User Execution

Confirm that the container runs under the security-restricted appuser:

```bash
docker exec -it web-server-app whoami
```

**Expected Output:**

```text
appuser
```
