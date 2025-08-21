# 🤖 Agent Context & Coordination Hub

## 📋 Overview

This document serves as the coordination center for the multiagent system. Here tasks are defined, progress is monitored, and communication between agents is coordinated.

## 🎯 Deployment Configuration

### Current Project: {{PROJECT_NAME}}

**Objective**: {{PRIMARY_OBJECTIVE}}

**Scope**: {{PROJECT_SCOPE}}

**Deadline**: {{TARGET_DATE}}

### Selected Workflow

**Template**: {{WORKFLOW_TEMPLATE}}

**Required Agents**: {{REQUIRED_AGENTS}}

**Optional Agents**: {{OPTIONAL_AGENTS}}

## 📊 Active Agents

_This section is automatically updated by the orchestration system_

### Global Status
- **Total Agents**: 0
- **Running**: 0  
- **Completed**: 0
- **With Errors**: 0
- **Last Update**: {{TIMESTAMP}}

### Individual Agents

#### Agent: {{AGENT_NAME}}
- **Status**: pending
- **Type**: {{AGENT_TYPE}}
- **Branch/Directory**: {{WORK_LOCATION}}
- **Progress**: 0%
- **Tasks Completed**: 0/{{TOTAL_TASKS}}
- **Last Update**: {{TIMESTAMP}}
- **Tasks**:
  - [ ] {{TASK_1}}
  - [ ] {{TASK_2}}
  - [ ] {{TASK_3}}

---

## 🎯 Configuration Templates

### Example: Feature Development

```markdown
## 🎯 Deployment Configuration

### Current Project: New Feature Implementation

**Objective**: Add {{FEATURE_NAME}} functionality

**Scope**: 
- {{SCOPE_ITEM_1}}
- {{SCOPE_ITEM_2}}
- {{SCOPE_ITEM_3}}

**Deadline**: {{DATE}}

### Selected Workflow

**Template**: feature_development

**Required Agents**: 
- frontend-developer
- backend-developer
- test-engineer

**Optional Agents**:
- security-auditor
- documentation-writer

### Agent: frontend-developer
**Tasks**:
- Create UI components
- Implement user interactions
- Ensure responsive design
- Add accessibility features

### Agent: backend-developer
**Tasks**:
- Create API endpoints
- Implement business logic
- Handle data persistence
- Add validation

### Agent: test-engineer
**Tasks**:
- Write unit tests
- Create integration tests
- Implement E2E tests
- Verify coverage >80%
```

## 📋 Available Templates

### 🎨 Component Development
- **Agents**: frontend-developer
- **Duration**: ~45 min
- **Use for**: Creating new UI components

### 🔐 Authentication Integration  
- **Agents**: security-auditor, backend-developer
- **Duration**: ~60 min
- **Use for**: Implementing auth flows

### 🗄️ Database Migration
- **Agents**: database-architect
- **Duration**: ~45 min
- **Use for**: Schema changes

### 🔌 API Development
- **Agents**: backend-developer, test-engineer
- **Duration**: ~50 min  
- **Use for**: Creating new API endpoints

### 🧪 Test Suite Creation
- **Agents**: test-engineer
- **Duration**: ~45 min
- **Use for**: Comprehensive test coverage

### 🚀 Deployment Setup
- **Agents**: devops-engineer
- **Duration**: ~60 min
- **Use for**: CI/CD pipeline configuration

### 🤖 AI Integration
- **Agents**: backend-developer, ai-specialist
- **Duration**: ~75 min
- **Use for**: Integrating AI capabilities

### 🔒 Security Audit
- **Agents**: security-auditor
- **Duration**: ~60 min
- **Use for**: Security review

## 🚀 Project Workflows

### Feature Development (End-to-End)
- **Required Agents**: frontend-developer, backend-developer, test-engineer
- **Optional Agents**: security-auditor, documentation-writer
- **Use for**: Complete feature development

### Authentication Implementation
- **Required Agents**: security-auditor, backend-developer, frontend-developer  
- **Optional Agents**: test-engineer, documentation-writer
- **Use for**: Complete auth system

### Database Overhaul
- **Required Agents**: database-architect, backend-developer, test-engineer
- **Optional Agents**: security-auditor, devops-engineer
- **Use for**: Major database changes

### Performance Optimization
- **Required Agents**: backend-developer, frontend-developer, devops-engineer
- **Optional Agents**: database-architect
- **Use for**: System optimization

## 📚 Useful Commands

```bash
# View available agents
{{LIST_AGENTS_CMD}}

# Create deployment plan from templates
{{CREATE_PLAN_CMD}}

# Initialize orchestration system
{{INIT_CMD}}

# Deploy agents based on this context
{{DEPLOY_CMD}}

# Check current agent status
{{STATUS_CMD}}

# Monitor progress in real-time
{{MONITOR_CMD}}

# Clean up work directories
{{CLEANUP_CMD}}

# Full deployment pipeline
{{FULL_DEPLOY_CMD}}

# Quick deployment
{{QUICK_DEPLOY_CMD}}

# Validation only
{{VALIDATE_CMD}}
```

## 📝 Coordination Notes

- Agents communicate through this file
- Each agent updates their progress automatically
- Conflicts are resolved through the orchestrator
- Shared context is synchronized every 5 minutes

## 🔄 System Status

**Orchestration System**: [Active/Inactive]

**Monitoring**: [Active/Inactive]  

**Last Deployment**: {{LAST_DEPLOYMENT}}

**Next Required Action**: {{NEXT_ACTION}}

## 📊 Metrics Dashboard

### Current Sprint
- **Sprint Goal**: {{SPRINT_GOAL}}
- **Story Points Completed**: {{POINTS_DONE}}/{{TOTAL_POINTS}}
- **Velocity**: {{VELOCITY}}
- **Burn Rate**: {{BURN_RATE}}

### Quality Metrics
- **Code Coverage**: {{COVERAGE}}%
- **Build Success Rate**: {{BUILD_SUCCESS}}%
- **Average Task Duration**: {{AVG_DURATION}}
- **Error Rate**: {{ERROR_RATE}}%

## 🔗 Inter-Agent Communication

### Message Format
```
FROM: {{SENDER_AGENT}}
TO: {{RECEIVER_AGENT}}
TIME: {{TIMESTAMP}}
TYPE: [INFO|REQUEST|BLOCKER|COMPLETE]
MESSAGE: {{MESSAGE_CONTENT}}
ACTION_REQUIRED: [YES|NO]
```

### Recent Messages
_Latest inter-agent communications_

---

## 🎯 Task Assignment Matrix

| Task Type | Primary Agent | Support Agent | Estimated Time |
|-----------|--------------|---------------|----------------|
| UI Components | frontend-developer | - | 30-60 min |
| API Endpoints | backend-developer | - | 45-75 min |
| Database Schema | database-architect | backend-developer | 60-90 min |
| Testing | test-engineer | - | 30-60 min |
| Security Review | security-auditor | - | 45-60 min |
| Documentation | documentation-writer | - | 30-45 min |
| Deployment | devops-engineer | - | 60-90 min |

## 🚦 Progress Indicators

### Color Coding
- 🟢 **Green**: On track
- 🟡 **Yellow**: Minor delays
- 🔴 **Red**: Blocked or critical issue
- ⚪ **Gray**: Not started
- 🔵 **Blue**: In progress

### Status Icons
- ✅ Completed
- 🔄 In Progress
- ⏳ Pending
- 🚫 Blocked
- ❌ Failed
- 🔍 Under Review

## 📈 Velocity Tracking

### Historical Performance
- **Last Week**: {{LAST_WEEK_VELOCITY}}
- **This Week**: {{THIS_WEEK_VELOCITY}}
- **Average**: {{AVG_VELOCITY}}
- **Trend**: {{TREND_INDICATOR}}

## 🎯 Next Steps

1. {{NEXT_STEP_1}}
2. {{NEXT_STEP_2}}
3. {{NEXT_STEP_3}}

## 📝 Notes

{{ADDITIONAL_NOTES}}

---
*This document is automatically updated by the orchestration system*
*Manual updates should be made with caution to avoid conflicts*