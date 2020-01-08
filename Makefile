
run:
	hugo server -w

build: git-status
	hugo

deploy: build
	cd public && rsync -a --delete --stats . kgolding.co.uk@ssh.stackcp.com:~/public_html

git-status:
	@if [ -z "$(git status --porcelain)" ]; \
	then \
		echo "Error - working directory is dirty. Commit those changes!"; \
		exit 1; \
	fi