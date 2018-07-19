#!/bin/bash -eu

. "$(dirname $0)"/../../../scripts/export-director-metadata

DIEGO_CELL_BEFORE=$(bosh vms -d ${ERT_DEPLOYMENT_NAME} | grep diego_cell | grep running | wc -l)
bosh -n recreate diego_cell -d ${ERT_DEPLOYMENT_NAME} --max-in-flight=${MAX_IN_FLIGHT}
DIEGO_CELL_AFTER=$(bosh vms -d ${ERT_DEPLOYMENT_NAME} | grep diego_cell | grep running | wc -l)

if [[ "${DIEGO_CELL_BEFORE}" !=  "${DIEGO_CELL_AFTER}" ]]; then
  echo "Numbers of Running Diego Cell are different"
  echo "Should be ${DIEGO_CELL_BEFORE} but found ${DIEGO_CELL_AFTER}"
  exit 1
fi

echo "Diego cell repave ${DIEGO_CELL_AFTER}"
