



module triangular_hole()
{
    linear_extrude(height = 40) polygon(points = [ [ 0, 0 ], [ 20, 7 ], [ 20, -7 ] ]);
}

module motor_magnet_link()
{

    difference()
    {
        union()
        {
            linear_extrude(height = 4) minkowski()
            {
                square(size = 30, center = true);
                circle(r = 2);
            }
            linear_extrude(height = 29) minkowski()
            {
                square(size = 25, center = true);
                circle(r = 2);
            }
        }

        for (i = [0:90:360])
        {
            rotate(i + 45) translate(v = [ 0, 20, 4.001 ]) cylinder(h = 21, r = 6);
            rotate(i + 45) translate(v = [ 0, 17, 20 ]) cylinder(h = 21, r = 1.2);
        }
        screw_offset = 25.5 / 2;

        translate(v = [ screw_offset, screw_offset, 0 ]) cylinder(h = 10, r = 2, center=true);
        translate(v = [ -screw_offset, screw_offset, 0 ]) cylinder(h = 10, r = 2, center=true);
        translate(v = [ screw_offset, -screw_offset, 0 ]) cylinder(h = 10, r = 2, center=true);
        translate(v = [ -screw_offset, -screw_offset, 0 ]) cylinder(h = 10, r = 2, center=true);

        cylinder(h = 100, r = 11, center = true);

        translate(v = [ -20, 0, 25 ]) rotate(a = 90, v = [ 0, 1, 0 ]) triangular_hole();
        rotate(a = 90, v = [ 0, 0, 1 ]) translate(v = [ -20, 0, 25 ]) rotate(a = 90, v = [ 0, 1, 0 ]) triangular_hole();

    }
}

motor_magnet_link();