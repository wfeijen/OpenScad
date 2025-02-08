
glansData = [
[0, 22.5, 10 , 10],
[12, 27, 28 , 16],
[7, 29, 33 , 20],
[0, 32, 35 , 25],
[-3, 35, 35 , 31],
[-5, 40, 32.5 , 28],
[-6, 45, 30 , 23.8],
[-5, 50, 25.5 , 20],
[-5, 52.5, 23 , 15],
[-5, 53.5, 20 , 13],
[-5, 54.5, 13 , 8],
[-5, 55, 1 , 1],
];

module positionedOval(px, py, pz, lx, ly){
    translate([px, py, pz])
        resize([lx, ly]) cylinder(d=20, h=0.01);
}


module glans(){
    hull(){
        for( i=[0 : len(glansData) -1])
            positionedOval(0, glansData[i][0], glansData[i][1], glansData[i][2], glansData[i][3]);   
    } 
}

module shaft(){
    translate([0, 2, 0]){
        difference() { 
            cylinder(h = 35, d = 30);
            translate([0, 11, 55])
                rotate([45, 0, 0])
                    cube(40,center = true);
        }
    }
}

translate([0,0,-25]) {
    glans();
    shaft();
}



