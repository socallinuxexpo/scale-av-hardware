include <tesmart.scad>
include <motherboard.scad>
include <parts.scad>

module 6mm_sheet2(second="right"){
	sheet();
	translate([-100,100,0]) rotate([0,0,90]) side();
	translate([-100,15,0]) rotate([0,0,90]) side(side="right");
	translate([-100,-70,0]) rotate([0,0,90]) side(side=second);
	translate([140,0,0]) rotate([0,0,0]) back();
  if(second=="right"){
    translate([220,0,0]) rotate([0,0,0]) back();
  }
}
module 6mm_sheet2_old(){
	sheet();
	translate([-100,100,0]) rotate([0,0,90]) side();
	translate([-100,0,0]) rotate([0,0,90]) side(side="right");
	translate([-150,-100,0]) rotate([0,0,90]) back();
	translate([150,-100,0]) rotate([0,0,90]) front();
}

module 6mm_fronts(){
	sheet();
	translate([255,0,0]) front();
	translate([175,0,0]) front();
	translate([95,0,0]) front();
	translate([15,0,0]) front();
	translate([-65,0,0]) front();
	translate([-145,0,0]) front();
	translate([-225,0,0]) front();
}

//6mm_sheet2(second="left");
6mm_sheet2();
//6mm_fronts();