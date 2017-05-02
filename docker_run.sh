#!/bin/bash
set -e
set -o pipefail
./docker_build.sh
docker run -p 8080:80 -v $(pwd)/data:/data --name nuget-klondike -it --rm didstopia/nuget-klondike:latest
