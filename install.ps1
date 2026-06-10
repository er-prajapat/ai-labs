# install.ps1 - Installs the skills from this repository to various coding agent skill folders.

param (
    [switch]$All,
    [switch]$Cursor,
    [switch]$Claude,
    [switch]$Gemini,
    [switch]$Codex,
    [switch]$Kiro,
    [switch]$Antigravity,
    [switch]$Agy
)

$HomeDir = [System.Environment]::GetFolderPath('UserProfile')

# Define target paths
$Targets = @{
    "cursor"      = "$HomeDir\.cursor\skills"
    "claude"      = "$HomeDir\.claude\skills"
    "gemini"      = "$HomeDir\.gemini\skills"
    "geminiConfig"= "$HomeDir\.gemini\config\skills"
    "codex"       = "$HomeDir\.codex\skills"
    "kiro"        = "$HomeDir\.kiro\skills"
    "antigravity" = "$HomeDir\.agents\skills"
    "agy"         = "$HomeDir\.gemini\antigravity-cli\skills"
}

# Determine which targets to install to
$SelectedTargets = @()

if ($All) {
    $SelectedTargets = $Targets.Keys
} else {
    if ($Cursor) { $SelectedTargets += "cursor" }
    if ($Claude) { $SelectedTargets += "claude" }
    if ($Gemini) { $SelectedTargets += "gemini"; $SelectedTargets += "geminiConfig" }
    if ($Codex) { $SelectedTargets += "codex" }
    if ($Kiro) { $SelectedTargets += "kiro" }
    if ($Antigravity) { $SelectedTargets += "antigravity" }
    if ($Agy) { $SelectedTargets += "agy" }
}

# Default to installing for Gemini/Antigravity (our current host environment) if nothing selected
if ($SelectedTargets.Count -eq 0) {
    Write-Host "No target specified. Installing to default Gemini/Antigravity paths..."
    $SelectedTargets += "gemini"
    $SelectedTargets += "geminiConfig"
    $SelectedTargets += "antigravity"
}

# Source directory
$SourceDir = Join-Path $PSScriptRoot "skills"

if (-not (Test-Path $SourceDir)) {
    Write-Error "Source directory 'skills' not found!"
    exit 1
}

# Copy skills to selected targets
foreach ($Key in $SelectedTargets) {
    $Dest = $Targets[$Key]
    Write-Host "Installing skills to $Dest ..."
    if (-not (Test-Path $Dest)) {
        New-Item -ItemType Directory -Path $Dest -Force | Out-Null
    }
    
    # Copy each subdirectory inside skills
    Get-ChildItem -Path $SourceDir -Directory | ForEach-Object {
        $SubDirName = $_.Name
        $SrcSub = $_.FullName
        
        Write-Host "  Copying $SubDirName -> $Dest"
        Copy-Item -Path $SrcSub -Destination $Dest -Recurse -Force
    }
}

Write-Host "Skills installation completed successfully!"
