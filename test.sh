#!/usr/bin/env bash



docker compose -f docker-compose.single-node.yml up -d --wait
docker compose  -f docker-compose.single-node.yml down -v