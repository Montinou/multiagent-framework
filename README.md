# 🤖 Multiagent Framework Template

A universal orchestration system for managing multiple AI agents working in parallel on software development tasks. This template can be adapted to any technology stack or project type.

## 📋 Table of Contents

- [Overview](#overview)
- [Quick Start](#quick-start)
- [Integration Guide](#integration-guide)
- [Customization](#customization)
- [Core Concepts](#core-concepts)
- [Agent Types](#agent-types)
- [Adaptation Examples](#adaptation-examples)

## 🎯 Overview

This framework template provides:

- **Agent Orchestration**: Coordinate multiple specialized AI agents
- **Baby Steps™ Methodology**: Incremental, validated progress
- **Memory Bank System**: Persistent context management across sessions
- **Progress Tracking**: Detailed logging and monitoring
- **CLI Integration**: Seamless integration with Claude CLI or other AI tools
- **Tech-Stack Agnostic**: Adaptable to any programming language or framework

## 🚀 Quick Start

### 1. Copy Template to Your Project

```bash
# Copy the entire template to your project root
cp -r multiagent-framework-template/ /path/to/your/project/multiagent-framework/

# Navigate to your project
cd /path/to/your/project
```

### 2. Configure for Your Project

Replace placeholders in all configuration files:

- `{{PROJECT_NAME}}` - Your project name
- `{{TECH_STACK}}` - Your technology stack (e.g., "Node.js/React", "Python/Django", "Go/Vue")
- `{{BUILD_COMMAND}}` - Your build command (e.g., "npm run build", "make build", "cargo build")
- `{{TEST_COMMAND}}` - Your test command (e.g., "npm test", "pytest", "go test")
- `{{LINT_COMMAND}}` - Your linting command
- `{{PROJECT_ROOT}}` - Your project root path

### 3. Customize Agent Definitions

Edit `agents/definitions.yaml` to match your project needs:

```yaml
agents:
  your-custom-agent:
    name: "{{AGENT_NAME}}"
    description: "{{AGENT_DESCRIPTION}}"
    capabilities:
      - "{{CAPABILITY_1}}"
      - "{{CAPABILITY_2}}"
    focus_areas:
      - "{{AREA_1}}"
      - "{{AREA_2}}"
```

### 4. Initialize Framework

```bash
# Option A: Automatic setup with cleanup
./multiagent-framework/scripts/setup.sh --auto-detect
# This will configure everything and remove unnecessary files

# Option B: Manual setup
mkdir -p multiagent-framework/memory-bank
cp multiagent-framework/templates/memory-bank-init/* multiagent-framework/memory-bank/

# Update project brief
edit multiagent-framework/memory-bank/projectBrief.md
```

### 5. Clean Up Unnecessary Files

After configuration, remove templates and examples for other tech stacks:

```bash
# For Node.js projects - remove Python/Go examples
rm -f multiagent-framework/examples/{python-django,go-microservices}.yaml

# For Python projects - remove Node.js/Go examples  
rm -f multiagent-framework/examples/{nodejs-react,go-microservices}.yaml
rm -f multiagent-framework/package.json.template

# For Go projects - remove Node.js/Python examples
rm -f multiagent-framework/examples/{nodejs-react,python-django}.yaml
rm -f multiagent-framework/package.json.template

# Remove all template files after configuration
find multiagent-framework -name "*.template" -delete

# Optional: Remove setup files after successful configuration
rm -f multiagent-framework/{SETUP.md,QUICK_START.md}
rm -rf multiagent-framework/scripts/setup.sh
```

## 📘 Integration Guide

### Step 1: Understand Your Project Structure

Before integrating, document:
- Project directory structure
- Build and test commands
- Development workflow
- Key technologies used
- Team conventions

### Step 2: Map Agents to Your Needs

Common agent mappings by project type:

#### Web Application
- `frontend-developer` → UI components, styling
- `backend-developer` → APIs, business logic
- `database-architect` → Schema, queries
- `test-engineer` → Testing, quality assurance

#### Mobile Application
- `ui-designer` → Screens, navigation
- `platform-developer` → iOS/Android specific
- `api-integrator` → Backend communication
- `performance-optimizer` → App optimization

#### Data Science Project
- `data-engineer` → Data pipelines
- `ml-engineer` → Model development
- `analyst` → Data analysis, visualization
- `deployment-specialist` → Model deployment

### Step 3: Configure Technology-Specific Commands

Update `orchestration/config.yaml`:

```yaml
# Example for Node.js project
commands:
  install: "npm install"
  build: "npm run build"
  test: "npm test"
  lint: "npm run lint"
  dev: "npm run dev"

# Example for Python project
commands:
  install: "pip install -r requirements.txt"
  build: "python setup.py build"
  test: "pytest"
  lint: "pylint src/"
  dev: "python manage.py runserver"

# Example for Go project
commands:
  install: "go mod download"
  build: "go build ./..."
  test: "go test ./..."
  lint: "golangci-lint run"
  dev: "go run main.go"
```

### Step 4: Set Up Version Control Integration

Configure Git worktrees or branches for parallel agent work:

```bash
# For Git worktree approach
git config --global alias.agent-branch '!git worktree add -b'

# For standard branching
git config --global alias.agent-checkout '!git checkout -b'
```

### Step 5: Create Project-Specific Templates

Add your own templates in `templates/project/`:

```yaml
# templates/project/component.yaml
component_template:
  structure:
    - "{{COMPONENT_NAME}}.{{EXTENSION}}"
    - "{{COMPONENT_NAME}}.test.{{EXTENSION}}"
    - "{{COMPONENT_NAME}}.styles.{{STYLE_EXT}}"
  
  conventions:
    naming: "{{NAMING_CONVENTION}}"
    testing: "{{TEST_FRAMEWORK}}"
    documentation: "{{DOC_FORMAT}}"
```

## ⚙️ Customization

### Agent Specialization

Create specialized agents for your domain:

```yaml
# agents/custom/domain-expert.yaml
metadata:
  name: "{{DOMAIN}} Expert"
  version: "1.0"
  tags: ['{{TAG1}}', '{{TAG2}}']

agent:
  role: "Specialized in {{DOMAIN}}"
  capabilities:
    - "{{SPECIALIZED_CAPABILITY_1}}"
    - "{{SPECIALIZED_CAPABILITY_2}}"
  
  tools_required:
    - "{{TOOL_1}}"
    - "{{TOOL_2}}"
```

### Workflow Customization

Define project-specific workflows:

```yaml
# templates/workflows/feature-development.yaml
workflow:
  name: "Feature Development"
  phases:
    - name: "Planning"
      agents: ["architect", "designer"]
      duration: "30 min"
      
    - name: "Implementation"
      agents: ["developer-1", "developer-2"]
      duration: "2 hours"
      
    - name: "Testing"
      agents: ["test-engineer"]
      duration: "1 hour"
      
    - name: "Review"
      agents: ["code-reviewer", "security-auditor"]
      duration: "30 min"
```

### Memory Bank Adaptation

Customize memory structure for your project:

```yaml
# memory-bank/structure-custom.yaml
project_specific_files:
  architecture_decisions:
    filename: "ADR.md"
    purpose: "Architecture Decision Records"
    
  api_contracts:
    filename: "api-contracts.md"
    purpose: "API specifications and contracts"
    
  deployment_guide:
    filename: "deployment.md"
    purpose: "Deployment procedures and configurations"
```

## 🔑 Core Concepts

### Baby Steps™ Methodology

The framework enforces incremental progress through:

1. **Smallest Meaningful Changes**: Break tasks into atomic units
2. **Process Documentation**: Document how, not just what
3. **Single Focus**: One task at a time
4. **Full Completion**: Finish before moving on
5. **Continuous Validation**: Test after every change
6. **Detailed Documentation**: Capture learnings

### Memory Bank System

Persistent context through structured files:

- `projectBrief.md` - Core requirements
- `activeContext.md` - Current work focus
- `systemPatterns.md` - Architecture decisions
- `techContext.md` - Technology setup
- `progress.md` - Completion status

### Progress Tracking

Comprehensive tracking with:

- Unique agent IDs: `AGENT_[TYPE]_[TIMESTAMP]`
- Structured logging: `[AGENT_ID] [ACTION]: [Description]`
- File change tracking
- Integration checkpoints

## 🤖 Agent Types

### Generic Agent Templates

| Agent Type | Focus Area | Common Tasks |
|------------|------------|--------------|
| **Frontend Developer** | User interfaces | Components, styling, UX |
| **Backend Developer** | Server logic | APIs, services, data processing |
| **Database Architect** | Data layer | Schema, queries, optimization |
| **DevOps Engineer** | Infrastructure | Deployment, monitoring, CI/CD |
| **Security Auditor** | Security | Vulnerabilities, compliance |
| **Test Engineer** | Quality | Unit tests, integration, E2E |
| **Documentation Writer** | Documentation | Guides, API docs, comments |

### Creating Custom Agents

```yaml
# Template for new agent type
metadata:
  name: "{{AGENT_TYPE}}"
  version: "1.0"
  
capabilities:
  - "{{PRIMARY_SKILL}}"
  - "{{SECONDARY_SKILL}}"
  
workflow:
  planning:
    duration: "{{TIME}}"
    outputs: ["plan.md"]
    
  execution:
    duration: "{{TIME}}"
    validation: "{{VALIDATION_METHOD}}"
    
  review:
    duration: "{{TIME}}"
    checklist: ["item1", "item2"]
```

## 📚 Adaptation Examples

### Example 1: React/Node.js Application

```yaml
# orchestration/config.yaml
project:
  name: "MyReactApp"
  tech_stack: "React/Node.js/PostgreSQL"
  
commands:
  install: "npm install"
  build: "npm run build"
  test: "npm test"
  dev: "npm run dev"
  
agents:
  ui-developer:
    specialization: "React components with TypeScript"
    tools: ["React DevTools", "TypeScript"]
    
  api-developer:
    specialization: "Express.js REST APIs"
    tools: ["Postman", "Node.js"]
```

### Example 2: Python/Django Project

```yaml
# orchestration/config.yaml
project:
  name: "DjangoApp"
  tech_stack: "Python/Django/PostgreSQL"
  
commands:
  install: "pip install -r requirements.txt"
  build: "python manage.py collectstatic"
  test: "python manage.py test"
  dev: "python manage.py runserver"
  migrate: "python manage.py migrate"
  
agents:
  django-developer:
    specialization: "Django views and models"
    tools: ["Django Admin", "DRF"]
    
  frontend-developer:
    specialization: "Django templates and HTMX"
    tools: ["Django Templates", "HTMX"]
```

### Example 3: Go Microservices

```yaml
# orchestration/config.yaml
project:
  name: "GoMicroservices"
  tech_stack: "Go/gRPC/Kubernetes"
  
commands:
  install: "go mod download"
  build: "go build -o bin/ ./..."
  test: "go test ./..."
  lint: "golangci-lint run"
  proto: "protoc --go_out=. *.proto"
  
agents:
  service-developer:
    specialization: "Go microservices with gRPC"
    tools: ["Go", "Protocol Buffers"]
    
  k8s-engineer:
    specialization: "Kubernetes deployments"
    tools: ["kubectl", "Helm"]
```

## 🔧 Orchestration Scripts

The framework includes template orchestration scripts that should be adapted to your environment:

### Shell Script Template (`orchestration/orchestrate.sh`)

```bash
#!/bin/bash
# Generic orchestration script template

PROJECT_NAME="{{PROJECT_NAME}}"
AGENT_TYPE="${1:-developer}"
TASK="${2:-default}"

# Your project-specific setup
source ./orchestration/setup.sh

# Launch agent with your configuration
launch_agent "$AGENT_TYPE" "$TASK"
```

### Python Template (`orchestration/orchestrate.py`)

```python
#!/usr/bin/env python3
# Generic orchestration script template

import os
import sys
import subprocess

PROJECT_NAME = "{{PROJECT_NAME}}"

def launch_agent(agent_type, task):
    """Launch an agent with given configuration"""
    # Your implementation here
    pass

if __name__ == "__main__":
    agent_type = sys.argv[1] if len(sys.argv) > 1 else "developer"
    task = sys.argv[2] if len(sys.argv) > 2 else "default"
    launch_agent(agent_type, task)
```

## 🚦 Getting Started Checklist

- [ ] Copy template to your project
- [ ] Replace all placeholders with project values
- [ ] Configure technology-specific commands
- [ ] Customize agent definitions
- [ ] Set up memory bank structure
- [ ] Create project brief
- [ ] Configure version control
- [ ] Test with simple task
- [ ] Scale to multiple agents
- [ ] Monitor and optimize

## 📖 Best Practices

1. **Start Small**: Begin with one agent type
2. **Document Everything**: Use the memory bank actively
3. **Validate Often**: Test after each change
4. **Maintain Context**: Keep memory files updated
5. **Track Progress**: Use structured logging
6. **Iterate**: Refine agent definitions based on results

## 🆘 Troubleshooting

### Common Issues

| Issue | Solution |
|-------|----------|
| Agent not finding files | Check path configurations |
| Commands failing | Verify tech-specific commands |
| Context lost between sessions | Update memory bank files |
| Agents conflicting | Use proper branching strategy |

## 📝 License

This template is provided as-is for use in any project. Customize freely for your needs.

## 🤝 Contributing

To improve this template:
1. Document your adaptations
2. Share successful configurations
3. Report issues and solutions
4. Contribute new agent types

---

**Remember**: This framework is a template. Adapt it to your specific needs, technology stack, and team workflows. The key is maintaining the core principles while customizing the implementation.