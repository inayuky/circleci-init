#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)

# check repogitory name is given
if [ -z "$1" ]; then
  echo "error: specify repogitory name."
  exit 1
fi

REPO_NAME=$1

# define destination directory
if [ -n "$2" ]; then
  # second argument
  DEST_DIR=$2
else
  # export dotenv for destination directory
  DOTENV_FILE="${SCRIPT_DIR}/.env"
  if [ -e "$DOTENV_FILE" ]; then
    set -a
    source $DOTENV_FILE
    set +a
  fi
fi
if [ -z "$DEST_DIR" ]; then
  # current dir
  DEST_DIR=`pwd`
fi

if [ ! -e "$DEST_DIR" ]; then
  echo "error: ${DEST_DIR} not found"
  exit 1
fi

if [ "$DEST_DIR" = "$SCRIPT_DIR" ]; then
  # this script dir is git repogitory. dest dir cannot be the same dir.
  echo "error: specify dest dir path. (or execute from different directory)"
  exit 1
fi

echo "dest_dir = ${DEST_DIR}"
echo "repo_name = ${REPO_NAME}"

# create repogitory at github from template repogitory
cd $DEST_DIR
gh repo create -y $REPO_NAME --private -p circleci-template

sleep 1 # wait for creating github repogitory

cd $REPO_NAME
git pull origin main
git branch -M main
git branch -u origin/main

# copy circleci template and create initial commit
# cp -a "${SCRIPT_DIR}/.circleci" "${REPO_NAME}/"
# cd $REPO_NAME
# git add .
# git commit -m "initial commit"
# git branch -M main
# git push -u origin main