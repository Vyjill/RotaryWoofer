module ballz(inner_radius, outer_radius, width, ball_size, nballz)
{
        for (i = [0:(360 / nballz):360])
        {
            rotate(i)
            {
                translate(v = [ (inner_radius + outer_radius) / 2, 0, -3.5 ]) cylinder(h = ball_size/2, r=ball_size/2.5, center=true);
                translate(v = [ (inner_radius + outer_radius) / 2, 0, 1.45 ]) cylinder(h = ball_size, r1 = ball_size, r2=ball_size/2.5, center=true);
                translate(v = [ (inner_radius + outer_radius) / 2, 0, -1.45 ]) cylinder(h = ball_size, r1 = ball_size/2.5, r2=ball_size, center=true);
                translate(v = [ (inner_radius + outer_radius) / 2, 0, 3.5 ]) cylinder(h = ball_size/2, r=ball_size/2.5, center=true);
            }
        }
}

module ball_bearing(inner_radius, outer_radius, inner_opening, width, ball_size, tolerence)
{
    union()
    {
        rotate_extrude()
        {
            difference()
            {
                union()
                {
                    translate(v = [ inner_radius + inner_opening/2, 0, 0 ]) square(size = [ inner_opening, width ], center = true);
                    translate(v = [ outer_radius - inner_opening/2, 0, 0 ]) square(size = [ inner_opening, width ], center = true);
                }
                translate(v = [ (inner_radius + outer_radius) / 2, 1, 0 ])  rotate(45) square(size = sqrt(2)*(ball_size + tolerence), center=true);
                translate(v = [ (inner_radius + outer_radius) / 2, -1, 0 ])  rotate(45) square(size = sqrt(2)*(ball_size + tolerence), center=true);
                translate(v = [ (inner_radius + outer_radius) / 2-2.25, 0, 0 ])  square(size = (ball_size / 1.5), center=true);
                translate(v = [ (inner_radius + outer_radius) / 2+2.25, 0, 0 ])  square(size = (ball_size / 1.5), center=true);

            }
        }
        ballz(inner_radius, outer_radius, inner_opening, ball_size, 12);
    }
}

// difference() {
// ball_bearing(
//     inner_radius=7.5,
//     outer_radius=15.5,
//     inner_opening=2.5,
//     width=8.5,
//     ball_size=2.9,
//     tolerence=.3
//     );
//     translate([0, 20, 0]) cube(size = 40, center=true);
// }
ball_bearing(
    inner_radius=7.5,
    outer_radius=15.5,
    inner_opening=2.5,
    width=8.5,
    ball_size=2.9,
    tolerence=.3
    );
