use <arm_holder.scad>
use <ball_bearing.scad>

module base()
{
    difference()
    {
        union()
        {
            difference()
            {
                difference()
                {
                    translate([ 0, 0, -1 ]) cylinder(h = 11, r = 25, center = true);
                    translate(v = [ 0, 0, -7 ]) cylinder(h = 4.5, r = 13.5, center = true);
                }
                for (i = [0:(360 / 5):360])
                {
                    rotate(i)
                    {
                        translate(v = [ 0, -20.5, -2 ]) union()
                        {
                            cylinder(h = 14, r = 1.1, center = true);
                            translate(v = [ 0, 0, -3.5 ]) cylinder(h = 2.5, r = 2.7, center = true, $fn = 6);
                            translate(v = [ 0, 0, 5.5 ]) cube([ 10, 10, 7 ], center = true);
                        }
                    }
                }
            }
            for (i = [0 + 360 / 10:(360 / 5):360])
            {
                rotate(i)
                {
                    translate(v = [ -4, -24.5, 9.5 ])
                    {
                        rotate([ 0, 90, 0 ]) arm_holder(5, 3, 3.5, .1);
                    }
                }
            }
        }
        cylinder(h = 10, r = 16.3, center = true);
    }
}

module capot()
{
    difference()
    {
        cylinder(h = 4, r = 16, center = true);
        cylinder(h = 6, r = 12, center = true);
        for (i = [3 * 360 / 20:(360 / 5):360])
        {
            rotate(i)
            {
                translate(v = [ 17, 0, 0 ]) rotate(a = 45, v = [ 0, 1, 0 ]) cube(size = [ 15, 10, 5 ], center = true);
            }
        }
    }
}

module pin()
{
    difference()
    {
        union()
        {
            difference()
            {
                translate(v = [ 0, 0, 5 ]) cube(size = [ 9, 8, 20 ], center = true);

                translate(v = [ 0, 0, .1 ]) union()
                {
                    rotate(a = 90, v = [ 1, 0, 0 ]) translate(v = [ 0, 0, 5 ]) cylinder(h = 15, r = 3, center = true);
                    rotate(a = 90, v = [ 1, 0, 0 ]) translate(v = [ 0, 0, 5 ]) cylinder(h = 30, r = 1.2, center = true);
                }
            }
            translate(v = [ 0, 0, -9 ]) difference()
            {
                cube(size = [ 9, 8, 9 ], center = true);
                rotate(a = 45, v = [ 1, 0, 0 ]) translate(v = [ 0, 0, -3 ])
                    cube(size = [ 20, 20, 11 ], center = true);
            }
        }
        translate(v = [0, 0, 10]) 
        cylinder(h = 12, r = 1.7, center = true);
    }
}

module helix_mover()
{
    color("lightblue") base();
    translate(v = [ 0, 0, 7 ]) capot();
    for (i = [0:(360 / 5):360])
    {
        rotate(i) translate(v = [ 0, -20.36, 5 ]) rotate(a = 90, v = [ 1, 0, 0 ]) rotate(a = 180, v = [ 0, 0, 1 ])
            color("PaleGreen") pin();
    }
}

difference()
{
    helix_mover();
    translate(v = [ -200, 0, 0 ]) cube(size = [ 400, 400, 400 ], center = true);
}