// fl sh 32.5 x 32.5 head 3.75 x 3.25
glansData = [ // yShift, z, x, y
[-5, 20, 1 , 1],
[-5, 19.5, 13 , 8],
[-5, 18.5, 20 , 13],
[-5, 17.5, 23 , 15],
[-5, 15, 25.5 , 20],
[-6, 10, 30 , 23.8],
[-5, 5, 32.5 , 28],
[-3, 0, 35 , 31],
[0, -9, 35 , 25],
[7, -14, 33 , 20],
[12, -18, 28 , 16],
[0, -22.5, 10 , 10],











];

        //was binnenHolte(glansData, [16/12,16/12,16/12], lengte = 40, dikte = 39);
        //was binnenHolte(glansData, [14/12, 14/12, 14/12], lengte = 45, dikte = 35); 
        
model = 1;        
schachtLengte = 27;
wandDikte = 1.5;

 //Oorspronkelijk model 0
 //scaleInnerGlans = 1.17;  schachtDikte = 35; gat1 = [0, 5.3,23];  gat2 = [0, 9.3,18];  gat3 = [0, 12.8,13];  gat4 = [0, 16.3,8];  gat5 = [0, 19.7,3]; mowhawkOffset = 0.5; ringOffset = 3;
// model 1 voorzichtig
//schachtDikte = 34; gat1 = [0, 4.6,23]; gat2 = [0, 9.1,18];  gat3 = [0, 12.4,13];  gat4 = [0, 15.7,8];  gat5 = [0, 19.1,3]; mowhawkOffset = 0.5; ringOffset = 1;
// model 2 Reel
//schachtDikte = 33; gat1 = [0, 4.6,23]; gat2 = [0, 8.3,18];    gat3 = [0, 11.8,13];    gat4 = [0, 15.3,8];    gat5 = [0, 18.7,3]; mowhawkOffset = 0; ringOffset = 0;
// model 3 Ambitieus
schachtDikte = 32; gat1 = [0, 6.1, 21]; gat2 = [0, 9,17];    gat3 = [0, 11.6,13];    gat4 = [0, 14.0,9];    gat5 = [0, 16.4,5];     gat6 = [0, 18.8,1]; gat7 = [0, 21.2, -3]; mowhawkOffset = -0.5; ringOffset = 0;

scaleInnerGlans = schachtDikte * 0.0334;
scaleOuterGlans = scaleInnerGlans + 0.10;

module positionedOval(px, py, pz, lx, ly){
    translate([px, py, pz])
        resize([lx, ly]) cylinder(d=20, h=0.01);
}

module glans(gd, gf){// gf x, y , z
    hull(){
        for( i=[0 : len(gd) -1])
            positionedOval(0, gd[i][0] * gf, gd[i][1] * gf, gd[i][2] * gf , gd[i][3] * gf);   
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
                        cylinder(h=80, r1=0, r2 = 2, center=true);
}

module onderRing()
{
    rotate_extrude() translate([schachtDikte / 2 + 2 ,13,0]) circle(2);
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
                    translate([0, -4 + mowhawkOffset,16])
                        rotate([0,90,0])
                            cylinder(h=11, r=16 + mowhawkOffset, center=true);        
                    translate([0, 18,-5])
                        rotate([0,90,0])
                            cylinder(h=11, r=9+ mowhawkOffset, center=true);
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
        gat(gat6);
        gat(gat7);
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
            translate([0,24 + ringOffset,-6])
                cylinder(h=4, r=5, center=true);
            mowhawk();
            translate([0,2,-39])
                onderRing();
            difference(){
                binnenHolte(glansData, scaleOuterGlans, schachtLengte, schachtDikte + 2 * wandDikte);   
                uitsnede();
                ademRuimte();
            }
        }
        binnenCone();    
        translate([0,24 + ringOffset ,-5])
            cylinder(h=20, r=2.5, center=true);
        binnenHolte(glansData, scaleInnerGlans, schachtLengte + 2 , schachtDikte); 
    }        
}

cbd();

//difference(){
//    buitenCone();
//    binnenCone();
//}
//translate([0,0,30])
//    cube(2,center = true);


