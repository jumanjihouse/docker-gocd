#!/bin/bash
set -e
set -o noclobber

# Import smitty.
source script/functions

say Build gocd base image.
pushd base
smitty docker build --rm -t jumanjiman/gocd-base .
popd
