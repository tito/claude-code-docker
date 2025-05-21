@echo off
REM Batch script to run the PowerShell Claude Code Docker script
SET SCRIPT_DIR=%~dp0
PowerShell -NoProfile -ExecutionPolicy Bypass -File "%SCRIPT_DIR%claude-code-docker-run.ps1" %*