jib_width=100;
bed_width=700;
bed_depth=500;
sheet_width=24*25.4;
sheet_depth=12*25.4;
slop=0.5;

//model_layout();
//cut_layout();
alignment_jig();

module model_layout(){
  %translate([0,0,0]) cube([bed_width,bed_depth,1], center=true);
  translate([0,0,0]) color("green") cube([sheet_width,sheet_depth,6], center=true);
  
  translate([bed_width/2-jib_width,-bed_depth/2,0]) alignment_jig();

  mirror([1,0,0]) translate([bed_width/2-jib_width,-bed_depth/2,0]) alignment_jig();
}

module alignment_jig(width=jib_width){
  corner_diameter=30;
  difference(){
    //%cube([width,bed_depth,6]);
    translate([(width/2),bed_depth/2,0]) hull() for(X=[-1,1], Y=[-1,1]) translate([((width-corner_diameter)*X/2),(bed_depth-corner_diameter)*Y/2,0]) cylinder(d=corner_diameter, h=6);
    translate([slop/2-(bed_width-sheet_width)/2,((bed_depth-sheet_depth)/2)+slop,-1]) cube([width+slop,sheet_depth+slop,6+2]);
    translate([width/2,width/2,2]) cylinder(d=40, center=true, h=10);
    translate([width/2,bed_depth-width/2,2]) cylinder(d=40, center=true, h=10);
  }
}

module cut_layout(){
  %cube([sheet_width,sheet_depth,6], center=true);
  translate([200,50,0]) rotate([0,0,90]) alignment_jig();
  translate([-200,105,0]) rotate([0,0,270]) alignment_jig();
}