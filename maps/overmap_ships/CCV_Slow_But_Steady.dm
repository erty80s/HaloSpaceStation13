
#include "_om_ship_areas_definition.dm"

/obj/effect/overmap/ship/CCV_sbs
	name = "CCV Slow But Steady"
	desc = "A cargo freighter with a safer, isolated design."

	icon = 'maps/first_contact/slowbutsteady.dmi'
	icon_state = "ship"
	fore_dir = WEST
	vessel_mass = 4


	map_bounds = list(7,49,73,27)

/area/om_ships/caelum
	name = "CCV Slow But Steady"
	has_gravity = 0
