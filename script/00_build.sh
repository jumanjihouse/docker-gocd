#!/bin/bash
set +e

# Import smitty.
source script/functions

say Remove existing containers if necessary.
for c in gocd-agent gocd-server; do
  smitty docker stop $c
  smitty docker rm $c
done

# Always exit true.
exit 0
