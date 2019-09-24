include <tesmart.scad>
include <motherboard.scad>
include <parts.scad>

module 6mm_all(){
	translate([-100,0,0]) rotate([0,0,90]) bottom_plate();
	translate([170,0,main_thickness/2]) rotate([0,0,90]) mount_plate();

	translate([-100,190,0]) rotate([0,0,90]) side();
	translate([-100,280,0]) rotate([0,0,90]) side(side="right");
	translate([-150,-190,0]) rotate([0,0,90]) back();
	translate([150,-190,0]) rotate([0,0,90]) front();

	translate([110,190,0]) rotate([0,0,90]) usb_sides(thickness=main_thickness);
	translate([140,190,0]) rotate([0,0,90]) usb_sides(thickness=main_thickness);
}

/*6mm_all();*/
projection(cut = true) 6mm_all();
