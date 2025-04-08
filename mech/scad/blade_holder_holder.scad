module blade_holder_holder_hull(tolerence)
{
    hull()
    {
        circle(r = 3+tolerence);
        translate(v = [15, 0, 0]) square(size = 12+tolerence, center=true);
    }
}

module blade_holder_holder()   
{
    difference() {
        linear_extrude(height = 12)
        { 
            blade_holder_holder_hull(0);

        }
        translate(v=[0, 0, 8]) cube(size = 12, center=true);
        translate(v = [8, 0, 6]) rotate(a = 90, v = [0, 1, 0]) cylinder(h = 20, r = 5.2);
        translate(v = [0, 0, 6]) rotate(a = 90, v = [0, 1, 0]) cylinder(h = 20, r = 3);

        translate(v = [0, 0, -15]) cylinder(h = 30, r = 1.2);

        translate(v = [0, 0, 6]) 
        difference() {
            translate(v = [12, 0, 10]) 
            cube(20, center=true);
            rotate(90,v =[0, 1, 0])
            cylinder(h = 30, r = 6.5);
        }
    }
}

blade_holder_holder();