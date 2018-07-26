$fn=100;

up_height = 90;
wall = 3;
middle = 5;

out_x = middle+2*wall;
width = 20;

difference(){
	union(){
		translate([middle/2+wall,up_height-out_x/2,0]) difference(){
			cylinder(d=out_x,h=width);	
			translate([0,0,-1]) cylinder(d=middle,h=width+2);
			translate([-20,-40,-1]) cube(40);
		}

		cube(size=[wall,up_height-out_x/2,width]);

		translate([wall+middle, 40,width/2]) rotate([0,90,0]) cylinder(d=width,h=wall);

		translate([wall+middle, 40, 0]) cube(size=[wall,up_height-40-out_x/2,width]);
	}
	translate([-1,15,width/2]) rotate([0,90,0]) cylinder(d=7,h=wall+2);
}