#!/bin/bash

LABEL_PROJECT=vue

declare -A SERVICES=(\
  ["1"]="VUE" \
)

# Vue
VUE_PATH="./vue"
VUE_IMAGE="vue-admin-june24"
VUE_SERVICE="vue-admin-june24"
VUE_NET=$LABEL_PROJECT
VUE_HOSTNAME="vue"
VUE_PORT_EXPOSE=3000
VUE_PORT_FORWARD=3000
