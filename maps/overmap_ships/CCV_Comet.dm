
#include "_om_ship_areas_definition.dm"

/obj/effect/overmap/ship/CCV_comet
	name = "Civilian Vessel"
	desc = "A Civilian vessel with a traditional cargo-hauler design."

	icon = 'maps/first_contact/freighter.dmi'
	icon_state = "ship"
	fore_dir = WEST

	map_bounds = list(102,160,154,117)

/area/om_ships/comet
	name = "CCV Comet"

/area/om_ships/comet/cometrockets
	name = "CCV Comet - Rocket Pods"

/obj/machinery/overmap_weapon_console/deck_gun_control/local/comet
	deck_gun_area = /area/om_ships/comet

/obj/machinery/overmap_weapon_console/deck_gun_control/local/missile_control/comet
	deck_gun_area = /area/om_ships/comet/cometrockets
