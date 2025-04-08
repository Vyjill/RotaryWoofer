use <arm_pins.scad>
use <link.scad>

// Atrocity found with wolframalpha
// solve for threta: l=(m*cos(θ) + n*cos(arcsin((m*sin(θ)+a)/n)))
// clang-format off

function _elie_angle(m, n, a, l) = (
    acos((-a*a+l*l+m*m+n*n)/(2*sqrt(a*a+l*l)*m)) + tan(a/l)
);

// function _elie_angle(m, n, a, l) = (
//     acos((m*m-a*a-l*l-n*n)/(2*sqrt(a*a+l*l)*m)) + tan(a/l)
// );

function _static_arm_angle(m, n, a, l) = (
    acos(
        (
            1/(
                2*(a*a*m*m + l*l*m*m)
            )
            *
            (
                a*a*l*m
                - sqrt(
                    pow(a, 6)*(-(m*m))
                    - 2*pow(a, 4)*l*l*m*m
                    + 2*pow(a, 4)*pow(m, 4)
                    + 2*pow(a, 4)*m*m*n*n
                    - a*a*pow(l, 4)*m*m
                    + 2*a*a*l*l*pow(m, 4)
                    + 2*a*a*l*l*m*m*n*n
                    - a*a*pow(m, 6)
                    + 2*a*a*pow(m, 4)*n*n
                    - a*a*m*m*pow(n, 4)
                )
                + pow(l, 3)*m
                + l*pow(m, 3)
                - l*m*n*n
            )
        )
    )
);
function static_arm_angle(arm1_length, arm2_length, arm_2_offset, distance) = (
    _static_arm_angle(arm1_length, n = arm2_length, a = arm_2_offset, l = distance)
);

function complementary_angle(arm1_length, arm2_length, arm_2_offset, angle1) = (
    asin(
        (
            arm1_length * sin(angle1) - arm_2_offset
        )
        /
        arm2_length
    )
);
// clang-format on

module two_arm_pins()
{
    translate(v = [ 0, 0, -1.5 ]) arm_pin(5, 2.7, 3.7);
    translate(v = [ 0, 0, 1.5 ]) rotate(a = 180, v = [ 0, 1, 0 ]) arm_pin(5, 2.7, 3.7);
}

module moving_arm(distance, _offset, arm_l_1, arm_l_2)
{

    angle1 = static_arm_angle(arm_l_1, arm_l_2, _offset, distance);
    // angle1 = _elie_angle(arm_l_1, arm_l_2, _offset, distance);

    angle2 = complementary_angle(arm_l_1, arm_l_2, _offset, angle1);

    color("Coral") rotate(a = 90, v = [ 0, 1, 0 ]) //
        translate(v = [ -_offset, -distance, 0 ])  //
        two_arm_pins();
    color("Coral") rotate(a = 90, v = [ 0, 1, 0 ]) //
        two_arm_pins();
    color("Coral") rotate(a = angle1, v = [ -1, 0, 0 ]) //
        translate(v = [ 0, -(arm_l_1), 0 ])             //
        rotate(a = 90, v = [ 0, 1, 0 ])                 //
        two_arm_pins();
    color("green") rotate(a = angle1, v = [ -1, 0, 0 ]) //
        rotate(a = 90, v = [ 0, 1, 0 ])                 //
        translate(v = [ 0, -(arm_l_1 / 2), 0 ])         //
        link(arm_l_1, 2.8, 3, 3);
    color("green") translate(v = [ 0, -distance, _offset ]) rotate(a = angle2, v = [ 1, 0, 0 ])
        rotate(a = 90, v = [ 0, 1, 0 ])           //
        translate(v = [ 0, (arm_l_2 / 2), -3.5 ]) //
        link(arm_l_2, 2.8, 3, 3);
}

moving_arm(20 + (9 * (sin($t * 360))), 5, 30, 30);