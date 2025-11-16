#!/bin/bash

# CEO Console Initialization Script
# Copies the CEO Console template into a new project directory

set -e  # Exit on error

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}"
echo "╔════════════════════════════════════════════╗"
echo "║     CEO Console Initialization v1.0        ║"
echo "║   Autonomous AI Team for Your Project      ║"
echo "╚════════════════════════════════════════════╝"
echo -e "${NC}"

# Get project directory
if [ -z "$1" ]; then
    echo -e "${YELLOW}Usage: ./init-ceo-console.sh <project-directory>${NC}"
    echo "Example: ./init-ceo-console.sh ~/projects/my-saas-app"
    exit 1
fi

PROJECT_DIR="$1"
TEMPLATE_DIR="$(cd "$(dirname "$0")" && pwd)"

# Check if project directory exists
if [ ! -d "$PROJECT_DIR" ]; then
    echo -e "${YELLOW}Directory $PROJECT_DIR does not exist.${NC}"
    read -p "Create it? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        mkdir -p "$PROJECT_DIR"
    else
        echo "Aborted."
        exit 1
    fi
fi

# Check if .claude directory already exists
if [ -d "$PROJECT_DIR/.claude" ]; then
    echo -e "${YELLOW}Warning: $PROJECT_DIR/.claude already exists.${NC}"
    read -p "Overwrite? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Aborted."
        exit 1
    fi
    rm -rf "$PROJECT_DIR/.claude"
fi

echo -e "${GREEN}Initializing CEO Console in $PROJECT_DIR...${NC}"
echo

# Copy .claude directory (agents + commands)
echo "📦 Installing specialized agents..."
cp -r "$TEMPLATE_DIR/.claude" "$PROJECT_DIR/"

# Copy executive team structure
echo "👔 Setting up executive team..."
cp -r "$TEMPLATE_DIR/executive-team" "$PROJECT_DIR/"

# Copy shared memory
echo "🧠 Initializing shared memory..."
cp -r "$TEMPLATE_DIR/shared-memory" "$PROJECT_DIR/"

# Copy README
if [ -f "$TEMPLATE_DIR/README-TEMPLATE.md" ]; then
    cp "$TEMPLATE_DIR/README-TEMPLATE.md" "$PROJECT_DIR/CEO-CONSOLE-README.md"
fi

# Initialize git if not already initialized
if [ ! -d "$PROJECT_DIR/.git" ]; then
    echo "🔧 Initializing git repository..."
    cd "$PROJECT_DIR"
    git init
fi

# Add .gitignore entries for CEO Console
if [ ! -f "$PROJECT_DIR/.gitignore" ]; then
    touch "$PROJECT_DIR/.gitignore"
fi

# Check if CEO Console entries already exist
if ! grep -q "# CEO Console" "$PROJECT_DIR/.gitignore" 2>/dev/null; then
    echo "" >> "$PROJECT_DIR/.gitignore"
    echo "# CEO Console - Optional: exclude learning data" >> "$PROJECT_DIR/.gitignore"
    echo "# Uncomment to keep learnings private:" >> "$PROJECT_DIR/.gitignore"
    echo "# executive-team/*/knowledge-base.md" >> "$PROJECT_DIR/.gitignore"
    echo "# shared-memory/ceo-preferences.md" >> "$PROJECT_DIR/.gitignore"
fi

echo
echo -e "${GREEN}✓ CEO Console initialized successfully!${NC}"
echo
echo -e "${BLUE}What was installed:${NC}"
echo "  ✓ 7 Specialized agents (.claude/agents/)"
echo "  ✓ /ship-feature workflow (.claude/commands/)"
echo "  ✓ 3 Executives (Product, Growth, Finance)"
echo "  ✓ Shared memory system"
echo "  ✓ Learning protocol"
echo
echo -e "${BLUE}Next steps:${NC}"
echo "  1. cd $PROJECT_DIR"
echo "  2. Open in VSCode (or Claude Code)"
echo "  3. Run: /exec-checkin product-lead"
echo "  4. Start building with: /ship-feature \"your feature\""
echo
echo -e "${BLUE}Documentation:${NC}"
echo "  - CEO-CONSOLE-README.md - How to use your AI team"
echo "  - .claude/agents/README.md - Agent documentation"
echo "  - SETUP-HOOKS.md - Configure autonomous operation"
echo
echo -e "${YELLOW}Pro tip:${NC} The more you interact with your executives,"
echo "the smarter they get. After 20-30 features, they'll know"
echo "your preferences and patterns incredibly well."
echo
