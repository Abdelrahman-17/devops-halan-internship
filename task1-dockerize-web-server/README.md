# Dockerized Python Web Server

A minimal, secure, and self-contained Python web server built using Flask and packaged with Docker.

## Features
- **Framework:** Flask 3.0.3
- **Security:** Runs as a non-root user (`appuser`) inside the container.
- **Optimization:** Uses `python:3.11-slim` base image to minimize footprint.

---

## Difference Between `.gitignore` and `.dockerignore`

* **`.gitignore`**: Prevents unwanted or sensitive local files (like `__pycache__`, `.venv`, `.env`) from being committed and tracked in your Git repository.
* **`.dockerignore`**: Prevents unnecessary host files and folders from being copied into the Docker build context during `docker build`, keeping the final image lean and fast.

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
How to Build and Run
1. Build the Docker Image
Bash
docker build -t my-web-server:v1 .
2. Run the Container
Bash
docker run -d -p 8085:5000 --name web-server-app my-web-server:v1
3. Verify Application
Check local HTTP response:

Bash
curl http://localhost:8085
4. Verify Non-Root User Execution
Ensure the container runs securely as appuser:

Bash
docker exec -it web-server-app whoami
# Output: appuser
