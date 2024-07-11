#!/usr/bin/env bash

if [ "$(basename "$PWD")" = 'scripts' ]; then cd ..; fi

fvm install
fvm use
fvm flutter clean
sh scripts/clean_ios.sh
fvm flutter pub get --enforce-lockfile
sh scripts/build_runner.sh
mason get
