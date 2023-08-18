
run:
	hugo server -w

build: git-status
	hugo

deploy: build
	cd public && rsync -a --delete --stats . kgolding.co.uk@ssh.gb.stackcp.com:~/public_html

git-status:
	@status=$$(git status --porcelain); \
	if [ ! -z "$${status}" ]; \
	then \
		echo "Error - working directory is dirty. Commit those changes!"; \
		exit 1; \
	fi

install-hugo:
	CGO_ENABLED=1 go install -tags extended github.com/gohugoio/hugo@latest
