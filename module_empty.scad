// Creates an empty module

/* [Case Dimensions] */

// diameter of the base
base_diameter = 62.8; //[62.8:Small, 80:Medium, 100:Large, 130:XLarge]
// thickness of outer wall
wall_thickness = 2; //[2:0.5:5]
// height of the module
module_height = 20; //[10:5:100]
// enable rim
enable_rim = true;
// rim height
rim_height = 1.2; // [.5: .1: 2]

/* [Hidden] */

$fn = 128;
base_radius = base_diameter / 2;

use <common.scad>

module empty(base_radius, empty_height, wall_thickness, enable_rim) {
	// outer shell
	shell(base_radius*2, empty_height, wall_thickness, false);

	// male connectors (to module below)
	connectors_male(90, base_radius, wall_thickness);
	connectors_male(270, base_radius, wall_thickness);

	// female connectors (to module above)
	connectors_female(90, base_radius, empty_height, wall_thickness);
	connectors_female(270, base_radius, empty_height, wall_thickness);

	if (enable_rim) {
		rim(base_radius, empty_height, wall_thickness, rim_height);
	}
}

empty(base_radius, module_height, wall_thickness, enable_rim);
