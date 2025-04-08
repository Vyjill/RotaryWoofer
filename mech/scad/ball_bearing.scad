module ballz(inner_radius, outer_radius, width, ball_size, nballz, _rotation)
{
    rotate(a = _rotation, v = [0, 0, 1])
    {
        for (i = [0:(360 / nballz):360])
        {
            rotate(i)
            {
                translate(v = [ (inner_radius + outer_radius) / 2, 0, 0 ])
                rotate(a = _rotation, v = [0, 0, 1])
                sphere(r = ball_size);
            }
        }
    } 
}

module ball_bearing(inner_radius, outer_radius, inner_opening, width, ball_size, tolerence, _rotation)
{
    union()
    {
        rotate_extrude()
        {
            difference()
            {

                translate(v = [ inner_radius + inner_opening/2, 0, 0 ]) square(size = [ inner_opening, width ], center = true);
                translate(v = [ (inner_radius + outer_radius) / 2, 0, 0 ]) circle(ball_size + tolerence);
            }
        }
        rotate(a = _rotation, v = [0, 0, 1]) 
        rotate_extrude()
        {
            difference()
            {
                translate(v = [ outer_radius - inner_opening/2, 0, 0 ]) square(size = [ inner_opening, width ], center = true);
                translate(v = [ (inner_radius + outer_radius) / 2, 0, 0 ]) circle(ball_size + tolerence);
            }
        }

        ballz(inner_radius, outer_radius, inner_opening, ball_size, 12, _rotation/2);
    }
}

// difference() {
// ball_bearing(
//     inner_radius=7.5,
//     outer_radius=16,
//     inner_opening=2.5,
//     width=5.8,
//     ball_size=2.9,
//     tolerence=.3
//     );
//     translate([0, 20, 0]) cube(size = 40, center=true);
// }

ball_bearing(
    inner_radius=7.5,
    outer_radius=16,
    inner_opening=2.5,
    width=9,
    ball_size=2.9,
    tolerence=.3
    );

