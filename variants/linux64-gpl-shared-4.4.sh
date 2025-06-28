#!/bin/bash
source "$(dirname "$BASH_SOURCE")"/linux-install-shared.sh
source "$(dirname "$BASH_SOURCE")"/defaults-gpl-shared.sh

# Override for FFmpeg 4.4
GIT_BRANCH="release/4.4"