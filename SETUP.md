# 🤖 LLM Auto-Configuration Guide

This document contains instructions for an LLM to automatically configure the multiagent framework for any project.

## For LLMs: Automatic Configuration Instructions

When asked to set up the multiagent framework, follow these steps:

### Step 1: Analyze the Project

```prompt
Analyze the current project directory and identify:
1. Project name from package.json, README, or directory name
2. Primary programming language(s) used
3. Framework(s) detected (React, Django, Express, etc.)
4. Build tools (npm, pip, maven, etc.)
5. Test frameworks present
6. Version control system (git, svn)
7. Existing project structure
```

### Step 2: Gather Configuration Values

Based on the analysis, determine these values:

```yaml
PROJECT_INFO:
  PROJECT_NAME: # Extract from package.json "name" or directory
  PROJECT_DESCRIPTION: # From package.json "description" or README
  AUTHOR: # From package.json "author" or git config
  LICENSE: # From LICENSE file or package.json

TECHNOLOGY:
  PRIMARY_LANGUAGE: # Most used language in src/
  FRAMEWORK: # Detected framework
  DATABASE: # From config files or dependencies
  RUNTIME: # Node.js version, Python version, etc.

COMMANDS:
  BUILD_COMMAND: # npm run build, make build, etc.
  TEST_COMMAND: # npm test, pytest, go test, etc.
  LINT_COMMAND: # npm run lint, flake8, etc.
  DEV_COMMAND: # npm run dev, python manage.py runserver, etc.

AI_INTEGRATION:
  AI_TOOL: # claude, openai, or custom
  PERMISSION_MODE: # acceptEdits or bypassPermissions
  MAX_TURNS: # 20 for complex, 10 for simple tasks
```

### Step 3: Replace Placeholders

Execute these replacements in all template files:

```javascript
// Pseudocode for replacement
files_to_update = [
  'multiagent-framework/agents/definitions.yaml',
  'multiagent-framework/context/AGENT_CONTEXT.md',
  'multiagent-framework/memory-bank/*.template',
  'multiagent-framework/orchestration/*.template'
]

for each file in files_to_update:
  content = read(file)
  for each placeholder, value in configuration:
    content = content.replace('{{' + placeholder + '}}', value)
  
  // Remove .template extension if present
  new_filename = file.replace('.template', '')
  write(new_filename, content)
```

### Step 4: Create Initial Memory Bank

Generate initial memory bank files:

```bash
# Create projectBrief.md
cat > multiagent-framework/memory-bank/projectBrief.md << EOF
# Project Brief: ${PROJECT_NAME}

## Overview
${PROJECT_DESCRIPTION}

## Technology Stack
- Language: ${PRIMARY_LANGUAGE}
- Framework: ${FRAMEWORK}
- Database: ${DATABASE}

## Core Requirements
[Extracted from README or inferred from project structure]

## Current Status
- Framework setup: Complete
- Ready for agent deployment
EOF

# Create initial activeContext.md
cat > multiagent-framework/memory-bank/activeContext.md << EOF
# Active Context

## Current Focus
Setting up multiagent framework for development automation

## Next Steps
1. Configure specific agents for project needs
2. Define initial tasks in AGENT_CONTEXT.md
3. Run first agent deployment
EOF
```

### Step 5: Configure package.json

If the project uses Node.js, update package.json:

```javascript
// Add these scripts to package.json
const scripts_to_add = {
  "agents:init": "node multiagent-framework/orchestration/orchestrator.js init",
  "agents:deploy": "node multiagent-framework/orchestration/orchestrator.js deploy",
  "agents:status": "node multiagent-framework/orchestration/orchestrator.js status",
  "agents:cleanup": "node multiagent-framework/orchestration/orchestrator.js cleanup"
}

// If package.json doesn't exist, check for equivalent in other languages:
// - Python: setup.py or pyproject.toml
// - Go: Makefile
// - Java: pom.xml or build.gradle
```

### Step 6: Setup Version Control Integration

```bash
# If using Git
if [ -d .git ]; then
  # Add framework to gitignore if needed
  echo "work/" >> .gitignore
  echo "*.log" >> .gitignore
  echo ".agent-*" >> .gitignore
fi
```

### Step 7: Clean Up Unnecessary Files

Remove files that don't match the project's tech stack:

```bash
# Detect project language
if [ -f "package.json" ]; then
    # JavaScript/Node.js project - remove Python and Go examples
    rm -f multiagent-framework/examples/python-django.yaml
    rm -f multiagent-framework/examples/go-microservices.yaml
elif [ -f "requirements.txt" ] || [ -f "setup.py" ]; then
    # Python project - remove Node.js and Go examples
    rm -f multiagent-framework/examples/nodejs-react.yaml
    rm -f multiagent-framework/examples/go-microservices.yaml
    rm -f multiagent-framework/package.json.template
elif [ -f "go.mod" ]; then
    # Go project - remove Node.js and Python examples
    rm -f multiagent-framework/examples/nodejs-react.yaml
    rm -f multiagent-framework/examples/python-django.yaml
    rm -f multiagent-framework/package.json.template
fi

# Remove all .template files after configuration
find multiagent-framework -name "*.template" -type f -delete

# Remove setup files if no longer needed
rm -f multiagent-framework/SETUP.md
rm -f multiagent-framework/QUICK_START.md
rm -f multiagent-framework/scripts/setup.sh
```

### Step 8: Validate Configuration

Run these checks:

```checklist
✓ All {{PLACEHOLDER}} values replaced
✓ No .template files remaining
✓ Only relevant example configurations kept
✓ Memory bank initialized with at least projectBrief.md
✓ AGENT_CONTEXT.md has project name
✓ orchestrator configured for correct language
✓ Build/test commands are valid
✓ Directory structure created (work/, tracking/logs/)
✓ Unnecessary tech stack examples removed
```

## Configuration Detection Patterns

### For Node.js/JavaScript Projects
```javascript
if (exists('package.json')) {
  const pkg = JSON.parse(read('package.json'))
  PROJECT_NAME = pkg.name
  BUILD_COMMAND = pkg.scripts.build || 'npm run build'
  TEST_COMMAND = pkg.scripts.test || 'npm test'
  DEV_COMMAND = pkg.scripts.dev || pkg.scripts.start || 'npm start'
}
```

### For Python Projects
```python
if exists('requirements.txt') or exists('pyproject.toml'):
    PROJECT_NAME = os.path.basename(os.getcwd())
    BUILD_COMMAND = 'python setup.py build' if exists('setup.py') else 'pip install -e .'
    TEST_COMMAND = 'pytest' if 'pytest' in deps else 'python -m unittest'
    DEV_COMMAND = 'python manage.py runserver' if exists('manage.py') else 'python main.py'
```

### For Go Projects
```go
if exists('go.mod'):
    mod_content = read('go.mod')
    PROJECT_NAME = extract_module_name(mod_content)
    BUILD_COMMAND = 'go build ./...'
    TEST_COMMAND = 'go test ./...'
    DEV_COMMAND = 'go run main.go'
```

## Automated Setup Script Usage

For LLMs that can execute scripts:

```bash
# Run the automated setup
chmod +x multiagent-framework/scripts/setup.sh
./multiagent-framework/scripts/setup.sh --auto-detect

# Or with specific values
./multiagent-framework/scripts/setup.sh \
  --project-name "MyProject" \
  --ai-tool "claude" \
  --build-cmd "npm run build" \
  --test-cmd "npm test"
```

## Common Configuration Examples

### React Application
```yaml
PROJECT_NAME: my-react-app
BUILD_COMMAND: npm run build
TEST_COMMAND: npm test
DEV_COMMAND: npm start
AI_TOOL: claude
PRIMARY_LANGUAGE: JavaScript/TypeScript
FRAMEWORK: React
```

### Django Application
```yaml
PROJECT_NAME: django-project
BUILD_COMMAND: python manage.py collectstatic
TEST_COMMAND: python manage.py test
DEV_COMMAND: python manage.py runserver
AI_TOOL: claude
PRIMARY_LANGUAGE: Python
FRAMEWORK: Django
```

### Go Microservice
```yaml
PROJECT_NAME: go-service
BUILD_COMMAND: go build -o bin/service
TEST_COMMAND: go test ./...
DEV_COMMAND: go run cmd/service/main.go
AI_TOOL: claude
PRIMARY_LANGUAGE: Go
FRAMEWORK: None/Custom
```

## Verification Commands

After setup, verify with:

```bash
# Check if configuration is complete
grep -r "{{" multiagent-framework/ | grep -v ".template"
# Should return nothing if all placeholders are replaced

# Test orchestrator initialization
node multiagent-framework/orchestration/orchestrator.js init
# Should create necessary directories and files

# Check memory bank
ls -la multiagent-framework/memory-bank/
# Should show initialized .md files

# Verify agent definitions
cat multiagent-framework/agents/definitions.yaml | head -20
# Should show configured values, not placeholders
```

## Troubleshooting

If automatic detection fails:

1. **Can't detect project type**: Look for build files (Makefile, build.gradle, etc.)
2. **No package manager found**: Check for language-specific files (.py, .go, .java)
3. **Commands unknown**: Use generic defaults and let user correct
4. **AI tool uncertain**: Default to 'claude' with note to configure

## Manual Override Instructions

If automatic configuration needs correction:

```bash
# Edit main configuration
edit multiagent-framework/agents/definitions.yaml

# Update project context
edit multiagent-framework/context/AGENT_CONTEXT.md

# Modify orchestrator settings
edit multiagent-framework/orchestration/orchestrator.js
# Look for CONFIG object at the top
```

## Success Indicators

The framework is properly configured when:

1. ✅ No `{{PLACEHOLDERS}}` remain in non-template files
2. ✅ Memory bank contains project-specific information
3. ✅ Orchestrator can initialize without errors
4. ✅ Agent commands are available (via npm, make, or direct execution)
5. ✅ Work directory structure is created
6. ✅ First agent can be deployed successfully

## Next Steps After Configuration

1. Define specific tasks in `AGENT_CONTEXT.md`
2. Run `agents:init` to initialize the system
3. Deploy first agent with `agents:deploy`
4. Monitor progress with `agents:status`

---

**For LLMs**: Use this document to configure the framework automatically. Start with Step 1 (Analyze) and proceed sequentially. If uncertain about a value, use sensible defaults and note them for user review.