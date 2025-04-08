$fn=80;

use <outer_holder.scad>

module screw_hole()
{
    cylinder(h = 4, r = 2);
    translate(v = [ 0, 0, 3 ]) cylinder(h = 5, r = 1);
}

module coil_holder()
{
    difference()
    {
        for (i = [0 + 360 / 10:(360 / 3):360])
        {
            rotate(i)
            {
                difference()
                {

                    union()
                    {
                        linear_extrude(height = 4, convexity = 2)
                        {
                            difference()
                            {
                                difference()
                                {
                                    offset(r = -4)
                                    {
                                        offset(delta = 4)
                                        {
                                            union()
                                            {
                                                translate(v = [ 0, 40, 0 ])

                                                    circle(r = 21);

                                                circle(r = 18);

                                                hull()
                                                {
                                                    translate(v = [ 0, 30, 0 ]) square(size = [ 25, 1 ], center = true);
                                                    translate(v = [ 0, 10, 0 ]) square(size = [ 35, 1 ], center = true);
                                                }
                                            }
                                        }
                                    }

                                    circle(r = 13.5);
                                }

                                // rotate(a = 30) translate(v = [ 0, -24.5, 0 ]) square(size = 50, center = true);
                                // rotate(a = -30) translate(v = [ 0, -24.5, 0 ]) square(size = 50, center = true);
                            }
                        }
                    }

                    for (i = [0:120:360])
                    {
                        translate(v = [ 0, 40, 0 ]) rotate(i)
                        {
                            translate(v = [ 0, 18.5, 6 ]) rotate(a = 180, v = [ 0, 1, 0 ])
                                cylinder(h = 20, r = 1, center = true);
                        }
                    }
                }
            }
        }

        for (i = [0:120:360])
        {
            rotate(i+30) translate(v = [ 15.5 * cos(46), 15.5 * sin(46), 6 ]) rotate(a = 180, v = [ 1, 0, 0 ])
                cylinder(h = 20, r = 1, center = true);

            rotate(i+30) translate(v = [ 15.5 * cos(44 + 90), 15.5 * sin(44 + 90), 6 ]) rotate(a = 180, v = [ 1, 0, 0 ])
                cylinder(h = 20, r = 1, center = true);
        }
    }
}

coil_holder();