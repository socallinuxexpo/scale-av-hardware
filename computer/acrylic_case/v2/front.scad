include <parts.scad>

projection(cut=true) front();

module front(type="exp"){
    drill_hole=2.28;
    difference(){
        back_base(thickness=front_panel_thickness);
//        for(Y=[0:1:3]) translate([22.5, -20.5+Y*28,0]) cylinder(d=6, h=40, center=true, $fn=60);
        for(Y=[0:1:3]) translate([20, -22.5+Y*29,0]) cylinder(d=6, h=40, center=true, $fn=60);
        hull() for(X=[-5,5]) translate([22.5+X, -123.5,0]) cylinder(d=5, h=40, center=true, $fn=60);
        //hull() for(X=[-7,7], Y=[-124, -57]) translate([-5.5+X, Y,0]) cylinder(d=5, h=40, center=true, $fn=60);
        //hull() for(X=[-12.5,7], Y=[-124, -39.5]) translate([-5.5+X, Y,0]) cylinder(d=5, h=40, center=true, $fn=60);
        hull() for(X=[-12.5,7], Y=[-124, -39.5]) translate([-5.5+X, Y-3,0]) cylinder(d=5, h=40, center=true, $fn=60);
        for(Y=[-20,7]) translate([-1,Y,0]) union(){
            cylinder(d=24, h=front_panel_thickness+0.1, center=true, $fn=60);
            translate([12,-9.5,0]) rotate([0,0,0]) cylinder(d=drill_hole, h=front_panel_thickness+0.1, center=true, $fn=60);
            translate([-12,9.5,0]) rotate([0,0,0]) cylinder(d=drill_hole, h=front_panel_thickness+0.1, center=true, $fn=60);
        }
        translate([-5,34,0]) union(){
            cylinder(d=24, h=front_panel_thickness+0.1, center=true, $fn=60);
//            cube([17.5,16,front_panel_thickness+0.1], center=true);
            translate([12,-9.5,0]) rotate([0,0,0]) cylinder(d=drill_hole, h=front_panel_thickness+0.1, center=true, $fn=60);
            translate([-12,9.5,0]) rotate([0,0,0]) cylinder(d=drill_hole, h=front_panel_thickness+0.1, center=true, $fn=60);
        }
        // screen mount
        translate([0,0-7,0]){
            translate([-2.25,121.75,0]) cylinder(d=1.6, h=front_panel_thickness+0.1, center=true, $fn=60);
            translate([-27.75,58.3,0]) cylinder(d=1.6, h=front_panel_thickness+0.1, center=true, $fn=60);
            translate([-11,119,0]) cylinder(d=10, h=front_panel_thickness+0.1, center=true, $fn=60);
        }
        translate([-25,130,0]) cylinder(d=12, h=front_panel_thickness+0.1, center=true, $fn=60);
        for(Y=[29,-65,-105]) translate([-29.2,Y,0]) hdmi_cutout(thickness=main_thickness+0.2);
        translate([-25.5,-10,0]) usb_cutout(thickness=main_thickness+0.2);
        if(type=="exp"){
            translate([-7,130,0])  cylinder(d=12, h=front_panel_thickness+0.1, center=true, $fn=60);
            translate([-28,-130,0])  cylinder(d=12, h=front_panel_thickness+0.1, center=true, $fn=60);
        }
        else{
            translate([-5,132,0])  cylinder(d=8, h=front_panel_thickness+0.1, center=true, $fn=60);
            translate([-28,-132,0])  cylinder(d=8, h=front_panel_thickness+0.1, center=true, $fn=60);
        }
    }
}
