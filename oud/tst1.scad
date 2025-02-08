use <libraries/sweep.scad>
use <libraries/scad-utils-master/transformations.scad>
use <libraries/shapes.scad>

bottom_w = 120;
top_w = 3;
height = 120;
steps = 360;

pathstep = height/steps;
delt = top_w - bottom_w;

//square_points = square(1);
//circle_points = circle(r=0.5, $fn=60);

sweep(circle_points, my_path);

my_path = [ for (i=[0:steps])
    translation([18*sin(i), 18-18*cos(i*0.7),     36*sin(i/2)]) *
    scaling([11 * (1.2 - i/steps), 11 * (1.2 - i/steps), 1]) *
    rotation([0,0, steps]) ];