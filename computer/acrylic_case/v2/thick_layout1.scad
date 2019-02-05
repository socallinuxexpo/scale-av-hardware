include <tesmart.scad>
include <motherboard.scad>
include <parts.scad>

sheet();
projection(cut = true) union(){
    translate([-100,0,0]) rotate([0,0,90]) bottom_plate();
    translate([170,0,main_thickness/2]) rotate([0,0,90]) mount_plate();
    for(Y=[-1,1]) translate([270,35*Y,0]) rotate([0,0,90]) usb_sides(thickness=main_thickness);
}