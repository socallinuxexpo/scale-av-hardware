include <parts.scad>
sheet();
projection(cut=true) 
union(){
	translate([-100,100,0]) rotate([0,0,90]) side(side="right");
	translate([-100,19,0]) rotate([0,0,90]) side(side="left");
	translate([136,0,0]) rotate([0,0,0]) back();
	translate([215,0,0]) rotate([0,0,0]) front();
}
