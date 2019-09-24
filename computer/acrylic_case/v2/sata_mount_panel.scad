include<parts.scad>

projection(cut=true) sata_mount_panel();

module sata_mount_panel(){
    difference(){
        hull() for(X=[-1,1]) translate([-45*X,0, 0,]) cylinder(d=9, h=top_thickness, center=true, $fn=60);
        for(X=[-45,15,45]) translate([X,0, 0,]) cylinder(d=3, h=top_thickness+0.1, center=true, $fn=60);
    }
    for(X=[-10,30]) translate([X,5,0]) tab(length=10, width=main_thickness, thickness=top_thickness);

}
