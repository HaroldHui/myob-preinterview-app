#!/usr/bin/env bash

set -e

echo 'Start Server'
bundle exec puma -C ./config/puma.rb