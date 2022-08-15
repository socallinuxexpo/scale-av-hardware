// **************************************************
// Camera mount for SCaLE
// **************************************************
include <CommonStuff.scad>

// For STL output cxccx
CameraMount(outer_rad=55);

$fn=90;
Overlap=0.05;

module CameraMount(outer_rad=55, hole_rad=50){
  PostOD_r=18;
	
  // Base
  difference(){
    union(){
      translate([0,78,0]) cylinder(r=outer_rad,h=10);
    } // union
    translate([0,78,3]) cylinder(r1=outer_rad-4,r2=outer_rad-3,h=10);
		
    //Bolt holes
    translate([0,78,-Overlap]) {
      cylinder(r=3.5,h=6);
      for(R=[0,120,240]) rotate([0,0,R])
        translate([0,hole_rad,0]){
          cylinder(r=1.8,h=6);
          translate([0,0,3]) cylinder(d=7,h=10);
        }
      }
  } // diff
/**/
	
  // Clamping and Pipe
  translate([0,78,2.9])
    difference(){
      union(){
        cylinder(r1=25, r2=23, h=45);
		
        hull(){
          translate([0,0,27]) 
            rotate([-90,0,0]) cylinder(r=10,h=30);
          translate([-10,25,0]) cube([20,10,1]);
        }
        hull(){
          translate([0,5,27]) 
            rotate([-90,0,0]) cylinder(r=6,h=30);
          translate([0,25,0]) cube([12,10,1],center=true);
        }
      } // union
		
      translate([-5.6,0,27-5.6]) cube([11.2,25,11.2]);
      translate([0,0,27]) rotate([-90,0,0]) 
        cylinder(r=3.5,h=40);
		
      translate([0,0,-Overlap]) cylinder(r=PostOD_r, h=46);
    } // diff
	
  // Gussetts
  translate([0,78,2.9])
    for (J=[0:5]) rotate([0,0,J*60])
      difference(){
		hull(){
          translate([20,-4,0]) cube([0.1,8,1]);
          translate([20,0,40]) 
            rotate([0,90,0]) cylinder(r=4,h=1);
          translate([outer_rad-4,0,0]) cylinder(r=4,h=0.1);
        } // hull
		
      translate([32.5,0,15]) 
        rotate([-90,0,0]) cylinder(r=3,h=20,center=true);
      } // diff
} // CameraMount

