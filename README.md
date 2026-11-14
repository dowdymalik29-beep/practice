# Practice App

This repository contains a small Python Flask sample application and a CI/CD setup using Jenkins and SonarQube.

## Project overview
- Flask app exposes a simple `/health` endpoint.
- Dockerfile builds the app into a container.
- `docker-install.sh` installs Docker Engine on Ubuntu/Debian.
- `docker-compose.yml` sets up Jenkins, SonarQube, and PostgreSQL.
- `Jenkinsfile` runs repository checkout, SonarQube analysis, and Docker image build.

## Local run
```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
python app.py
```

Then open http://localhost:5000/health

## Docker build
```bash
docker build -t practice-app .
docker run -p 5000:5000 practice-app
```

## Docker fundamentals
- Volumes persist data across container restarts and are defined under `volumes:` in Docker Compose.
- Networks allow containers to communicate by service name (for example, Jenkins connects to SonarQube over the shared Docker network).
- `docker-compose.yml` uses a bridge network for the Jenkins/SonarQube stack.
