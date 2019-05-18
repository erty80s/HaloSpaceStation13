
/obj/item/weapon/gun/energy/plasmapistol
	name = "Type-25 Directed Energy Pistol"
	desc = "A dual funtionality pistol: It fires bolts of plasma, and when overcharged is capable of emitting a small emp burst at the point of impact."
	icon = 'code/modules/halo/icons/Covenant Weapons.dmi'
	icon_state = "Plasma Pistol"
	slot_flags = SLOT_BELT|SLOT_HOLSTER|SLOT_POCKET|SLOT_BACK
	fire_sound = 'code/modules/halo/sounds/haloplasmapistol.ogg'
	charge_meter = 1
	max_shots = 80
	slowdown_general = 0
	var/overcharge = 0
	projectile_type = /obj/item/projectile/covenant/plasmapistol
	screen_shake = 0
	irradiate_non_cov = 2
	var/overcharge_cost = 1
	sprite_sheets = list(
		"Tvaoan Kig-Yar" = null,\
		"Jiralhanae" = null,\
		"Sangheili" = null\
		)

/obj/item/weapon/gun/energy/plasmapistol/New()
	. = ..()
	overcharge_cost = initial(charge_cost)*(max_shots/2)

/obj/item/weapon/gun/energy/plasmapistol/attack_self(var/mob/user)
	if(power_supply.charge >= overcharge_cost)
		set_overcharge(!overcharge, user)

/obj/item/weapon/gun/energy/plasmapistol/proc/cov_plasma_recharge_tick()
	if(max_shots > 0)
		if(power_supply.charge < power_supply.maxcharge)
			power_supply.give(charge_cost/3)
			update_icon()
			return 1

/obj/item/weapon/gun/energy/plasmapistol/consume_next_projectile()
	.  = ..()
	if(overcharge)
		set_overcharge(0)

/obj/item/weapon/gun/energy/plasmapistol/proc/set_overcharge(var/new_overcharge = 1, var/mob/user = null)
	if(new_overcharge != overcharge)
		if(new_overcharge)
			if(user)
				visible_message("<span class='notice'>[user.name]'s [src]'s lights brighten</span>","<span class='notice'>You activate your [src]'s overcharge</span>")
			projectile_type = /obj/item/projectile/covenant/plasmapistol/overcharge
			charge_cost = overcharge_cost
			overcharge = 1
			overlays += "overcharge"
			set_light(3, 1, "66FF00")
		else
			if(user)
				visible_message("<span class='notice'>[user.name]'s [src]'s lights darken</span>","<span class='notice'>You deactivate your [src]'s overcharge</span>")
			projectile_type = initial(projectile_type)
			overcharge = 0
			charge_cost = initial(charge_cost)
			overlays -= "overcharge"
			set_light(0, 0, "66FF00")

/obj/item/weapon/gun/energy/plasmapistol/disabled
	desc = "A dual funtionality pistol: It fires bolts of plasma, and when overcharged is capable of emitting a small emp burst at the point of impact. This one appears to be disabled"
	max_shots = 0

/obj/item/weapon/gun/energy/plasmapistol/disabled/attack_self(var/mob/user)
 return

/obj/item/weapon/gun/energy/plasmapistol/trainingpistol
	name = "Type-25B Directed Energy (Training) Pistol"
	desc = "A dual funtionality pistol: It fires bolts of plasma, and when overcharged is capable of emitting a small emp burst at the point of impact. This one appears to be modified to fire very weak bolts of energy."
	icon = 'code/modules/halo/icons/Covenant Weapons.dmi'
	icon_state = "Training Pistol"
	projectile_type = /obj/item/projectile/covenant/trainingpistol

/obj/item/weapon/gun/energy/plasmapistol/trainingpistol/set_overcharge(var/new_overcharge = 1, var/mob/user = null)
	return

/obj/item/weapon/gun/projectile/needler // Uses "magazines" to reload rather than inbuilt cells.
	name = "Type-33 Guided Munitions Launcher"
	desc = "This weapon fire razor-sharp crystalline shards which can explode violently when embedded into targets."
	icon = 'code/modules/halo/icons/Covenant Weapons.dmi'
	icon_state = "Needler"
	item_state = "needler"
	slot_flags = SLOT_BELT||SLOT_HOLSTER
	fire_sound = 'code/modules/halo/sounds/needlerfire.ogg'
	magazine_type = /obj/item/ammo_magazine/needles
	handle_casings = CLEAR_CASINGS
	caliber = "needler"
	load_method = MAGAZINE
	burst = 3
	is_heavy = 1
	slowdown_general = 0

	item_icons = list(
		slot_l_hand_str = 'code/modules/halo/weapons/icons/Weapon_Inhands_left.dmi',
		slot_r_hand_str = 'code/modules/halo/weapons/icons/Weapon_Inhands_right.dmi',
		)
	sprite_sheets = list(
		"Tvaoan Kig-Yar" = null,\
		"Jiralhanae" = null,\
		"Sangheili" = null\
		)
