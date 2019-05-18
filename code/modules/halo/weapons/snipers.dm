


//SRS99 sniper rifle
//basically just a resprite
/obj/item/weapon/gun/projectile/srs99_sniper
	name = "SRS99 sniper rifle"
	desc = "Special Applications Rifle, system 99 Anti-Mat�riel. Deadly at extreme range.  Takes 14.5mm calibre magazines."
	icon = 'code/modules/halo/weapons/icons/Weapon Sprites.dmi'
	icon_state = "SRS99"
	item_state = "SRS99"
	load_method = MAGAZINE
	caliber = "14.5mm"
	slot_flags = SLOT_BACK
	magazine_type = /obj/item/ammo_magazine/m145_ap
	fire_sound = 'code/modules/halo/sounds/SniperShotSoundEffect.ogg'
	reload_sound = 'code/modules/halo/sounds/SniperRifleReloadSoundEffect.ogg'
	one_hand_penalty = -1
	scoped_accuracy = 3
	accuracy = -2
	screen_shake = 0
	burst = 1
	burst_delay = 2
	w_class = ITEM_SIZE_HUGE
	item_icons = list(
		slot_l_hand_str = 'code/modules/halo/weapons/icons/Weapon_Inhands_left.dmi',
		slot_r_hand_str = 'code/modules/halo/weapons/icons/Weapon_Inhands_right.dmi',
		)

/obj/item/weapon/gun/projectile/srs99_sniper/can_use_when_prone()
	return 1

/obj/item/weapon/gun/projectile/srs99_sniper/verb/scope()
	set category = "Weapon"
	set name = "Use Scope"
	set popup_menu = 1

	toggle_scope(usr, 2.0)

/obj/item/weapon/gun/projectile/srs99_sniper/update_icon()
	if(ammo_magazine)
		icon_state = "SRS99"
	else
		icon_state = "SRS99_unloaded"
	. = ..()

//M392 designated marksman rifle
//todo: should this be a sniper?
/obj/item/weapon/gun/projectile/m392_dmr
	name = "M392 Designated Marksman Rifle"
	desc = "This rifle favors mid- to long-ranged combat, offering impressive stopping power over a long distance. Has an inbuilt underbarrel flashlight.  Takes 7.62mm calibre magazines."
	icon = 'code/modules/halo/weapons/icons/Weapon Sprites.dmi'
	icon_state = "M395"
	item_state = "m392"
	load_method = MAGAZINE
	caliber = "a762dmr"
	slot_flags = SLOT_BACK
	magazine_type = /obj/item/ammo_magazine/m762_ap/M392
	allowed_magazines = list(/obj/item/ammo_magazine/m762_ap/M392) //Disallows loading LMG boxmags into the DMR.
	fire_sound = 'code/modules/halo/sounds/DMR_ShotSoundEffect.ogg'
	reload_sound = 'code/modules/halo/sounds/DMR_Reload_Sound_Effect.ogg'
	one_hand_penalty = -1
	w_class = ITEM_SIZE_LARGE
	accuracy = 2
	scoped_accuracy = 3
	fire_delay = 4
	burst_delay = 4
	var/on = 0
	var/activation_sound = 'sound/effects/flashlight.ogg'

	item_icons = list(
		slot_l_hand_str = 'code/modules/halo/weapons/icons/Weapon_Inhands_left.dmi',
		slot_r_hand_str = 'code/modules/halo/weapons/icons/Weapon_Inhands_right.dmi',
		)

/obj/item/weapon/gun/projectile/m392_dmr/can_use_when_prone()
	return 1

/obj/item/weapon/gun/projectile/m392_dmr/verb/scope()
	set category = "Weapon"
	set name = "Use Scope"
	set popup_menu = 1

	toggle_scope(usr, 1.35)

/obj/item/weapon/gun/projectile/m392_dmr/update_icon()
	if(ammo_magazine)
		icon_state = "M395"
	else
		icon_state = "M395_unloaded"
	. = ..()

/obj/item/weapon/gun/projectile/m392_dmr/verb/toggle_light()
	set category = "Weapon"
	set name = "Toggle Gun Light"
	on = !on
	if(on && activation_sound)
		playsound(src.loc, activation_sound, 75, 1)
		set_light(4)
	else
		set_light(0)

/obj/item/weapon/gun/projectile/m392_dmr/innie
	name = "Modified M392 DMR"
	desc = "A heavily modified M392 remade without a bullpup design and including a hardened barrel for a faster fire rate. Has both semi and burst functionality. Takes 7.62mm rounds."
	icon_state = "innie_M392"
	fire_sound = 'code/modules/halo/sounds/innieDMRfirfix.ogg'
	reload_sound = 'code/modules/halo/sounds/InnieDMRreload.ogg'
	fire_delay = 1.5
	burst_delay = 1.5
	burst = 1
	magazine_type = /obj/item/ammo_magazine/m762_ap/M392/innie
	allowed_magazines = list(/obj/item/ammo_magazine/m762_ap/M392)
	accuracy = 1
	scoped_accuracy = 2
	dispersion = list(0.2)

	firemodes = list(
		list(mode_name="2-round bursts", burst=2, fire_delay=3.5, move_delay=6,    burst_accuracy=list(-1,-1),       dispersion=list(0.0, 0.4, 0.4)),
		list(mode_name="semi-automatic", 	burst=1, fire_delay=1.5, move_delay=6,    burst_accuracy=list(1), dispersion=list(0.0)),
		)

/obj/item/weapon/gun/projectile/m392_dmr/innie/update_icon()
	if(ammo_magazine)
		icon_state = "innie_M392"
	else
		icon_state = "innie_M392_unloaded"
	. = ..()

/obj/item/weapon/gun/energy/SDSR_10
	name = "SDSR-10"
	desc = "The Sonic Dispersion Sniper Rifle is a supposed prototype of an ONI Hard Sound Rifle. This prototype has a greatly decreased effectiveness compared to the final product. Construction blueprints were recovered from an ONI prowler. 10 seconds recharge time."
	icon = 'code/modules/halo/weapons/icons/Weapon Sprites.dmi'
	icon_state = "SoundRifle-full"
	item_state = "SoundRifle-full"
	fire_sound = 'code/modules/halo/sounds/sound_rifle_firesound.ogg'
	charge_meter = 0
	self_recharge = 1
	recharge_time = 10 //10 seconds recharge time.
	max_shots = 1
	one_hand_penalty = -1
	scoped_accuracy = 1
	accuracy = 0
	screen_shake = 0
	projectile_type = /obj/item/projectile/SDSS_proj

/obj/item/weapon/gun/energy/SDSR_10/verb/scope()
	set category = "Weapon"
	set name = "Use Scope"
	set popup_menu = 1

	toggle_scope(usr, 1.35)