use <coil_holder.scad>

module magnets_holder_holder()
{

    difference()
    {

        union()
        {

            union()
            {

                linear_extrude(height = 4)
                {
                    minkowski()
                    {
                        for(i=[0:120:360])
                        {
                            rotate(i+90) translate(v = [0, 9, 0])  square(size = [35, 20], center = true);
                        }
                        circle(r = 2);
                    }
                }
            }

            coil_holder();
        }
        screw_offset = 12;
        translate(v = [ screw_offset, screw_offset, 0 ]) cylinder(h = 20, r = 1.1, center = true);
        translate(v = [ screw_offset, -screw_offset, 0 ]) cylinder(h = 20, r = 1.1, center = true);
        translate(v = [ -screw_offset, screw_offset, 0 ]) cylinder(h = 20, r = 1.1, center = true);
        translate(v = [ -screw_offset, -screw_offset, 0 ]) cylinder(h = 20, r = 1.1, center = true);

        cylinder(h = 10, r = 10, center=true);
    }
}

magnets_holder_holder();