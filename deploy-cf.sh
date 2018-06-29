#!/bin/bash

cd ~/cf-deployment
export STEMCELL_VERSION=$(bosh int ~/cf-deployment/cf-deployment.yml --path /stemcells/alias=default/version)
bosh upload-stemcell https://bosh.io/d/stemcells/bosh-warden-boshlite-ubuntu-trusty-go_agent?v=$STEMCELL_VERSION -n
bosh update-cloud-config ~/cf-deployment/iaas-support/bosh-lite/cloud-config.yml -n
bosh -d cf deploy ~/cf-deployment/cf-deployment.yml --var-file router_ca_certs=ca.crt -o ~/cf-deployment/operations/bosh-lite.yml --vars-store ~/deployments/vbox/deployment-vars.yml -v system_domain=bosh-lite.com -n
