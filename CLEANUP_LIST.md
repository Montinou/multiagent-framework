# 🧹 Cleanup List

This document lists files that should be removed after configuration based on your project's technology stack.

## Files to Remove After Configuration

### Always Remove (After Processing)
- [ ] All `*.template` files (they've been processed into actual files)
- [ ] `SETUP.md` (only needed during setup)
- [ ] `CLEANUP_LIST.md` (this file)
- [ ] `scripts/setup.sh` (after running it)

### For JavaScript/TypeScript Projects
**Keep:** `examples/nodejs-react.yaml`

**Remove:**
- [ ] `examples/python-django.yaml`
- [ ] `examples/go-microservices.yaml`
- [ ] Python-specific orchestration scripts (if created)
- [ ] Go-specific orchestration scripts (if created)

### For Python Projects
**Keep:** `examples/python-django.yaml`

**Remove:**
- [ ] `examples/nodejs-react.yaml`
- [ ] `examples/go-microservices.yaml`
- [ ] `package.json.template`
- [ ] `orchestration/orchestrator.js.template`
- [ ] Node.js-specific configurations

### For Go Projects
**Keep:** `examples/go-microservices.yaml`

**Remove:**
- [ ] `examples/nodejs-react.yaml`
- [ ] `examples/python-django.yaml`
- [ ] `package.json.template`
- [ ] `orchestration/orchestrator.js.template`
- [ ] Python-specific configurations

### For Other Languages
**Keep:** All examples for reference

**Remove:**
- [ ] Language-specific templates that don't apply
- [ ] `package.json.template` (unless using Node.js tools)

## Automated Cleanup Commands

### Quick Cleanup (Automatic Detection)
```bash
# Run the setup script with cleanup
./multiagent-framework/scripts/setup.sh --auto-detect
# It will automatically remove unnecessary files
```

### Manual Cleanup by Language

#### JavaScript/TypeScript
```bash
find multiagent-framework -name "*.template" -delete
rm -f multiagent-framework/examples/{python-django,go-microservices}.yaml
rm -f multiagent-framework/{SETUP.md,CLEANUP_LIST.md}
```

#### Python
```bash
find multiagent-framework -name "*.template" -delete
rm -f multiagent-framework/examples/{nodejs-react,go-microservices}.yaml
rm -f multiagent-framework/package.json.template
rm -f multiagent-framework/{SETUP.md,CLEANUP_LIST.md}
```

#### Go
```bash
find multiagent-framework -name "*.template" -delete
rm -f multiagent-framework/examples/{nodejs-react,python-django}.yaml
rm -f multiagent-framework/package.json.template
rm -f multiagent-framework/{SETUP.md,CLEANUP_LIST.md}
```

## Why Clean Up?

Removing unnecessary files:
1. **Reduces confusion** - No templates for other languages
2. **Keeps project clean** - Only relevant configurations
3. **Prevents errors** - No accidental use of wrong templates
4. **Saves space** - Removes redundant examples
5. **Improves clarity** - Clear what applies to your project

## Verification After Cleanup

Run these checks to ensure cleanup was successful:

```bash
# Check no templates remain
find multiagent-framework -name "*.template" 2>/dev/null
# Should return nothing

# Check no placeholders remain
grep -r "{{" multiagent-framework/ 2>/dev/null
# Should return nothing

# Verify only relevant examples exist
ls multiagent-framework/examples/
# Should show only examples for your language

# Confirm framework still works
npm run agents:init  # or equivalent for your language
# Should initialize successfully
```

## What to Keep

Always keep these core files:
- ✅ `agents/definitions.yaml` (configured)
- ✅ `context/AGENT_CONTEXT.md` (configured)
- ✅ `memory-bank/*.md` (configured, not templates)
- ✅ `orchestration/orchestrator.*` (your language version)
- ✅ `tracking/progress-tracker.yaml`
- ✅ `templates/` (workflow and task templates)
- ✅ `cli/cli-patterns.yaml`
- ✅ `README.md` (main documentation)

## Manual Cleanup Checklist

If the automatic cleanup didn't run or you want to do it manually:

- [ ] Run `find multiagent-framework -name "*.template" -delete`
- [ ] Remove examples for other languages
- [ ] Delete SETUP.md if no longer needed
- [ ] Delete CLEANUP_LIST.md (this file) when done
- [ ] Remove setup.sh script
- [ ] Verify no `{{placeholders}}` remain
- [ ] Test that framework initializes correctly
- [ ] Commit the cleaned configuration

---

**Note:** This file should be deleted after successful cleanup!