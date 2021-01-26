#!/bin/bash

### Generate ssh key for TopolA access

TPA_ID=topola
TPA_DIR=~/.ssh/"${TPA_ID}"
TPA_KEY="${TPA_DIR}"/id_"${TPA_ID}"


# 0. Check and create directory for key storing
[ -d "${TPA_DIR}" ] || mkdir -p "${TPA_DIR}"

# 1. Check if key exists and generate it
[ -f "${TPA_KEY}" ] || ssh-keygen -q -t ed25519 -N "" -C "topola_hetzner" -f "${TPA_KEY}"

# 2. Outputs
echo To go at remote server run next command:
echo ssh -i "${TPA_KEY}" \<user@remote.server\>
