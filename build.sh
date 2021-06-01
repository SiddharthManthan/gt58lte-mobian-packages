#!/bin/bash

# Variables
repositories="firmware-gt58lte gt58lte-tweaks gt58lte-support"

#Clone and build packages
for repository in ${repositories}; do
  git clone https://gitlab.com/mobian-gt58lte/${repository}.git
  cd ${repository}
  CONFIG_SITE=/etc/dpkg-cross/cross-config.arm64  DEB_BUILD_OPTIONS=nocheck dpkg-buildpackage -aarm64 -Pcross,nocheck
  cd ..
  sudo rm -rf ${repositories}
done

tar -cf packages.tar *.dsc *.xz *.deb *.buildinfo *.changes
