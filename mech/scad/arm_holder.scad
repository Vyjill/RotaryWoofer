
module arm_holder(external_radius, internal_radius, width, tolerence)
{
    union()
    {
        scale(v = [1, 1, 2]) union() {
            difference() {
                cube(size = [external_radius, external_radius, width]);
                translate(v = [0, 0, width/2]) cylinder(h = width*2, r = external_radius, center = true);
            }
            translate(v = [0, external_radius*2, 0]) mirror(v = [0, 1, 0])  difference() {
                cube(size = [external_radius, external_radius, width]);
                translate(v = [0, 0, width/2]) cylinder(h = width*2, r = external_radius, center = true);
            }
        }

        difference()
        {
            translate(v = [0, 0, width/2]) cylinder(h = width, r = external_radius, center = true);
            cylinder(h = 13, r = internal_radius, center = true);
        }
    }
}


rotate(a = 90, v = [0, 1, 0]) arm_holder(5, 3, 4, .1);