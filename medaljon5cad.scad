
ringGrootte = 22;
ringDikte = 2;

module centraleRing()
{
    rotate(a=15, v=[0,0,1])
    resize(newsize=[25,30,5])
    rotate_extrude($fn = 100) translate([ringGrootte / 2 ,0,0]) circle(ringDikte, $fn = 50);
}

module linksBoven()
{
    translate([0,0,1])
    rotate(a=5, v=[0,0,1])
    rotate(a=-20, v=[0,1,0])
    resize(newsize=[23,29,5])
    rotate_extrude($fn = 100) translate([ringGrootte / 2 ,0,0]) circle(ringDikte, $fn = 3);
}

module rechtsBoven()
{
    translate([0,0,-2])
    rotate(a=05, v=[0,0,1])
    rotate(a=25, v=[0,1,0])
    resize(newsize=[24,28,5])
    rotate_extrude($fn = 100) translate([ringGrootte / 2 ,0,0]) circle(ringDikte, $fn = 4);
}

module onder()
{
    translate([6,0,0])
    rotate(a=5, v=[0,0,1])
    rotate(a=-15, v=[1,0,0])
    resize(newsize=[35,20,5])
    rotate_extrude($fn = 100) translate([25 / 2 ,0,0]) circle(ringDikte, $fn = 5);
}

module bevestiging()
{
    translate([31,0,0])
    rotate(a=-90, v=[1,0,0])
    rotate_extrude($fn = 100) translate([10 / 2 ,0,0]) circle(2, $fn = 100);
}


difference(){
    union(){
        centraleRing();
        translate([6, 8, 0])
            rechtsBoven();
        translate([6, -8, 0])
            linksBoven();
        translate([-15, 0, 0])
            onder();
        translate([-15, 0, 0])
            bevestiging();    }
}

