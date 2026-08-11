# Task 3: Git & GitHub Foundations for DevOps

A comprehensive guide and demonstration of production-grade **Git Workflows**, **SSH Authentication**, **Containerization with Docker**, and **GitHub Branch Protection Rules** for modern DevOps teams.

---

## 📐 Architecture & Features

- **Flask Microservice**: A lightweight Python REST API providing root (`/`) and health check (`/health`) endpoints.
- **Non-Root Containerization**: Configured with a dedicated non-privileged user (`appuser`) for enhanced security.
- **Environment Configuration Isolation**: Employs `.gitignore` and `.env.example` templates to prevent secret leakage.
- **SSH Key Authentication**: Key-based secure GitHub communication using `ED25519` key pairs.
- **Feature Branch Workflow**: Strict PR-based development flow avoiding direct commits to production/main branches.

---

## 📂 Project Structure

```text
task3-git-foundations/
├── .env.example       # Template for environment variables (Secrets Prevention)
├── .gitignore          # Prevents tracking virtual environments, caches & secrets
├── Dockerfile          # Multi-stage/secure Docker build file
├── README.md           # Comprehensive technical documentation
├── app.py              # Flask application entrypoint with health probes
└── requirements.txt    # Application dependencies
⚙️ Prerequisites
Git & GitHub configured via SSH.

Docker Engine installed and running.

Python 3.10+ (for local non-containerized testing).

🚀 Getting Started
1. Local Environment Setup
Bash
cd task3-git-foundations
cp .env.example .env
2. Docker Implementation
Build the Container Image
Bash
docker build -t flask-git-app:v1 .
Run the Container
Bash
docker run -d -p 5000:5000 --name flask-app flask-git-app:v1
Verify Application Probes
Main Route:

Bash
curl http://localhost:5000/
Response: {"message": "Welcome to Git & GitHub Foundations App!"}

Health Endpoint:

Bash
curl http://localhost:5000/health
Response: {"status": "ok"}

🔀 Git & GitHub Workflow
Base Commit on main:
Initial Flask app structure, Dockerfile, and metadata files committed to main.

Feature Branch Creation:

Bash
git checkout -b feature/health-endpoint
Feature Implementation:
Added /health route returning JSON health state.

Remote Push & Pull Request:

Bash
git push origin feature/health-endpoint
Opened Pull Request on GitHub.

Reviewed, approved, and merged into main.

🛡️ Branch Protection Rules
To enforce code review quality and prevent accidental production outages, Ruleset Protection was applied to the main branch on GitHub:

Enforcement Status: Active

Target Branch: main

Protection Features:

Require a Pull Request before merging: Prevents direct pushes to main.

Restrict Deletions: Prevents accidental deletion of the primary branch.

Testing Branch Protection
Attempting a direct push to main returns:

Plaintext
remote: error: GH006: Protected branch update failed for refs/heads/main.
❓ DevOps Q&A
Q1: Why is removing secrets from a recent commit insufficient?
Answer: Git preserves the complete repository history. Even if a secret is deleted in a subsequent commit, it remains accessible in prior commit objects and history logs (git log / git checkout). To fully remediate leaked secrets, the entire Git history must be rewritten (using tools like BGF Repo-Cleaner or git-filter-repo), and the compromised secret must be immediately rotated/revoked.
