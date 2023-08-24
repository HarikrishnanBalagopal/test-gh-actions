VERSION ?= v1.2.3-rc.45

.PHONY: bundle
bundle: kustomize operator-sdk ## Generate bundle manifests and metadata, then validate generated files.
	@echo 'changing the image tag to '${VERSION}' in "containerImage" field in the CSV using yq'
	@cat config/manifests/bases/move2kube-operator.clusterserviceversion.yaml
	yq eval --exit-status --inplace ".metadata.annotations.containerImage=\"quay.io/konveyor/move2kube-operator:${VERSION}\"" config/manifests/bases/move2kube-operator.clusterserviceversion.yaml
	@echo 'after editting the CSV'
	@cat config/manifests/bases/move2kube-operator.clusterserviceversion.yaml
