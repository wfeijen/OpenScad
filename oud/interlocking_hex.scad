include <./lib/bosl/beziers.scad>
straalTotRechteZijde = 39;
lipDistanceTotZijde = 3.5;
lipR = 5;
lipInDist = straalTotRechteZijde - lipDistanceTotZijde;
lipUitDist = straalTotRechteZijde + lipDistanceTotZijde;
lipBaseRotation = 5.9;
hoeken = [0, 60, 120,180,240,300];

module hex(d, a){
    translate([d * sin(a), d * cos(a), 0])
        cylinder(r=45, h=5, $fn=6);
}

module lipUit(d, a){
    translate([d * sin(a), d * cos(a), 0])
        cylinder(r=lipR, h=5, $fn=100);
}

module lipIn(d, a){
    translate([d * sin(a), d * cos(a), -10])
        cylinder(r=lipR + 0.5, h=50, $fn=100);
}

module rotate_about_pt(z, y, pt) {
    translate(pt)
        rotate([0, y, z]) // CHANGE HERE
            translate(-pt)
                children();   
}

module point_dist_angle(d, a){
    translate([d * sin(a), d * cos(a)])
        children();  
}



difference(){
    hex(d = 0, a = 0);
    union(){
        for( i=[0 : len(hoeken) -1])
            lipIn(d = lipInDist, a = lipBaseRotation + hoeken[i]);
    }
}
for( i=[0 : len(hoeken) -1])
    lipUit(d = lipUitDist, a = -lipBaseRotation + hoeken[i]);

//translate([00,39,0])
//    cube(100);


