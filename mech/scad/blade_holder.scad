

use <arm_pins.scad>
use <blade.scad>

module blade_holder(blade_size, blade_width)
{
    difference()
    {
        cylinder(h = 60, r = 4.9);
        translate(v = [ 0, 0, 2 ]) cylinder(h = 60, r = 4);
        translate(v = [ 0, 0, -2 ]) cylinder(h = 10, r = 3);
        translate(v = [ 0, 0, 55 ]) cube(size = [ blade_size, blade_width, blade_size ], center = true);
        translate(v = [ 0, 0, 15.5 ]) rotate(a = 90, v = [ 0, 1, 0 ]) cylinder(h = 6, r = 1.2);
        translate(v = [ 0, 0, 35 ]) rotate(90, [ 1, 0, 0 ]) cylinder(h = 20, r = 1.2, center = true);
        translate(v = [ 0, 0, 50 ]) rotate(90, [ 1, 0, 0 ]) cylinder(h = 20, r = 1.2, center = true);
    }
}

module blade_holder_strengthener(height, blade_size)
{
    difference()
    {
        cylinder(h = height, r = 3.5);
        translate(v = [ -(height + 2) / 2, -(blade_size / 2), -1 ]) cube(size = [ height + 2, height + 2, height + 2 ]);
    }
}

difference()
{
    union()
    {
        blade_holder(70, 2.3);

        *translate(v = [ 0, 0, 30 ]) //
            blade_holder_strengthener(50, 2.5);

        translate(v = [ 0, 0, 0 ])           //
            translate(v = [ 0, 0, .5 ])      //
            rotate(a = 180, v = [ 1, 0, 0 ]) //
            arm_pin(4, 2.7, 3.4);

        translate(v = [ 0, 0, 57 ]) rotate(a = 90, v = [ 1, 0, 0 ]) blade();
    }
    *translate(v = [ -100, 0, 40 ]) cube(size = [ 200, 200, 200 ], center = true);
}