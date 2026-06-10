#!/bin/bash
# install.sh - Installs the skills from this repository to various coding agent skill folders.

show_help() {
    echo "Usage: ./install.sh [options]"
    echo "Options:"
    echo "  --all          Install to all agent paths"
    echo "  --cursor       Install to ~/.cursor/skills"
    echo "  --claude       Install to ~/.claude/skills"
    echo "  --gemini       Install to ~/.gemini/skills & ~/.gemini/config/skills"
    echo "  --codex        Install to ~/.codex/skills"
    echo "  --kiro         Install to ~/.kiro/skills"
    echo "  --antigravity  Install to ~/.agents/skills"
    echo "  --agy          Install to ~/.gemini/antigravity-cli/skills"
    echo "  --help         Show this help message"
}

ALL=false
CURSOR=false
CLAUDE=false
GEMINI=false
CODEX=false
KIRO=false
ANTIGRAVITY=false
AGY=false

while [[ "$#" -gt 0 ]]; do
    case $1 in
        --all) ALL=true ;;
        --cursor) CURSOR=true ;;
        --claude) CLAUDE=true ;;
        --gemini) GEMINI=true ;;
        --codex) CODEX=true ;;
        --kiro) KIRO=true ;;
        --antigravity) ANTIGRAVITY=true ;;
        --agy) AGY=true ;;
        --help) show_help; exit 0 ;;
        *) echo "Unknown parameter: $1"; show_help; exit 1 ;;
    esac
    shift
done

# Resolve home directory
HOMEDIR=$HOME

# Default behavior (if no flags are provided, install for current host)
if [ "$ALL" = false ] && [ "$CURSOR" = false ] && [ "$CLAUDE" = false ] && [ "$GEMINI" = false ] && [ "$CODEX" = false ] && [ "$KIRO" = false ] && [ "$ANTIGRAVITY" = false ] && [ "$AGY" = false ]; then
    echo "No target specified. Installing to default Gemini/Antigravity paths..."
    GEMINI=true
    ANTIGRAVITY=true
fi

# Define directories
SOURCE_DIR="./skills"

if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: Source directory 'skills' not found!"
    exit 1
fi

copy_skills() {
    local dest=$1
    echo "Installing skills to $dest ..."
    mkdir -p "$dest"
    cp -R "$SOURCE_DIR"/* "$dest"/
}

if [ "$ALL" = true ] || [ "$CURSOR" = true ]; then
    copy_skills "$HOMEDIR/.cursor/skills"
fi

if [ "$ALL" = true ] || [ "$CLAUDE" = true ]; then
    copy_skills "$HOMEDIR/.claude/skills"
fi

if [ "$ALL" = true ] || [ "$GEMINI" = true ]; then
    copy_skills "$HOMEDIR/.gemini/skills"
    copy_skills "$HOMEDIR/.gemini/config/skills"
fi

if [ "$ALL" = true ] || [ "$CODEX" = true ]; then
    copy_skills "$HOMEDIR/.codex/skills"
fi

if [ "$ALL" = true ] || [ "$KIRO" = true ]; then
    copy_skills "$HOMEDIR/.kiro/skills"
fi

if [ "$ALL" = true ] || [ "$ANTIGRAVITY" = true ]; then
    copy_skills "$HOMEDIR/.agents/skills"
fi

if [ "$ALL" = true ] || [ "$AGY" = true ]; then
    copy_skills "$HOMEDIR/.gemini/antigravity-cli/skills"
fi

echo "Skills installation completed successfully!"
