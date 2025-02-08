/**
* rounded_cylinder.scad
*
* @copyright Justin Lin, 2017
* @license https://opensource.org/licenses/lgpl-3.0.html
*
* @see https://openhome.cc/eGossip/OpenSCAD/lib2x-rounded_cylinder.html
*
**/

use <__comm__/__half_trapezium.scad>;

module rounded_cylinder(radius, h, round_r, convexity = 2, center = false) {  
    r_corners = __half_trapezium(radius, h, round_r);
    
    shape_pts = concat(
        [[0, -h/2]],
        r_corners,           
        [[0, h/2]]
    );

    center_pt = center ? [0, 0, 0] : [0, 0, h/2];

    translate(center_pt) 
    rotate(180) 
    rotate_extrude(convexity = convexity) 
        polygon(shape_pts);

    // hook for testing
    test_center_half_trapezium(center_pt, shape_pts);
}

// override it to test
module test_center_half_trapezium(center_pt, shape_pts) {
    
}
