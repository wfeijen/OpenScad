// fl sh 32.5 x 32.5 head 3.75 x 3.25
glansData = [ // yShift, z, x, y
[0, -15.5, 10 , 10],
[10, -10, 28 , 18],
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

model = 1; schachtDikte = 27; glansLengteFactor = 1.3 ;

scaleInnerGlans = 1.03;
scaleOuterGlans = scaleInnerGlans + 0.12;

module positionedOval(px, py, pz, lx, ly){
    translate([px, py, pz])
        resize([lx, ly]) cylinder(d=20, h=0.01);
}

module glans(gd, gf, binnenVerschuiving, glansLengteFactor, dikteRing){// gf x, y , z
    difference(){
        hull(){
            for( i=[0 : len(gd) -1])
                positionedOval(0, gd[i][0] * gf + binnenVerschuiving, gd[i][1] * gf * glansLengteFactor, gd[i][2] * gf , gd[i][3] * gf );   
        } 
            translate([0, -5, -21 - dikteRing])
                rotate([-22, 0, 0])
                    cube([60,60,30],center = true);        
    }
}

module shaft(lengte, dikte){
    translate([0, -1, -lengte])
        cylinder(h = lengte, d = dikte);
}


module ademRuimte(){
    aantalPerRonde = 14;
    for( ii = [0 : 16])
        for( i=[0 : aantalPerRonde -1])
                translate([0, 0, ii * 2.5 - 11])
                    rotate([90,0, ((i + ii/2) * 360) / aantalPerRonde])
                        cylinder(h=80, r1=0, r2 = 2, center=true);
}


module spuitgat(lengte, dikte){
    translate([0, -10, 0])
        cylinder(h = lengte, d = dikte);
    translate([0, -3, 0])
        cylinder(h = lengte, d = dikte);}
        
module piercinggat(lengte, dikte){
    translate([0, 14.5 + lengte / 2, 5])
        rotate([115,0, 0])
            cylinder(h = lengte, d = dikte);
}

module piercinggatVersteviging(lengte, dikte){
    translate([0, 26, 8])
        rotate([115,0, 0])
            cylinder(h = lengte, d = dikte);
}

module sleutelgat(lengte, dikte){
    rotate([25,0, 0])
        translate([0, 16, -20])        
            cylinder(h = lengte, d = dikte);}

module cbd(){
    difference(){
        difference(){
            union(){
                difference(){
                    glans(glansData, scaleOuterGlans, 0, glansLengteFactor, 2);   
                    //uitsnede();
                    difference(){
                        
                        rotate([20, 0, 0])
                            ademRuimte();
                        translate([0, -5, -15 ])
                            rotate([-23, 0, 0])
                                cube([60,60,30],center = true);
                        translate([0, -5, 37])
                                cube([60,60,30],center = true);
                        piercinggatVersteviging(23, 16);                   
                        
                    }
                    translate([0, 9, 0 ])
                        rotate([20, 0, 0])
                            spuitgat(1000,5);
                        
                }
                difference(){
                    piercinggat(10, 10);
                    sleutelgat(1000,5);
                    translate([0, 28 , 5])
                        rotate([-10,0, 0])
                            cube(20,center = true);
                    }
            }
            glans(glansData, scaleInnerGlans, -0.5, glansLengteFactor, 0);    
            piercinggat(11, 5); 
                
        }  
      union(){  
        shaft(100,schachtDikte);        
      }
    }    
}

//difference(){
    cbd();
//    translate([25, 0 , 0])
//        cube([50, 100, 100],center = true);
//}

//glans(glansData, scaleInnerGlans, glansLengteFactor, 0);    
//
//translate([0, 16 , -5])
//    rotate([20,0, 0])
//        cube([1, 20, 15],center = true);
//
//translate([0, 0 , 5])
//    rotate([20,0, 0])
//        cube([38, 1, 45],center = true);




