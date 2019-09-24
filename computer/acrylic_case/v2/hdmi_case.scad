include <tesmart.scad>
include <motherboard.scad>
include <sata_mount.scad>
include <parts.scad>



rotate([0,0,180]) hdmi_case();

module hdmi_case(){
    xlr_height=40;
    hdmi_height=63;
    translate([45,-100,0]) rotate([0,0,90]) motherboard();
    translate([0,115,12.5]) TESmart();

    translate([34,(380/2)+1.5+front_panel_thickness,xlr_height]) rotate([0,0,180]) xlr_cat6();
    translate([7,(380/2)+1.5+front_panel_thickness,xlr_height-4]) rotate([0,0,180]) xlr_635();
    translate([-20,(380/2)+1.5+front_panel_thickness,xlr_height-4]) rotate([0,0,180]) xlr_635();

    translate([130,(380/2)-15+front_panel_thickness,60]) rotate([-90,0,0]) button_light(nut_offset=6);
    translate([130,(380/2)+3,40]) power_connector();

    translate([130,(380/2)-1,40]) rotate([90,0,0]) dc_mount();
    translate([-132,(380/2)+3,63]) power_connector();
    translate([-132,(380/2)-1,63]) rotate([90,0,0]) dc_mount_s();



    translate([0,120,31.35]) mount_plate();

    translate([90-7,180,50]) rotate([-90,0,0]) screen();

    translate([35-6,(380/2)-7.5,hdmi_height]) rotate([0,0,180]) hdmi_panelmount();
    translate([-10,(380/2),hdmi_height-2.5]) rotate([0,0,180]) dual_usb_panelmount();
    translate([-65,(380/2)-7.5,hdmi_height]) rotate([0,0,180]) hdmi_panelmount();
    translate([-105,(380/2)-7.5,hdmi_height]) rotate([0,0,180]) hdmi_panelmount();
    translate([-3.5,-2,0]){
      translate([-34.5,190,31.5]) rotate([0,0,180]) sata_mount();
      translate([-32.5,120,36]) rotate([-90,0,-90]) sata_mount_panel();
    }

//    translate([0,10,35]) %cube([280, 380, internal_height], center=true);


    %translate([((internal_width/2)-(main_thickness/2)),0,(internal_height/2)]) rotate([0,90,0]) side();
    %translate([-((internal_width/2)-(main_thickness/2)),0,(internal_height/2)]) rotate([0,90,0]) side(side="right");
    translate([0,-(380/2)-(main_thickness/2),(internal_height/2)]) rotate([0,90,-90]) back();
    translate([0,(380/2)+front_panel_thickness/2,(internal_height/2)]) rotate([0,90,-90]) front();

    translate([115,185,12.5]) rotate([0,90,90]) mount_support();
    translate([-115,185,12.5]) rotate([0,90,-90]) front_right_support();
    for(X=[-1,1]) translate([115*X,45,12.5]) rotate([0,-90,90*X]) back_support2();

    translate([60,90,37.6]) rotate([0,0,45]){
        usb_capture();
        for(X=[-1,1]) translate([(20+(main_thickness/2)+.5)*X,0,0]) rotate([-90,0,90]) usb_sides(thickness=main_thickness);
        translate([0,0,main_thickness+top_thickness/2]) usb_mount_brace();
    }
    translate([0,0,-(main_thickness/2)]) bottom_plate();
    %translate([0,0,internal_height+(top_thickness/2)]) top_plate();
}
