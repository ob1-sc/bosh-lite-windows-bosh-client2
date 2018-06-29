#!/bin/bash

DOWNLOAD_DIR=~/cf-cli-download

mkdir $DOWNLOAD_DIR
pushd $DOWNLOAD_DIR

CF_CLI_HREF="https://packages.cloudfoundry.org/stable?release=linux64-binary&source=github"
CF_CLI_NAME=cf
CF_CLI_PKG="$CF_CLI_NAME.tgz"

# download cf cli
wget -O $CF_CLI_PKG $CF_CLI_HREF

# extract
tar zxvf $CF_CLI_PKG

# make executable
chmod +x $CF_CLI_NAME

# move to local bin
mv $CF_CLI_NAME /usr/local/bin/$CF_CLI_NAME

# print bosh version
$CF_CLI_NAME -v

popd

# delete the download directory
rm -rf $DOWNLOAD_DIR
