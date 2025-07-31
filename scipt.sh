#!/bin/bash
set -e

echo "Downloading archives"
curl -fsSL https://github.com/rootless-containers/rootlesskit/releases/download/v2.3.5/rootlesskit-x86_64.tar.gz -o rootlesskit.tgz
curl -fsSL https://download.docker.com/linux/static/stable/x86_64/docker-24.0.6.tgz -o docker.tgz
curl -fsSL https://github.com/rootless-containers/slirp4netns/releases/download/v1.3.3/slirp4netns-x86_64 -o slirp4netns

echo "Extracting archives"
tar -xzf rootlesskit.tgz
tar -xzf docker.tgz

echo "Making "$HOME/bin" directory"
mkdir -p "$HOME/bin"


echo "Making binaries executable (chmod)"
chmod +x rootlesskit* docker/* slirp4netns

echo "Moving binaries to $HOME/bin"
mv rootlesskit* "$HOME/bin/"
mv docker/* "$HOME/bin/"
mv slirp4netns "$HOME/bin/"

echo "Cleanup"
rm -rf rootless* docker rootlesskit.tgz docker.tgz slirp4netns

echo ""

echo "run:"
echo "export PATH=\"$HOME/bin:\$PATH\""
echo "export DOCKER_HOST=unix:///run/user/$(id -u)/docker.sock"
echo "dockerd-rootless.sh --debug"