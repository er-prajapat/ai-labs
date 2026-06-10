# Dev Labs: Git Workflow and Skills

This repository contains custom developer guidelines and automated skills designed for developers and collaborative teams.

## Repository Contents

*   **[skills/git-workflow-and-versioning](file:///d:/workspace/ai-labs/skills/git-workflow-and-versioning/SKILL.md)**: A consolidated guide detailing the **Trunk-Flow** branching strategy and **Conventional Commits** specification.

---

## Trunk-Flow Strategy

This workflow combines the structured releases and hotfixes of **Git Flow** with the continuous integration speed of **Trunk-Based Development**, optimized for fast-paced development:

1.  **Dual Environments**:
    *   **Develop/Staging (`develop` branch)**: Code is integrated here continuously using short-lived feature branches (< 1-2 days). Merge/push to `develop` automatically deploys to the staging environment.
    *   **Production (`main` / `master` branch)**: Reflects production-ready code. Deployment to the live environment is triggered *exclusively* by pushing a semver release tag (e.g., `v1.2.0`) to the `main` branch.
2.  **Automated CI Gates**: Before code merges into `develop`, it undergoes automated linting, testing, and validation.
3.  **Conventional Commits**: Every commit must follow `<type>[optional scope]: <description>` (e.g., `feat(auth): add google login`).

---

## How to Install Skills

We provide installation scripts to copy these skills directly into the directory your coding tools/agents expect.

### Windows (PowerShell)
```powershell
# Install to default paths
.\install.ps1

# Install to all supported environments
.\install.ps1 -All

# Install to specific tool (e.g., Cursor)
.\install.ps1 -Cursor
```

### Unix / Mac (Bash)
```bash
# Install to default paths
./install.sh

# Install to all supported environments
./install.sh --all

# Install to specific tool (e.g., Claude Code)
./install.sh --claude
```

### Supported Environments & Target Paths
*   **Cursor**: `~/.cursor/skills`
*   **Claude Code**: `~/.claude/skills`
*   **Gemini CLI**: `~/.gemini/skills`
*   **Codex CLI**: `~/.codex/skills`
*   **Kiro CLI**: `~/.kiro/skills`
*   **Antigravity IDE**: `~/.agents/skills`
*   **Antigravity CLI (agy)**: `~/.gemini/antigravity-cli/skills`
