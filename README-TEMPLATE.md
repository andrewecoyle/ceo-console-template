# CEO Console - Your Autonomous AI Team

This project includes a complete CEO Console setup - an AI team that helps you build, grow, and manage your project autonomously.

## Your Team

### Executives (Strategic Advisors)
- **Product Lead** - `/exec-checkin product-lead`
- **Growth Lead** - `/exec-checkin growth-lead`
- **Finance Advisor** - `/exec-checkin finance-advisor`

### Development Team (Autonomous Feature Delivery)
- 4 Research agents (best practices, codebase, docs, git history)
- 3 Review agents (style, security, performance)
- **Command:** `/ship-feature "feature description"`

## Quick Start

### Ship Your First Feature

```
/ship-feature "Add user authentication"
```

The team will:
1. Research best practices (in parallel)
2. Present you a plan
3. Implement it
4. Review for security, performance, style
5. Auto-fix issues
6. Run tests
7. Create commit
8. Ship

### Check In With Executives

```
/exec-checkin product-lead
```

Get updates, make decisions, share priorities.

### Daily Workflows

```
/daily-standup      # Morning product update
/eod-summary        # End of day wrap-up
/weekly-planning    # Strategic planning session
```

## How It Learns

Every interaction teaches your team:
- Feature decisions → Product Lead learns priorities
- Code reviews → Style preferences learned
- Strategic discussions → Company strategy refined

After 20-30 features, your team will anticipate your preferences with 70-80% accuracy.

## File Structure

```
.
├── .claude/
│   ├── commands/           # /ship-feature, /escalate, etc.
│   └── agents/             # 7 specialized agents
├── executive-team/
│   ├── product-lead/
│   │   ├── knowledge-base.md    # Accumulates learnings
│   │   └── current-focus.md     # Active work
│   ├── growth-lead/
│   └── finance-advisor/
└── shared-memory/
    ├── ceo-preferences.md       # Cross-cutting preferences
    ├── company-strategy.md      # Strategic direction
    └── decision-log.md          # Major decisions
```

## Configuration

### Enable Autonomous Operation

See `SETUP-HOOKS.md` to configure auto-approval for safe operations while maintaining guard rails for dangerous commands.

### Fidelity Levels

Your team uses a 3-level model:

- **Fidelity 1**: Quick fixes → Just ship it
- **Fidelity 2**: Features → Research → Plan → Ship
- **Fidelity 3**: Big/fuzzy → Prototype → Learn → Plan → Ship

The team auto-detects which level applies.

## Commands Reference

| Command | What It Does |
|---------|-------------|
| `/ship-feature "desc"` | Autonomous feature delivery |
| `/exec-checkin <role>` | Check in with an executive |
| `/daily-standup` | Morning product update |
| `/weekly-planning` | Strategic planning session |
| `/escalate` | Escalate a decision to CEO |

## Learning Over Time

### Week 1
- Team learns your communication preferences
- Begins building pattern recognition
- Asks more questions

### Month 1
- 70% preference accuracy
- Stronger recommendations
- Less back-and-forth

### Quarter 1
- Deep understanding of priorities
- Anticipates your decisions
- Feels like senior team members

## Pro Tips

1. **Teach, don't just correct** - When giving feedback, explain *why*
2. **Be consistent** - Your team learns from patterns
3. **Review knowledge bases** - Periodically check what they've learned
4. **Update shared memory** - Keep strategy and preferences current

## Support

- Full docs: See `.claude/agents/README.md`
- Template source: https://github.com/yourusername/ceo-console-template
- Issues: Open an issue on the template repo

---

**Built with CEO Console v1.0**
Inspired by compound engineering principles - every interaction makes your team smarter.
