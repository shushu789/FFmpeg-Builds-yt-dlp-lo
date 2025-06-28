#!/bin/bash
source "$(dirname "$BASH_SOURCE")"/windows-install-static.sh
source "$(dirname "$BASH_SOURCE")"/defaults-lgpl.sh

# Override for FFmpeg 4.4
GIT_BRANCH="release/4.4"