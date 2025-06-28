#!/bin/bash
source "$(dirname "$BASH_SOURCE")"/linux-install-static.sh
source "$(dirname "$BASH_SOURCE")"/defaults-gpl.sh

# Override for FFmpeg 4.4
GIT_BRANCH="release/4.4"