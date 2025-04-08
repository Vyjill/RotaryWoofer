use <arm_pins.scad>
use <arm_holder.scad>

module link(lenght, external_radius, internal_radius, width)
{
    linear_extrude(height = width)
    {
        difference() {
            offset(r=-2) {
                offset(delta=2) {
                    union() {
                        translate(v = [0, -lenght/2, 0]) circle(r = external_radius+2);
                        translate(v = [0, lenght/2, 0])circle(r = external_radius+2);
                        square(size = [external_radius*1.5, lenght], center=true);
                    }
                    circle(r = 2);
                }
            }
            union() {
                translate(v = [0, -lenght/2, 0]) circle(r = internal_radius);
                translate(v = [0, lenght/2, 0]) circle(r = internal_radius);
            }
        }
    } 
}

rotate(a = 90, v = [1, 0, 0]) union() 
{
    !link(20, 2.8, 3, 3)
    link(20, 2.8, 3, 3);
    translate(v = [0, -20, 2]) arm_pin(5, 2.7);
    translate(v = [0, -20, 7]) rotate(a = 180, v = [1, 0, 0])  rotate(a = 90, v = [0,0,1]) arm_holder(5, 3, 3.5, .1);
}
