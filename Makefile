
run:
	hugo server -w

build:
	hugo

deploy: build
	cd public && rsync -a --delete --stats . kgolding.co.uk@ssh.stackcp.com:~/public_html