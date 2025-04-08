$fs = 1;
$fa = .5;
$fn = 70;

shaft_radius = 3.5;
holder_radius = 4.5;
bearing_outer_radius = 11;
out_radius = 20;

npales = 5;
rangle = 360 / npales;

module shaft()
{
    color("Silver") cylinder(100, shaft_radius, shaft_radius, true);
}

module ball_bearing()
{
    union()
    {
        rotate_extrude()
        {
            difference()
            {
                union()
                {
                    translate(v = [ holder_radius + 1, 0, 0 ]) square(size = [ 2, 7 ], center = true);
                    translate(v = [ bearing_outer_radius - 1, 0, 0 ]) square(size = [ 2, 7 ], center = true);
                }
                translate(v = [ (holder_radius + bearing_outer_radius) / 2, 0, 0 ]) circle(3);
            }
        }

        for (i = [0:(360 / 7):360])
        {
            rotate(i)
            {
                translate(v = [ (shaft_radius + bearing_outer_radius) / 2, 0, 0 ]) sphere(r = 2.9);
            }
        }
    }
}

module arm_holder1()
{
    union()
    {
        difference()
        {
            union()
            {
                difference()
                {
                    translate([ 3, 0, -3 ]) cube(size = 6, center = true);
                    rotate(a = 90, v = [ 1, 0, 0 ]) cylinder(h = 7, r = 3, center = true);
                    translate([ 6, 0, 0 ]) rotate(a = 90, v = [ 1, 0, 0 ]) cylinder(h = 7, r = 3, center = true);
                }

                rotate(a = 90, v = [ 1, 0, 0 ])
                {
                    difference()
                    {
                        cylinder(h = 6, r = 3, center = true);
                        cylinder(h = 2, r = 4, center = true);
                    }
                }
            }

            rotate(a = 90, v = [ 1, 0, 0 ]) cylinder(h = 7, r = 1, center = true);
        }
    }
}
module arm_holder2()
{
    union()
    {
        difference()
        {
            union()
            {
                difference()
                {
                    translate([ 3, 0, -3 ]) cube(size = 6, center = true);
                    rotate(a = 90, v = [ 1, 0, 0 ]) cylinder(h = 7, r = 3, center = true);
                    translate([ 6, 0, 0 ]) rotate(a = 90, v = [ 1, 0, 0 ]) cylinder(h = 7, r = 3, center = true);
                }

                rotate(a = 90, v = [ 1, 0, 0 ])
                {
                    cylinder(h = 2, r = 3, center = true);
                }
            }

            rotate(a = 90, v = [ 1, 0, 0 ]) cylinder(h = 7, r = 1, center = true);
        }
    }
}
module outer_thing()
{
    union()
    {
        difference()
        {
            color("blue") cylinder(10, out_radius, out_radius, true);
            cylinder(40, bearing_outer_radius, bearing_outer_radius, true);
        }
        for (i = [0:rangle:360])
        {
            rotate(i + 270 + rangle / 2)
            {
                color("cyan") translate([ -19, 0, 8 ]) arm_holder1();
            }
        }
    }
}

module pale()
{
    translate(v = [ 0, 11, 0 ]) union()
    {

        difference()
        {
            translate(v = [ 0, 30, 0 ]) rotate(90, [ 1, 0, 0 ]) cylinder(50, 3, 3, true);
            translate(v = [ 0, 50, 0 ]) cube(size = [ 10, 30, 1.5 ], center = true);
        }
        color("pink") minkowski()
        {
            translate([ 0, 66, 0 ]) difference()
            {

                cube(size = [ 30, 60, 1.5 ], center = true);
                translate(v = [ 210, 0, -3 ]) cylinder(h = 6, r = 200);
                translate(v = [ -25, 0, 0 ]) scale([ 1, 1, 2 ]) difference()
                {
                    cube(size = [ 30, 60, 1.5 ], center = true);
                    translate(v = [ 210, 0, -3 ]) cylinder(h = 6, r = 200);
                }
                translate(v = [ 0, -125, -3 ]) cylinder(h = 6, r = 100);
                translate(v = [ 0, 55, 0 ]) scale([ 1, 1, 2 ]) difference()
                {
                    cube(size = [ 30, 60, 1.5 ], center = true);
                    translate(v = [ 0, -125, -3 ]) cylinder(h = 6, r = 100);
                }
            }
            translate(v = [ 0, 0, -.1 ]) cylinder(h = 0.2, r = 5);
        }
    }
}

module arm()
{
    union()
    {
        cube(size = [ 20, 6, 5 ], center = true);
        translate(v = [ -10, 0, 5.5 ]) arm_holder1();
        translate(v = [ 10, 0, 5.5 ]) rotate([ 0, 0, 180 ]) arm_holder2();
    }
}

pos = (sin($t * 360)) * 10;

module head()
{
    translate(v = [ 0, 0, -8 ]) cylinder(h = 16, r = 15);

    *translate(v = [ 0, 0, -10 ]) union() {
        difference()
        {
            sphere(50);
            translate(v = [ 0, 0, -30 ]) cube(100, center = true);
            sphere(r = 48);
        }
        translate(v = [ 0, 0, 5 ])difference()
        {
            cylinder(h = 30, r = 46, center=true);
            cylinder(h = 40, r = 44, center=true);
        }
}

for (i = [0:rangle:360])
{
    rotate(i)
    {
        rotate([ 0, -pos * 2, 0 ]) pale();
    }
}

for (i = [0:rangle:360])
{
    rotate(i + 270 + rangle / 2)
    {
        translate([ -14, 0, -11 ]) rotate(a = 180, v = [ 1, 0, 0 ]) union()
        {
            color("magenta") arm_holder2();
            rotate([ 0, -15, 180 ]) translate(v = [ 15, 0, -5.5 ]) arm();
            translate(v = [ 0, 0, 15 ]) rotate([ 180, 0, 0 ]) rotate([ 0, -15, 180 ]) translate(v = [ 15, 0, -5.5 ])
                arm();
        }
    }
}
}


module coil()
{
    translate(v = [0, 0, -19.5-29]) difference()    
    {
        cylinder(h = 40, r = (20*2.54/2));
        scale(v = 1.05)  translate(v = [0, 0, 42]) holder();
        translate([0, 0, 20]) cylinder(h = 30, r = 7.5);
        translate([0, 0, -4]) cylinder(h = 35, r = (20*2.54/2)-1);
    }

}

module holder()
{
    union() 
    {
        difference() 
        {
            translate(v = [0, 0, -10]) cylinder(10, 7.5, 7.5, true);
            translate(v = [0, 0, -10]) cylinder(11, 5.5, 5.5, true);

        }

        difference() 
        {
            translate(v = [0, 0, -8]) cylinder(r=10, h=5, $fn=6);
            cylinder(32, shaft_radius, shaft_radius, true);
            translate(v = [0, 0, -10]) cylinder(11, 5.5, 5.5, true);

        }

        difference() {
            cylinder(30, holder_radius, holder_radius, true);
            cylinder(32, shaft_radius, shaft_radius, true);
            translate(v = [0, 0, -10]) cylinder(11, 5.5, 5.5, true);
            
        }
    }

}

module main()
{
    rotate($t * 360, [ 0, 0, 1 ])
    {
        shaft();
        translate(v = [ 0, 0, 40 ]) head();
    }

    translate(v = [ 0, 0, pos ])
    {

        translate(v = [ 0, 0, -5 ])color("SandyBrown") holder();
        rotate($t * 360, [ 0, 0, 1 ]) outer_thing();
        rotate($t * 360, [ 0, 0, 1 ]) color("AliceBlue") ball_bearing();
        coil();
    }
}

rotate(a = 90, v = [ 1, 0, 0 ])
{
    main();
}