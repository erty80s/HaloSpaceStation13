
/obj/machinery/overmap_weapon_console/deck_gun_control/missile_control
	name = "Missile Control Console"

/obj/machinery/overmap_weapon_console/deck_gun_control/missile_control/New()
	if(isnull(control_tag))
		control_tag = "missile_control - [z]"

/obj/machinery/overmap_weapon_console/deck_gun_control/local/missile_control
	name = "Local Missile Control Console"
	fire_sound = 'code/modules/halo/sounds/deck_gun_fire.ogg'
	fired_projectile = /obj/item/projectile/overmap/missile
	deck_gun_area = null

/obj/machinery/overmap_weapon_console/deck_gun_control/local/missile_control/New()
	if(isnull(control_tag))
		control_tag = "missile_control - [z]"

//Missile "deck gun"//
/obj/machinery/deck_gun/missile_pod
	name = "Missile Pod"
	desc = "Holds the machinery for loading and firing missiles."
	icon = 'code/modules/halo/overmap/weapons/deck_missile_pod.dmi'
	icon_state = "missile_pod"
	fire_sound = 'code/modules/halo/sounds/rocket_pod_fire.ogg'
	fired_projectile = /obj/item/projectile/overmap/missile
	round_reload_time = 25 SECONDS
	rounds_loaded = 4
	max_rounds_loadable = 4

/obj/machinery/deck_gun/missile_pod/return_list_addto()
	return list(src,src,src,src)

//Projectiles//
/obj/item/projectile/overmap/missile
	name = "missile"
	desc = "An explosive warhead on the end of a guided thruster."
	icon = 'code/modules/halo/overmap/weapons/deck_missile_pod.dmi'
	icon_state = "missile_om_proj"
	ship_damage_projectile = /obj/item/projectile/missile_damage_proj
	ship_hit_sound = 'code/modules/halo/sounds/om_proj_hitsounds/rocketpod_missile_impact.wav'
	step_delay = 0.75 SECOND

/obj/item/projectile/overmap/missile/sector_hit_effects(var/z_level,var/obj/effect/overmap/hit,var/list/hit_bounds)

/obj/item/projectile/missile_damage_proj
	name = "missile"
	desc = "An explosive warhead on the end of a guided thruster."
	icon = 'code/modules/halo/overmap/weapons/deck_missile_pod.dmi'
	icon_state = "missile"
	damage = 0 //It's a missile, it has no innate damage.

/obj/item/projectile/missile_damage_proj/on_impact(var/atom/impacted)
	if(!istype(impacted,/obj/effect/shield))
		explosion(loc,-1,2,4,5, adminlog = 0)
	var/obj/effect/overmap/sector/S = map_sectors["[src.z]"]
	S.adminwarn_attack()
	. = ..()
