# Task 1: Dockerize Your Own Web Server

A minimal, secure Python Flask web server containerized with Docker, running under a non-root user.

---

## 💡 Difference Between `.gitignore` and `.dockerignore`

* **`.gitignore`**: Prevents unwanted or sensitive local files (like `__pycache__`, `.venv`, `.env`) from being committed and tracked in your Git repository.
* **`.dockerignore`**: Prevents unnecessary host files and folders from being copied into the Docker build context during `docker build`, keeping the final image lean and fast.

---

## 📁 Project Structure

```text
.
├── Dockerfile
├── .dockerignore
├── .gitignore
├── README.md
├── app.py
└── requirements.txt
🚀 How to Build and Run
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
