# Claude Code Docker Image

This repository contains Docker configurations and scripts to run Claude Code in a Docker container, 
primarily intended for Windows users who need to use Claude Code in a containerized environment.

For development and architecture details, see [DEVELOP.md](DEVELOP.md).

## Quick Start - Download Scripts

### Linux/macOS

```bash
wget https://raw.githubusercontent.com/idachev/claude-code-docker/master/claude-code-docker-run.sh -O claude-code-docker-run.sh && chmod +x claude-code-docker-run.sh
```

### Windows

```powershell
Invoke-WebRequest -Uri https://raw.githubusercontent.com/idachev/claude-code-docker/master/claude-code-docker-run.ps1 -OutFile claude-code-docker-run.ps1
```

## Usage

### On Linux/macOS

```bash
./claude-code-docker-run.sh
```

You can set a custom location for Claude configuration files:

```bash
CLAUDE_CODE_HOME=/path/to/custom/dir ./claude-code-docker-run.sh
```

### On Windows

#### Prerequisites

Before running Claude Code in Docker on Windows, ensure that:

1. Virtual Machine Platform is enabled (required for Docker):
   ```powershell
   # Run as Administrator in PowerShell
   Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform
   ```

2. PowerShell execution policy is set appropriately:
   ```powershell
   # For the current process only
   Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

   # Or for the current user (more permanent)
   Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
   ```

#### Running the Container

```powershell
.\claude-code-docker-run.ps1
```

You can set a custom location for Claude configuration files:

```powershell
$env:CLAUDE_CODE_HOME = "D:\path\to\custom\dir"
.\claude-code-docker-run.ps1
```

## Updates and Exiting

When Claude Code completes an auto-update, you can:

1. Type `exit` once to exit Claude Code, which will return you to the Docker container's bash shell
2. Start Claude Code again to use the updated version by running `claude` within the bash shell 
3. To completely exit the Docker container, type `exit` a second time in the bash shell

This allows you to restart Claude with the updated version without having to restart the entire Docker container.