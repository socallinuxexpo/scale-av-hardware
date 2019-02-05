include <tesmart.scad>
include <motherboard.scad>
include <parts.scad>

sheet();

projection(cut = true) union(){
    translate([-100,100,0]) rotate([0,0,90]) side();
    translate([-100,0,0]) rotate([0,0,90]) side(side="right");
    translate([-150,-100,0]) rotate([0,0,90]) back();
    translate([150,-100,0]) rotate([0,0,90]) front();
}
