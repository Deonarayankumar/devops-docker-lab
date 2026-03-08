#!/usr/bin/env bash
# trivy-scan.sh — Scan local Docker images for vulnerabilities.
set -euo pipefail

IMAGES=("devops-docker-lab-api:latest" "devops-docker-lab-spring:latest")

if ! command -v trivy >/dev/null 2>&1; then
  echo "Trivy is required. Install: https://aquasecurity.github.io/trivy/"
  exit 1
fi

echo "=== Trivy Image Scan ==="
for img in "${IMAGES[@]}"; do
  if docker image inspect "$img" >/dev/null 2>&1; then
    echo "--- $img ---"
    trivy image --severity HIGH,CRITICAL --exit-code 0 "$img"
  else
    echo "Skipping $img (image not built)"
  fi
done
echo "Done."
