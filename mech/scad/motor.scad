module motor()
{

    difference()
    {
        color("#222") minkowski()
        {
            cube([ 50, 35, 35 ], center = true);
            sphere(r = 4);
        }
        color("#ddd") translate(v = [ -45, 0, 0 ]) cube(size = 50, center = true);
        color("#ddd") translate(v = [ 45, 0, 0 ]) cube(size = 50, center = true);
        screw_offset = 25.5/2;
        translate(v = [16, screw_offset, screw_offset]) rotate(90, [0, 1, 0]) cylinder(h = 10, r = 2);
        translate(v = [16, -screw_offset, screw_offset]) rotate(90, [0, 1, 0]) cylinder(h = 10, r = 2);
        translate(v = [16, screw_offset, -screw_offset]) rotate(90, [0, 1, 0]) cylinder(h = 10, r = 2);
        translate(v = [16, -screw_offset, -screw_offset]) rotate(90, [0, 1, 0]) cylinder(h = 10, r = 2);
    }
    color("#eee") translate(v = [ 0, 0, 0 ]) rotate(90, [0, 1, 0]) cylinder(h = 40, r = 2);
}

motor();