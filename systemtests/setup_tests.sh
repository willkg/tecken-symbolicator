#!/bin/bash

# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set -e

# Usage: ./setup_tests.sh

STACKSDIR="./data/stacks/"

echo "Generating systemtest data files ..."

# Generate some stacks for symbolication
mkdir -p "${STACKSDIR}" || true
STACKSCOUNT=$(find "${STACKSDIR}" -type f | wc -l)
if [ ${STACKSCOUNT} -lt 10 ]; then
    echo "NOTE: You'll want to double check the stacks files to make sure they're not "
    echo "silly looking."
    echo ""
    ./bin/fetch-crashids.py --num-results=10 | ./bin/make-stacks.py save "${STACKSDIR}"
else
    echo "Already have ${STACKSCOUNT} stacks files."
fi
