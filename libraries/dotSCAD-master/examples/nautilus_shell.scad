use <rotate_p.scad>;
use <hull_polyline2d.scad>;
use <bezier_curve.scad>;
use <ellipse_extrude.scad>;

chambered_section_max_angle = 300;
steps = 25;
thickness = 1;
slices = 5;
semi_minor_axis = 10;
height = 5;

module nautilus_shell(chambered_section_max_angle, steps, thickness) {
    function r(a) = pow(2.71828, 0.0053468 * a);
    
    a_step = chambered_section_max_angle / steps;
    spiral = [
        for(a = [a_step:a_step:chambered_section_max_angle + 450])  
            rotate_p([r(a), 0], a)
    ];

    render() {
        hull_polyline2d(spiral, thickness);

        for(a = [a_step:a_step * 2:chambered_section_max_angle]) {
            a2 = a + 360;
            a3 = a + 420;
            p1 = rotate_p([r(a), 0], a);
            p2 = rotate_p((p1 + rotate_p([r(a2), 0], a2)) * .6, -5);
            p3 = rotate_p([r(a3), 0], a3);
            
            hull_polyline2d(bezier_curve(0.1, 
                [p1, p2, p3]
            ), thickness);
        }

    }
}

ellipse_extrude(semi_minor_axis, height = height, slices = slices)
    nautilus_shell(chambered_section_max_angle, steps, thickness);

mirror([0, 0, 1])    
ellipse_extrude(semi_minor_axis, height = height, slices = slices)
    nautilus_shell(chambered_section_max_angle, steps, thickness);
