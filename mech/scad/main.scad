$fs = 1;
$fa = .5;
$fn = 20;

use <arm_movement.scad>
use <arm_pins.scad>
use <ball_bearing.scad>
use <blade.scad>
use <blade_holder.scad>
use <blade_holder_holder.scad>
use <blade_mover.scad>
use <center_holder.scad>
use <core.scad>
use <helix_mover.scad>
use <link.scad>
use <outer_holder.scad>

use <coil.scad>
use <magnets_holder.scad>
use <magnets_holder_holder.scad>

use <motor.scad>
use <shafts_linker.scad>

use <motor_magnet_link.scad>

module blades(command)
{
    for (i = [0 + 360 / 10:(360 / 5):360])
    {
        rotate(i)
        {
            translate(v = [ 0, -75, 0 ])        //
                rotate(a = 90, v = [ 0, 0, 0 ]) //
                rotate(a = -5 * command, v = [ 0, 1, 0 ]) blade();
        }
    }
}

module blade_holders(command)
{
    for (i = [0 + 360 / 10:(360 / 5):360])
    {
        rotate(i)
        {
            rotate(a = 90, v = [ 1, 0, 0 ]) //

                translate(v = [ 0, 0, 17.5 ]) //

                color("Aquamarine")                        //
                rotate(a = 2.5 * command, v = [ 0, 0, 1 ]) //
                blade_holder(70, 2.3);

            color("Plum")                                  //
                translate(v = [ 0, -33, 0 ])               //
                rotate(a = 90, v = [ 1, 0, 0 ])            //
                rotate(a = 2.5 * command, v = [ 0, 0, 1 ]) //
                blade_mover();
        }
    }
}

module blade_holder_holders()
{
    for (i = [0:(360 / 5):360])
    {
        rotate(i)
        {
            translate(v = [ 0, 9, 0 ])          //
                rotate(a = 90, v = [ 0, 0, 1 ]) //
                blade_holder_holder();
        }
    }
}

module center_arm_pins()
{
    for (i = [0 + 360 / 10:(360 / 5):360])
    {
        rotate(i)
        {
            union()
            {
                rotate(a = 90, v = [ 1, 0, 0 ]) translate(v = [ 0, 13.25, 16.5 ]) arm_pin(3.5, 2.7, 3.7);

                rotate(a = 90, v = [ 1, 0, 0 ]) translate(v = [ 0, 13.25, 18.5 ]) rotate(a = 180, v = [ 0, 1, 0 ])
                    arm_pin(3.5, 2.7, 3.7);
            }
        }
    }
}

module two_arm_pins()
{
    translate(v = [ 0, 0, -1.5 ]) arm_pin(5, 2.7, 3.7);
    translate(v = [ 0, 0, 1.5 ]) rotate(a = 180, v = [ 0, 1, 0 ]) arm_pin(5, 2.7, 3.7);
}

module center_link_arm_pins()
{
    for (i = [0 + 360 / 10:(360 / 5):360])
    {
        rotate(i)
        {
            union()
            {
                translate(v = [ .5, 19.5, 21.25 ]) rotate(a = 90, v = [ 0, 1, 0 ]) two_arm_pins();
            }
        }
    }
}

module link_link_arm_pins(angle1)
{
    for (i = [0 + 360 / 10:(360 / 5):360])
    {
        rotate(i)
        {
            union()
            {
                // translate(v = [-3, 19.5, 2])
                rotate(a = angle1, v = [ 1, 0, 0 ])
                    // rotate(a = 90, v = [0, 1, 0])
                    // translate(v = [0, 10, 0])
                    // rotate(a = 180, v = [0, 0, 1])
                    translate(v = [ 0, 40, 30 ]) rotate(a = 90, v = [ 0, 1, 0 ]) two_arm_pins();
            }
        }
    }
}

module links(angle1)
{
    for (i = [0 + 360 / 10:(360 / 5):360])
    {
        rotate(i)
        {
            translate(v = [ -3, 19.5, 2 ]) rotate(a = angle1, v = [ 1, 0, 0 ]) rotate(a = 90, v = [ 0, 1, 0 ])
                translate(v = [ 0, 10, 0 ]) rotate(a = 180, v = [ 0, 0, 1 ]) link(20, 2.8, 3, 3);
        }
    }
}

module five_moving_arms(distance)
{
    for (i = [360 / 10:(360 / 5):360])
    {
        rotate(i)
        {
            translate(v = [ 0, -20, -22 ]) rotate(a = 90, v = [ 1, 0, 0 ]) mirror(v = [ 1, 0, 0 ])
                moving_arm((-distance) + 28, 5, 20, 20);
        }
    }
}

module main(rotation, command)
{
    union()
    {
        // Only rotating
        rotate(a = rotation, v = [ 0, 0, 1 ])
        {
            union()
            {
                color("pink") rotate(a = 180, v = [ 1, 0, 0 ]) center_holder();

                color("LemonChiffon") rotate(a = 180, v = [ 1, 0, 0 ]) translate(v = [ 0, 0, 8 ])
                    blade_holder_holders();

                // color("Coral") rotate(a = 180, v = [ 1, 0, 0 ]) translate(v = [ 0, 0, .75 ]) center_arm_pins();

                // color("Coral") rotate(a = 180, v = [ 1, 0, 0 ]) translate(v = [ 0, 0, .75 ]) center_link_arm_pins();
            }
        }

        // Blades rotating and pivoting
        rotate(a = rotation, v = [ 0, 0, 1 ]) union()
        {
            rotate(a = 180, v = [ 1, 0, 0 ]) //
                translate(v = [ 0, 0, 14 ])  //
                blade_holders(command);

            color("MistyRose") rotate(a = 180, v = [ 1, 0, 0 ]) translate(v = [ 0, 0, 14 ]) blades(command);
        }

        translate(v = [ 0, 0, command ]) rotate(a = rotation, v = [ 0, 0, 1 ]) union()
        {
            translate(v = [ 0, 0, -60 ]) helix_mover();
        }

        // Link 1
        translate(v = [ 0, 0, command ]) translate(v = [ 0, 0, -65 ]) core(rotation);

        // Link 2
        // rotate(a = rotation, v = [ 0, 0, 1 ]) color("green") rotate(a = 180, v = [ 1, 0, 0 ])
        //     translate(v = [ 0, 0, 20 ]) links(static_arm_angle(4, 5 + command / 2));
        rotate(a = rotation, v = [ 0, 0, 1 ]) five_moving_arms(command);

        // Link 3
        color("LightSteelBlue") translate(v = [ 0, 0, -104 ]) rotate(180) magnets_holder_holder();
        color("YellowGreen") translate(v = [ 0, 0, -134 ]) rotate(180) motor_magnet_link();

        translate(v = [ 0, 0, -87 ]) for (i = [0:120:360])
        {
            color("SeaGreen") rotate(i+60-24) translate(v = [ 0, -40, 4  + command ]) coil();
            color("PapayaWhip") rotate(i+60-24) translate(v = [ 0, -40, -4 ]) magnets_holder();
        }

        translate(v = [0, 0, -155]) rotate(a = -90, v = [0, 1, 0])  motor(); 
        color("Orchid") translate(v = [0, 0, -110]) rotate(rotation) shaft_linkers();
    }
}

difference()
{
    user_command_offset = 0;
    user_angle_offset = 360 / 10;
    rotate(a = 90, v = [ 1, 0, 0 ]) main($t * 360 + user_angle_offset, 5 * sin(2 * 360 * $t) + user_command_offset);
    // main(360 / 10, 5 * sin(8 * 360 * $t));
    //translate(v = [-200, 0, 0]) cube(size = 400, center=true);
}