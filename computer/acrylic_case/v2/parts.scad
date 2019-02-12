include <tesmart.scad>
include <motherboard.scad>
include <sata_mount.scad>

main_thickness=6.35;
top_thickness=3.175;
//front_panel_thickness=top_thickness;
front_panel_thickness=main_thickness;
tab_width=50;
internal_height=70;
internal_width=280+(main_thickness*2);


module dc_mount(){
    difference(){
        hull() for(X=[-1,1], Y=[-1,1]) translate([6*X, 8*Y, 0]) cylinder(d=2, h=top_thickness, center=true, $fn=60);
        cylinder(d=8, h=top_thickness+0.1, center=true, $fn=60);
    }
}

module dc_mount_s(){
    difference(){
        hull() for(X=[-1,1], Y=[-5,5.8]) translate([7*X, Y, 0]) cylinder(d=2, h=top_thickness, center=true, $fn=60);
        cylinder(d=8, h=top_thickness+0.1, center=true, $fn=60);
    }
}

module sheet(){
    %cube([24*25.4, 12*25.4, 1], center=true);
}

module scale_av(thickness=main_thickness+0.2){
    linear_extrude(height = thickness){
        import("scaleav.dxf");
    }
}

module troy(thickness=top_thickness+0.2){
    linear_extrude(height = thickness){
        import("troy.dxf");
    }
}

module usb_mount_brace(thickness=top_thickness){
    difference(){
        hull() for(X=[-1,1], Y=[-1,1]) translate([28*X,27*Y,0]) cylinder(d=6, h=thickness, center=true, $fn=60);
        for(X=[-1,1]) translate([(20+(main_thickness/2)+.5)*X,0,0]) rotate([0,0,90]) usb_mount_cutout();

        translate([4,0,0]) cylinder(d=3, h=thickness+0.1, center=true, $fn=60);
        for(R=[0,180]) rotate([0,0,R])
        hull(){
            translate([4,0,0]) cylinder(d=3, h=thickness+0.1, center=true, $fn=60);
            for(Y=[-1,1]) translate([14,20*Y,0]) cylinder(d=3, h=thickness+0.1, center=true, $fn=60);
        }
        for(R=[0,180]) rotate([0,0,R]) hull(){
            translate([0,4,0]) cylinder(d=3, h=thickness+0.1, center=true, $fn=60);
            for(X=[-1,1]) translate([9*X,24,0]) cylinder(d=3, h=thickness+0.1, center=true, $fn=60);
        }
    }
}

module usb_mount_cutout(thickness=main_thickness+0.1){
    for(X=[-1,1]) translate([20*X,0,0]) cube([10,thickness,thickness], center=true);
    cylinder(d=3, h=thickness, center=true, $fn=60);
}

module usb_sides(thickness=top_thickness, top_tab_height=top_thickness, bottom_tab_height=main_thickness){
    hieight=11.7;
    difference(){
        cube([60,hieight,thickness], center=true);
//        nut_cutout(thickness=thickness+0.1, length=0);
    }
    for(X=[-1,1]) translate([20*X,(hieight/2)+(bottom_tab_height/2),0]) cube([10,bottom_tab_height,thickness], center=true);
    for(X=[-1,1]) translate([20*X,-(hieight/2)-(top_tab_height/2),0]) cube([10,top_tab_height,thickness], center=true);
}

module tab(length=main_thickness+0.1, width=tab_width+0.1, thickness=main_thickness+0.1){
    cube([length, width, thickness], center=true);
}

module side(side="left"){
    difference(){
        cube([internal_height, 380+main_thickness*2, main_thickness], center=true);
        for(Y=[-1,1]) translate([0,((380+main_thickness)/2)*Y,0]) tab(length=20, width=main_thickness+0.01, thickness=main_thickness+0.01);
        for(Y=[70,120,170]) translate([7,Y,0]) cylinder(d=3, h=20, center=true, $fn=60);
        for(Y=[185,45]) translate([22.5,Y,0]) cube([10,top_thickness+0.1,main_thickness+0.1], center=true);
        if(side=="left"){
            translate([-20,-175,-(main_thickness/2)-0.1]) scale([0.75,0.8,1]) scale_av();
        }
        else{
            translate([-20,38,-(main_thickness/2)-0.1]) scale([0.75,0.8,1]) mirror([0,1,0]) scale_av();
        }
        for(O=[0:12:110]) translate([28,175-O,0]) hull(){
            cylinder(d=6, h=main_thickness+0.1, center=true, $fn=60);
            translate([-10,-10,0]) cylinder(d=6, h=main_thickness+0.1, center=true, $fn=60);
        }
        if( front_panel_thickness != main_thickness){
            translate([0, 5+(380/2)+front_panel_thickness, 0]) cube([internal_width+0.001, 10, main_thickness+0.001], center=true);
        }
    }
    for(Y=[-1,0,1]) translate([-((internal_height+top_thickness)/2),120*Y,0])
        tab(length=top_thickness+0.1, width=tab_width+0.1, thickness=main_thickness+0.1);
    for(Y=[-1,0,1]) translate([((internal_height+main_thickness)/2),120*Y,0]) tab();
}

module back_base(thickness=main_thickness){
    difference(){
        cube([internal_height, internal_width-(main_thickness*2), thickness], center=true);
    }
    for(Y=[-1,1]) translate([0,((internal_width-main_thickness)/2)*Y,0]) tab(length=20+0.1, width=main_thickness+0.1, thickness=thickness+0.1);
    for(Y=[-1,1]) translate([((internal_height+main_thickness)/2),75*Y,0]) tab(thickness=thickness+0.1);

    translate([-((internal_height+top_thickness)/2),0,0]) tab(length=top_thickness+0.1, thickness=thickness+0.1);
}

module back(){
    difference(){
        back_base();
        translate([-20,-100,-(main_thickness/2)-0.1]) scale([0.75,0.75,1]) scale_av();
    }
}

module front(type="exp"){
    difference(){
        back_base(thickness=front_panel_thickness);
        for(Y=[0:1:3]) translate([22.5, -20.5+Y*28,0]) cylinder(d=6, h=40, center=true, $fn=60);
        hull() for(X=[-5,5]) translate([22.5+X, -123.5,0]) cylinder(d=5, h=40, center=true, $fn=60);
        hull() for(X=[-7,7], Y=[-124, -57]) translate([-5.5+X, Y,0]) cylinder(d=5, h=40, center=true, $fn=60);
        hull() for(X=[-12.5,7], Y=[-124, -39.5]) translate([-5.5+X, Y,0]) cylinder(d=5, h=40, center=true, $fn=60);
        for(Y=[-20,7]) translate([-1,Y,0]) union(){
            cylinder(d=23, h=front_panel_thickness+0.1, center=true, $fn=60);
            translate([12,-9.5,0]) rotate([0,0,0]) cylinder(d=3, h=front_panel_thickness+0.1, center=true, $fn=60);
            translate([-12,9.5,0]) rotate([0,0,0]) cylinder(d=3, h=front_panel_thickness+0.1, center=true, $fn=60);
        }
        translate([-5,34,0]) union(){
            cube([17.5,16,front_panel_thickness+0.1], center=true);
            translate([12,-9.5,0]) rotate([0,0,0]) cylinder(d=3, h=front_panel_thickness+0.1, center=true, $fn=60);
            translate([-12,9.5,0]) rotate([0,0,0]) cylinder(d=3, h=front_panel_thickness+0.1, center=true, $fn=60);
        }
        translate([-2.25,121.75,0]) cylinder(d=2.25, h=front_panel_thickness+0.1, center=true, $fn=60);
        translate([-27.75,58.3,0]) cylinder(d=2.25, h=front_panel_thickness+0.1, center=true, $fn=60);

        translate([-11,119,0]) cylinder(d=10, h=front_panel_thickness+0.1, center=true, $fn=60);
        translate([-25,132,0]) cylinder(d=12, h=front_panel_thickness+0.1, center=true, $fn=60);
        for(Y=[35,-65,-105]) translate([-29.2,Y,0]) hdmi_cutout(thickness=main_thickness+0.2);
        translate([-25.5,-10,0]) usb_cutout(thickness=main_thickness+0.2);
        if(type=="exp"){
            translate([-5,132,0])  cylinder(d=12, h=front_panel_thickness+0.1, center=true, $fn=60);
            translate([-28,-132,0])  cylinder(d=12, h=front_panel_thickness+0.1, center=true, $fn=60);
        }
        else{
            translate([-5,132,0])  cylinder(d=8, h=front_panel_thickness+0.1, center=true, $fn=60);
            translate([-28,-132,0])  cylinder(d=8, h=front_panel_thickness+0.1, center=true, $fn=60);
        }
    }
}

module hdmi_cutout(thickness=front_panel_thickness){
    hull(){
        for(X=[-1,1], Y=[-1,1]) translate([2*X,(15.7/2)*Y,0]) cylinder(d=2, h=thickness, center=true, $fn=60);
        for(Y=[-1,1]) translate([4.4,(11.4/2)*Y,0]) cylinder(d=2, h=thickness, center=true, $fn=60);
    }
    for(Y=[-1,1]) translate([1.25,13.25*Y,0])  cylinder(d=3, h=thickness, center=true, $fn=60);
}

module usb_cutout(thickness=front_panel_thickness){
    for(Y=[-1,1]) translate([0,15.5*Y,0]) cylinder(d=3, h=thickness, center=true, $fn=60);
    hull() for(X=[-1,1], Y=[-1,1]) translate([7.5*X,10*Y,0]) cylinder(d=2, h=thickness, center=true, $fn=60);
}

module back_support(){
    difference(){
        mount_support();
        hull(){
            translate([0,30,0]) cube([15,1,top_thickness+0.1], center=true);
            for(Y=[-1,1]) translate([5*Y,-13,0]) cylinder(d=4, h=5, center=true, $fn=60);
        }
    }
}

module back_support2(){
    difference(){
        back_support();
        translate([10,10,0]) cube([20,50,5], center=true);
    }
}

module mount_support(){
    cube([25, 50, top_thickness], center=true);
    for(X=[-1,1], Y=[-15, 20]) translate([(12.5+(main_thickness/2))*X,Y,0]) cube([main_thickness,10,top_thickness], center=true);

    translate([0,-28,0]) cube([10,main_thickness,top_thickness], center=true);
}

module front_right_support(){
    difference(){
        mount_support();
        translate([0,-8.5,0]) cube([18,13,top_thickness+0.1], center=true);
    }
}

module base_plate(thickness=main_thickness, dual_tab=true){
    difference(){
        cube([internal_width, 380+main_thickness*2, thickness], center=true);
        if(dual_tab == true){
            for(X=[-1,1]) translate([75*X,-((380+main_thickness)/2),0])
                tab(length=tab_width+0.1, width=main_thickness+0.1, thickness=main_thickness+0.1);
            for(X=[-1,1]) translate([75*X,((380+front_panel_thickness)/2),0])
                tab(length=tab_width+0.1, width=front_panel_thickness+0.1, thickness=main_thickness+0.1);
        }
        else{
            translate([0,-((380+main_thickness)/2),0])
                tab(length=tab_width+0.1, width=main_thickness+0.1, thickness=main_thickness+0.1);
            translate([0,((380+front_panel_thickness)/2),0])
                tab(length=tab_width+0.1, width=front_panel_thickness+0.1, thickness=main_thickness+0.1);
        }
        if( front_panel_thickness != main_thickness){
            translate([0, 5+(380/2)+front_panel_thickness, 0]) cube([internal_width+0.1, 10, thickness+0.1], center=true);
        }
        for(X=[-1,1], Y=[-1,0,1]) translate([((internal_width-main_thickness)/2)*X,120*Y,0]) tab();
    }
}

module top_plate(){
    difference(){
        base_plate(thickness=top_thickness, dual_tab=false);
        translate([100,100,-0.01-top_thickness/2]) rotate([0,0,90]) scale([0.75,0.75,1]) scale_av(thickness=top_thickness+0.2);
        translate([50,80,-0.01-top_thickness/2]) rotate([0,0,180]) troy();
        for(X=[-1,1], Y=[-170,-60,60, 170]) translate([((internal_width-main_thickness)/2)*X, Y, 0])
            cylinder(d=3, h=top_thickness+0.1, center=true, $fn=60);
        for(X=[-1,1]) translate([80*X, -((380/2)+main_thickness/2), 0]) cylinder(d=3, h=top_thickness+0.1, center=true, $fn=60);
        if(front_panel_thickness == main_thickness){
            for(X=[-1,1]) translate([85*X, ((380/2)+front_panel_thickness/2), 0]) cylinder(d=3, h=top_thickness+0.1, center=true, $fn=60);
        }
    }
}

module bottom_plate(){
    difference(){
        base_plate();
        for(X=[95,130, -95, -130], Y=[185, 45]) translate([X,Y,0]) tab(width=top_thickness+0.01, length=10+0.01);
        translate([-10,-21.4,0]) cylinder(d=2.5, h=main_thickness+0.1, center=true, $fn=60);
        translate([-32.6,-178.6,0]) cylinder(d=2.5, h=main_thickness+0.1, center=true, $fn=60);
        translate([122.6,-178.6,0]) cylinder(d=2.5, h=main_thickness+0.1, center=true, $fn=60);
        translate([122.5,-21.4,0]) cylinder(d=2.5, h=main_thickness+0.1, center=true, $fn=60);
    }
}

module mount_plate(){
    difference(){
        translate([0,-5,-3]) cube([280, 150, main_thickness], center=true); // Divider/mount
        for(X=[-1,1], Y=[-1,0,1]) translate([-133*X,50*Y,0-3]) rotate([0,0,90*X]) nut_cutout();

//        translate([6.5,41+20,-3]) cube([80,20,6.5], center=true);
        translate([6.5,0,-3]) hull(){
            for(X=[-1,1]) translate([38*X,40,0]) cylinder(d=4, h=6.5, center=true, $fn=60);
            translate([0,71,0]) cube([80,1,6.5], center=true);
        }
        translate([-137, -90, -0.1])
            for(X=[3.5,102-3.5], Y=[55.5, 124.5]) translate([X,Y,-0.1])
                cylinder(d=3, h=15, center=true, $fn=60);
        for(X=[95,130, -95, -130], Y=[-75, 65]) translate([X,Y,0]) tab(width=top_thickness+0.1, length=10+0.1);

        //cylinder(d=3, h=15, center=true, $fn=60);
        translate([60,-30,-(main_thickness/2)+0.2]) rotate([0,0,45]){
            for(X=[-1,1]) translate([(20+(main_thickness/2)+.5)*X,0,0]) rotate([0,0,90]) usb_mount_cutout();
        }
    }
}

module led_5mm(lead_length=10, facet=60){
    hull(){
        translate([0,0,7]) sphere(d=4.7, $fn=facet);
        translate([0,0,0]) cylinder(d=5, h=1, $fn=facet);
    }
    difference(){
        translate([0,0,0]) cylinder(d=5.6, h=1.25, $fn=facet);
        translate([2.75,0,4.55]) cube([0.15,10,10], center=true);
    }
    for(X=[-1.82, -0.61, 0.61, 1.82]) translate([X,0,-lead_length])
        cylinder(d=0.65, h=lead_length+1, $fn=facet);
}

module push_button(){
    translate([0,0,2]) cylinder(d=9, h=13, $fn=60);
    difference(){
        translate([0,0,2]) cylinder(d=12, h=6, $fn=60);
        translate([5.65+0.65,0,5]) cube([2,10,10], center=true);
    }
    //translate([-6,0,0]) %cube([11.3,11.3,11.3]);

    for(X=[-1,1], Y=[-1,1]) translate([2.5*X,2.5*Y,-2.5]) cylinder(d=1, h=6, $fn=60);
}

module screen(){
//translate([35.45,0-19.4,1]) rotate([0,0,90]) linear_extrude(height=1) import (file = "circuit-brd.dxf");
    difference(){
        cube([70,32,1.8], center=true);
        translate([31.7,12.75,0]) cylinder(d=2.25, h=5, center=true, $fn=60);
        translate([-31.7,-12.75,0]) cylinder(d=2.25, h=5, center=true, $fn=60);
    }
    translate([-3-13,4-10.8,0.9]) cube([38,12,5]);
    translate([29,4,0]) rotate([0,0,0]) push_button();
    translate([29,-11.25,1]) led_5mm();
}

module power_connector(safe_zone=false){
    rotate([90,0,0]) cylinder(d=8, h=19, $fn=60);
    translate([0,-2,0]) rotate([90,0,0]) cylinder(d=11.35, h=1, $fn=60);
    if(safe_zone){
        rotate([90,0,0]) #cylinder(d=10, h=19, $fn=60);
    }
}

module button_light(nut_offset=10){
    translate([0,0,17]) cylinder(d=7.45, h=1, $fn=60);
    translate([0,0,15]) cylinder(d1=13.75, d2=10, h=1.95, $fn=60);
    cylinder(d=11.88, h=15, $fn=60);

    translate([0,0,12.5-nut_offset]) cylinder(d=13.85, h=2.27, $fn=6);
    for(R=[0,90,180,270]) rotate([0,0,R]) translate([-1,4,-3.9]) cube([2,.5,4]);
}

module nut_cutout(thickness=main_thickness+0.1, length=10){
    cube([5.6,2.5,thickness], center=true);
    translate([0, (length/2), 0]) cube([3,length+10,thickness], center=true);
}

module m3_square_nut(){
    difference(){
        cube([5.5,5.5,2.5], center=true);
        cylinder(d=2.85, h=2.75, center=true, $fn=60);
    }
}
