#!/usr/bin/env bash

set -u
set -e

readonly token="$1"
readonly manager="$2"

# Ensure Docker is installed.
rpm -q docker-engine || exit

# Check if we're running.
ps -C dockerd || exit

# See if already part of Swarm.
/bin/docker info | grep 'Swarm: active' || exit

# Join the swarm.
/bin/docker swarm join --token "$token" "$manager"
