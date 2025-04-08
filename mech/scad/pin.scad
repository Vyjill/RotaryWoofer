module topper(topper_radius, factor)
{
    difference() 
    {
        sphere(factor*topper_radius);
        translate(v = [0, 0, -2*topper_radius]) cube(4*topper_radius, center=true);
    }
}

module basepin(pin_height, pin_radius, factor)
{
    union() 
    {
        cylinder(h = pin_height, r = pin_radius, center=true);
        translate(v = [0, 0, pin_height/2]) topper(pin_radius, factor);
        rotate(a = 180, v = [0, 1, 0]) translate(v = [0, 0, pin_height/2]) topper(pin_radius, factor);
    }
}

module pin(pin_height, pin_radius, factor)
{
    difference() {
        basepin(pin_height, pin_radius, factor);
        translate(v = [0, 0, pin_radius*2]) cube([pin_radius/2, pin_radius*4, pin_height*factor], center=true);
        translate(v = [0, 0, pin_radius*2]) cube([pin_radius*4, pin_radius/2, pin_height*factor], center=true);
    }

}

pin(10, 4, 1.4);