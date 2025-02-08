/**
* rounded_cube.scad
*
* @copyright Justin Lin, 2017
* @license https://opensource.org/licenses/lgpl-3.0.html
*
* @see https://openhome.cc/eGossip/OpenSCAD/lib2x-rounded_cube.html
*
**/

use <__comm__/__frags.scad>;
use <__comm__/__nearest_multiple_of_4.scad>;

module rounded_cube(size, corner_r, center = false) {
    is_flt = is_num(size);
    x = is_flt ? size : size[0];
    y = is_flt ? size : size[1];
    z = is_flt ? size : size[2];

    corner_frags = __nearest_multiple_of_4(__frags(corner_r));
    edge_d = corner_r * cos(180 / corner_frags);

    half_x = x / 2;
    half_y = y / 2;
    half_z = z / 2;
    
    half_l = half_x - edge_d;
    half_w = half_y - edge_d;
    half_h = half_z - edge_d;
    
    half_cube_leng = size / 2;
    half_leng = half_cube_leng - edge_d;
        
    pair = [1, -1];
    corners = [
        for(z = pair) 
            for(y = pair) 
                for(x = pair) 
                    [half_l * x, half_w * y, half_h * z]
    ];

    module corner(i) {
        translate(corners[i]) 
            sphere(corner_r, $fn = corner_frags);        
    }

    center_pts = center ? [0, 0, 0] : [half_x, half_y, half_z];
    
    // Don't use `hull() for(...) {...}` because it's slow.
    translate(center_pts) hull() {
        corner(0);
        corner(1);
        corner(2);
        corner(3);
        corner(4);
        corner(5);
        corner(6);
        corner(7);      
    }

    // hook for testing
    test_rounded_edge_corner_center(corner_frags, corners, center_pts);
}

// override it to test
module test_rounded_edge_corner_center(corner_frags, corners, center_pts) {

}