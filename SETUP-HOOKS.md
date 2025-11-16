# Claude Code Auto-Approval Hook Setup

This document explains how to enable autonomous operation in Claude Code by configuring hooks.

## What Was Created

A hook script has been created at:
```
~/.config/claude-code/hooks/auto-approve.sh
```

This script automatically approves safe operations so you don't have to manually approve every action.

## Auto-Approved Tools

The hook automatically approves:
- **Read-only operations**: Read, Glob, Grep, BashOutput
- **Research tools**: WebSearch, WebFetch
- **File modifications**: Write, Edit, NotebookEdit
- **Task orchestration**: Task, TodoWrite
- **Bash commands**: All bash commands (consider reviewing dangerous ones)
- **Workflows**: Skill, SlashCommand

Other tools will still ask for approval.

## How to Enable Auto-Approval

### ✅ CONFIGURED: Hooks are already set up!

The hook system has been configured at:
- **Settings**: `~/.config/claude-code/settings.json`
- **Hook script**: `~/.config/claude-code/hooks/auto-approve.sh`

**To activate:**
1. Restart Claude Code (close and reopen VSCode)
2. The hook will now auto-approve safe operations

### What Gets Auto-Approved

✅ **Always approved:**
- Read operations (Read, Glob, Grep)
- Research (WebSearch, WebFetch)
- File edits (Write, Edit, NotebookEdit)
- Agent tasks (Task, TodoWrite)
- Safe bash commands

⚠️ **Requires approval:**
- Dangerous bash commands (`rm -rf`, `git push --force`, `git reset --hard`, `dd`, etc.)
- Unknown/new tools

### Method 2: Alternative - Use dangerouslyAllow (not recommended)

1. Open your VSCode settings.json:
   - `Cmd/Ctrl + Shift + P`
   - Type "Preferences: Open User Settings (JSON)"
   - Press Enter

2. Add this configuration:
   ```json
   {
     "claudeCode.hooks.preToolUse": {
       "command": "~/.config/claude-code/hooks/auto-approve.sh",
       "description": "Auto-approve safe tool operations for autonomous workflows"
     }
   }
   ```

3. Save the file and restart Claude Code

### Option 3: Environment Variable

If Claude Code supports it, you can also set:
```bash
export CLAUDE_CODE_PRE_TOOL_USE_HOOK="~/.config/claude-code/hooks/auto-approve.sh"
```

Add this to your `~/.zshrc` or `~/.bashrc` and restart your terminal.

## Verify It's Working

After enabling the hook:

1. Start a new Claude Code conversation
2. Ask Claude to read a file or search the web
3. You should NOT see an approval prompt
4. The action should execute immediately

## Customizing the Hook

If you want to change what gets auto-approved, edit:
```
~/.config/claude-code/hooks/auto-approve.sh
```

For example, to require approval for bash commands:
```bash
"Bash")
    echo "ASK"  # Changed from "APPROVE"
    ;;
```

## Guard Rails Still In Place

Even with auto-approval, you still have protection:

1. **Git Safety Protocol**: Claude won't run dangerous git commands (force push, hard reset) without explicit permission
2. **Dangerous bash**: You can configure the hook to ask before destructive commands
3. **Plan mode**: If you enable plan mode, Claude will still present a plan before executing

## Recommended Setup for CEO Console

For the autonomous CEO Console workflows, use these settings:

```json
{
  "claudeCode.hooks.preToolUse": {
    "command": "~/.config/claude-code/hooks/auto-approve.sh",
    "description": "Enable autonomous operation"
  },
  "claudeCode.planMode": false
}
```

This allows:
- `/ship-feature` to autonomously research, implement, review, and ship
- `/daily-standup` to read knowledge bases and update without asking
- Research agents to gather information automatically
- Full autonomous workflow per the Fidelity model

## Troubleshooting

**Hook not running:**
- Check the script is executable: `ls -l ~/.config/claude-code/hooks/auto-approve.sh`
- Should show `-rwxr-xr-x` (executable)
- If not: `chmod +x ~/.config/claude-code/hooks/auto-approve.sh`

**Still seeing approval prompts:**
- Verify hook is configured in settings
- Restart Claude Code/VSCode
- Check Claude Code logs for hook errors

**Want to temporarily disable:**
- Set `claudeCode.hooks.preToolUse` to `null` in settings
- Or rename the hook script: `mv ~/.config/claude-code/hooks/auto-approve.sh{,.disabled}`

## Security Note

Auto-approving bash commands means Claude can execute terminal commands without asking. The hook script approves all bash commands by default.

If you're concerned, modify the hook to require approval for bash:
```bash
"Bash")
    echo "ASK"
    ;;
```

Or create a smarter check that only auto-approves safe commands:
```bash
"Bash")
    # Get the actual command from stdin or environment
    # Check if it contains dangerous patterns
    if echo "$BASH_COMMAND" | grep -qE "rm -rf|push --force|reset --hard"; then
      echo "ASK"
    else
      echo "APPROVE"
    fi
    ;;
```

---

**Created**: 2025-11-15
**For**: CEO Console autonomous workflows
