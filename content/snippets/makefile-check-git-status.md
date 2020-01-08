+++
title = "Makefile - check git status"
description = "Exit make if working directory is dirty"
tags = ["make", "git"]
+++

This target will exit a Makefile is the working directory is not clean.

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
