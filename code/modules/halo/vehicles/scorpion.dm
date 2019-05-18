
/obj/vehicles/scorpion_tank
	name = "M808B Scorpion"
	desc = "The M808B Main Battle Tank is equipped with a 90mm cannon loaded with HE shells and a linked machine gun firing 7.62mm AP rounds. This will present a great foe to any force."

	icon = 'code/modules/halo/vehicles/Scorpion.dmi'
	icon_state = "move"
	anchored = 1

	bound_height = 64
	bound_width = 96

	comp_prof = /datum/component_profile/scorpion

	vehicle_move_delay = 5
	exposed_positions = list("passenger" = 40,"gunner" = 5)

	occupants = list(4,1)

	vehicle_size = 64

	move_sound = 'code/modules/halo/sounds/scorp_move.ogg'

	vehicle_view_modifier = 1.3

	light_color = "#E1FDFF"

/obj/item/vehicle_component/health_manager/scorpion
	integrity = 750
	resistances = list("brute"=65,"burn"=50,"emp"=40,"bomb"=65)
	repair_materials = list("plasteel")

/datum/component_profile/scorpion
	pos_to_check = "gunner"
	gunner_weapons = list(/obj/item/weapon/gun/vehicle_turret/switchable/scorpion_cannon)
	vital_components = newlist(/obj/item/vehicle_component/health_manager/scorpion)
	cargo_capacity = 8 //Can hold, at max, two normals

/obj/item/weapon/gun/vehicle_turret/switchable/scorpion_cannon
	name = "Scorpion Cannon"
	desc = "A slow firing but devastatingly damaging cannon."

	projectile_fired = /obj/item/projectile/bullet/scorp_cannon

	fire_delay = 5 SECONDS
	fire_sound = 'code/modules/halo/sounds/scorp_cannon_fire.ogg'

	burst = 1

	guns_switchto = newlist(/datum/vehicle_gun/scorp_cannon,/datum/vehicle_gun/scorp_machinegun)

/datum/vehicle_gun/scorp_cannon
	name = "Scorpion Cannon"
	desc = "A slow firing but devastatinly damaging cannon."
	burst_size = 1
	burst_delay = 1
	fire_delay = 5 SECONDS
	fire_sound = 'code/modules/halo/sounds/scorp_cannon_fire.ogg'
	proj_fired = /obj/item/projectile/bullet/scorp_cannon

/datum/vehicle_gun/scorp_machinegun
	name = "Scorpion Machinegun"
	desc = "A short burst machinegun, used for anti-infantry purposes."
	burst_size = 3
	burst_delay = 0.1 SECONDS
	fire_delay = 0.5 SECONDS
	fire_sound = 'code/modules/halo/sounds/scorp_machinegun_fire.ogg'
	proj_fired = /obj/item/projectile/bullet/a762_ap

/obj/item/projectile/bullet/scorp_cannon
	damage = 50
	damage_type = "bomb"
	armor_penetration = 25

/obj/item/projectile/bullet/scorp_cannon/on_impact(var/atom/impacted)
	explosion(impacted,0,1,4,5,guaranteed_damage = 50,guaranteed_damage_range = 2)
	. = ..()

/obj/item/projectile/bullet/scorp_cannon/attack_mob()
	damage_type = BRUTE
	damtype = BRUTE
	return ..()
