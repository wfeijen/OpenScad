$fn = 50;
ringGrootte = 22;
ringDikte = 2;

module centraleRing()
{
    rotate(a=15, v=[0,0,1])
    resize(newsize=[25,30,5])
    rotate_extrude() translate([ringGrootte / 2 ,0,0]) circle(ringDikte);
}

module linksBoven()
{
    translate([0,0,1])
    rotate(a=5, v=[0,0,1])
    rotate(a=-20, v=[0,1,0])
    resize(newsize=[23,29,5])
    rotate_extrude() translate([ringGrootte / 2 ,0,0]) circle(ringDikte);
}

module rechtsBoven()
{
    translate([0,0,-2])
    rotate(a=05, v=[0,0,1])
    rotate(a=25, v=[0,1,0])
    resize(newsize=[24,28,5])
    rotate_extrude() translate([ringGrootte / 2 ,0,0]) circle(ringDikte);
}

module onder()
{
    translate([5,0,0])
    rotate(a=5, v=[0,0,1])
    rotate(a=-15, v=[1,0,0])
    resize(newsize=[30,20,5])
    rotate_extrude() translate([ringGrootte / 2 ,0,0]) circle(ringDikte);
}


module ring()
{
    rotate_extrude() translate([ringGrootte / 2 ,0,0]) circle(ringDikte);
}
module ademRuimte(){
    aantalPerRonde = 7;
    for( ii = [0 : 0])
        for( i=[0 : aantalPerRonde -1])
                translate([0, 0, ii * 2.5 ])
                    rotate([90,0, ((i + ii/2) * 360) / aantalPerRonde])
                        cylinder(h=15, r=0, r2 = 2, center=true);
}

module pentagram(outer) {
    inner = outer*sqrt(3.5-1.5*sqrt(5));
    Star(7,outer, inner);
}




difference(){
    union(){
        centraleRing();
        translate([6, 8, 0])
            rechtsBoven(20);
        translate([6, -8, 0])
            linksBoven(20);
        translate([-15, 0, 0])
            onder(20);
        //ademRuimte();
    }
}

