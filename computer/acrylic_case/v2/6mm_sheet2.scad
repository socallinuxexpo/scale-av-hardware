include <tesmart.scad>
include <motherboard.scad>
include <parts.scad>

module 6mm_sheet2(){
	sheet();
	translate([-100,100,0]) rotate([0,0,90]) side();
	translate([-100,0,0]) rotate([0,0,90]) side(side="right");
	translate([-150,-100,0]) rotate([0,0,90]) back();
	translate([150,-100,0]) rotate([0,0,90]) front();
}

6mm_sheet2();
