module magnets_holder()
{
    difference() {
        cylinder(h = 16, r = 21,center=true);
        translate(v = [0, 0, -2]) cylinder(h = 16, r = 12.5,center=true);
        translate(v = [0, 0, 2]) difference() {
            cylinder(h = 16, r = 22,center=true);
            translate(v = [0, 0, -2]) cylinder(h = 16, r = 29/2,center=true);
        }
        for(i = [0:120:360])
        {
            rotate(i, v = [0, 0, 1]) translate(v = [19, 0, 0]) cylinder(h = 20, r = 1.1, center=true);
        }
    }
}

magnets_holder();