RELEASE_BRANCH=main
BETA_BRANCH=preview
DEVELOP_BRANCH=develop

.PHONY: push
push:
	git checkout main && git push origin main && git push origin --tags && git checkout develop && git push origin develop

.PHONY: release
	some release cmd

.PHONY: release-rc
release-rc:
	git checkout $(BETA_BRANCH) && git pull origin $(BETA_BRANCH) && git merge $(DEVELOP_BRANCH) --no-ff && git push origin $(BETA_BRANCH) && git checkout $(DEVELOP_BRANCH)

