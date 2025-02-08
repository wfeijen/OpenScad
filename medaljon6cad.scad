
ringGrootte = 22;
ringDikte = 2;

module centraleRing()
{
    rotate(a=15, v=[0,0,1])
    //resize(newsize=[25,30,5])
    rotate_extrude($fn = 200) translate([8 ,0,0]) circle(1.1, $fn = 50);
}

module linksBoven()
{
    translate([-1,4,1])
    rotate(a=10, v=[0,0,1])
    rotate(a=-20, v=[0,1,0])
    resize(newsize=[14,17.5,3])
    rotate_extrude($fn = 200) translate([11 ,0,0]) circle(ringDikte, $fn = 3);
}

module rechtsBoven()
{
    translate([-3,-3,-1])
    rotate(a=15, v=[0,0,1])
    rotate(a=20, v=[0,1,0])
    resize(newsize=[14,17,3])
    rotate_extrude($fn = 200) translate([11 ,0,0]) circle(ringDikte, $fn = 4);
}

module onder()
{
    translate([10,0,0])
    rotate(a=5, v=[0,0,1])
    rotate(a=-15, v=[1,0,0])
    resize(newsize=[20,15,3])
    rotate_extrude($fn = 200) translate([11 ,0,0]) circle(ringDikte, $fn = 5);
}

module bevestiging()
{
    translate([25.5,0,-1])
    rotate(a=-100, v=[1,0,0])
    rotate_extrude($fn = 100) translate([5 / 2 ,0,0]) circle(1, $fn = 100);
}

module maxGrootte()
{
    #union(){
        translate([0.5, 0.5, 0]) difference(){
            square([30.5,28], true);
            square([28.5,26], true);
        }
        translate([-12.1, -13.5, -1]) square([3,27]);
    }
}

maxGrootte();

rotate(a=10, v=[1,0,0])
mirror([1,0,0]){
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
}

