
/obj/item/weapon/gun/projectile/fuel_rod_launcher
	name = "Type-33 Light Anti-Armor Weapon"
	desc = "A man-portable weapon capable of inflicting heavy damage on both vehicles and infantry."
	icon = 'code/modules/halo/icons/fuel_rod_cannon.dmi'
	icon_state = "fuel_rod"
	item_state = "fuel_rod"
	fire_sound = 'code/modules/halo/sounds/fuel_rod_fire.ogg'
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/fuel_rod
	fire_delay = 6
	one_hand_penalty = -1
	caliber = "fuel rod"
	handle_casings = CASELESS
	w_class = ITEM_SIZE_HUGE
	item_icons = list(
		slot_l_hand_str = 'code/modules/halo/weapons/icons/Weapon_Inhands_left.dmi',
		slot_r_hand_str = 'code/modules/halo/weapons/icons/Weapon_Inhands_right.dmi',
		)
	slowdown_general = 2

/obj/item/weapon/gun/projectile/fuel_rod_launcher/update_icon()
	if(ammo_magazine)
		icon_state = "fuel_rod_loaded"
	else
		icon_state = "fuel_rod"
