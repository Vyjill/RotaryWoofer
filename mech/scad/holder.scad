module pin(outer_radius, inner_radius, width)
{
    difference()
    {
        cylinder(h = width, r = outer_radius, center = true);
        cylinder(h = width + 1, r = inner_radius, center = true);
    }
}


module holder()
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

                }
            }

            rotate(a = 90, v = [ 1, 0, 0 ]) cylinder(h = 7, r = 1, center = true);
        }
    }
}

pin(4, 2, 2);
// holder();