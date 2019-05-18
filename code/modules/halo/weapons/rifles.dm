


//MA5B assault rifle

/obj/item/weapon/gun/projectile/ma5b_ar
	name = "\improper MA5B Assault Rifle"
	desc = "Standard-issue service rifle of the UNSC Marines. Has an inbuilt underbarrel flashlight. Takes 7.62mm calibre magazines."
	icon = 'code/modules/halo/weapons/icons/Weapon Sprites.dmi'
	icon_state = "MA5-Base-Empty"
	item_state = "ma5b"
	caliber = "a762"
	slot_flags = SLOT_BACK
	fire_sound = 'code/modules/halo/sounds/Assault_Rifle_Short_Burst_Sound_Effect.ogg'
	//fire_sound_burst = 'code/modules/halo/sounds/Assault_Rifle_Short_Burst_Sound_Effect.ogg'
	reload_sound = 'code/modules/halo/sounds/AssaultRifle&BattleRifle_ReloadSound_Effect.ogg'
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/m762_ap/MA5B
	allowed_magazines = list(/obj/item/ammo_magazine/m762_ap/MA5B) //Disallows loading LMG boxmags into the MA5B
	burst = 3
	burst_delay = 1.5
	one_hand_penalty = -1
	dispersion = list(0)
	var/on = 0
	var/activation_sound = 'sound/effects/flashlight.ogg'
	w_class = ITEM_SIZE_LARGE

	item_icons = list(
		slot_l_hand_str = 'code/modules/halo/weapons/icons/Weapon_Inhands_left.dmi',
		slot_r_hand_str = 'code/modules/halo/weapons/icons/Weapon_Inhands_right.dmi',
		)

	firemodes = list(
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=6,    burst_accuracy=list(0,-1,-1),       dispersion=list(0.0, 0.6, 0.6)),
		list(mode_name="short bursts", 	burst=5, fire_delay=null, move_delay=6,    burst_accuracy=list(-1,-1,-2,-2,-3), dispersion=list(0.6, 1.0, 1.5, 1.5, 1.9)),
		)

	attachment_slots = list("barrel","underbarrel rail","upper rail","upper stock", "stock")
	attachments_on_spawn = list(/obj/item/weapon_attachment/ma5_stock_cheekrest,/obj/item/weapon_attachment/ma5_stock_butt,/obj/item/weapon_attachment/ma5_upper)

/obj/item/weapon/gun/projectile/ma5b_ar/can_use_when_prone()
	return 1

/obj/item/weapon/gun/projectile/ma5b_ar/New()
	..()

/obj/item/weapon/gun/projectile/ma5b_ar/MA37/update_icon()
	. = ..()
	if(ammo_magazine)
		icon_state = "MA5-Base-Loaded"
	else
		icon_state = "MA5-Base-Empty"

/obj/item/weapon/gun/projectile/ma5b_ar/proc/add_flashlight()
	verbs += /obj/item/weapon/gun/projectile/ma5b_ar/proc/toggle_light

/obj/item/weapon/gun/projectile/ma5b_ar/MA37/add_flashlight()
	return

/obj/item/weapon/gun/projectile/ma5b_ar/training
	magazine_type = /obj/item/ammo_magazine/m762_ap/MA5B/TTR

/obj/item/weapon/gun/projectile/ma5b_ar/MA37
	name = "\improper MA37 ICWS"
	desc = "Also formally known as the MA5. Takes 7.62mm ammo."
	icon_state = "MA37"
	magazine_type = /obj/item/ammo_magazine/m762_ap/MA37
	ammo_icon_state = null
	allowed_magazines = list(/obj/item/ammo_magazine/m762_ap/MA37)
	attachment_slots = null
	attachments_on_spawn = null

/obj/item/weapon/gun/projectile/ma5b_ar/MA37/update_icon()
	. = ..()
	if(ammo_magazine)
		icon_state = "MA37"
	else
		icon_state = "MA37_unloaded"

/obj/item/weapon/gun/projectile/ma5b_ar/proc/toggle_light()
	set category = "Weapon"
	set name = "Toggle Gun Light"
	on = !on
	if(on && activation_sound)
		playsound(src.loc, activation_sound, 75, 1)
		set_light(4)
	else
		set_light(0)

/obj/item/weapon/gun/projectile/ma5b_ar/MA3
	name = "\improper MA3 Assault Rifle"
	desc = "An obsolete military assault rifle commonly available on the black market. Takes 7.62mm ammo."
	icon_state = "MA3"
	magazine_type = /obj/item/ammo_magazine/m762_ap/MA3
	ammo_icon_state = null
	allowed_magazines = list(/obj/item/ammo_magazine/m762_ap/MA3)
	attachment_slots = null
	attachments_on_spawn = null
	burst_delay = 0.9
	fire_sound = 'code/modules/halo/sounds/MA3firefix.ogg'
	reload_sound = 'code/modules/halo/sounds/MA3reload.ogg'
	firemodes = list(
		list(mode_name="4-round bursts", burst=4, fire_delay=1, move_delay=6,    burst_accuracy=list(0,0,-1,-1),       dispersion=list(0.3, 0.9, 1.3, 1.6)),
		list(mode_name="short bursts", 	burst=6, fire_delay=1, move_delay=6,    burst_accuracy=list(0,0,-1,-1,-2,-2), dispersion=list(0.3, 0.7, 1.2, 1.2, 1.6, 1.6)),
		)

/obj/item/weapon/gun/projectile/ma5b_ar/MA3/update_icon()
	. = ..()
	if(ammo_magazine)
		icon_state = "MA3"
	else
		icon_state = "MA3_unloaded"


//BR85 battle

/obj/item/weapon/gun/projectile/br85
	name = "\improper BR85 Battle Rifle"
	desc = "When nothing else gets the job done, the BR85 Battle Rifle will do. Takes 9.5mm calibre magazines."
	icon = 'code/modules/halo/weapons/icons/Weapon Sprites.dmi'
	icon_state = "Br85"
	item_state = "br85"
	caliber = "9.5mm"
	slot_flags = SLOT_BACK
	fire_sound = 'code/modules/halo/sounds/BattleRifleShotSoundEffect.ogg'
	reload_sound = 'code/modules/halo/sounds/AssaultRifle&BattleRifle_ReloadSound_Effect.ogg'
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/m95_sap
	allowed_magazines = list(/obj/item/ammo_magazine/m95_sap)
	one_hand_penalty = -1
	burst = 3
	burst_delay = 0.5
	fire_delay = 2
	accuracy = 1
	w_class = ITEM_SIZE_LARGE
	dispersion=list(0.0, 0.6, 0.6)
	item_icons = list(
		slot_l_hand_str = 'code/modules/halo/weapons/icons/Weapon_Inhands_left.dmi',
		slot_r_hand_str = 'code/modules/halo/weapons/icons/Weapon_Inhands_right.dmi',
		)

/obj/item/weapon/gun/projectile/br85/verb/scope()
	set category = "Weapon"
	set name = "Use Scope"
	set popup_menu = 1

	toggle_scope(usr, 1.15)

/obj/item/weapon/gun/projectile/br85/update_icon()
	if(ammo_magazine)
		icon_state = "Br85"
	else
		icon_state = "Br85_unloaded"
	. = ..()

/obj/item/weapon/gun/projectile/br55
	name = "\improper BR55 Battle Rifle"
	desc = "The BR55 is an all-round infantry weapon with a 2x magnification scope."
	icon = 'code/modules/halo/weapons/icons/Weapon Sprites.dmi'
	icon_state = "BR55-Loaded-Base"
	item_state = "br85"
	magazine_type = /obj/item/ammo_magazine/m95_sap/br55
	allowed_magazines = list(/obj/item/ammo_magazine/m95_sap)
	caliber = "9.5mm"
	slot_flags = SLOT_BACK
	fire_sound = 'code/modules/halo/sounds/BattleRifleShotSoundEffect.ogg'
	reload_sound = 'code/modules/halo/sounds/AssaultRifle&BattleRifle_ReloadSound_Effect.ogg'
	load_method = MAGAZINE
	one_hand_penalty = -1
	burst = 3
	burst_delay = 0.5
	fire_delay = 9
	accuracy = 1
	w_class = ITEM_SIZE_LARGE
	dispersion=list(0.1, 0.8, 0.8)
	item_icons = list(
		slot_l_hand_str = 'code/modules/halo/weapons/icons/Weapon_Inhands_left.dmi',
		slot_r_hand_str = 'code/modules/halo/weapons/icons/Weapon_Inhands_right.dmi',
		)
	attachment_slots = list("barrel","underbarrel rail","upper rail","upper stock")
	attachments_on_spawn = list(/obj/item/weapon_attachment/barrel/br55,/obj/item/weapon_attachment/br55_stock_cheekrest,/obj/item/weapon_attachment/br55_bottom,/obj/item/weapon_attachment/br55_upper,/obj/item/weapon_attachment/sight/br55_scope)

/obj/item/weapon/gun/projectile/br85/br55/update_icon()
	if(ammo_magazine)
		icon_state = "BR55-Loaded-Base"
	else
		icon_state = "BR55-Unloaded-Base"
	. = ..()