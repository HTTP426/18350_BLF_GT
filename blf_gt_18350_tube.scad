$fn=200;

use <threads.scad>; //http://dkprojects.net/openscad-threads/threads.scad

thread_od = 51.9; // threads extend slightly beyond this
thread_pitch = 2; 
thread_length = 15;
thread_size = 1.5; // width of each thread (not pitch)

tube_od = thread_od;
tube_id = 46;
total_length = 44; // 44mm suits unmodified 40mm carrier standoffs

sideplate_len = 10;
sideplate_angle = 40;
sideplate_inset = 1;


module threaded_section(){
	metric_thread(thread_od, thread_pitch, thread_length, internal=false, n_starts=1, square=true, thread_size=thread_size);
}


module g(){
	linear_extrude(height=1) text("G",font="Comic Sans MS:style=Regular",valign="center",halign="center");
}


module tube(){
	difference(){
		union(){
			threaded_section();
			translate([0,0,total_length-thread_length]) threaded_section();
			translate([0,0,thread_length]) cylinder(d=tube_od, h=total_length-2*thread_length);
			//#cylinder(d=52.8,h=10);
		}
		translate([0,0,-1]) cylinder(d=tube_id, h=total_length+2);
		// Milled flat sections
		for(rot=[0,90,180,270]){
			rotate([0,0,rot+45]) translate([thread_od/2-sideplate_inset,-20,-sideplate_len/2+total_length/2]){
				cube(size=[40,40,sideplate_len]);
				rotate([0,sideplate_angle,0]) cube(size=[40,40,sideplate_len]);
				translate([0,0,sideplate_len]) rotate([0,-sideplate_angle,0]) translate([0,0,-sideplate_len]) cube(size=[40,40,sideplate_len]);
			}
		}
		// rotate([0,0,45]) translate([thread_od/2-sideplate_inset-0.5,0,total_length/2+0.2]) rotate([90,90,90]) linear_extrude(height=10) 
		// 	text("G",font="Comic Sans MS:style=Regular",valign="center",halign="center");
	}
}



tube();
//g();