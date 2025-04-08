
module blade()
{
    difference()
    {
        minkowski()
        {
            difference()
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

        translate(v = [ 0, -7, 0 ]) rotate([ 0, 0, 90 ]) cylinder(h = 20, r = 1.2, center = true);
        translate(v = [ 0, -22, 0 ]) rotate([ 0, 0, 90 ]) cylinder(h = 20, r = 1.2, center = true);
    }
}

blade();