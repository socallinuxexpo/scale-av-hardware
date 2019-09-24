include <parts.scad>

//projection(cut=true) side(side=side);
side();
translate([100,0,0]) side(side="right");

module side(side="left"){
    
    difference(){
        cube([internal_height, 380+main_thickness*2, main_thickness], center=true);
        for(Y=[70,120,170]) translate([7,Y,0]) cylinder(d=3, h=20, center=true, $fn=60);
        for(Y=[185,45]) translate([22.5,Y,0]) cube([10,top_thickness+0.1,main_thickness+0.1], center=true);
        if(side=="left"){
          
            translate([0,-((380+main_thickness)/2),0]) tab(length=right_tab, width=main_thickness+0.01, thickness=main_thickness+0.01);
            translate([0,((380+main_thickness)/2),0]) tab(length=left_tab, width=main_thickness+0.01, thickness=main_thickness+0.01);
            translate([-20,-175,-(main_thickness/2)-0.1]) scale([0.75,0.8,1]) scale_av();
        }
        else{
          
            translate([0,-((380+main_thickness)/2),0]) tab(length=left_tab, width=main_thickness+0.01, thickness=main_thickness+0.01);
            translate([0,((380+main_thickness)/2),0]) tab(length=right_tab, width=main_thickness+0.01, thickness=main_thickness+0.01);
            for(Y=[-45,-15,45]) translate([-1,118+Y,0,]) cylinder(d=3, h=main_thickness+0.1, center=true, $fn=60);
            translate([-20,38,-(main_thickness/2)-0.1]) scale([0.75,0.8,1]) mirror([0,1,0]) scale_av();
        }
        for(O=[0:12:110]) translate([28,175-O,0]) hull(){
            cylinder(d=6, h=main_thickness+0.1, center=true, $fn=60);
            translate([-10,-10,0]) cylinder(d=6, h=main_thickness+0.1, center=true, $fn=60);
        }
        if( front_panel_thickness != main_thickness){
            translate([0, 5+(380/2)+front_panel_thickness, 0]) cube([internal_width+0.001, 10, main_thickness+0.001], center=true);
        }
    }
    for(Y=[-1,0,1]) translate([-((internal_height+top_thickness)/2),120*Y,0])
        tab(length=top_thickness+0.1, width=tab_width+0.1, thickness=main_thickness+0.1);
    for(Y=[-1,0,1]) translate([((internal_height+main_thickness)/2),120*Y,0]) tab();
}
