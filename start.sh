#!/bin/bash

. services.sh

for key in  $(printf "%s\n" "${!SERVICES[@]}" | sort); do
  value="${SERVICES[$key]}"

  vservice="${value}_SERVICE"

  docker start ${!vservice}
done
