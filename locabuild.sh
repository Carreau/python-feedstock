#!/bin/bash


# add function to change location of fork and commit hash to build in meta.yml
# do it manually before running the script.
export CPU_COUNT=1

export PYTHONUNBUFFERED=1

export MACOSX_DEPLOYMENT_TARGET="10.9"
export CONDA_PY=36
conda config --set show_channel_urls true
conda config --set add_pip_as_python_dependency false

conda update -n root --yes --quiet conda conda-env conda-build
conda install -n root --yes --quiet jinja2 conda-build anaconda-client

conda info
conda config --get


conda build purge ./recipe/
conda build ./recipe/

# need to symlink $PREFIX/site-package/python3.6 to python3.7
# optionally
#     conda create python=3.6
# activate
# conda install python=3.6.99 --use-local --force 
# likely conda install pip/setuptools if not there.
