+++
title = "Buldroot - tips and tricks"
description = "Some buildroot tips"
date = "2020-06-12"
tags = ["buildroot"]
+++
Here are some great [buildroot](https://buildroot.org/) tips and tips:
<!--more-->

## Menuconfig search

When using `make menuconfig` you can search for an option using `/`, but did you know you can jump straight to any of the search results with just one press of a key?

![Buildroot screenshot showing menuconfig search jump shortcut](/img/2020/buildroot-menuconfig-search-jump.png)

## Make with a pretty output

`./utils/brmake` runs `make` and simplifies the output to a more human readable format.

## Rebuild one package and regenerate filesystem images

Use can specify multiple make targets, which saves `make` parsing the configuration multiple times, speeding things up.

e.g. to rebuild the htop package and rebuild the file-system images.

`make htop-rebuild all`

Where `htop-rebuild` rebuilds the htop package and  `all` rebuilds the file-system images.

## Print out variables

Use `make VARS=<pattern> printvars` to print out buildroot vars, using `%` in the pattern as a wildcard.

e.g. to display all the vars starting with `GO_` (add the underscore at the end to only display GO package vars and not GODB2 as well for example

`make VARS=GO_% printvars`

## Help

`make help` returns a handy list of available commands.

```
Cleaning:
  clean                  - delete all files created by build
  distclean              - delete all non-source files (including .config)

Build:
  all                    - make world
  toolchain              - build toolchain
  sdk                    - build relocatable SDK

Configuration:
  menuconfig             - interactive curses-based configurator
  nconfig                - interactive ncurses-based configurator
  xconfig                - interactive Qt-based configurator
  gconfig                - interactive GTK-based configurator
  oldconfig              - resolve any unresolved symbols in .config
  syncconfig             - Same as oldconfig, but quietly, additionally update deps
  olddefconfig           - Same as syncconfig but sets new symbols to their default value
  randconfig             - New config with random answer to all options
  defconfig              - New config with default answer to all options;
                             BR2_DEFCONFIG, if set on the command line, is used as input
  savedefconfig          - Save current config to BR2_DEFCONFIG (minimal config)
  update-defconfig       - Same as savedefconfig
  allyesconfig           - New config where all options are accepted with yes
  allnoconfig            - New config where all options are answered with no
  alldefconfig           - New config where all options are set to default
  randpackageconfig      - New config with random answer to package options
  allyespackageconfig    - New config where pkg options are accepted with yes
  allnopackageconfig     - New config where package options are answered with no

Package-specific:
  <pkg>                  - Build and install <pkg> and all its dependencies
  <pkg>-source           - Only download the source files for <pkg>
  <pkg>-extract          - Extract <pkg> sources
  <pkg>-patch            - Apply patches to <pkg>
  <pkg>-depends          - Build <pkg>'s dependencies
  <pkg>-configure        - Build <pkg> up to the configure step
  <pkg>-build            - Build <pkg> up to the build step
  <pkg>-show-info        - generate info about <pkg>, as a JSON blurb
  <pkg>-show-depends     - List packages on which <pkg> depends
  <pkg>-show-rdepends    - List packages which have <pkg> as a dependency
  <pkg>-show-recursive-depends
                         - Recursively list packages on which <pkg> depends
  <pkg>-show-recursive-rdepends
                         - Recursively list packages which have <pkg> as a dependency
  <pkg>-graph-depends    - Generate a graph of <pkg>'s dependencies
  <pkg>-graph-rdepends   - Generate a graph of <pkg>'s reverse dependencies
  <pkg>-dirclean         - Remove <pkg> build directory
  <pkg>-reconfigure      - Restart the build from the configure step
  <pkg>-rebuild          - Restart the build from the build step

busybox:
  busybox-menuconfig     - Run BusyBox menuconfig

uboot:
  uboot-menuconfig       - Run U-Boot menuconfig
  uboot-savedefconfig    - Run U-Boot savedefconfig
  uboot-update-defconfig - Save the U-Boot configuration to the path specified
                             by BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE

linux:
  linux-menuconfig       - Run Linux kernel menuconfig
  linux-savedefconfig    - Run Linux kernel savedefconfig
  linux-update-defconfig - Save the Linux configuration to the path specified
                             by BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE

Documentation:
  manual                 - build manual in all formats
  manual-html            - build manual in HTML
  manual-split-html      - build manual in split HTML
  manual-pdf             - build manual in PDF
  manual-text            - build manual in text
  manual-epub            - build manual in ePub
  graph-build            - generate graphs of the build times
  graph-depends          - generate graph of the dependency tree
  graph-size             - generate stats of the filesystem size
  list-defconfigs        - list all defconfigs (pre-configured minimal systems)

Miscellaneous:
  source                 - download all sources needed for offline-build
  external-deps          - list external packages used
  legal-info             - generate info about license compliance
  show-info              - generate info about packages, as a JSON blurb
  printvars              - dump internal variables selected with VARS=...

  make V=0|1             - 0 => quiet build (default), 1 => verbose build
  make O=dir             - Locate all output files in "dir", including .config

For further details, see README, generate the Buildroot manual, or consult
it on-line at http://buildroot.org/docs.html

```
