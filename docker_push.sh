#!/bin/bash
set -e
set -o pipefail
docker tag didstopia/nuget-klondike:latest didstopia/nuget-klondike:latest
docker push didstopia/nuget-klondike:latest