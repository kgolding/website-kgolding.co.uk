---
title: "Golang Application Directory Structure"
date: 2020-02-19T21:12:56Z
tags: ["go"]
---

How to set up a golang project as a mono repo, with public and private packages.
<!--more-->

See https://github.com/golang-standards/project-layout for a much more detail!

### Quickstart

In the following commands replace `my-project` for your projects name, and `kgolding` with you git username.

1. On github or gitlab create a new empty repo e.g. `github.com/kgolding/my-project` for this example.

2. `mkdir my-project`

3. `cd my-project`

4. `mkdir -p cmd/app pkg internal && touch README.md && touch cmd/app/main.go`

5. `go mod init github.com/kgolding/my-project`

6. You should now have the following structure:

   ```
   ├── cmd
   │   └── app
   │       └── main.go
   ├── go.mod
   ├── internal
   ├── pkg
   └── README.md
   ```

7. `git init`

8. `git add .`

9. `git commit -m "initial commit"`

10. `git remote add origin git@github.com:kgolding/my-project.git`

11. `git push -u origin master`

### Directory structure

| Relative path | Description                                                  |
| ------------- | ------------------------------------------------------------ |
| ./            | The root of the git repo                                     |
| ./README.md   | The projects main readme                                     |
| ./go.mod      | Created by running `go mod github.com/kgolding.go-app-structure` |
| ./cmd/*       | Folders for each build-able application `main.go`            |
| ./internal/*  | Folders for each private package (that can not be used in other projects) |
| ./pkg/*       | Folders for each public package (that might be used in other projects) |
| ./vendor/*    | *Optional:* External dependencies as populated by `go mod vendor` |


