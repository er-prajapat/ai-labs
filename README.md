# AI Labs: Coding Agent Skills & Workflows

This repository contains custom developer guidelines and automated skills designed specifically for AI coding agents and human-AI collaborative environments.

## Repository Contents

*   **[skills/git-workflow-and-versioning](file:///d:/workspace/ai-labs/skills/git-workflow-and-versioning/SKILL.md)**: A consolidated guide detailing the **AI-Augmented Trunk-Flow** branching strategy and **Conventional Commits** specification.

---

## AI-Augmented Trunk-Flow Strategy

This workflow combines the structured releases and hotfixes of **Git Flow** with the continuous integration speed of **Trunk-Based Development**, optimized for agent-led workflows:

1.  **Dual Environments**:
    *   **Develop/Staging (`develop` branch)**: Code is integrated here continuously using short-lived feature branches (< 1-2 days). Merge/push to `develop` automatically deploys to the staging environment.
    *   **Production (`main` / `master` branch)**: Reflects production-ready code. Deployment to the live environment is triggered *exclusively* by pushing a semver release tag (e.g., `v1.2.0`) to the `main` branch.
2.  **AI-Specific Gates**: Before code merges into `develop`, it undergoes automated linting, test suites, and LLM semantic validation.
3.  **Conventional Commits**: Every commit must follow `<type>[optional scope]: <description>` (e.g., `feat(auth): add google login`).

---

## How to Install Skills

We provide installation scripts to copy these skills directly into the directory your coding agent expects.

### Windows (PowerShell)
```powershell
# Install to default agent directories (Gemini/Antigravity/OpenCode)
.\install.ps1

# Install to all supported agents
.\install.ps1 -All

# Install to specific agent (e.g., Cursor)
.\install.ps1 -Cursor
```

### Unix / Mac (Bash)
```bash
# Install to default agent directories
./install.sh

# Install to all supported agents
./install.sh --all

# Install to specific agent (e.g., Claude Code)
./install.sh --claude
```

### Supported Agents & Target Paths
*   **Cursor**: `~/.cursor/skills`
*   **Claude Code**: `~/.claude/skills`
*   **Gemini CLI**: `~/.gemini/skills`
*   **Codex CLI**: `~/.codex/skills`
*   **Kiro CLI**: `~/.kiro/skills`
*   **Antigravity IDE**: `~/.agents/skills`
*   **Antigravity CLI (agy)**: `~/.gemini/antigravity-cli/skills`
