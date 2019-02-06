include <tesmart.scad>;
include <motherboard.scad>;
include <parts.scad>;

module 3mm_sheet1(){
  sheet();
  translate([-100,0,0]) rotate([0,0,90]) top_plate();
  translate([205,115,0]) rotate([0,0,90]) dc_mount();
  translate([205,135,0]) dc_mount_s();
  translate([135,55,0]) usb_mount_brace();

  translate([120,120,0]) back_support();
  translate([160,120,0]) back_support();
  translate([200,120,0]) back_support2();
  translate([240,120,0]) mount_support();
  translate([280,120,0]) front_right_support();
}

3mm_sheet1();
