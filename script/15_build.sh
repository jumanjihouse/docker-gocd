#!/bin/bash
set -e
set -o noclobber

# Import smitty.
source script/functions

say Build gocd server image.
pushd server
smitty docker build --rm -t jumanjiman/gocd-server .
popd
