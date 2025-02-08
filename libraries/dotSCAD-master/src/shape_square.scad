/**
* shape_square.scad
*
* @copyright Justin Lin, 2017
* @license https://opensource.org/licenses/lgpl-3.0.html
*
* @see https://openhome.cc/eGossip/OpenSCAD/lib2x-shape_square.html
*
**/

use <__comm__/__trapezium.scad>;
 
function shape_square(size, corner_r = 0) = 
    let(
        is_flt = is_num(size),
        x = is_flt ? size : size[0],
        y = is_flt ? size : size[1]        
    )
    __trapezium(
        length = x, 
        h = y, 
        round_r = corner_r
    );
    