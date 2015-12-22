// **************************************************
// Camera mount for SCaLe
// **************************************************
include <CommonStuff.scad>

// For STL output
CameraMount();
//translate([0,0,4]) rotate([0,90,0]) PowerSplitterClamp();

$fn=90;
Overlap=0.05;

module CameraMount(){
	PostOD_r=18;
	
	// Base
	difference(){
		union(){
			translate([0,78,0]) cylinder(r=70,h=10);
			translate([-59,0,0]) cube([118,78,10]);
		} // union
		translate([0,78,3]) cylinder(r1=65,r2=67,h=10);
		translate([-56,3,3]) cube([112,78,10]);
		
		//Bolt holes
		translate([0,78,-Overlap]) {
			cylinder(r=3.5,h=6);
			translate([0,50,0]) cylinder(r=1.8,h=6);
			rotate([0,0,120]) translate([0,50,0]) cylinder(r=1.8,h=6);
			rotate([0,0,-120]) translate([0,50,0]) cylinder(r=1.8,h=6);
		}
		
		//bolt holes
		translate([-14,4,-Overlap]){
		translate([0,6,0]) cylinder(r=1.7,h=10);
		translate([0,26,0]) cylinder(r=1.7,h=10);}
		translate([14,4,-Overlap]){
		translate([0,6,0]) cylinder(r=1.7,h=10);
		translate([0,26,0]) cylinder(r=1.7,h=10);}
	} // diff
/**/
	
	// Clamping and Pipe
	translate([0,78,2.9])
	difference(){
		union(){
			cylinder(r1=25, r2=23, h=45);
		
			hull(){
			translate([0,0,27]) rotate([-90,0,0]) cylinder(r=10,h=30);
				translate([-10,25,0]) cube([20,10,1]);
			}
		} // union
		
		translate([-5.6,0,27-5.6]) cube([11.2,25,11.2]);
		translate([0,0,27]) rotate([-90,0,0]) cylinder(r=3.5,h=35);
		
		translate([0,0,-Overlap]) cylinder(r=PostOD_r, h=46);
		//cylinder(r=3.5,h=6);
	} // diff
	
	// Gussetts
	translate([0,78,2.9])
	for (J=[0:5]) rotate([0,0,J*60])
		difference(){
		hull(){
			translate([20,-4.5,0]) cube([0.1,9,35]);
			translate([64,0,0]) cylinder(r=4,h=0.1);
		} // hull
		
		translate([35,-4.7,15]) rotate([-90,0,0]) cylinder(r=3,h=20);
	} // diff
	/**/
} // CameraMount

//CameraMount();


// 24x54

module PowerSplitterClamp(){
	
	difference(){
		cube([8,32,60],center=true);
		cube([8+Overlap,24.4,54.4],center=true);
	} // diff
	translate([-4,-16,-40])
	difference(){
		cube([8,32,10]);
		translate([4,6,-Overlap]) rotate([0,180,0]) BoltHole();
		translate([4,26,-Overlap]) rotate([0,180,0]) BoltHole();
	} // diff
} // PowerSplitterClamp

//translate([14,20,43]) PowerSplitterClamp();
//translate([-14,20,43]) PowerSplitterClamp();

















