module cycy()
{
    difference()
    {
        cylinder(h = 40, r = 8, center = true);
        translate(v = [ 0, 0, -19.95 ]) cylinder(h = 40, r = 2.8, center = true);
    }
}
module shaft()
{
    difference()
    {
        cylinder(h = 50, r = 3.75);
        translate(v = [ 2.6, -10, -0.1 ]) cube(size = 16);
    }
}
module shaft_linkers()
{
    difference()
    {
        cycy();
        shaft();
        translate(v = [ 0, 0, 7 ]) rotate(a = 90, v = [ 0, 1, 0 ]) cylinder(h = 60, r = 1, center = true);
        translate(v = [ 0, 0, -7 ]) rotate(a = 90, v = [ 0, 1, 0 ]) cylinder(h = 60, r = 1, center = true);
    }
}

shaft_linkers();