lint-chart:
	helm lint charts/ks-devops

remove-crds:
	kubectl delete -f charts/ks-devops/crds

install-chart: lint-chart
	helm install ks-devops charts/ks-devops -n kubesphere-devops-system --create-namespace \
		 --set image.pullPolicy=Always --set jenkins.ksAuth.enabled=true

uninstall-chart:
	make uninstall-jenkins-chart || true
	helm uninstall ks-devops -n kubesphere-devops-system
render-chart:
	helm template ks-devops charts/ks-devops -n kubesphere-devops-system --create-namespace \
		 --set image.pullPolicy=Always --set jenkins.ksAuth.enabled=true --debug

install-jenkins-chart:
	helm install ks-jenkins-test charts/ks-devops/charts/jenkins --set Master.NodePort=

uninstall-jenkins-chart:
	helm uninstall ks-jenkins-test

reinstall-chart:
	make uninstall-chart || true
	make install-chart

reinstall-jenkins-chart:
	make uninstall-jenkins-chart || true
	make install-jenkins-chart

package-chart:
	cd charts && helm package ks-devops

load-images-to-k3d:
	docker pull ghcr.io/kubesphere/devops-tools:master
	docker pull ghcr.io/kubesphere/devops-apiserver:master
	docker pull ghcr.io/kubesphere/devops-controller:master
	docker pull kubespheredev/ks-jenkins:master

	k3d image import ghcr.io/kubesphere/devops-tools:master
	k3d image import ghcr.io/kubesphere/devops-apiserver:master
	k3d image import ghcr.io/kubesphere/devops-controller:master
	k3d image import kubespheredev/ks-jenkins:master

fetch-crds:
	./hack/fetch-crds.sh
