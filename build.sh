#!/bin/bash

REPO="mrdiffer/github-readme-stats"
TAG_NAME="$REPO:2024.06.04"
LATEST="$REPO:latest"

docker buildx create --use --name mounted-build-kit --node mounted-build-kit --bootstrap
if ! docker buildx build \
     --builder mounted-build-kit \
     --push \
     --platform linux/amd64,linux/arm64 \
     --tag $TAG_NAME --tag $LATEST -f Dockerfile  .; then
  echo "build error, terminating script"
  exit 1
fi
docker buildx prune -a -f --builder mounted-build-kit

echo "build completed successfully"