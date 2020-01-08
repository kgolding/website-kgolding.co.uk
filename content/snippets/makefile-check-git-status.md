+++
title = "Makefile - check git status"
description = "Exit make if working directory is dirty"
tags = ["make", "git"]
+++

This target will exit a Makefile if the working directory is not clean. Great for making sure you've commited changes before doing a production build/deployment.

<!--more-->

**Makefile**
```bash
git-status:
	@status=$$(git status --porcelain); \
	if [ ! -z "$${status}" ]; \
	then \
		echo "Error - working directory is dirty. Commit those changes!"; \
		exit 1; \
	fi
```
