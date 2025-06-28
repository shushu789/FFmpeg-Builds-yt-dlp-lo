#!/bin/bash
source "$(dirname "$BASH_SOURCE")"/windows-install-shared.sh
source "$(dirname "$BASH_SOURCE")"/defaults-gpl-shared.sh

# Override for FFmpeg 4.4
GIT_BRANCH="release/4.4"