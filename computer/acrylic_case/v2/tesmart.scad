

//TESmart();
//hdmi_panelmount();

module TESmart(safe_area=true){
//    color([0.4,0.4,0.4]) 
    difference(){
        cube([277, 136, 25], center=true);
        for(X=[-1,1], Y=[-1,1]) translate([(277.1/2)*X, 38*Y, -8.2]) rotate([0,90,0]) cylinder(d=5, h=1, $fn=60);
    }
    // rs-232 part
    color("silver") translate([138.5-26,-136/2,0]){
        for(X=[-1,1]) translate([(24.5/2)*X, 0,0]) rotate([90,0,0]) cylinder(d=5, h=4.8, $fn=6);
        hull(){
            for(X=[-1,1]) translate([(14.4/2)*X, 0,2]) rotate([90,0,0]) cylinder(d=2, h=4.8, $fn=60);
            for(X=[-1,1]) translate([(12.8/2)*X, 0,-2]) rotate([90,0,0]) cylinder(d=2, h=4.8, $fn=60);
        }
    }
    // switch
    color([0.4,0.4,0.4]) translate([-138.5+15,138/2,0])cube([11, 2.2, 15], center=true);
    // Buttones
    color([0.4,0.4,0.4]) for(X=[0:1:3]) translate([138.5-75-(X*28), (136/2)+4.8,0]) rotate([90,0,0]) cylinder(d=6, h=4.8, $fn=60);
    if(safe_area){
        color("green"){
            for(X=[0:1:7]) translate([-138.5+45-2.5+(X*24.5),-136/2,0]) hdmi_plug();
//            translate([-138.5,(-136/2)-5,-5]) %cube([35,10,10]);
//            translate([-138.5+35+15,(-136/2)-5,-5]) %cube([10,10,10]);
            translate([-138.5+23,-(136/2),0]){
                rotate([90,0,0]) cylinder(d=8.76, h=15, $fn=60);
                translate([0,-15,0]) rotate([90,0,0]) cylinder(d=6.76, h=15, $fn=60);
            }
        }
    }
}

module hdmi_plug(){
    translate([0,-19,0]) cube([20,38,9.35], center=true);
    translate([0,-38,0]) rotate([90,0,0]) cylinder(d=6, h=4.8, $fn=60);
}


module hdmi_panelmount(){
    difference(){
        hull() for(X=[-1,1]) translate([(26.5/2)*X, 0,0]) rotate([90,0,0]) cylinder(d=10.6, h=7.2, $fn=60);
        for(X=[-1,1]) translate([(26.5/2)*X,-2.5,0]) rotate([90,0,0]) cylinder(d=3, h=5, $fn=60);
    }
    translate([0,-7.1,1.25]) hull(){
        for(X=[-1,1], Z=[-1,1]) translate([(15.5/2)*X,0,1.8*Z]) rotate([90,0,0]) cylinder(d=2, h=4.35, $fn=60);
        for(X=[-1,1]) translate([(11/2)*X,0,-4.2]) rotate([90,0,0]) cylinder(d=2, h=4.35, $fn=60);
    }
    hull(){
        cube([20.5,1,10.6], center=true);
        for(X=[-1,1]) translate([(16.5/2)*X,22,0]) rotate([0,0,0]) cylinder(d=4, h=10.6, center=true, $fn=60);
    }
    translate([0,24+9,0]) rotate([90,0,0]) cylinder(d1=8.5, d2=8, h=9, $fn=60);
}

module dual_usb_panelmount(safe_zone=false){
    translate([0,7.6,0]){
        difference(){
            hull() for(X=[-1,1]) translate([15.5*X, 0,0]) rotate([90,0,0]) cylinder(d=10, h=7.6, $fn=60);
            for(X=[-1,1]) translate([15.5*X,1,0]) rotate([90,0,0]) cylinder(d=3, h=10, $fn=60);
        }
        translate([0,-3.1,0]) cube([24,9,16.5], center=true);
        translate([0,11,0]) cube([24,20,18.5], center=true);
        
        hull() for(X=[-1,1]) translate([2.5*X, 25,0]) rotate([90,0,0]) cylinder(d=10.5, h=4.3, $fn=60);
        for(X=[-1,1]) translate([2.2*X, 35,0]) rotate([90,0,0]) cylinder(d=4.2, h=10, $fn=60);
        if( safe_zone ){
            #translate([0,-16.6,0]) cube([18.5,18.5,18.5], center=true);
        }
    }
}
//single_usb_panelmount();
module single_usb_panelmount(safe_zone=true){
    translate([0,7.6,0]){
        difference(){
            hull() for(X=[-1,1]) translate([15.5*X, 0,0]) rotate([90,0,0]) cylinder(d=10, h=7.6, $fn=60);
            for(X=[-1,1]) translate([15.5*X,1,0]) rotate([90,0,0]) cylinder(d=3, h=10, $fn=60);
        }
        translate([0,-3.1,0]) cube([24,9,12], center=true);
        
        hull() for(X=[-1,1]) translate([2.5*X, 25,0]) rotate([90,0,0]) cylinder(d=10.5, h=4.3, $fn=60);
        for(X=[-1,1]) translate([2.2*X, 35,0]) rotate([90,0,0]) cylinder(d=4.2, h=10, $fn=60);
        
        #translate([0,-16.6,0]) cube([18.5,18.5,9], center=true);
    }
}


module usb_capture(safe=true){
    hull() for(X=[-1,1], Y=[-1,1])
        translate([(20-3)*X, (46-3)*Y,0]) 
            cylinder(d=6, h=12, center=true, $fn=60);
    if(safe){
        translate([0,-46,0]) mirror([0,0,0]) %hdmi_plug();
        translate([0,46,0]) mirror([0,1,0]) %hdmi_plug();
    }
}

 