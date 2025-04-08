INNER_RADIUS = 3.5;
EXTER_RADIUS = 5.5;

module full_copper_holder()
{
    union() 
    {
        translate(v = [0, 0, -11.5]) cylinder(r=9, h=8, center=true);
        translate(v = [0, 0, -8]) cylinder(r=10, h=5, $fn=6);
        translate(v = [0, 0, 5]) cylinder(21, EXTER_RADIUS, EXTER_RADIUS, true);
    }
}

module copper_holder()
{

    difference() {
        full_copper_holder();
        translate(v = [0, 0, -11]) cylinder(11, 5.5, 5.5, true);
        cylinder(40, INNER_RADIUS, INNER_RADIUS, center=true);
    }

}

// color("sandybrown") full_copper_holder();