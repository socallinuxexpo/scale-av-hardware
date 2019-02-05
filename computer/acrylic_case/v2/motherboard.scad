

//motherboard();

module motherboard(safe_area=true){
    
    translate([0,0,8]) base_baord();
    translate([5,-85+10,10.15]) cube([55, 15, 35]); // power board
    translate([-55,-60,10.15]) color("red") cube([140, 15, 35]); // RAM
    translate([-75,55,10.15]) color("silver") cube([150, 30, 30]); //rough connectors
    
    translate([20,3,10.15]){
        cylinder(d=94, h=53, $fn=60);
        for(X=[-1,1], Y=[-1,1]) ;
    }
    if(safe_area){
        %translate([5,-95,10.15]) cube([55, 20, 35]); // power cables
        %translate([-70,85,10.15]) cube([155, 60, 30]); //rough connectors
    }
}

module base_baord(){
    // 85
    translate([0,0,1])
    difference(){
        cube([170,170,2], center=true);
//        for(X=[-1,1], Y=[,1,1,1]) translate([78.65*X, Y,0]) cylinder(d=3.96, h=4, center=true, $fn=60);
        translate([-78.65, 77.47,0]) cylinder(d=3.96, h=4, center=true, $fn=60);
        translate([78.65, 55,0]) cylinder(d=3.96, h=4, center=true, $fn=60);
        translate([78.65, -77.43,0]) cylinder(d=3.96, h=4, center=true, $fn=60);
        translate([-78.65, -77.43,0]) cylinder(d=3.96, h=4, center=true, $fn=60);
    }
    
}