include <parts.scad>
sheet();
projection(cut=true) union(){
	translate([185,0,main_thickness/2]) rotate([0,0,-90]) mount_plate();
	translate([-100,100,0]) rotate([0,0,90]) side(side="right");
	translate([-100,15,0]) rotate([0,0,90]) side(side="left");
	translate([-150,-70,0]) rotate([0,0,90]) front();
}
