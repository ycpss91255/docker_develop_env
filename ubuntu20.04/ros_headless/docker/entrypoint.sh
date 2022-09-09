#!/usr/bin/env bash

jupyter lab --no-browser --ip="*" --port 10000

exec $@
