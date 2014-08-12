#!/bin/bash
set -e
set -o noclobber

# Import smitty.
source script/functions

say Build gocd agent image.
pushd agent
smitty docker build --rm -t jumanjiman/gocd-agent .
popd
