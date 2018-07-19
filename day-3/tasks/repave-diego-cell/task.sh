
#!/bin/bash -eu

. "$(dirname $0)"/../../../scripts/export-director-metadata

bosh vms
env


#bosh recreate diego_cell -d ${ERT_DEPLOYMENT_NAME} --max-in-flight=${MAX_IN_FLIGHT}
