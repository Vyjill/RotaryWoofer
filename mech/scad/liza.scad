



module cycy()
{
    difference()
    {
        cylinder(h = 26, r = 10, center = true);
        cylinder(h = 35, r = 2.85, center = true);
    }
}
module arbreeeeee()
{
    difference()
    {
        cylinder(h = 50, r = 3.82);

        translate(v = [ 2.7, -10, -0.1 ]) cube(size = 16);
    }
}
difference()
{
    cycy();
    arbreeeeee();
}