use <ball_bearing.scad>
use <coil_holder.scad>
use <copper_holder.scad>
use <outer_holder.scad>

module core(rotation)
{

    color("sandybrown") translate(v = [ 0, 0, -2 ]) copper_holder();

    // color("darkgrey") translate(v = [0, 0, 5]) ball_bearing(
    //     inner_radius=7.5,
    //     outer_radius=16,
    //     inner_opening=2.5,
    //     width=9,
    //     ball_size=2.9,
    //     tolerence=.3,
    //     _rotation=rotation
    //     );

    for (i = [0:(360 / 3):360])
    {
        rotate(i + 60) translate(v = [ 0, 0, -1.5 ]) third_outer_holder();
    }

    rotate(60) translate(v = [ 0, 0, -9 ]) color("NavajoWhite") coil_holder();

    // translate(v = [0, 0, 10.75]) serrach();
    // translate(v = [0, 0, 10.75]) rotate([0, 0, 180]) serrach();
}

difference()
{
    rotate(a = 90, v = [ 0, 1, 0 ]) core(0);
    translate(v = [ 0, -100, 0 ]) cube(size = 200, center = true);
}