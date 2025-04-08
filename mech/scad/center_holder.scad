use <arm_holder.scad>
use <arm_pins.scad>
use <blade_holder.scad>
use <blade_holder_holder.scad>
use <shafts_linker.scad>

module center_holder()
{
    difference() 
    {
        union() {

            difference() {
                union() {
                    cylinder(h = 7, r1 = 15, r2=20);
                    translate(v = [0, 0, 7]) cylinder(h = 10, r=20);
                }
            }
            for (i = [0:(360 / 5):360])
            {
                rotate(i)
                {
                    translate(v = [-4, -19.5, 22]){
                        rotate([0, 90, 0]) arm_holder(5, 3, 3.5, .1);;
                    }
                }
            }
        }
        for (i = [0:(360 / 5):360])
        {
            rotate(i)
            {
                translate(v = [0, 9, 7.2])
                rotate(a = 90, v = [0, 0, 1]) 
                linear_extrude(height = 15) 
                {
                    blade_holder_holder_hull(.4);
                }
                translate(v = [0, 9, -1]) 
                cylinder(h = 30, r = 1.2);
                translate(v = [0, 9, 0]) cylinder(h = 2.5, r = 2.7, center=true, $fn=6);
            }
        }
        rotate(a = 180/10, v = [0, 0, 1]) translate(v = [0, 0, 5]) shaft();
        translate(v = [0, 0, 12]) rotate(a = 180/10, v = [0, 0, 1]) rotate(a = 90, v = [0, 1, 0]) cylinder(h = 20, r = 1);
    }
}

difference() 
{
    center_holder();
    //translate(v = [-100, 0, 0]) cube(size = [200, 200, 200], center=true);
}

