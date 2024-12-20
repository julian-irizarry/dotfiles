#!/bin/bash

TARGET_WORKSPACE=$1
CURRENT_WORKSPACE=$(hyprctl activeworkspace -j | jq -r '.id')

# Check if the current workspace matches the target
if [ "$CURRENT_WORKSPACE" != "$TARGET_WORKSPACE" ]; then
    hyprctl dispatch workspace "$TARGET_WORKSPACE"
fi
