+++
title = "Buldroot - making a package patch"
description = "How to make a package source code patch"
date = "2022-09-19"
tags = ["buildroot", "linux", "git"]
+++

How to create buildroot package patches.
<!--more-->

Source: http://lists.busybox.net/pipermail/buildroot/2012-December/064291.html
Original author: Stefan Fröberg

I've reordered and slighty modified the original post, and it is here as I keep having to come back to it for reference.

### Use quilt

`quilt` is a tool that allows to generate a stack of patches. I typically
use quilt as follows in the context of Buildroot. I start building a
package, and realize it doesn't work. So the package source code has
already been extracted in output/build/mesa3d-8.0.5/.

What I do is:

```
cd output/build/mesa3d-8.0.5/
mkdir patches
quilt new mesa3d-01-something.patch
quilt edit configure.ac
```

Then, I can test to build the package against (of course, don't do a
make clean, or remove the package directory, or you would loose your
patches). You can continue editing more files using `quilt edit <filename>`.

You can also add more patches:

```
quilt new mesa3d-02-something-else.patch
quilt edit ...
```

At any point, to refresh (i.e generate) the current patch in the
patches/ directory, run "quilt refresh". You can move forward and
backward through your patches using quilt pop and quilt push.

When you're on a particular patch, you can edit its description using
`quilt header -e`. There, write your patch description and
Signed-off-by line.

Once you're happy with your patches, make sure to refresh them all, and
then do:

`cp patches/*.patch ${your_buildroot_src}/package/mesa3d/`


### Use Git

To use Git, the easiest way is to fetch the original source code of the
package by cloning the official repository of the project, and do the
modification here. So, something like:

```
git clone git://somewhere.org/mesa3d.git
cd mesa3d/
# identify the tag that corresponds to the official release
# you're working on, i.e 8.0.5. I'll assume it's called v8.0.5
git branch buildroot-work v8.0.5
git checkout buildroot-work

# Do your work as usual with Git.

# Then, to generate your patches:

git format-patch master

# All patches are named 000x-<something>.patch, so you'll have
# to rename them. Typically, I do:
for i in *.patch; do cp $i ${buildroot_src_dir}/package/mesa3d/mesa3d-$i ; done
```

### Use the raw diff tool
We will use the raw diff tool only. So first, extract one copy of
mesa3d source code (outside of Buildroot), and rename the directory:

```
tar xf mesa3d-8.0.5.tar.bz2
mv mesa3d-8.0.5 mesa3d-8.0.5.orig
```

Extract another copy:

```
tar xf mesa3d-8.0.5.tar.bz2
```
Then, do your modifications in the mesa3d-8.0.5/ directory. The
mesa3d-8.0.5.orig/ must be kept unchanged. Once you're done doing your
modifications, do:

`diff -ruN mesa3d-8.0.5.orig/ mesa3d-8.0.5/ > mesa3d-01-something.patch`

And then, edit mesa3d-01-something.patch with your text editor to add
the patch description and the Signed-off-by line.

This method is really poor mainly because it is hard to handle multiple
patches with it. I do not recommend it.


