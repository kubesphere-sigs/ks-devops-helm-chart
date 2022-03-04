#!/bin/bash

crds=("devops.kubesphere.io_devopsprojects.yaml devops.kubesphere.io_pipelines.yaml devops.kubesphere.io_pipelineruns.yaml devops.kubesphere.io_templates.yaml devops.kubesphere.io_clustertemplates.yaml gitops.kubesphere.io_applications.yaml")
for crd in $crds
do
    curl -sSL -o charts/ks-devops/crds/$crd https://ghproxy.com/https://raw.githubusercontent.com/kubesphere/ks-devops/master/config/crd/bases/$crd
done

crds=("devops.kubesphere.io_s2ibuilders.yaml devops.kubesphere.io_s2ibuildertemplates.yaml devops.kubesphere.io_s2iruns.yaml")
for crd in $crds
do
    curl -sSL -o charts/ks-devops/charts/s2i/crds/$crd https://ghproxy.com/https://raw.githubusercontent.com/kubesphere/s2ioperator/master/config/crds/$crd
done

crds=("devops.kubesphere.io_s2ibinaries.yaml")
for crd in $crds
do
    curl -sSL -o charts/ks-devops/charts/s2i/crds/$crd https://ghproxy.com/https://raw.githubusercontent.com/kubesphere/ks-devops/master/config/crd/bases/$crd
done
