include <tesmart.scad>;
include <motherboard.scad>;
include <parts.scad>;

module 3mm_sheet1(){
  sheet();
  translate([-100,0,0]) rotate([0,0,90]) top_plate();
  translate([135,55,0]) usb_mount_brace();

  translate([120,120,0]) back_support();
  translate([160,120,0]) back_support2();
  translate([120,-2.5,0]) mount_support();
  translate([120,-60,0]) front_right_support();
  translate([145,-30,0]) rotate([0,0,-90]) sata_mount_panel();
  //translate([160,-30,0]) rotate([0,0,90]) sata_mount_panel();
}

3mm_sheet1();
