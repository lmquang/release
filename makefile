RELEASE_BRANCH=main
BETA_BRANCH=preview
DEVELOP_BRANCH=develop

.PHONY: push
push:
	git checkout main && git push origin main && git push origin --tags && git checkout develop && git push origin develop

.PHONY: release
release:
	git checkout $(BETA_BRANCH) && git pull origin $(BETA_BRANCH) && \
		git checkout $(RELEASE_BRANCH) && git pull origin $(RELEASE_BRANCH) && \
		git merge $(BETA_BRANCH) --no-ff && \
		git push origin $(RELEASE_BRANCH) && \
		git checkout $(DEVELOP_BRANCH)

.PHONY: release-rc
release-rc:
	git checkout $(BETA_BRANCH) && git pull origin $(BETA_BRANCH) && git merge $(DEVELOP_BRANCH) --no-ff && git push origin $(BETA_BRANCH) && git checkout $(DEVELOP_BRANCH)

