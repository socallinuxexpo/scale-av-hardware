
//sata_mount();
//xlr_635();

module sata_mount(safe_area=true){
    difference(){
        cube([102, 120.5, 25.4]);
        translate([20,-0.01,0.8]) cube([70, 6, 16.25]);
        translate([3,-0.1,14.8]) cube([14, 1.5, 7.8]);
        for(X=[-0.1,97.1], Y=[24.5, 84.15, 114.5]) translate([X,Y,4.35]) rotate([0,90,0]) cylinder(d=2.5, h=5, $fn=60);
        
        for(X=[3.5,102-3.5], Y=[35.5, 104.5]) translate([X,Y,-0.1]) cylinder(d=2.5, h=5, $fn=60);
            
        difference(){
            translate([3,-0.1,1.5]) cube([14.3, 1.5, 9.5]);
            translate([3.15,-0.1,1.6]) cube([14, 1.5, 9.3]);
        }
    }
    translate([3.1,-1.5,14.95]) cube([12, 1.5, 7.5]);
    if(safe_area){
        color("green"){
            translate([35,120,11]) cube([43, 20, 8]);
        }
    }
}

module xlr_635(tsafe_area=true){
    difference(){
        union(){
            xlr_plate();
            translate([0,-4,0]) rotate([90,0,0]) cylinder(d=24, h=5.75, center=true, $fn=60);
            color("red"){
                translate([0,-6,10]) cube([4.5,3,8.75], center=true);
                translate([0,-6,14]) cube([11.25,3,3.6], center=true);
            }
            translate([0,11,0]) rotate([90,0,0]) cylinder(d=22, h=20, center=true, $fn=60);
            for(R=[0,90,180]) rotate([0,R,0]) translate([6,23,0]) rotate([90,0,0]) cylinder(d=3, h=6, center=true, $fn=60);
        }
        translate([0,-5,0]) rotate([90,0,0]) cylinder(d=6.7, h=10, center=true, $fn=60);
    }
    if(tsafe_area){
        color("green"){
//            translate([0,25+6.5,0]) cube([11.8, 13, 8.5], center=true);
            translate([0,35,0]) rotate([90,0,0]) cylinder(d=5, h=20, center=true, $fn=60);
        }
    }
}

module xlr_cat6(tsafe_area=true){
    difference(){
        union(){
            xlr_plate();
            translate([0,12.5,0]) cube([15,25,16.6], center=true);
        }
        translate([0,-0.1,0]) cube([12,5,7], center=true);
        translate([0,-0.1,4.2]) cube([6.3,5,1.75], center=true);
        translate([0,-0.1,5.7]) cube([4,5,1.3], center=true);
    }
    if(tsafe_area){
        color("green"){
            translate([0,25+6.5,0]) cube([11.8, 13, 8.5], center=true);
            translate([0,25+13,0]) rotate([90,0,0]) cylinder(d=5, h=20, center=true, $fn=60);
        }
    }
}

module xlr_plate(){
//    %cube([26, 1, 31], center=true);
    difference(){
        hull() for(X=[-1,1], Z=[-1,1]) translate([10.5*X,0,13*Z]) rotate([90,0,0]) cylinder(d=5, h=2.3, center=true, $fn=60);
        translate([-9.5,0,12]) rotate([90,0,0]) cylinder(d=3, h=3, center=true, $fn=60);
        translate([9.5,0,-12]) rotate([90,0,0]) cylinder(d=3, h=3, center=true, $fn=60);
    }
}
