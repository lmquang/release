.PHONY: push
push:
	git checkout main && git push origin main && git push origin --tags && git checkout develop && git push origin develop