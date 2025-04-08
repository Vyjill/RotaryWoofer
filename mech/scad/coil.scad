use <magnets_holder.scad>

module coil()
{
    difference() {
        cylinder(h = 16, r = 21,center=true);
        cylinder(h = 20, r = 15,center=true);
        difference() {
            cylinder(h = 12, r = 24,center=true);
            translate(v = [0, 0, -2]) cylinder(h = 16, r = 34/2,center=true);
        }
        for(i = [0:120:360])
        {
            rotate(i, v = [0, 0, 1]) translate(v = [19, 0, 10]) cylinder(h = 10, r = 1.1, center=true);
        }
    }
}

coil();

translate(v = [0, 0, -3]) magnets_holder();