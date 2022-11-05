CHARTS_URL = https://mirulabs.jfrog.io/artifactory/api/helm/litmus-kubernetes-chaos

build: dist-repo
	cd package && \
		docker-compose build && \
		docker-compose run --rm package package.sh "${CHARTS_URL}" dist-repo && \
		cd ../dist-repo && \
		echo "--- Diff" && \
		git diff --stat

# Commit and push the chart index
release:
	cd dist-repo && \
		git add *.tgz index.yaml && \
		git commit --message "Update to buildkite/charts@${COMMIT}" && \
		git push origin gh-pages
