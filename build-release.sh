#!/bin/bash
set -euxo pipefail

PATH=$(PATH):$(pwd)/depot_tools/

# Download chromium source
fetch --no-history chromium
cd src

# Create a new build with some predefined args
gn gen out/Default
cp ../args.gn out/Default/args.gn

# Build
autoninja -C out/Default chrome

ls out/Default

