#!/usr/bin/env bash

find . -name "*.std.compose.yaml" -exec docker compose -f {} $@ \;
