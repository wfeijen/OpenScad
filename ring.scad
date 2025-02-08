
module ademRuimte(){
    aantalPerRonde = 14;
    for( ii = [0 : 2])
        for( i=[0 : aantalPerRonde -1])
                translate([0, 0, ii * 2.5 ])
                    rotate([90,0, ((i + ii/2) * 360) / aantalPerRonde])
                        cylinder(h=80, r=0, r2 = 2, center=true);
}

module ring()
{
    rotate_extrude() translate([22 / 2 + 2 ,0,0]) circle(2);
}


module dubbelRing(){
    union(){
        ring();
        translate([0,0,+5])ring();
        translate([0,0,+2.5])ring();
    }
}

difference(){
    dubbelRing();
    ademRuimte();
}

