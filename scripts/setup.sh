#!/usr/bin/env bash

SCRIPT_DIR=$(cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)
VENDOR_DIR=$SCRIPT_DIR"/../vendor"

mkdir $VENDOR_DIR

REPO_URL=git@github.com:al7aro/stb.git
git clone $REPO_URL $VENDOR_DIR/stb

REPO_URL=https://github.com/glfw/glfw.git
git clone $REPO_URL -b 3.3-stable $VENDOR_DIR/glfw

REPO_URL=https://github.com/g-truc/glm.git
git clone $REPO_URL -b 1.0 $VENDOR_DIR/glm