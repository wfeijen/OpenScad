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

module hollePik(){
    difference(){
        union(){
            binnenHolte(glansData, [15/12,15/12,15/12], lengte = 35, dikte = 37);
            translate([0, 20, -35])
                cylinder(h=30, r1 = 2, r2 = 8);
        }            
        binnenHolte(glansData, [7/6, 7/6, 7/6], lengte = 45, dikte = 35);    
        translate([0, 20, -27])
            cylinder(h=80, r1 = 0, r2 = 14);
    }
}

module ademRuimte(){
    aantalPerRonde = 16;
    for( ii = [0 : 5])
        for( i=[0 : aantalPerRonde -1])
                translate([0, 11,ii * 4 -30])
                    rotate([90,0, ((i + ii/2) * 360) / aantalPerRonde])
                        cylinder(h=80, r=0, r2 = 2, center=true);
    for( ii = [0 : 3])
        for( i=[0 : aantalPerRonde -1])
                translate([0, 11,ii * 4 -2])
                    rotate([90,0, ((i + ii/2) * 360) / aantalPerRonde])
                        cylinder(h=80, r=0, r2 = 2, center=true);
}

module torus2(r1, r2)
{
rotate_extrude() translate([r1,0,0]) circle(r2);
}

module oval_torus(inner_radius, thickness=[0, 0])
{
rotate_extrude() translate([inner_radius+thickness[0]/2,0,0]) ellipse(width=thickness[0], height=thickness[1]);
}

difference(){
    hull(){
        translate([0, -1,18])
            rotate([0,90,0])
                cylinder(h=13, r=13, center=true);        
        translate([0, 18,-5])
            rotate([0,90,0])
                cylinder(h=13, r=5, center=true);
    }
    rotate([0,90,0])
        cylinder(h=7, r=120, center=true);
    binnenHolte(glansData, [7/6, 7/6, 7/6], lengte = 45, dikte = 35);
    translate([0, 5,22])
        rotate([0,90,0])
            cylinder(h=20, r=2, center=true);
    translate([0, 8,18])
        rotate([0,90,0])
            cylinder(h=20, r=2, center=true);
    translate([0, 11,14])
        rotate([0,90,0])
            cylinder(h=20, r=2, center=true);
}


translate([0,2,-34])
    torus2(19,2);
difference(){
    hollePik();    
    translate([0,10,20])
        cube([6, 50, 50], center = true);
    ademRuimte();
}
//binnenHolte(glansData, [1,1,1], lengte = 35, dikte = 30);



