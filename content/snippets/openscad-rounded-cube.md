+++
title = "OpenSCAD - Rounded cube"
description = ""
tags = ["OpenSCAD"]
+++

![openscad-rounded-cube1.png](/img/snippets/openscad-rounded-cube1.png)

The `minkowski()` covers tjhe first object with the second object. Whilst I've it used to add rounded vertical corners to a cube using a cylinder, using a sphere adds the rounding to all edges!

`minkowski()` increases the size of the first object, so the `cubeRounded()` module below first shrinks the cube before applying the rounding resulting in a rounded cube with the height/width/depth as given.


```
$fn=100;

cubeRounded(50,40,30,2);

translate([60,0,0]) cubeRounded(40,30,20,3);

module cubeRounded(x, y, z, r) {
    minkowski()
    {
        translate([r,r,r]) cube([x-2*r,y-2*r,z-2*r]);
        sphere(r=r);
    }
}

```
