# ks-devops-helm-chart

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
![GitHub All Releases](https://img.shields.io/github/downloads/kubesphere-sigs/ks-devops-helm-chart/total)

KubeSphere official helm chart for [KubeSphere DevOps](https://github.com/kubesphere/ks-devops).

## Usage

[Helm](https://helm.sh) must be installed to use the charts.
Please refer to Helm's [documentation](https://helm.sh/docs/) to get started.

Once Helm is set up properly, add the repo as follows:

```bash
helm repo add ks-devops https://kubesphere-sigs.github.io/ks-devops-helm-chart/
```

you can then do

```bash
helm search repo ks-devops
helm install devops ks-devops/ks-devops --namespace kubesphere-devops-system --create-namespace
```

## Argo CD support
Install it via the following instructions:

```shell
helm repo add argo https://argoproj.github.io/argo-helm
helm install argocd --version 4.4.0 argo/argo-cd --namespace argocd --create-namespace
```

or, you could use the following instrctions to unintall it:
```shell
helm uninstall --namespace argocd argocd
```

## Configuration

See chart [readme](https://github.com/kubesphere-sigs/ks-devops-helm-chart/blob/master/charts/ks-devops/README.md) for install and config options.

## Repository

You can [browse the chart repository](https://github.com/kubesphere-sigs/ks-devops-helm-chart), [browse the site](https://kubesphere-sigs.github.io/ks-devops-helm-chart/) 

Or view the YAML at: [index.yaml](https://kubesphere-sigs.github.io/ks-devops-helm-chart/index.yaml)

