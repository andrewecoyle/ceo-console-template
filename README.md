# CEO Console Template

A reusable template for setting up an autonomous AI executive team in any project.

## What This Is

Drop an entire AI executive team into any project:
- 3 Executives (Product, Growth, Finance)
- 8 Specialized agents (4 researchers + 4 reviewers)
- Autonomous `/ship-feature` workflow
- Learning system that improves over time

## Quick Start

### Initialize in a New Project

```bash
cd ~/ceo-console-template
./init-ceo-console.sh ~/path/to/your/project
```

### Initialize in Current Directory

```bash
cd ~/path/to/your/project
~/ceo-console-template/init-ceo-console.sh .
```

### What Gets Installed

```
your-project/
├── .claude/
│   ├── commands/
│   │   ├── ship-feature.md       # Autonomous feature delivery
│   │   ├── exec-checkin.md
│   │   ├── escalate.md
│   │   └── (other workflows)
│   └── agents/
│       ├── best-practices-researcher.md
│       ├── codebase-analyst.md
│       ├── framework-docs-researcher.md
│       ├── git-history-analyzer.md
│       ├── andrew-style-reviewer.md
│       ├── security-sentinel.md
│       ├── performance-oracle.md
│       └── ux-reviewer.md           # UX/accessibility review
├── executive-team/
│   ├── product-lead/
│   │   ├── knowledge-base.md     # Empty, will learn
│   │   └── current-focus.md
│   ├── growth-lead/
│   │   └── knowledge-base.md
│   └── finance-advisor/
│       └── knowledge-base.md
├── shared-memory/
│   ├── ceo-preferences.md        # Empty, will learn
│   ├── company-strategy.md
│   └── decision-log.md
└── CEO-CONSOLE-README.md         # User guide
```

## Use Cases

### Scenario 1: SaaS Project
```bash
./init-ceo-console.sh ~/projects/my-saas-app
```
Full executive team manages product development, growth experiments, and finances.

### Scenario 2: Client Project
```bash
./init-ceo-console.sh ~/clients/acme-corp
```
Product-focused team ships features autonomously while learning client preferences.

### Scenario 3: Side Project
```bash
./init-ceo-console.sh ~/side-projects/weekend-hack
```
Lightweight development team with learning capabilities for rapid iteration.

## Features

### Autonomous Feature Delivery
```
/ship-feature "Add user authentication"
```
- Researches best practices (4 agents in parallel)
- Creates implementation plan
- Builds the feature
- Reviews for security, performance, style, UX/accessibility (4 agents in parallel)
- Auto-fixes issues
- Runs tests
- Ships

### Learning System
Every interaction teaches the team:
- Code review → Learns your style preferences
- Feature decisions → Learns your priorities
- Strategic discussions → Learns company direction

After 20-30 features: 70-80% preference accuracy

### Fidelity-Based Routing
- **Fidelity 1**: Quick fixes (typos, one-liners) → Just ship
- **Fidelity 2**: Features (multi-file, clear scope) → Research → Plan → Ship
- **Fidelity 3**: Big/fuzzy projects → Prototype → Learn → Ship

The team auto-detects which level applies.

## Customization

### Per-Project Customization

Each project's CEO Console learns independently:
- Different coding styles per project
- Different strategic priorities
- Different team workflows

### Template Customization

To customize the template itself:

1. Edit files in `~/ceo-console-template/`
2. Modify agent prompts in `.claude/agents/`
3. Adjust workflows in `.claude/commands/`
4. Update knowledge base templates

Changes apply to all future initializations.

## Updating the Template

### Pull Latest Changes
```bash
cd ~/ceo-console-template
git pull  # If you've made this a git repo
```

### Update Existing Projects
```bash
# Backup learnings first!
cp -r ~/project/executive-team ~/project/executive-team.backup
cp -r ~/project/shared-memory ~/project/shared-memory.backup

# Re-initialize (will prompt to overwrite)
./init-ceo-console.sh ~/project
```

### Merge Learnings Back
Manually merge the backup files to preserve learnings while getting new template features.

## Version Control Strategy

### Option 1: Commit Everything
Track all learnings in git. Good for solo projects.

```bash
git add executive-team/ shared-memory/ .claude/
git commit -m "Add CEO Console with learnings"
```

### Option 2: Exclude Learnings
Keep knowledge bases private.

Add to `.gitignore`:
```
executive-team/*/knowledge-base.md
shared-memory/ceo-preferences.md
```

Commit the structure but not the learnings.

### Option 3: Separate Learnings Repo
Public code, private learnings.

```bash
# In your project
git submodule add <private-repo> .ceo-console-private

# Move learnings
mv executive-team/* .ceo-console-private/
mv shared-memory/* .ceo-console-private/

# Symlink back
ln -s .ceo-console-private/executive-team executive-team
```

## Advanced Usage

### Multiple Projects, Shared Learnings

Create a symlink for shared preferences:

```bash
# Central preferences
mkdir ~/ceo-console-shared
mv ~/project1/shared-memory/ceo-preferences.md ~/ceo-console-shared/

# Symlink from each project
ln -s ~/ceo-console-shared/ceo-preferences.md ~/project1/shared-memory/
ln -s ~/ceo-console-shared/ceo-preferences.md ~/project2/shared-memory/
```

All projects now share style preferences while maintaining separate product knowledge.

### Team Usage

Multiple developers can benefit from shared learnings:

1. Commit knowledge bases to git
2. Team members pull and review learnings
3. Knowledge compounds across the whole team
4. "This is how we work" becomes codified

## Requirements

- Claude Code (VSCode extension)
- Git (optional but recommended)
- Bash shell

## Template Structure

```
ceo-console-template/
├── README.md                    # This file
├── README-TEMPLATE.md           # Gets copied to new projects
├── init-ceo-console.sh          # Initialization script
├── .claude/                     # Agent definitions (copied)
├── executive-team/              # Empty templates (copied)
└── shared-memory/               # Empty templates (copied)
```

## Contributing

Have improvements to the agents or workflows?

1. Test in a real project
2. Update the template
3. Share back (if this becomes open source)

## Philosophy

**Compound Engineering:** Every interaction is an investment that pays dividends on all future interactions.

Instead of starting from scratch each time, your AI team gets smarter with every feature, every decision, and every code review.

## License

MIT (when open-sourced)

---

**Created by:** Andrew Coyle
**Inspired by:** Kieran Klaassen's compound engineering articles
**Version:** 1.0
