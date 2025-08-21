#!/bin/bash

# ============================================================================
# Multiagent Framework Auto-Setup Script
# This script automatically configures the framework for your project
# ============================================================================

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# ============================================================================
# Helper Functions
# ============================================================================

print_header() {
    echo -e "${CYAN}============================================${NC}"
    echo -e "${CYAN}$1${NC}"
    echo -e "${CYAN}============================================${NC}"
}

print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

print_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

# ============================================================================
# Project Detection Functions
# ============================================================================

detect_project_name() {
    local name=""
    
    # Try package.json first
    if [ -f "package.json" ]; then
        name=$(grep -o '"name":[^,]*' package.json | sed 's/"name"://; s/"//g; s/ //g' | head -1)
    fi
    
    # Try Python setup.py
    if [ -z "$name" ] && [ -f "setup.py" ]; then
        name=$(grep "name=" setup.py | head -1 | sed "s/.*name=['\"]//; s/['\"].*//")
    fi
    
    # Try go.mod
    if [ -z "$name" ] && [ -f "go.mod" ]; then
        name=$(head -1 go.mod | sed 's/module //')
    fi
    
    # Fallback to directory name
    if [ -z "$name" ]; then
        name=$(basename "$(pwd)")
    fi
    
    echo "$name"
}

detect_language() {
    # Check for various language indicators
    if [ -f "package.json" ] || [ -f "yarn.lock" ] || [ -f "package-lock.json" ]; then
        echo "JavaScript/TypeScript"
    elif [ -f "requirements.txt" ] || [ -f "setup.py" ] || [ -f "Pipfile" ]; then
        echo "Python"
    elif [ -f "go.mod" ] || [ -f "go.sum" ]; then
        echo "Go"
    elif [ -f "Cargo.toml" ]; then
        echo "Rust"
    elif [ -f "pom.xml" ] || [ -f "build.gradle" ]; then
        echo "Java"
    elif [ -f "composer.json" ]; then
        echo "PHP"
    elif [ -f "Gemfile" ]; then
        echo "Ruby"
    else
        echo "Unknown"
    fi
}

detect_framework() {
    local framework=""
    
    # JavaScript frameworks
    if [ -f "package.json" ]; then
        if grep -q "react" package.json 2>/dev/null; then
            framework="React"
        elif grep -q "vue" package.json 2>/dev/null; then
            framework="Vue"
        elif grep -q "angular" package.json 2>/dev/null; then
            framework="Angular"
        elif grep -q "express" package.json 2>/dev/null; then
            framework="Express"
        elif grep -q "next" package.json 2>/dev/null; then
            framework="Next.js"
        fi
    fi
    
    # Python frameworks
    if [ -f "manage.py" ]; then
        framework="Django"
    elif [ -f "requirements.txt" ] && grep -q "flask" requirements.txt 2>/dev/null; then
        framework="Flask"
    elif [ -f "requirements.txt" ] && grep -q "fastapi" requirements.txt 2>/dev/null; then
        framework="FastAPI"
    fi
    
    echo "${framework:-None}"
}

detect_build_command() {
    local lang="$1"
    
    case "$lang" in
        "JavaScript/TypeScript")
            if [ -f "package.json" ] && grep -q '"build":' package.json; then
                echo "npm run build"
            else
                echo "npm install"
            fi
            ;;
        "Python")
            if [ -f "setup.py" ]; then
                echo "python setup.py build"
            else
                echo "pip install -r requirements.txt"
            fi
            ;;
        "Go")
            echo "go build ./..."
            ;;
        "Rust")
            echo "cargo build --release"
            ;;
        "Java")
            if [ -f "pom.xml" ]; then
                echo "mvn clean package"
            else
                echo "gradle build"
            fi
            ;;
        *)
            echo "make build"
            ;;
    esac
}

detect_test_command() {
    local lang="$1"
    
    case "$lang" in
        "JavaScript/TypeScript")
            if [ -f "package.json" ] && grep -q '"test":' package.json; then
                echo "npm test"
            else
                echo "npm test"
            fi
            ;;
        "Python")
            if command -v pytest &> /dev/null; then
                echo "pytest"
            else
                echo "python -m unittest"
            fi
            ;;
        "Go")
            echo "go test ./..."
            ;;
        "Rust")
            echo "cargo test"
            ;;
        "Java")
            if [ -f "pom.xml" ]; then
                echo "mvn test"
            else
                echo "gradle test"
            fi
            ;;
        *)
            echo "make test"
            ;;
    esac
}

# ============================================================================
# Configuration Functions
# ============================================================================

replace_placeholders() {
    local file="$1"
    local placeholder="$2"
    local value="$3"
    
    # Use different sed syntax for macOS vs Linux
    if [[ "$OSTYPE" == "darwin"* ]]; then
        sed -i '' "s|{{${placeholder}}}|${value}|g" "$file" 2>/dev/null || true
    else
        sed -i "s|{{${placeholder}}}|${value}|g" "$file" 2>/dev/null || true
    fi
}

configure_file() {
    local file="$1"
    shift
    
    print_info "Configuring $(basename "$file")..."
    
    while [ "$#" -gt 0 ]; do
        local placeholder="$1"
        local value="$2"
        replace_placeholders "$file" "$placeholder" "$value"
        shift 2
    done
}

# ============================================================================
# Main Setup Process
# ============================================================================

main() {
    print_header "🤖 Multiagent Framework Auto-Setup"
    
    # Check if we're in the right directory
    if [ ! -d "multiagent-framework" ]; then
        print_error "multiagent-framework directory not found!"
        print_info "Please run this script from your project root after copying the template."
        exit 1
    fi
    
    # Step 1: Detect project configuration
    print_header "Step 1: Detecting Project Configuration"
    
    PROJECT_NAME=$(detect_project_name)
    print_success "Project Name: $PROJECT_NAME"
    
    LANGUAGE=$(detect_language)
    print_success "Primary Language: $LANGUAGE"
    
    FRAMEWORK=$(detect_framework)
    print_success "Framework: $FRAMEWORK"
    
    BUILD_CMD=$(detect_build_command "$LANGUAGE")
    print_success "Build Command: $BUILD_CMD"
    
    TEST_CMD=$(detect_test_command "$LANGUAGE")
    print_success "Test Command: $TEST_CMD"
    
    # Step 2: Get AI tool preference
    print_header "Step 2: AI Tool Configuration"
    
    echo "Which AI tool will you use?"
    echo "1) Claude CLI (claude)"
    echo "2) OpenAI CLI (openai)"
    echo "3) Custom AI tool"
    read -p "Enter choice (1-3): " ai_choice
    
    case $ai_choice in
        1)
            AI_TOOL="claude"
            AI_COMMAND='claude -p "${prompt}" --max-turns ${turns}'
            ;;
        2)
            AI_TOOL="openai"
            AI_COMMAND='openai api chat.completions.create -m gpt-4 -p "${prompt}"'
            ;;
        3)
            read -p "Enter AI tool command: " AI_TOOL
            AI_COMMAND="$AI_TOOL"
            ;;
        *)
            AI_TOOL="claude"
            AI_COMMAND='claude -p "${prompt}" --max-turns ${turns}'
            ;;
    esac
    
    print_success "AI Tool: $AI_TOOL"
    
    # Step 3: Configure all template files
    print_header "Step 3: Configuring Template Files"
    
    # Configure agent definitions
    configure_file "multiagent-framework/agents/definitions.yaml" \
        "PROJECT_NAME" "$PROJECT_NAME" \
        "BUILD_CMD" "$BUILD_CMD" \
        "TEST_CMD" "$TEST_CMD" \
        "LINT_CMD" "${LINT_CMD:-npm run lint}" \
        "AI_TOOL" "$AI_TOOL"
    
    # Configure AGENT_CONTEXT.md
    configure_file "multiagent-framework/context/AGENT_CONTEXT.md" \
        "PROJECT_NAME" "$PROJECT_NAME" \
        "PRIMARY_OBJECTIVE" "Automated development assistance" \
        "PROJECT_SCOPE" "Full project development" \
        "TARGET_DATE" "$(date -d '+30 days' 2>/dev/null || date -v '+30d' 2>/dev/null || echo 'TBD')"
    
    # Configure orchestrator if JavaScript project
    if [ -f "multiagent-framework/orchestration/orchestrator.js.template" ]; then
        cp "multiagent-framework/orchestration/orchestrator.js.template" \
           "multiagent-framework/orchestration/orchestrator.js"
        
        configure_file "multiagent-framework/orchestration/orchestrator.js" \
            "PROJECT_NAME" "$PROJECT_NAME" \
            "AI_TOOL" "$AI_TOOL" \
            "AI_COMMAND" "$AI_COMMAND" \
            "BUILD_COMMAND" "$BUILD_CMD" \
            "TEST_COMMAND" "$TEST_CMD" \
            "VCS_TYPE" "git" \
            "BRANCH_STRATEGY" "branches"
    fi
    
    # Step 4: Initialize memory bank
    print_header "Step 4: Initializing Memory Bank"
    
    # Process template files
    for template in multiagent-framework/memory-bank/*.template; do
        if [ -f "$template" ]; then
            output="${template%.template}"
            cp "$template" "$output"
            
            configure_file "$output" \
                "PROJECT_NAME" "$PROJECT_NAME" \
                "PROJECT_DESCRIPTION" "Development project using $LANGUAGE and $FRAMEWORK" \
                "PRIMARY_LANGUAGE" "$LANGUAGE" \
                "FRAMEWORK" "$FRAMEWORK" \
                "BUILD_COMMAND" "$BUILD_CMD" \
                "TEST_COMMAND" "$TEST_CMD"
            
            print_success "Created $(basename "$output")"
        fi
    done
    
    # Step 5: Update package.json if Node.js project
    if [ -f "package.json" ] && [ "$LANGUAGE" == "JavaScript/TypeScript" ]; then
        print_header "Step 5: Updating package.json"
        
        # Check if scripts section exists
        if grep -q '"scripts"' package.json; then
            print_info "Adding agent commands to package.json..."
            # This is complex to do safely in bash, so we'll provide instructions
            print_warning "Please manually add these scripts to your package.json:"
            echo '  "agents:init": "node multiagent-framework/orchestration/orchestrator.js init",'
            echo '  "agents:deploy": "node multiagent-framework/orchestration/orchestrator.js deploy",'
            echo '  "agents:status": "node multiagent-framework/orchestration/orchestrator.js status",'
            echo '  "agents:cleanup": "node multiagent-framework/orchestration/orchestrator.js cleanup"'
        fi
    fi
    
    # Step 6: Create necessary directories
    print_header "Step 6: Creating Directory Structure"
    
    mkdir -p multiagent-framework/tracking/logs
    mkdir -p multiagent-framework/memory-bank/agent-memories
    mkdir -p work
    
    print_success "Directory structure created"
    
    # Step 7: Cleanup unnecessary files
    print_header "Step 7: Cleaning Up Unnecessary Files"
    
    print_info "Removing example configurations for other tech stacks..."
    
    # Determine which examples to keep based on detected language
    case "$LANGUAGE" in
        "JavaScript/TypeScript")
            # Keep Node.js example, remove others
            rm -f multiagent-framework/examples/python-django.yaml 2>/dev/null
            rm -f multiagent-framework/examples/go-microservices.yaml 2>/dev/null
            print_success "Kept nodejs-react.yaml example"
            ;;
        "Python")
            # Keep Python example, remove others
            rm -f multiagent-framework/examples/nodejs-react.yaml 2>/dev/null
            rm -f multiagent-framework/examples/go-microservices.yaml 2>/dev/null
            print_success "Kept python-django.yaml example"
            ;;
        "Go")
            # Keep Go example, remove others
            rm -f multiagent-framework/examples/nodejs-react.yaml 2>/dev/null
            rm -f multiagent-framework/examples/python-django.yaml 2>/dev/null
            print_success "Kept go-microservices.yaml example"
            ;;
        *)
            # Keep all examples for unknown languages
            print_info "Keeping all examples for reference"
            ;;
    esac
    
    # Remove all .template files after processing
    print_info "Removing template files..."
    find multiagent-framework -name "*.template" -type f -delete 2>/dev/null
    print_success "Template files removed"
    
    # Remove the orchestrator template if we created the actual file
    if [ -f "multiagent-framework/orchestration/orchestrator.js" ]; then
        rm -f multiagent-framework/orchestration/orchestrator.js.template 2>/dev/null
    fi
    
    # Remove package.json.template if not a Node.js project
    if [ "$LANGUAGE" != "JavaScript/TypeScript" ]; then
        rm -f multiagent-framework/package.json.template 2>/dev/null
        print_info "Removed Node.js specific templates"
    fi
    
    # Remove the generic shell orchestration template if language-specific exists
    if [ -f "multiagent-framework/orchestration/orchestrator.js" ] || \
       [ -f "multiagent-framework/orchestration/orchestrator.py" ] || \
       [ -f "multiagent-framework/orchestration/orchestrator.go" ]; then
        rm -f multiagent-framework/orchestration/orchestrate-template.sh 2>/dev/null
    fi
    
    # Clean up setup files themselves (optional - ask user)
    echo ""
    read -p "Remove setup files (SETUP.md, this script)? (y/N): " remove_setup
    if [[ $remove_setup =~ ^[Yy]$ ]]; then
        rm -f multiagent-framework/SETUP.md 2>/dev/null
        rm -f multiagent-framework/QUICK_START.md 2>/dev/null
        # Note: Can't delete this script while it's running, will be done at the end
        REMOVE_SELF=true
        print_success "Setup files will be removed"
    else
        print_info "Keeping setup files for reference"
    fi
    
    # Step 8: Verification
    print_header "Step 8: Verification"
    
    # Check for remaining placeholders
    remaining=$(grep -r "{{" multiagent-framework/ 2>/dev/null | grep -v ".template" | wc -l)
    if [ "$remaining" -gt 0 ]; then
        print_warning "Found $remaining remaining placeholders to configure"
    else
        print_success "All placeholders configured!"
    fi
    
    # Final summary
    print_header "✅ Setup Complete!"
    
    echo ""
    echo "Configuration Summary:"
    echo "----------------------"
    echo "Project: $PROJECT_NAME"
    echo "Language: $LANGUAGE"
    echo "Framework: $FRAMEWORK"
    echo "AI Tool: $AI_TOOL"
    echo ""
    echo "Next Steps:"
    echo "1. Review configuration in multiagent-framework/agents/definitions.yaml"
    echo "2. Define tasks in multiagent-framework/context/AGENT_CONTEXT.md"
    echo "3. Run initialization: npm run agents:init (or equivalent)"
    echo "4. Deploy your first agent: npm run agents:deploy"
    echo ""
    print_success "Framework is ready to use! 🚀"
    
    # Self-delete if requested
    if [ "$REMOVE_SELF" = true ]; then
        echo ""
        print_info "Cleaning up setup script..."
        rm -f "$0" 2>/dev/null
    fi
}

# ============================================================================
# Script Entry Point
# ============================================================================

# Initialize variables
REMOVE_SELF=false

# Parse command line arguments
AUTO_DETECT=false
while [[ $# -gt 0 ]]; do
    case $1 in
        --auto-detect)
            AUTO_DETECT=true
            shift
            ;;
        --project-name)
            PROJECT_NAME="$2"
            shift 2
            ;;
        --ai-tool)
            AI_TOOL="$2"
            shift 2
            ;;
        --help)
            echo "Usage: $0 [options]"
            echo "Options:"
            echo "  --auto-detect         Run with automatic detection"
            echo "  --project-name NAME   Set project name"
            echo "  --ai-tool TOOL       Set AI tool (claude, openai, custom)"
            echo "  --help               Show this help message"
            exit 0
            ;;
        *)
            shift
            ;;
    esac
done

# Run main setup
main