# 🚀 Quick Start Guide

Get your multiagent framework up and running in 5 minutes!

## Prerequisites

- Your project repository
- An AI CLI tool (Claude CLI, OpenAI CLI, or custom)
- Basic understanding of your project structure

## Step 1: Copy the Template (30 seconds)

```bash
# Copy the entire template to your project
cp -r multiagent-framework-template/ /path/to/your/project/multiagent-framework/

# Navigate to your project
cd /path/to/your/project
```

## Step 2: Quick Configuration (2 minutes)

### Option A: Use an Example Configuration

If your tech stack matches one of our examples:

```bash
# For Node.js + React projects
cp multiagent-framework/examples/nodejs-react.yaml multiagent-framework/config.yaml

# For Python + Django projects
cp multiagent-framework/examples/python-django.yaml multiagent-framework/config.yaml

# For Go microservices
cp multiagent-framework/examples/go-microservices.yaml multiagent-framework/config.yaml
```

### Option B: Manual Configuration

Edit the main configuration file:

```bash
# Open the definitions file
edit multiagent-framework/agents/definitions.yaml
```

Replace these key placeholders:
- `{{PROJECT_NAME}}` → Your project name
- `{{PROJECT_ROOT}}` → Your project path
- `{{AI_TOOL}}` → Your AI tool command (e.g., "claude", "openai")
- `{{BUILD_COMMAND}}` → Your build command (e.g., "npm run build")
- `{{TEST_COMMAND}}` → Your test command (e.g., "npm test")

## Step 3: Initialize Memory Bank (1 minute)

Create your project brief:

```bash
# Create the memory bank
mkdir -p multiagent-framework/memory-bank

# Create a simple project brief
cat > multiagent-framework/memory-bank/projectBrief.md << EOF
# Project Brief: $(basename $(pwd))

## Overview
My project that needs AI assistance.

## Core Requirements
- Main functionality
- Key features
- Important constraints

## Tech Stack
- Languages: [Your languages]
- Frameworks: [Your frameworks]
- Database: [Your database]

## Current Focus
Getting the multiagent framework running!
EOF
```

## Step 4: Test with First Agent (1.5 minutes)

### If Using Shell Script

```bash
# Make the orchestration script executable
chmod +x multiagent-framework/orchestration/orchestrate-template.sh

# Test with a simple task
./multiagent-framework/orchestration/orchestrate-template.sh deploy developer "Create a hello world file"
```

### If Using Your Own Language

Quick Python example:

```python
# test_agent.py
import subprocess

def run_agent(task):
    # Replace with your AI tool command
    result = subprocess.run(
        ["claude", "-p", task],  # or your AI tool
        capture_output=True,
        text=True
    )
    return result.stdout

# Test it
print(run_agent("Create a hello world function"))
```

## Step 5: Verify It Works (30 seconds)

Check that files were created:

```bash
# Check for agent work
ls -la multiagent-framework/tracking/
ls -la work/  # If using work directories
```

## 🎉 Success!

You now have a working multiagent framework!

## What's Next?

### Customize Your Agents

1. Edit `multiagent-framework/agents/definitions.yaml`
2. Add your specific agent types
3. Configure their capabilities

### Set Up Workflows

1. Edit `multiagent-framework/templates/workflows.yaml`
2. Define your development workflows
3. Map agents to tasks

### Configure Your Tools

Update the orchestration script with your specifics:
- Your AI tool commands
- Your version control preferences
- Your testing requirements

## Common Quick Fixes

### "AI tool not found"
→ Update `{{AI_TOOL}}` in orchestration script

### "Command failed"
→ Check your build/test commands in definitions.yaml

### "No work directory"
→ Create it: `mkdir -p work`

### "Permission denied"
→ Make scripts executable: `chmod +x multiagent-framework/orchestration/*.sh`

## Minimal Working Example

Here's the absolute minimum to get started:

```bash
# 1. Create basic structure
mkdir -p my-project/multiagent-framework/{agents,memory-bank,tracking}

# 2. Create minimal agent definition
cat > my-project/multiagent-framework/agents/definitions.yaml << 'EOF'
agents:
  developer:
    name: "Developer"
    capabilities: ["Write code", "Fix bugs"]

commands:
  build: "echo 'Building...'"
  test: "echo 'Testing...'"
EOF

# 3. Create minimal project brief
echo "# My Project" > my-project/multiagent-framework/memory-bank/projectBrief.md

# 4. Run your AI tool with a task
cd my-project
claude -p "Create a function that adds two numbers" # Or your AI tool

# That's it! You're running!
```

## Get Help

- Check the main README for detailed documentation
- Review example configurations in `/examples`
- Look at the orchestration guide for advanced setups

## Tips for Success

1. **Start Small**: Test with simple tasks first
2. **One Agent**: Begin with just one agent type
3. **Incremental**: Add complexity gradually
4. **Document**: Update memory bank as you go
5. **Monitor**: Check tracking files for progress

---

**Remember**: The framework is a template. Make it yours! 🚀