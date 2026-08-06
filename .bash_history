sudo nano /etc/apache2/ports.conf
sudo nano /etc/apache2/sites-available/000-default.conf
sudo systemctl restart apache2
sudo systemctl enable apache2
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
sudo nano /etc/nginx/sites-available/default
sudo apt update
sudo apt install apache2 -y
sudo sed -i 's/Listen 80/Listen 8080/' /etc/apache2/ports.conf
sudo sed -i 's/<VirtualHost \*:80>/<VirtualHost \*:8080>/' /etc/apache2/sites-available/000-default.conf
sudo systemctl restart apache2
/etc/apache2/apache2.conf
cat 
cat /etc/apache2/apache2.conf
nano /etc/apache2/apache2.conf
sudo rm apache
sudo rm apache 2
sudo rm apache2
nano/var/www/html
nano /var/www/html
cd var
ls
cd /
ls
cd var
cd www
ls
nano html
apache2 -v
sudo ufw app list
sudo systemctl status apache2
sudo systemctl start apache2
hostname -I
curl -4 icanhazip.com
sudo ss -tuln | grep :80
sudo tail -f /var/log/apache2/error.log
sudo systemctl status apache2
sudo ss -tulpn | grep -E '80|8080'
sudo ufw allow 80/tcp
sudo ufw allow 8080/tcp
sudo ufw reload
curl http://localhost:8080
sudo nano /etc/nginx/sites-available/default
sudo nginx -t
sudo systemctl restart nginx
sudo nano /etc/nginx/sites-available/default
sudo nginx -t
sudo systemctl restart nginx
curl http://localhost:8081
curl -I http://127.0.0.1:8080
curl -I http://127.0.0.1:8081
sudo ufw allow 8080/tcp
sudo ufw allow 8081/tcp
sudo ufw allow 80/tcp
sudo ufw reload
sudo ss -tulpn | grep -E '80|8080|8081'
sudo apt install haproxy -y
sudo nano /etc/haproxy/haproxy.cfg
sudo haproxy -c -f /etc/haproxy/haproxy.cfg
sudo systemctl restart haproxy
sudo nano /etc/haproxy/haproxy.cfg
sudo haproxy -c -f /etc/haproxy/haproxy.cfg
sudo systemctl restart haproxy
sudo mkdir -p /var/www/html/nginx
sudo nano /etc/nginx/sites-available/default
مس
ls
cd /
cd var
ls
cd www
ls
nano html
cd /
ls
cd /var/log/apache2
cd var
cd log
ls
nano apache2
cd .
cd ..
nano /etc/apache2/apache2.conf
ؤي
ls
cd var
ls
cd www
ls
cd html
ls
rm nginx
sudo rm nginx
sudo -r rm nginx
sudo nano /etc/haproxy/haproxy.cfg
sudo systemctl restart haproxy
sudo nano /etc/haproxy/haproxy.cfg
sudo useradd --no-create-home --shell /bin/false node_exporter
cd /tmp
wget https://github.com/prometheus/node_exporter/releases/download/v1.12.1/node_exporter-1.12.1.linux-amd64.tar.gz
tar xvf node_exporter-1.12.1.linux-amd64.tar.gz
sudo cp node_exporter-1.12.1.linux-amd64/node_exporter /usr/local/bin/
sudo chown node_exporter:node_exporter /usr/local/bin/node_exporter
sudo nano /etc/systemd/system/node_exporter.service
sudo systemctl daemon-reload
sudo systemctl start node_exporter
sudo systemctl enable node_exporter
systemctl status node_exporter
ps aux | grep node_exporter
curl http://localhost:9100/metrics
sudo nano /etc/haproxy/haproxy.cfg
sudo systemctl reload haproxy
haproxy -c -f /etc/haproxy/haproxy.cfg
sudo nano /etc/haproxy/haproxy.cfg
haproxy -c -f /etc/haproxy/haproxy.cfg
sudo systemctl reload haproxy
sudo nano /etc/haproxy/haproxy.cfg
haproxy -c -f /etc/haproxy/haproxy.cfg
sudo systemctl reload haproxy
sudo systemctl restart nginx
sudo systemctl enable nginx
sudo systemctl restart apache2
sudo systemctl enable apache2
curl http://localhost/nginx
sudo apt-get install -y apt-transport-https software-properties-common wget
sudo mkdir -p /etc/apt/keyrings/
wget -q -O - https://apt.grafana.com/gpg.key | gpg --dearmor | sudo tee /etc/apt/keyrings/grafana.gpg > /dev/null
echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main" | sudo tee /etc/apt/systemd/sources.list.d/grafana.list
echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main" | sudo tee /etc/apt/sources.list.d/grafana.list
sudo apt-get update
sudo apt-get install -y grafana
ctl سفشقفenable
sudo systemctl start grafana-server
sudo systemctl status grafana-server
ps aux | grep grafana
sudo systemctl status prometheus
cd /tmp
wget https://github.com/prometheus/prometheus/releases/download/v2.54.1/prometheus-2.54.1.linux-amd64.tar.gz
tar -xvf prometheus-2.54.1.linux-amd64.tar.gz
sudo mv prometheus-2.54.1.linux-amd64/prometheus /usr/local/bin/
sudo mv prometheus-2.54.1.linux-amd64/promtool /usr/local/bin/
sudo mkdir -p /etc/prometheus
sudo mkdir -p /var/lib/prometheus
sudo mv prometheus-2.54.1.linux-amd64/consoles /etc/prometheus
sudo mv prometheus-2.54.1.linux-amd64/console_libraries /etc/prometheus
sudo nano /etc/prometheus/prometheus.yml
sudo systemctl daemon-reload
sudo systemctl enable prometheues
sudo useradd --no-create-home --shell /bin/false prometheus
sudo chown -R prometheus:prometheus /etc/prometheus
sudo chown -R prometheus:prometheus /var/lib/prometheus
sudo nano /etc/systemd/system/prometheus.service
sudo systemctl daemon-reload
sudo systemctl enable prometheus
sudo systemctl start prometheus
sudo systemctl status prometheus
history
cd ..
history
cd ..
cd ~
history
sudo nano /etc/systemd/system/prometheus.service
sudo nano /etc/prometheus/prometheus.yml
sudo nano /etc/systemd/system/prometheus.service
sudo nano /etc/prometheus/prometheus.yml
history
sudo systemctl enable grafama
sudo systemctl enable grafana
sudo systemctl status grafana
sudo lsof -i -P -n | grep 3000
sudo systemctl list-units | grep graf
sudo systemctl status grafana-server
cd /tmp
wget https://github.com/prometheus/alertmanager/releases/download/v0.33.1/alertmanager-0.33.1.linux-amd64.tar.gz
tar -xvf alertmanager-0.33.1.linux-amd64.tar.gz
sudo mv alertmanager-0.33.1.linux-amd64/alertmanager /usr/local/bin/
sudo mv alertmanager-0.33.1.linux-amd64/amtool /usr/local/bin/
sudo mkdir -p /etc/alertmanager /var/lib/alertmanager
sudo useradd --no-create-home --shell /bin/false alertmanager 2>/dev/null || true
sudo chown -R alertmanager:alertmanager /etc/alertmanager
sudo chown -R alertmanager:alertmanager /var/lib/alertmanager
sudo chown alertmanager:alertmanager /usr/local/bin/alertmanager
sudo chown alertmanager:alertmanager /usr/local/bin/amtool
sudo nano /etc/prometheus/alert.rules.yml
sudo nano /etc/prometheus/prometheus.yml
sudo chown prometheus:prometheus /etc/prometheus/alert.rules.yml
sudo systemctl restart prometheus
sudo systemctl status alertmanager
sudo systemctl start alertmanager
curl http://localhost:9093/-/healthy
sudo nano /etc/systemd/system/alertmanager.service
sudo nano /etc/alertmanager/alertmanager.yml
sudo chown alertmanager:alertmanager /etc/alertmanager/alertmanager.yml
sudo systemctl daemon-reload
sudo systemctl enable alertmanager
sudo systemctl start alertmanager
sudo systemctl status alertmanager
sudo nano /etc/prometheus/alert.rules.yml
sudo systemctl restart prometheus
sudo nano /etc/prometheus/alert.rules.yml
sudo systemctl restart prometheus
sudo nano /etc/alertmanager/alertmanager.yml
sudo nano /etc/alertmanager/alertmanager.yml
sudo nano /etc/prometheus/prometheus.yml
sudo nano /etc/systemd/system/prometheus.service
sudo nano /etc/prometheus/prometheus.yml
sudo nano /etc/prometheues/alert.rules.yml
sudo nano /etc/prometheues/alert.rules.ymlsudo nano /etc/prometheus/alert.rules.yml
sudo systemctl restart prometheus
sudo systemctl restart alertmanager
sudo nano /etc/prometheues/alert.rules.yml
sudo nano /etc/prometheues/alert.rules.ymlsudo nano /etc/prometheus/alert.rules.yml
sudo systemctl restart alertmanager
sudo systemctl restart prometheus
sudo nano /etc/prometheues/alert.rules.ymlsudo nano /etc/prometheus/alert.rules.yml
sudo systemctl restart alertmanager
sudo systemctl restart prometheus
sudo nano /etc/prometheues/alert.rules.ymlsudo nano /etc/prometheus/alert.rules.yml
sudo nano /etc/alertmanager/alertmanager.yml
sudo systemctl restart alertmanager
sudo systemctl restart prometheus
sudo nano /etc/prometheues/alert.rules.ymlsudo nano /etc/prometheus/alert.rules.yml
sudo systemctl restart alertmanager
sudo systemctl restart prometheus
sudo systemctl status prometheus
sudo nano /etc/prometheues/alert.rules.yml
sudo  /etc/prometheues/
sudo nano /etc/prometheus/alert.rules.yml
sudo apt update
sudo apt install -y docker.io
sudo systemctl enable --now docker
sudo usermod -aG docker $USER
newgrp docker
docker run hello-world
sudo systemctl status docker
docker run -d -p 80:80 --name my-nginx nginx
docker ps
sudo lsof -i :80
sudo systemctl stop haproxy
docker rm my-nginx
docker run -d -p 80:80 --name my-nginx nginx
docker logs my-nginx
cd usr/share/nginx
cd /usr/share/nginx
ls
cd html
ls
nano index.html
sudo nano index.html
cd /
cd ~
docker exec my-nginx
docker exec my-nginx /bin/bash
docker exec -it my-nginx /bin/bash
docker run -d -p 8080:80 --name my-nginx-2 nginx
docker run -d -p 8081:80 --name my-nginx-2 nginx
docker rm my-nginx-2
docker run -d -p 8081:80 --name my-nginx-2 nginx
docker rm my-nginx-2
docker run -d -p 8083:80 --name my-nginx-2 nginx
docker exec my-nginx-2 sh -c 'echo "<h1>Hello from Second Container on Port 8083!</h1>" > /usr/share/nginx/html/index.html'
docker ps
mkdir ~/task1-dockerize-web-server && cd ~/task1-dockerize-web-server
cat << 'EOF' > app.py
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return "Hello World from Abdelrahman Awad's Dockerized Server! 🚀"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
EOF

# 3. إنشاء ملف requirements.txt
echo "flask==3.0.3" > requirements.txt
# 4. إنشاء ملف .dockerignore
cat << 'EOF' > .dockerignore
__pycache__
*.pyc
.git
.venv
EOF

مس
ls
rm app.py
rm requirements.txt
ls
cat << 'EOF' > app.py
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return "Hello World from Abdelrahman's Dockerized App! "

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
EOF

ls
echo "flask==3.0.3" > requirements.txt
cat << 'EOF' > .dockerignore
__pycache__
*.pyc
.git
.venv
EOF

cat << 'EOF' > Dockerfile
FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

RUN useradd -m appuser
USER appuser

EXPOSE 5000

CMD ["python", "app.py"]
EOF

docker build -t my-web-server:v1 .
docker run -d -p 5000:5000 --name web-server-app my-web-server:v1
docker exec -it web-server-app whoami
docker logs web-server-app
docker rm web-server-app
cat << 'EOF' > app.py
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return "Hello World from Abdelrahman's Dockerized App!"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
EOF

docker build -t my-web-server:v1 .
docker run -d -p 5000:5000 --name web-server-app my-web-server:v1
docker exec -it web-server-app whoami
curl http://localhost:5000
docker stop web-server-app && docker rm web-server-app
docker run -d -p 8085:5000 --name web-server-app my-web-server:v1
curl http://localhost:8085
cd ~/task1-dockerize-web-server
مس
ls
cat << 'EOF' > .gitignore
__pycache__/
*.pyc
.venv/
.env
EOF

cat << 'EOF' > README.md
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

cat << 'EOF' > README.md
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
EOF

git init
ls
cd task1-dockerize-web-server
ls
cat app.py
