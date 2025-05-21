# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Purpose

This repository contains Docker configurations and scripts to run Claude Code in a Docker container, primarily intended for Windows users who need to use Claude Code in a containerized environment.

## Key Components

- `Dockerfile`: Defines the Docker image with Node.js and necessary dependencies for running Claude Code
- Shell scripts for building, running, and publishing the Docker image:
  - `docker-build.sh`: Builds the Docker image locally
  - `docker-run-local.sh`: Runs Claude Code in the Docker container
  - `docker-push-public.sh`: Pushes the Docker image to Docker Hub

## Environment Setup

The repository uses a `.env` file (created from `.env-template`) to configure Docker image names and tags:
- `IGD_UTILS_DOCKER_IMG`: Docker image name (default: idachev-claude-code)
- `IGD_UTILS_DOCKER_TAG`: Docker image tag (default: latest)

## Common Commands

### Building the Docker Image

```bash
./docker-build.sh
```

### Running Claude Code in Docker

```bash
./docker-run-local.sh
```

### Publishing the Docker Image

```bash
./docker-push-public.sh
```

## Development Workflow

1. Make changes to the `Dockerfile` or scripts as needed
2. Build the image using `./docker-build.sh`
3. Test the image using `./docker-run-local.sh`
4. If ready to publish, use `./docker-push-public.sh`