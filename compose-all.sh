#!/usr/bin/env bash

find . -name "*.compose.yaml" -exec docker compose -f {} $@ \;
