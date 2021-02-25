#!/bin/bash
set -e
CMD=${1}
set -u
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

help(){
    echo "Supported arguments "
    echo "  setup"
    echo "  create"
    echo "  destroy"
    echo "  converage"
    echo "  verify"
    echo "  login"
    echo "  image-build"
}

if [ "${CMD}" = "setup" ]; then
    cd "${DIR}"
    ./setup.sh
    cd ..
    echo "* Updating gems"
    bundle install
elif [ "${CMD}" = "create" ]; then
    cd "${DIR}/.."
    bundle exec kitchen create
elif [ "${CMD}" = "destroy" ]; then
    cd "${DIR}/.."
     bundle exec kitchen destroy
elif [ "${CMD}" = "converage" ]; then
    cd "${DIR}/.."
    bundle exec kitchen conv
elif [ "${CMD}" = "verify" ]; then
    cd "${DIR}/.."
    bundle exec kitchen verify
elif [ "${CMD}" = "login" ]; then
    cd "${DIR}/.."
    bundle exec kitchen login
elif [ "${CMD}" = "image-build" ]; then
    cd "${DIR}/.."
    BRANCH=$(git rev-parse --abbrev-ref HEAD)
    COMMIT=$(git rev-parse --short HEAD)
    DATE=$(date +%m%d%H%M%S)
    export IMAGE_NAME="gold-${BRANCH}-${COMMIT}-${DATE}"
    echo "buidling $IMAGE_NAME"
    packer build -var playbook_drop_path="${DIR}/../" config/packer-image-config.json  
else 
    echo "unkown Command '${CMD}'"
    help
    exit 1
fi
