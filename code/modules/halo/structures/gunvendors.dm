
/obj/machinery/vending/armory
	icon = 'code/modules/halo/icons/machinery/gunvend.dmi'

/obj/machinery/vending/armory/attackby(var/atom/A,var/mob/user)
	if(A in products)
		products[A] = products[A] + 1
	return ..()

/obj/machinery/vending/armory/hybrid // Both ammo, and guns!
	name = "UNSC Weapon and Ammunition Rack"
	desc = "Storage for basic weapons and ammunition"
	icon_state ="ironhammer" // SPRITES
	icon_deny = "ironhammer-deny"
	req_access = list(308)
	products = list(/obj/item/ammo_magazine/m127_saphe =20,/obj/item/ammo_magazine/m127_saphp =20,/obj/item/ammo_magazine/m762_ap/MA5B = 40,/obj/item/ammo_magazine/m762_ap/MA5B/TTR = 15,/obj/item/ammo_magazine/m762_ap/M392 = 30
					,/obj/item/ammo_magazine/m95_sap = 20,/obj/item/ammo_magazine/m5 = 20,/obj/item/ammo_box/shotgun = 10,/obj/item/ammo_box/shotgun/slug = 10,/obj/item/weapon/material/knife/combat_knife =15,/obj/item/weapon/material/machete = 2
					,/obj/item/weapon/gun/projectile/m6d_magnum = 15,/obj/item/weapon/gun/projectile/ma5b_ar = 15,/obj/item/weapon/gun/projectile/br55 = 2
					,/obj/item/weapon/gun/projectile/shotgun/pump/m90_ts = 8,/obj/item/weapon/gun/projectile/m7_smg = 8,/obj/item/weapon/gun/projectile/m392_dmr = 5,/obj/item/weapon/grenade/frag/m9_hedp = 5,/obj/item/weapon/grenade/smokebomb = 5, /obj/item/weapon/armor_patch = 5,/obj/item/drop_pod_beacon = 1)

/obj/machinery/vending/armory/heavy // HEAVY WEAPONS
	name = "UNSC Heavy Weapons Rack"
	desc = "Storage for advanced weapons and ammunition"
	icon_state = "ironhammer" //SPRITES
	icon_deny = "ironhammer-deny"
	req_access = list(308)
	products = list(/obj/item/ammo_magazine/m145_ap = 2,/obj/item/ammo_magazine/a762_box_ap = 5,/obj/item/weapon/gun/projectile/m739_lmg = 2
	,/obj/item/weapon/gun/projectile/srs99_sniper = 1, /obj/item/weapon/gun/projectile/m41 = 1, /obj/item/weapon/storage/box/spnkr = 2,/obj/item/weapon/plastique = 2,/obj/item/weapon/armor_patch = 2)

/obj/machinery/vending/armory/police
	name = "Shell Vendor"
	desc = "A locker for different kinds of shotgun shells."
	icon_state ="ironhammer" // SPRITES
	icon_deny = "ironhammer-deny"
	vend_delay = 6
	products = list(/obj/item/ammo_box/shotgun = 4, /obj/item/ammo_box/shotgun/slug = 4,/obj/item/ammo_box/shotgun/emp = 2
					,/obj/item/ammo_box/shotgun/beanbag = 6, /obj/item/ammo_box/shotgun/flash = 6, /obj/item/ammo_box/shotgun/practice = 4)

/obj/machinery/vending/armory/armor
	name = "Armor Vendor"
	desc = "A machine full of spare UNSC armor."
	icon_state ="ironhammer"
	icon_deny = "ironhammer-deny"
	products = list(/obj/item/clothing/under/unsc/marine_fatigues = 12,
	/obj/item/clothing/head/helmet/marine = 8,
	/obj/item/clothing/head/helmet/marine/medic = 6,
	/obj/item/clothing/head/helmet/marine/visor = 8,
	/obj/item/clothing/suit/storage/marine = 5,
	/obj/item/clothing/suit/storage/marine/medic = 3,
	/obj/item/clothing/shoes/marine = 8,
	/obj/item/clothing/mask/marine = 5,
	/obj/item/weapon/storage/belt/marine_ammo = 8,
	/obj/item/clothing/gloves/thick/unsc = 8,
	/obj/item/weapon/armor_patch = 10)

/obj/machinery/vending/armory/attachment
	name = "Attachment Vendor"
	desc = "A vendor full of attachments for the MA5B."
	icon_state ="ironhammer"
	icon_deny = "ironhammer-deny"
	req_access = list(308)
	products = list(\
	/obj/item/weapon_attachment/ma5_stock_butt/extended = 5,
	/obj/item/weapon_attachment/ma5_grip = 3,
	/obj/item/weapon_attachment/ma5_upper_railed =3,
	/obj/item/weapon_attachment/barrel/suppressor = 2,
	/obj/item/weapon_attachment/sight/ma5_scope = 3,
	/obj/item/weapon_attachment/light/ma5_flashlight = 5,
	/obj/item/weapon_attachment/secondary_weapon/underslung_shotgun = 2,
	/obj/item/weapon_attachment/barrel/suppressor/br55 = 2,
	/obj/item/weapon_attachment/br55_grip = 3)
	//products = list(/obj/item/weapon_attachment/sight/acog = 2, /obj/item/weapon_attachment/sight/rds = 6)

/obj/machinery/vending/armory/odstvend
	name = "Armtech 5530"
	desc = "Cold, dark, and slightly depressed. Basically an ODST in vending machine form."
	product_ads = "Life is woe;Suspect, Investigate, Terminate;CAUTION SHIP SELF DESTRUCT ACTIVATED! Just kidding."
	icon = 'code/modules/halo/icons/machinery/gunvend.dmi'
	icon_state = "ironhammer"
	icon_deny = "ironhammer-deny"
	color = COLOR_DARK_GRAY
	req_access = list(309)
	products = list(
	/obj/item/clothing/head/helmet/odst/rifleman = 4,
	/obj/item/clothing/suit/armor/special/odst = 4,
	/obj/item/weapon/storage/backpack/odst/regular = 4,
	/obj/item/clothing/head/helmet/odst/engineer = 4,
	/obj/item/clothing/suit/armor/special/odst/engineer = 4,
	/obj/item/weapon/storage/backpack/odst/engineer = 4,
	/obj/item/clothing/head/helmet/odst/cqb = 4,
	/obj/item/clothing/suit/armor/special/odst/cqb = 4,
	/obj/item/weapon/storage/backpack/odst/cqb = 4,
	/obj/item/clothing/head/helmet/odst/squadleader = 4,
	/obj/item/clothing/suit/armor/special/odst/squadleader = 4,
	/obj/item/clothing/head/helmet/odst/sharpshooter = 4,
	/obj/item/clothing/suit/armor/special/odst/sharpshooter = 4,
	/obj/item/weapon/storage/backpack/odst/sharpshooter = 4,
	/obj/item/clothing/head/helmet/odst/medic = 4,
	/obj/item/clothing/suit/armor/special/odst/medic = 4,
	/obj/item/weapon/storage/backpack/odst/medic = 4,
	/obj/item/clothing/gloves/thick/combat = 4,
	/obj/item/weapon/storage/belt/marine_ammo = 4,
	/obj/item/weapon/storage/belt/marine_medic = 4,
	/obj/item/clothing/accessory/storage/odst = 4,
	/obj/item/clothing/shoes/magboots/odst = 8,
	/obj/item/weapon/material/knife/combat_knife = 4,
	/obj/item/weapon/material/machete = 2,
	/obj/item/weapon/gun/projectile/m7_smg/silenced = 4,
	/obj/item/weapon/gun/projectile/shotgun/pump/m90_ts = 4,
	/obj/item/weapon/gun/projectile/m392_dmr = 2,
	/obj/item/weapon/gun/projectile/srs99_sniper = 1,
	/obj/item/weapon/plastique = 9,
	/obj/item/weapon/storage/firstaid/unsc = 6,
	/obj/item/device/binoculars = 4,
	/obj/item/ammo_magazine/m127_saphe = 16,
	/obj/item/ammo_magazine/m5 = 16,
	/obj/item/ammo_magazine/m762_ap/M392 = 16,
	/obj/item/ammo_magazine/m145_ap = 2,
	/obj/item/weapon/grenade/smokebomb = 8,
	/obj/item/weapon/grenade/frag/m9_hedp = 8,
	/obj/item/weapon/armor_patch = 8,
	/obj/item/drop_pod_beacon = 3)


/obj/machinery/vending/armory/odstvend/vend_2
	name = "Armtech 5533"
	products = list(
	/obj/item/clothing/head/helmet/odst/rifleman = 4,
	/obj/item/clothing/suit/armor/special/odst = 4,
	/obj/item/weapon/storage/backpack/odst/regular = 4,
	/obj/item/clothing/head/helmet/odst/engineer = 4,
	/obj/item/clothing/suit/armor/special/odst/engineer = 4,
	/obj/item/weapon/storage/backpack/odst/engineer = 4,
	/obj/item/clothing/head/helmet/odst/cqb = 4,
	/obj/item/clothing/suit/armor/special/odst/cqb = 4,
	/obj/item/weapon/storage/backpack/odst/cqb = 4,
	/obj/item/clothing/head/helmet/odst/medic = 4,
	/obj/item/clothing/suit/armor/special/odst/medic = 4,
	/obj/item/weapon/storage/backpack/odst/medic = 4,
	/obj/item/clothing/head/helmet/odst/squadleader = 4,
	/obj/item/clothing/suit/armor/special/odst/squadleader = 4,
	/obj/item/clothing/head/helmet/odst/sharpshooter = 4,
	/obj/item/clothing/suit/armor/special/odst/sharpshooter = 4,
	/obj/item/weapon/storage/backpack/odst/sharpshooter = 4,
	/obj/item/clothing/gloves/thick/combat = 4,
	/obj/item/weapon/storage/belt/marine_ammo = 4,
	/obj/item/weapon/storage/belt/marine_medic = 4,
	/obj/item/clothing/accessory/storage/odst = 4,
	/obj/item/clothing/shoes/magboots/odst = 8,
	/obj/item/weapon/material/knife/combat_knife = 4,
	/obj/item/weapon/material/machete = 2,
	/obj/item/weapon/gun/projectile/m7_smg/silenced = 5,
	/obj/item/weapon/gun/projectile/shotgun/pump/m90_ts = 4,
	/obj/item/weapon/gun/projectile/m392_dmr = 2,
	/obj/item/weapon/gun/projectile/br55 = 2,
	/obj/item/weapon/gun/projectile/srs99_sniper = 1,
	/obj/item/weapon/plastique = 9,
	/obj/item/weapon/storage/firstaid/unsc = 6,
	/obj/item/device/binoculars = 4,
	/obj/item/ammo_magazine/m127_saphe = 16,
	/obj/item/ammo_magazine/m5 = 24,
	/obj/item/ammo_magazine/m95_sap = 10,
	/obj/item/ammo_magazine/m762_ap/M392 = 16,
	/obj/item/ammo_magazine/m145_ap = 2,
	/obj/item/ammo_box/shotgun = 10,
	/obj/item/ammo_box/shotgun/slug = 10,
	/obj/item/weapon/grenade/smokebomb = 8,
	/obj/item/weapon/grenade/frag/m9_hedp = 8,
	/obj/item/weapon/armor_patch = 8,
	/obj/item/drop_pod_beacon = 3)

/obj/machinery/vending/armory/commandovend
	name = "Stolen Armtech 5530"
	desc = "An Armtech vendor with damaged fastenings. Many products appear to be missing and have makeshift product names taped over them."
	product_ads = "URF! URF!"
	icon = 'code/modules/halo/icons/machinery/gunvend.dmi'
	icon_state = "ironhammer"
	icon_deny = "ironhammer-deny"
	color = COLOR_DARK_GRAY
	req_access = list()
	products = list(
	/obj/item/weapon/gun/projectile/heavysniper = 1,
	/obj/item/weapon/gun/projectile/br55 = 2,
	/obj/item/weapon/gun/projectile/m6d_magnum = 2,
	/obj/item/weapon/gun/projectile/m7_smg = 2,
	/obj/item/weapon/gun/projectile/m392_dmr/innie = 2,
	/obj/item/weapon/gun/projectile/shotgun/pump/m90_ts = 4,
	/obj/item/weapon/gun/projectile/m739_lmg/lmg30cal = 1,
	/obj/item/weapon/gun/projectile/ma5b_ar/MA3 = 8,
	/obj/item/ammo_box/heavysniper = 2,
	/obj/item/ammo_magazine/m762_ap/MA3 = 16,
	/obj/item/ammo_magazine/m762_ap/M392/innie = 12,
	/obj/item/ammo_magazine/m95_sap = 10,
	/obj/item/ammo_magazine/m5 = 24,
	/obj/item/ammo_box/shotgun = 10,
	/obj/item/ammo_box/shotgun/slug = 10,
	/obj/item/ammo_magazine/lmg_30cal_box_ap = 5,
	/obj/item/ammo_magazine/m127_saphe =10,
	/obj/item/ammo_magazine/m127_saphp =10,
	/obj/item/weapon/storage/belt/marine_ammo = 4,
	/obj/item/weapon/storage/belt/marine_medic = 4,
	/obj/item/weapon/material/knife/combat_knife = 4,
	/obj/item/weapon/material/machete = 2,
	/obj/item/weapon/plastique = 9,
	/obj/item/weapon/storage/firstaid/unsc = 6,
	/obj/item/device/binoculars = 4,
	/obj/item/weapon/handcuffs/ = 5,
	/obj/item/weapon/grenade/smokebomb = 8,
	/obj/item/device/landmine = 4,
	/obj/item/weapon/grenade/frag/m9_hedp = 4,
	/obj/item/weapon/armor_patch = 4,
	/obj/item/drop_pod_beacon = 1
	)

/obj/machinery/vending/armory/commandovend/armour
	products = list(
	/obj/item/clothing/head/helmet/urfc/engineer = 2,
	/obj/item/clothing/suit/armor/special/urfc/engineer = 2,
	/obj/item/weapon/storage/backpack/cmdo/eng = 2,
	/obj/item/clothing/head/helmet/urfc/medic = 2,
	/obj/item/clothing/suit/armor/special/urfc/medic = 2,
	/obj/item/weapon/storage/backpack/cmdo/med = 2,
	/obj/item/clothing/head/helmet/urfc/sniper = 2,
	/obj/item/clothing/suit/armor/special/urfc/sniper = 2,
	/obj/item/weapon/storage/backpack/cmdo = 2,
	/obj/item/clothing/head/helmet/urfc/cqb = 2,
	/obj/item/clothing/suit/armor/special/urfc/cqb = 2,
	/obj/item/weapon/storage/backpack/cmdo/cqc = 2,
	/obj/item/clothing/head/helmet/urfc/squadleader = 1,
	/obj/item/clothing/suit/armor/special/urfc/squadleader = 1,
	/obj/item/clothing/under/urfc_jumpsuit = 8,
	/obj/item/clothing/gloves/thick/swat = 8,
	/obj/item/clothing/shoes/magboots/urfc = 8,
	/obj/item/weapon/armor_patch = 4)
