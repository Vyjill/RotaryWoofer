module screw_hole()
{
    translate(v = [ 0, 0, -2 ]) cylinder(h = 5, r = 1.2, center = true);
    translate(v = [ 0, 0, 2 ]) cylinder(h = 5, r = 2.2, center = true);
}

module blade_mover_bottom()
{
    difference()
    {
        union()
        {
            cylinder(h = 5, r = 8, center = true);
            translate(v = [ -16, 0, 0 ]) //
                cube(size = [ 20, 8, 5 ], center = true);
        }
        cylinder(h = 6, r = 5.2, center = true);

        translate(v = [ 3, 0, 0 ])          //
            rotate(a = 90, v = [ 0, 1, 0 ]) //
            cylinder(h = 5, r = 1.2);


        translate(v = [ -23.5, 0, 0 ]) //
            mirror([ 0, 0, 1 ])        //
            screw_hole();

        translate(v = [ -8.5, 0, 0 ]) //
            mirror([ 0, 0, 1 ])       //
            screw_hole();

        translate(v = [ -14, 0, 0 ]) //
            cylinder(h = 8, r = 1.7, center=true);
        translate(v = [ -18, 0, 0 ]) //
            cylinder(h = 8, r = 1.7, center=true);
    }
}

module blade_mover_cover()
{

    difference()
    {
        translate(v = [ -15, 0, -1 ]) //
            union()
        {
            cube(size = [ 20, 8, 2 ], center = true);

            translate(v = [ -7.5, 0, 2 ]) //
                cube(size = [ 5, 8, 3 ], center = true);

            translate(v = [ 7.5, 0, 2 ]) //
                cube(size = [ 5, 8, 3 ], center = true);
        }

        translate(v = [ -22.5, 0, 0 ]) //
            mirror([ 0, 0, 1 ])        //
            screw_hole();

        translate(v = [ -7.5, 0, 0 ]) //
            mirror([ 0, 0, 1 ])       //
            screw_hole();

    }
}

module blade_mover()
{
    blade_mover_bottom();
    translate(v = [ -1, 0, 5.2 ]) //
        mirror(v = [ 0, 0, 1 ])  //
        blade_mover_cover();
}

blade_mover();