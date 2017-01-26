#!/bin/sh
set -efu
vagrant ssh -c 'jupyter notebook --ip 0.0.0.0 --notebook-dir notebooks --no-browser'
