/**
* t2d.scad
*
* @copyright Justin Lin, 2019
* @license https://opensource.org/licenses/lgpl-3.0.html
*
* @see https://openhome.cc/eGossip/OpenSCAD/lib2x-t2d.html
*
**/ 

use <turtle/_impl/_t2d_impl.scad>;

function t2d(t, cmd, point, angle, leng) = _t2d_impl(t, cmd, point, angle, leng);