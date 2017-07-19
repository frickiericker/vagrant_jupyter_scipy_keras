#!/bin/sh
set -efu

doit() {
    echo "# $*"
    "$@" > /dev/null
}

export DEBIAN_FRONTEND=noninteractive

doit apt-get update
doit apt-get install -y python-dev python-pip
doit apt-get install -y python-numpy python-scipy python-matplotlib python-sklearn python-pil
doit apt-get install -y ipython ipython-notebook
doit pip install --upgrade pip
doit pip install tensorflow theano keras seaborn
doit pip install jupyter jupyter_contrib_nbextensions
doit jupyter contrib nbextension install 2> /dev/null

cat << END
Setup finished. Let us type ./start_notebook.sh to launch notebook server!
END
