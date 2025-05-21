param (
    [switch]$DebugMode,
    [Parameter(ValueFromRemainingArguments=$true)]
    [string[]]$remainingArgs
)

if ($DebugMode) {
    $DebugPreference = 'Continue'
}

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

$DOCKER_IMG = "idachev/claude-code:latest"

if (-not $env:CLAUDE_CODE_HOME) {
    $env:CLAUDE_CODE_HOME = $env:USERPROFILE
}

$ClaudeDir = Join-Path $env:CLAUDE_CODE_HOME ".claude"
if (-not (Test-Path $ClaudeDir)) {
    New-Item -Path $ClaudeDir -ItemType Directory -Force | Out-Null
    Write-Host "Created $ClaudeDir directory"
}

$ClaudeConfigFile = Join-Path $env:CLAUDE_CODE_HOME ".claude.json"
if (-not (Test-Path $ClaudeConfigFile)) {
    New-Item -Path $ClaudeConfigFile -ItemType File -Force | Out-Null
    Write-Host "Created empty $ClaudeConfigFile file"
}

$CURRENT_DIR = (Get-Location).Path
$CURRENT_DIR_BASENAME = Split-Path -Leaf $CURRENT_DIR

$DOCKER_NAME = "claude-code"

$CURRENT_DIR_DOCKER = $CURRENT_DIR -replace '\\', '/' -replace '^([A-Za-z]):', '//$1'
$CLAUDE_DIR_DOCKER = $ClaudeDir -replace '\\', '/' -replace '^([A-Za-z]):', '//$1'
$CLAUDE_CONFIG_DOCKER = $ClaudeConfigFile -replace '\\', '/' -replace '^([A-Za-z]):', '//$1'

try {
    & docker run -it --rm `
        --name $DOCKER_NAME `
        -v "${CURRENT_DIR_DOCKER}:/workspace/${CURRENT_DIR_BASENAME}" `
        -v "${CLAUDE_DIR_DOCKER}:/home/node/.claude" `
        -v "${CLAUDE_CONFIG_DOCKER}:/home/node/.claude.json" `
        --entrypoint /bin/bash `
        $DOCKER_IMG `
        -c "cd /workspace/${CURRENT_DIR_BASENAME} && claude $remainingArgs"
} catch {
    Write-Error "Error running Docker: $_"
    exit 1
}
