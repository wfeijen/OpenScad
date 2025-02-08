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

        //binnenHolte(glansData, [16/12,16/12,16/12], lengte = 40, dikte = 39);
        //binnenHolte(glansData, [7/6, 7/6, 7/6], lengte = 45, dikte = 35); 


scaleInneerGlans = [13/12, 13/12, 13/12];
scaleOuterGlans = [15/12,15/12,15/12];
schachtLengte = 40;
schachtDikte = 31;
wandDikte = 2;
gat1 = [0, 4.9,23];
gat2 = [0, 8.3,18];
gat3 = [0, 11.8,13];
gat4 = [0, 15.3,8];
gat5 = [0, 18.7,3];
gat6 = [0, 22,-2];


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

module ademRuimte(){
    aantalPerRonde = 14;
    for( ii = [0 : 19])
        for( i=[0 : aantalPerRonde -1])
                translate([0, 0, ii * 2.5 -35.6])
                    rotate([90,0, ((i + ii/2) * 360) / aantalPerRonde])
                        cylinder(h=80, r=0, r2 = 2, center=true);
}

module onderRing(r1, r2)
{
    rotate_extrude() translate([r1,0,0]) circle(r2);
}

module gat(locatie){
    translate(locatie)
            rotate([0,90,0])
                cylinder(h=20, r=2, center=true);
}

module buitenCone(){
    translate([0,-5.5,22])
            cylinder(h=14, r1=13.5, r2 = 6.5, center=true);
} 

module binnenCone(){
    translate([0,-5.5,25])
        cylinder(h=25, r1=12.5, r2 = 0, center=true);
} 

module mowhawk(){
    difference(){
        union(){
            difference(){
                 hull(){
                    translate([0, -4,16])
                        rotate([0,90,0])
                            cylinder(h=13, r=16, center=true);        
                    translate([0, 18,-5])
                        rotate([0,90,0])
                            cylinder(h=13, r=9, center=true);
                 }
                 translate([0,0,60])
                    rotate([0,90,0])
                        cylinder(h=7, r=60, center=true);
            }
            buitenCone();
        }
        gat(gat1);
        gat(gat2);
        gat(gat3);
        gat(gat4);
        gat(gat5);
        //gat(gat6);
        uitsnede();        

    }
}

module uitsnede(){
    translate([0,11,22.5])
            cube([7, 50, 50], center = true);
}

module cbd(){
    difference(){
        union(){
            translate([0,24,-6])
                cylinder(h=7, r=5, center=true);
            mowhawk();
            translate([0,2,-39])
                onderRing(18,2);
            difference(){
                binnenHolte(glansData, scaleOuterGlans, schachtLengte, schachtDikte + 2 * wandDikte);   
                uitsnede();
                ademRuimte();
            }
        }
        binnenCone();    
        translate([0,24,-5])
            cylinder(h=20, r=3, center=true);
        binnenHolte(glansData, scaleInneerGlans, schachtLengte + 2 , schachtDikte); 
    }
        
}

cbd();

//difference(){
//    buitenCone();
//    binnenCone();
//}
//translate([0,0,30])
//    cube(2,center = true);


