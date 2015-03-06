#!/usr/bin/env bash

set +e

grep x import.sh | echo fail; exit 1
echo end
