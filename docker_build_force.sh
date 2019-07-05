#!/bin/bash

set -e
set -o pipefail

docker build --no-cache -t didstopia/nuget-klondike:latest .
