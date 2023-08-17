RELEASE_BRANCH=main
BETA_BRANCH=preview
DEVELOP_BRANCH=develop

.PHONY: release
release: 
	git checkout $(BETA_BRANCH) && git pull origin $(BETA_BRANCH) && \
		git checkout $(RELEASE_BRANCH) && git pull origin $(RELEASE_BRANCH) && \
		git merge $(BETA_BRANCH) --no-edit --no-ff && \
		git push origin $(RELEASE_BRANCH) && \
		git checkout $(DEVELOP_BRANCH)

.PHONY: release-staging
release-staging: sync-release
	git checkout $(DEVELOP_BRANCH) && git pull origin $(DEVELOP_BRANCH) && \
		git checkout $(BETA_BRANCH) && git pull origin $(BETA_BRANCH) && \
		git merge $(DEVELOP_BRANCH) --no-edit --no-ff && \
		git push origin $(BETA_BRANCH) && \
		git checkout $(DEVELOP_BRANCH) && git push origin $(DEVELOP_BRANCH)

.PHONY: sync-release
sync-release:
	git checkout $(RELEASE_BRANCH) && git pull origin $(RELEASE_BRANCH) && \
		git checkout $(BETA_BRANCH) && git pull origin $(BETA_BRANCH) && \
		git merge $(RELEASE_BRANCH) --no-edit --no-ff