include<parts.scad>

projection(cut=true) mount_plate();

module mount_plate(){
    difference(){
        translate([0,-5,-3]) cube([280, 150, main_thickness], center=true); // Divider/mount
        for(X=[-1,1], Y=[-1,0,1]) translate([-133*X,50*Y,0-3]) rotate([0,0,90*X]) nut_cutout();

//        translate([6.5,41+20,-3]) cube([80,20,6.5], center=true);
        translate([6.5,0,-3]) hull(){
            for(X=[-1,1]) translate([38*X,40,0]) cylinder(d=4, h=6.5, center=true, $fn=60);
            translate([0,71,0]) cube([80,1,6.5], center=true);
        }
        for(X=[95,130, -95, -130], Y=[-75, 65]) translate([X,Y,-(main_thickness/2)+0.2]) tab(width=top_thickness+0.1, length=10+0.1);

        //cylinder(d=3, h=15, center=true, $fn=60);
        translate([60,-30,-(main_thickness/2)+0.2]) rotate([0,0,45]){
            for(X=[-1,1]) translate([(20+(main_thickness/2)+.5)*X,0,0]) rotate([0,0,90]) usb_mount_cutout();
        }

        // SATA mount cutout
        for(Y=[-10,30]) translate([-36,Y-22,-(main_thickness/2)]) rotate([0,0,90]) tab(length=10, width=top_thickness+0.01, thickness=main_thickness+0.5);
    }
}
