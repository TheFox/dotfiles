#!/usr/bin/env bash

set -e

echo start

#grep x import.sh || { echo failed; exit 1; }
grep xy import.sh || echo failed

echo
echo end
