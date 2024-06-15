#!/bin/bash

. services.sh

docker network create --driver bridge $LABEL_PROJECT

for key in $(printf "%s\n" "${!SERVICES[@]}" | sort); do
  value="${SERVICES[$key]}"

  vpath="${value}_PATH"
  vservice="${value}_SERVICE"
  vimage="${value}_IMAGE"
  vname="${value}_NAME"
  vnet="${value}_NET"
  vhostname="${value}_HOSTNAME"
  vport_expose="${value}_PORT_EXPOSE"
  vport_forward="${value}_PORT_FORWARD"
  vuserid="${value}_USER_ID"
  vgroupid="${value}_GROUP_ID"
  vrestart="${value}_RESTART"
  vcpu="${value}_CPU"
  vmemory="${value}_MEMORY"
  vvolume_from="${value}_VOLUME_FROM"
  vvolume_to="${value}_VOLUME_TO"

  docker stop ${!vservice}
  docker rm ${!vservice}
  docker image rm ${!vimage}
  docker build --tag ${!vimage} ${!vpath}

  create_script="docker create --label com.docker.compose.project=$LABEL_PROJECT"

  if [ -n "${!vnet}" ]; then
    create_script="${create_script} --network ${!vnet}"
  fi

  if [ -n "${!vhostname}" ]; then
    create_script="${create_script} --hostname ${!vhostname}"
  fi

  if [ -n "${!vport_forward}" ] && [ -n "${!vport_expose}" ]; then
    create_script="${create_script} --publish ${!vport_forward}:${!vport_expose}"
  fi

  if [ -n "${!vuserid}" ] && [ -n "${!vgroupid}" ]; then
    create_script="${create_script} --user ${!vuserid}:${!vgroupid}"
  fi

  if [ -n "${!vrestart}" ]; then
    create_script="${create_script} --restart ${!vrestart}"
  fi

  if [ -n "${!vcpu}" ]; then
    create_script="${create_script} --cpus ${!vcpu}"
  fi

  if [ -n "${!vmemory}" ]; then
    create_script="${create_script} --memory ${!vmemory}"
  fi

  if [ -n "${!vvolume_from}" ] && [ -n "${!vvolume_to}" ]; then
    create_script="${create_script} --volume ${!vvolume_from}:${!vvolume_to}:Z"

    next_volume=2

    while true; do
      next_vvolume_from="${vvolume_from}${next_volume}"
      next_vvolume_to="${vvolume_to}${next_volume}"

      if [ -n "${!next_vvolume_from}" ] && [ -n "${!next_vvolume_to}" ]; then
        create_script="${create_script} --volume ${!next_vvolume_from}:${!next_vvolume_to}:Z"
      
        ((next_volume++))
      else
        break
      fi
    done
  fi

  create_script="${create_script} --name ${!vservice} ${!vimage}"

  eval "${create_script}"

done

