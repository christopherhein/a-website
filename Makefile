gen-crd-api-reference-docs:
	go install go.hein.dev/gen-crd-api-reference-docs

generate-%: 
	gen-crd-api-reference-docs \
		-config ./docs-config.json \
		-api-dir ../manager/apis/$*/v1alpha1 \
		-out-dir content/docs/reference/

generate: #gen-crd-api-reference-docs
	@$(MAKE) generate-apigateway
	@$(MAKE) generate-cloud9
	@$(MAKE) generate-cloudformation
	@$(MAKE) generate-ecr
	@$(MAKE) generate-iam
	@$(MAKE) generate-lambda
	@$(MAKE) generate-route53
	@$(MAKE) generate-s3

serve: 
	hugo server \
	--buildDrafts \
	--buildFuture \
	--disableFastRender \
	--ignoreCache

production-build:
	hugo

preview-build:
	hugo \
	--baseURL $(DEPLOY_PRIME_URL) \
	--buildDrafts \
	--buildFuture
