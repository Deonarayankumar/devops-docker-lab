# DevOps Docker Lab

Containerization lab with a Python API, Spring Boot stub, Docker Compose stack, and Trivy scanning.

## Apps

| Path | Description |
|------|-------------|
| `apps/python-api` | FastAPI service with multi-stage Dockerfile |
| `apps/spring-boot` | Java 21 Spring Boot stub with multi-stage Dockerfile |

## Quick Start

```bash
docker compose up --build
curl http://localhost:8000/health
```

API connects to PostgreSQL via `DATABASE_URL`.

## Scan Images

```bash
bash scripts/trivy-scan.sh
```

## Learnings

- Multi-stage builds reduce final image size
- Non-root users improve container security
- Compose networks isolate app and database tiers
