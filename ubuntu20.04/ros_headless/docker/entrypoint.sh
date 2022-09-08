#!/usr/bin/env bash

jupyter notebook --allow-root --no-browser --ip="*"

exec $@
