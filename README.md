# Claude Code Docker Image

This repository contains Docker configurations and scripts to run Claude Code in a Docker container, primarily intended for Windows users who need to use Claude Code in a containerized environment.

## Key Components

- `Dockerfile`: Defines the Docker image with Node.js and necessary dependencies for running Claude Code
  - Uses node:20-slim as base image
  - Installs required system packages
  - Installs Python and pip for code-index-mcp dependency
  - Sets up environment for Claude Code
- Shell scripts for building, running, and publishing the Docker image:
  - `docker-build.sh`: Builds the Docker image locally
  - `docker-run-local.sh`: Runs Claude Code in the Docker container
  - `docker-push.sh`: Pushes the Docker image to Docker Hub
- Windows support:
  - `claude-code-docker-run.ps1`: PowerShell script for running Claude Code in Docker on Windows
  - `claude-code-docker-run.bat`: Batch file wrapper for the PowerShell script

## Setting Up

First copy the `.env-template` to `.env` and edit with your info:

```bash
cp .env-template .env
```

You can configure the following environment variables:
- `IGD_UTILS_DOCKER_IMG`: Docker image name (default: idachev-claude-code)
- `IGD_UTILS_DOCKER_TAG`: Docker image tag (default: latest)

## Usage

### Building the Docker Image

```bash
./docker-build.sh
```

### Running Claude Code in Docker

#### On Linux/macOS

```bash
./docker-run-local.sh
```

You can set a custom location for Claude configuration files:

```bash
CLAUDE_CODE_HOME=/path/to/custom/dir ./docker-run-local.sh
```

#### On Windows

For PowerShell:

```powershell
.\claude-code-docker-run.ps1
```

For Command Prompt:

```cmd
claude-code-docker-run.bat
```

You can set a custom location for Claude configuration files:

```powershell
$env:CLAUDE_CODE_HOME = "D:\path\to\custom\dir"
.\claude-code-docker-run.ps1
```

### Publishing the Docker Image

```bash
./docker-push.sh
```

## Technical Details

The Docker image includes:
- Node.js 20 (slim version)
- Python 3 and pip for code-index-mcp
- Git, zsh, ripgrep and other development tools
- The Claude Code CLI tool

Important implementation notes:
- The Docker image switches between root and node users for different installation steps
- The final image uses the node user for security best practices
- Apt cache is cleaned up after all apt commands to reduce image size
