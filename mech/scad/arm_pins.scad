use <arm_holder.scad>

module arm_pin(height, radius, hat_radius)
{
    difference()
    {
        union()
        {
            cylinder(h = height, r = radius, center = true);
            translate(v = [ 0, 0, -height / 2 - 1 ]) cylinder(h = 2, r = hat_radius, center = true);
        }
        cylinder(h = 20, r = 1.4, center = true);
        translate(v = [ -2, -2, 2 ]) cube(size = 4.2, center = true);
        translate(v = [ 2, 2, 2 ]) cube(size = 4.2, center = true);
    }
}

arm_pin(3.5, 2.7, 3.7);