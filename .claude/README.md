# CEO_Me Claude Code Configuration

This directory contains project-specific Claude Code customizations for the CEO_Me agent-based project management system.

## Available Slash Commands

These commands simulate check-ins from your AI agent team:

### Daily Commands
- `/daily-standup` - Morning standup from Project Manager (9:00 AM)
- `/eod-summary` - End of day summary from Project Manager (5:00 PM)

### Weekly Commands
- `/weekly-planning` - Weekly planning review from Head of Product (Mondays)
- `/code-review-summary` - Code review summary from Code Reviewer

### As-Needed Commands
- `/escalate` - Formal escalation format when agents need CEO decision
- `/update-roadmap` - Review and update project roadmap

## Agent Roles

**Project Manager Agent**
- Maintains roadmap and task tracking
- Provides daily standup and EOD summaries
- Identifies blockers and dependencies

**Head of Product Development Agent**
- Makes technical decisions within approved guidelines
- Proposes features and architecture changes
- Weekly planning and retrospectives

**Code Reviewer Agent**
- Reviews code for quality, security, and best practices
- Daily review summaries
- Flags issues requiring CEO attention

## Usage

Simply type any slash command in Claude Code, for example:
```
/daily-standup
```

The agent will respond in character with the appropriate check-in format.

## Customization

Feel free to modify the command templates in `.claude/commands/` to adjust:
- Report formats and verbosity
- Agent personalities and communication styles
- Check-in structures and requirements
- Decision-making boundaries
