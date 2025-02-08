// fl sh 32.5 x 32.5 head 3.75 x 3.25
glansData = [ // yShift, z, x, y
[0, -22.5, 10 , 10],
[12, -8, 28 , 16],
[7, -6, 33 , 20],
[0, -3, 35 , 25],
[-3, 0, 35 , 31],
[-5, 5, 32.5 , 28],
[-6, 10, 30 , 23.8],
[-5, 15, 25.5 , 20],
[-5, 17.5, 23 , 15],
[-5, 18.5, 20 , 13],
[-5, 19.5, 13 , 8],
[-5, 20, 1 , 1],
];

module positionedOval(px, py, pz, lx, ly){
    translate([px, py, pz])
        resize([lx, ly]) cylinder(d=20, h=0.01);
}


module glans(gd, gf){// gf x, y , z
    hull(){
        for( i=[0 : len(gd) -1])
            positionedOval(0, gd[i][0] * gf[1], gd[i][1] * gf[2], gd[i][2] * gf[0] , gd[i][3] * gf[1]);   
    } 
}

module shaft(lengte, dikte){
    translate([0, 2, 0]){
        difference() { 
            translate([0, 0, -lengte])
                cylinder(h = lengte, d = dikte);
            translate([0, 23, 10])
                rotate([45, 0, 0])
                    cube(40,center = true);
        }
    }
}

module binnenHolte(glansData, glansFactor, lengte, dikte){
    glans(glansData, glansFactor);
    shaft(lengte, dikte);
}

module bevestigingsRing(){
     difference(){
         union(){
            translate([0, 22.2,-34])
                rotate([0,90,0])
                    cylinder(h=16, r=6, center=true);   
            translate([0,18.2,-34])
                cube([16, 12, 12], center = true);             
         }      
        binnenHolte(glansData, [7/6, 7/6, 7/6], lengte = 45, dikte = 35);    
        translate([0, 22.2,-34])
            rotate([0,90,0])
                cylinder(h=20, r=3, center=true);     
     }
}

module hollePik(){
    difference(){
        binnenHolte(glansData, [15/12,15/12,15/12], lengte = 40, dikte = 35);
        binnenHolte(glansData, [13/12, 13/12, 13/12], lengte = 45, dikte = 31);    
     }
}

module ademRuimte(){
    aantalPerRonde = 14;
    for( ii = [0 : 24])
        for( i=[0 : aantalPerRonde -1])
                translate([0, 0, ii * 2.5 -35.6])
                    rotate([90,0, ((i + ii/2) * 360) / aantalPerRonde])
                        cylinder(h=80, r=0, r2 = 2, center=true);
}

module torus2(r1, r2)
{
    rotate_extrude() translate([r1,0,0]) circle(r2);
}

module mowhawk(){
    difference(){
        hull(){
            translate([0, -4,16])
                rotate([0,90,0])
                    cylinder(h=13, r=16, center=true);        
            translate([0, 18,-5])
                rotate([0,90,0])
                    cylinder(h=13, r=9, center=true);
        }
        rotate([0,90,0])
            cylinder(h=7, r=120, center=true);
        binnenHolte(glansData, [7/6, 7/6, 7/6], lengte = 45, dikte = 35);
        translate([0, -1,26])
            rotate([0,90,0])
                cylinder(h=20, r=2, center=true);
        translate([0, 4.3,23])
            rotate([0,90,0])
                cylinder(h=20, r=2, center=true);
        translate([0, 8.3,18])
            rotate([0,90,0])
                cylinder(h=20, r=2, center=true);
        translate([0, 11.8,13])
            rotate([0,90,0])
                cylinder(h=20, r=2, center=true);        
        translate([0, 15.3,8])
            rotate([0,90,0])
                cylinder(h=20, r=2, center=true);
        translate([0, 18.7,3])
            rotate([0,90,0])
                cylinder(h=20, r=2, center=true);
        translate([0, 22,-2])
            rotate([0,90,0])
                cylinder(h=20, r=2, center=true);
    }
}

module cbd(){
    bevestigingsRing();
    mowhawk();
    translate([0,2,-39])
        torus2(18,2);
    difference(){
        hollePik();    
        translate([0,8,22.5])
            cube([7, 50, 50], center = true);
        ademRuimte();
    }
}

cbd();



