/**
* shape_star.scad
*
* @copyright Justin Lin, 2017
* @license https://opensource.org/licenses/lgpl-3.0.html
*
* @see https://openhome.cc/eGossip/OpenSCAD/lib2x-shape_starburst.html
*
**/

use <_impl/_shape_starburst_impl.scad>;

function shape_starburst(r1, r2, n) = 
   _shape_starburst_impl(r1, r2, n);