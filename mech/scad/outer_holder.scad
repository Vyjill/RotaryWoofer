$fn=80;

use <copper_holder.scad>

module outer_holder()
{
    difference() {
        union()
        {
            translate(v=[0, 0, 8]) cylinder(h = 20, r = 7.3, center=true);
            translate(v = [0, 0, -5.5]) cylinder(h = 9, r = 13, center=true);
            translate(v = [0, 0, 0]) cylinder(h = 3, r = 11, center=true);
            translate(v = [0, 0, -10]) cylinder(h = 4, r = 18, center=true);
        }
        scale(v = [1.05, 1.05, 1.1]) full_copper_holder();
    }
}


module third_outer_holder()
{
    difference()  
    {
        union() {
            outer_holder();
            translate(v = [0, 0, 14]) 
            cylinder(h = 15, r = 7.3);
        }
        cylinder(h = 50, r = 4.2);
        translate(v = [-39.85, 0, 0]) cube(80, center=true);
        rotate(a = 60, v = [0, 0, 1]) translate(v = [-39.85, 0, 0]) cube(80, center=true);
        
        union() {
            translate(v = [15.5*cos(45), 15.5*sin(45), -10]) 
            cylinder(h = 10, r = 1.2, center=true);

            translate(v = [15.5*cos(45), 15.5*sin(45), -12]) 
            cylinder(h = 5, r = 2, center=true);

            translate(v = [15.5*cos(15), 15.5*sin(15), -10]) 
            cylinder(h = 10, r = 1.2, center=true);

            translate(v = [15.5*cos(15), 15.5*sin(15), -12]) 
            cylinder(h = 5, r = 2, center=true);
        }

        rotate(30)
        translate(v = [7, 0, 20]) 
        cube([3, 17, 5], center=true);
    }
}

module indent()
{
    difference() 
    {
        translate(v = [-6.75, 0, 12]) cube([1, 7, 4], center=true);
        difference() 
        {
            translate(v = [-10, 0, 10]) cube(20, center=true);
            translate(v = [0, 0, 10]) cylinder(r=7.2, h=25, center=true);
        }

    }
}

module serrach()
{
    union() {
        difference() 
        {
            cylinder(h = 2.5, r = 9);
            cylinder(h = 10, r = 7.3, center=true);
            translate(v = [9.5, 0, 0]) cube(size = 20, center=true);
        }
        translate(v = [-7.25, 0, 1.25]) cube([1.5, 8, 2.5], center=true);
        
        translate(v = [-1.25, -10, 1.25]) difference() 
        {
            cube([1.5, 5.5, 4], center=true);
            translate(v = [0, -0.8, 0]) rotate([0, 90, 0]) cylinder(h = 3, r = 1.1, center=true);
        }
        translate(v = [-1.25, 10, 1.25]) difference() 
        {
            cube([1.5, 5.5, 4], center=true);
            translate(v = [0, 0.8, 0]) rotate([0, 90, 0]) cylinder(h = 3, r = 1.1, center=true);
        }
    }
}

third_outer_holder();