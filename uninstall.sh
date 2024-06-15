#!/bin/bash

. services.sh

for key in $(printf "%s\n" "${!SERVICES[@]}" | sort); do
  value="${SERVICES[$key]}"

  vservice="${value}_SERVICE"

  docker stop ${!vservice}
  docker rm ${!vservice}
  docker image rm ${!vimage}

done

docker network rm $LABEL_PROJECT

