#!/bin/bash

set -e

# Optional: Import test library bundled with the devcontainer CLI
# See https://github.com/devcontainers/cli/blob/HEAD/docs/features/test.md#dev-container-features-test-lib
# Provides the 'check' and 'reportResults' commands.
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib. Syntax is...
# check <LABEL> <cmd> [args...]
check "zsh version" zsh --version
check "omz theme" bash -c "cat ~/.zshrc | grep -E '^ZSH_THEME=\"bira\"'"
check "omz plugins" bash -c "cat ~/.zshrc | grep -E '^plugins=\(git opentofu terraform\)'"
# check "omz plugins" cat ~/.zshrc | grep -E "^plugins=\(git opentofu\)"



# Report results
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults