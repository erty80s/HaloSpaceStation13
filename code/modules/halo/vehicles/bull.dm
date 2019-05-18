
/obj/vehicles/bull
	name = "Bull APC"
	desc = "An old APC chassis with modern modifications and a mounted machine gun."

	icon = 'code/modules/halo/vehicles/Bull.dmi'
	icon_state = "bull"
	anchored = 1

	bound_height = 64
	bound_width = 96

	comp_prof = /datum/component_profile/bull

	vehicle_move_delay = 1.75

	occupants = list(4,1)
	exposed_positions = list("driver" = 5,"passenger" = 10,"gunner" = 30)

	vehicle_size = 64

	move_sound = 'code/modules/halo/sounds/warthog_move.ogg'

	light_color = "#FEFFE1"

/obj/vehicles/bull/update_object_sprites()
	. = ..()
	pixel_x = 0
	if(dir == WEST)
		pixel_x = -32

/obj/item/vehicle_component/health_manager/bull
	integrity = 500
	resistances = list("brute"=50,"burn"=45,"emp"=30,"bomb"=30)

/datum/component_profile/bull
	pos_to_check = "gunner"
	gunner_weapons = list(/obj/item/weapon/gun/vehicle_turret/warthog_turret)
	vital_components = newlist(/obj/item/vehicle_component/health_manager/bull)
	cargo_capacity = 32 //Can hold, at max, 8 normals