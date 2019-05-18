//I'm putting, or have put all donator items here to make it x1000 easier to manage and implement. Please put all new donator items here according to the format.

#define ODST_OVERRIDE 'code/modules/halo/clothing/odst.dmi'
#define ITEM_INHAND 'code/modules/halo/clothing/odst_items.dmi'


////////caelumz\\\\\\\\

//ODST

/obj/item/clothing/head/helmet/odst/donator/caelumz
	name = "Customized ODST Sniper Helmet"

	item_state = "Odst Helmet Caelum"
	icon_state = "Odst Helmet Caelum"
	item_state_novisr = "Odst Helmet Caelum Transparent"
	icon_state_novisr = "Odst Helmet Caelum Transparent"

/obj/item/clothing/suit/armor/special/odst/donator/caelumz
	name = "Customized ODST Sniper Armour"

	icon_state = "Odst Armor Caelum"

/decl/hierarchy/outfit/caelumz_odst
	name = "caelumz - ODST"
	head = /obj/item/clothing/head/helmet/odst/donator/caelumz
	suit = /obj/item/clothing/suit/armor/special/odst/donator/caelumz

//Spartan

/obj/item/clothing/head/helmet/spartan/praetor
	name = "MJOLNIR Powered Assault Armor Helmet Mark IV Praetor"
	icon_state = "caelum-praetor-helm"
	item_state = "caelum-praetor-helm-worn"

/obj/item/clothing/suit/armor/special/spartan/praetor
	name = "MJOLNIR Powered Assault Armor Mark IV Praetor"
	icon_state = "caelum-praetor-armor"
	item_state = "caelum-praetor-armor-worn"

/decl/hierarchy/outfit/caelumz_spartan
	name = "caelumz - spartan"
	uniform = /obj/item/clothing/under/spartan_internal
	suit = /obj/item/clothing/suit/armor/special/spartan/praetor
	gloves = /obj/item/clothing/gloves/spartan
	shoes = /obj/item/clothing/shoes/magboots/spartan
	belt = /obj/item/weapon/storage/belt/marine_ammo
	head = /obj/item/clothing/head/helmet/spartan/praetor
	l_ear = /obj/item/device/radio/headset/unsc/odsto
	suit_store = /obj/item/weapon/tank/emergency/oxygen/double
	l_pocket = /obj/item/ammo_magazine/m762_ap
	r_pocket = /obj/item/weapon/grenade/frag/m9_hedp
	belt = /obj/item/weapon/gun/projectile/m6d_magnum
	back = /obj/item/weapon/gun/projectile/ma5b_ar

////////Boltersam\\\\\\\\

//JIRALHANAE

/obj/item/clothing/head/helmet/jiralhanae/boltersam
	icon_state = "bolter_helm"
/obj/item/clothing/suit/armor/jiralhanae/boltersam
	icon_state = "bolter_armour"

/obj/item/clothing/shoes/jiralhanae/boltersam
	icon_state = "bolter_greaves"

/decl/hierarchy/outfit/boltersam_jiralhanae
	name = "boltersam - jiralhanae"
	head = /obj/item/clothing/head/helmet/jiralhanae/boltersam
	suit = /obj/item/clothing/suit/armor/jiralhanae/boltersam

////////eonoc\\\\\\\\

//ODST

/obj/item/clothing/head/helmet/odst/donator/eonoc
	name = "Barnabus's ODST Helmet"

	item_state = "eonoc-helmet_worn"
	icon_state = "eonoc-helmet_obj"
	item_state_novisr = "eonoc-helmet-open_worn"
	icon_state_novisr = "eonoc-helmet_obj"

/obj/item/clothing/suit/armor/special/odst/donator/eonoc
	name = "Barnabus's ODST Armor"

	icon_state = "eonoc-armor_worn"

/decl/hierarchy/outfit/eonoc_odst
	name = "eonoc - ODST"
	head = /obj/item/clothing/head/helmet/odst/donator/eonoc
	suit = /obj/item/clothing/suit/armor/special/odst/donator/eonoc

////////flaksim\\\\\\\\

//ODST

/obj/item/clothing/head/helmet/odst/donator/flaksim
	name = "Kashada's ODST Helmet"

	item_state = "Odst Helmet Flaksim"
	icon_state = "Odst Helmet Flaksim"
	item_state_novisr = "Odst Helmet Flaksim Transparent"
	icon_state_novisr = "Odst Helmet Flaksim Transparent"

/obj/item/clothing/suit/armor/special/odst/donator/flaksim
	name = "Kashada's ODST Armour"

	icon_state = "Odst Armor Flaksim"

/obj/item/weapon/storage/backpack/odst/donator/flaksim
	icon = ITEM_INHAND
	icon_override = ODST_OVERRIDE
	name = "Kashada's Backpack"
	item_state = "Odst Flaksim Backpack"
	icon_state = "Odst Flaksim Backpack"

/decl/hierarchy/outfit/flaksim_odst
	name = "flaksim - ODST"
	head = /obj/item/clothing/head/helmet/odst/donator/flaksim
	suit = /obj/item/clothing/suit/armor/special/odst/donator/flaksim
	back = /obj/item/weapon/storage/backpack/odst/donator/flaksim

//Spartan

/obj/item/clothing/head/helmet/spartan/mkiv_flak
	name = "MJOLNIR Powered Assault Armor Helmet Mark IV Flak"
	icon_state = "SPARTAN-flaksimhelm"
	item_state = "SPARTAN-flaksimhelm-worn"

/obj/item/clothing/suit/armor/special/spartan/mkiv_flak
	name = "MJOLNIR Powered Assault Armor Mark IV Flak"
	icon_state = "SPARTAN-flaksimarmor"
	item_state = "SPARTAN-flaksimarmor-worn"

/decl/hierarchy/outfit/flaksim_spartan
	name = "flaksim - spartan"
	uniform = /obj/item/clothing/under/spartan_internal
	suit = /obj/item/clothing/suit/armor/special/spartan/mkiv_flak
	gloves = /obj/item/clothing/gloves/spartan
	shoes = /obj/item/clothing/shoes/magboots/spartan
	belt = /obj/item/weapon/storage/belt/marine_ammo
	head = /obj/item/clothing/head/helmet/spartan/mkiv_flak
	l_ear = /obj/item/device/radio/headset/unsc/odsto
	suit_store = /obj/item/weapon/tank/emergency/oxygen/double
	l_pocket = /obj/item/ammo_magazine/m762_ap
	r_pocket = /obj/item/weapon/grenade/frag/m9_hedp
	belt = /obj/item/weapon/gun/projectile/m6d_magnum
	back = /obj/item/weapon/gun/projectile/ma5b_ar


//Focks in a bocks

//Spartan

/obj/item/clothing/head/helmet/spartan/mkiv_security
	name = "MJOLNIR Powered Assault Armor Helmet Mark IV Security"
	icon_state = "SPARTAN-morekhelm"
	item_state = "SPARTAN-morekhelm-worn"

/obj/item/clothing/suit/armor/special/spartan/mkiv_security
	name = "MJOLNIR Powered Assault Armor Mark IV Security"
	icon_state = "SPARTAN-morekarmor"
	item_state = "SPARTAN-morekarmor-worn"

/decl/hierarchy/outfit/focks_spartan
	name = "focks - spartan"
	uniform = /obj/item/clothing/under/spartan_internal
	suit = /obj/item/clothing/suit/armor/special/spartan/mkiv_security
	gloves = /obj/item/clothing/gloves/spartan
	shoes = /obj/item/clothing/shoes/magboots/spartan
	belt = /obj/item/weapon/storage/belt/marine_ammo
	head = /obj/item/clothing/head/helmet/spartan/mkiv_security
	l_ear = /obj/item/device/radio/headset/unsc/odsto
	suit_store = /obj/item/weapon/tank/emergency/oxygen/double
	l_pocket = /obj/item/ammo_magazine/m762_ap
	r_pocket = /obj/item/weapon/grenade/frag/m9_hedp
	belt = /obj/item/weapon/gun/projectile/m6d_magnum
	back = /obj/item/weapon/gun/projectile/ma5b_ar


////////Gulag\\\\\\\\

//ODST

obj/item/clothing/head/helmet/odst/donator/gulag
	name = "Murmillo Helmet"
	item_state = "gulag-helmet_worn"
	icon_state = "gulag-helmet_obj"
	item_state_novisr = "gulag-helmet_worn"
	icon_state_novisr = "gulag-helmet_obj"

/obj/item/clothing/suit/armor/special/odst/donator/gulag
	name = "Murmillo Armour"
	icon_state = "gulag-armor_obj"
	item_state = "gulag-armor_worn"

/decl/hierarchy/outfit/gulag_odst
	name = "gulag - ODST"
	head = /obj/item/clothing/head/helmet/odst/donator/gulag
	suit = /obj/item/clothing/suit/armor/special/odst/donator/gulag

////////Kelso\\\\\\\\

//Spartan

/obj/item/clothing/head/helmet/spartan/mkiv_kelso
	name = "MJOLNIR Powered Assault Armor Helmet Mark IV Recon"
	icon_state = "kelso-spartanhelm_obj"
	item_state = "kelso-spartanhelm_worn"

/obj/item/clothing/suit/armor/special/spartan/mkiv_kelso
	name = "MJOLNIR Powered Assault Armor Mark IV Grenadier"
	icon_state = "kelso-spartanarmor_obj"
	item_state = "kelso-spartanarmor_worn"

/decl/hierarchy/outfit/kelso_spartan
	name = "kelso - spartan"
	uniform = /obj/item/clothing/under/spartan_internal
	suit = /obj/item/clothing/suit/armor/special/spartan/mkiv_kelso
	gloves = /obj/item/clothing/gloves/spartan
	shoes = /obj/item/clothing/shoes/magboots/spartan
	belt = /obj/item/weapon/storage/belt/marine_ammo
	head = /obj/item/clothing/head/helmet/spartan/mkiv_kelso
	l_ear = /obj/item/device/radio/headset/unsc/odsto
	suit_store = /obj/item/weapon/tank/emergency/oxygen/double
	l_pocket = /obj/item/ammo_magazine/m762_ap
	r_pocket = /obj/item/weapon/grenade/frag/m9_hedp
	belt = /obj/item/weapon/gun/projectile/m6d_magnum
	back = /obj/item/weapon/gun/projectile/ma5b_ar

////////Kozi\\\\\\\\

//ODST

/obj/item/clothing/head/helmet/odst/donator/kozi
	name = "Kozi's Hassar Helmet"
	item_state = "kozi-helmet_worn"
	icon_state = "kozi-helmet_obj"
	item_state_novisr = "kozi-helmet_worn"
	icon_state_novisr = "kozi-helmet_obj"

/obj/item/clothing/suit/armor/special/odst/donator/kozi
	name = "Kozi's Hassar Armor"
	icon_state = "kozi-armor_obj"
	item_state = "kozi-armor_worn"

/obj/item/weapon/storage/backpack/odst/kozi
	icon = ITEM_INHAND
	icon_override = ODST_OVERRIDE
	name = "Kozi's Hassar Backpack"
	item_state = "kozi-backpack_worn"
	icon_state = "kozi-backpack_obj"

/obj/item/weapon/material/machete/kozi
	name = "Hassar Sabre"
	icon_state = "kozi-sabre_obj"
	item_state = "kozi-sabre"
	item_icons = list(
		slot_l_hand_str = 'code/modules/halo/weapons/icons/Weapon_Inhands_left.dmi',
		slot_r_hand_str = 'code/modules/halo/weapons/icons/Weapon_Inhands_right.dmi',
		)

/decl/hierarchy/outfit/kozi_odst
	name = "kozi - ODST"
	head = /obj/item/clothing/head/helmet/odst/donator/kozi
	suit = /obj/item/clothing/suit/armor/special/odst/donator/kozi
	l_hand = /obj/item/weapon/material/machete/kozi
	back = /obj/item/weapon/storage/backpack/odst/kozi

////////liam_gallagher\\\\\\\\

//ODST

/obj/item/clothing/head/helmet/odst/donator/liam_gallagher
	name = "ODST EOD Helmet"

	item_state = "osama-helmet_worn"
	icon_state = "osama-helmet_obj"
	item_state_novisr = "osama-helmet-open_worn"
	icon_state_novisr = "osama-helmet_obj"

/obj/item/clothing/suit/armor/special/odst/donator/liam_gallagher
	name = "ODST EOD Suit"

	icon_state = "osama-armor_worn"

/decl/hierarchy/outfit/liam_gallagher_odst
	name = "liam gallagher - ODST"
	head = /obj/item/clothing/head/helmet/odst/donator/liam_gallagher
	suit = /obj/item/clothing/suit/armor/special/odst/donator/liam_gallagher

//Spartan

/obj/item/clothing/head/helmet/spartan/liam_gallagher
	name = "MJOLNIR Powered Assault Armor Helmet Mark IV Scarred EVA"
	icon = 'code/modules/halo/clothing/SpartanHussarKit.dmi'
	icon_state = "osama-spartan-helm_obj"
	item_state = "osama-spartan-helm_worn"
	icon_override = 'code/modules/halo/clothing/SpartanHussarKit.dmi'

/obj/item/clothing/suit/armor/special/spartan/liam_gallagher
	name = "MJOLNIR Powered Assault Armor Mark IV Scarred EVA"
	icon = 'code/modules/halo/clothing/SpartanHussarKit.dmi'
	icon_state = "osama-spartan-armor_obj"
	item_state = "osama-spartan-armor_worn"
	icon_override = 'code/modules/halo/clothing/SpartanHussarKit.dmi'

/decl/hierarchy/outfit/liam_gallagher_spartan
	name = "liam_gallagher - spartan"
	uniform = /obj/item/clothing/under/spartan_internal
	suit = /obj/item/clothing/suit/armor/special/spartan/liam_gallagher
	gloves = /obj/item/clothing/gloves/spartan
	shoes = /obj/item/clothing/shoes/magboots/spartan
	belt = /obj/item/weapon/storage/belt/marine_ammo
	head = /obj/item/clothing/head/helmet/spartan/liam_gallagher
	l_ear = /obj/item/device/radio/headset/unsc/odsto
	suit_store = /obj/item/weapon/tank/emergency/oxygen/double
	l_pocket = /obj/item/ammo_magazine/m762_ap
	r_pocket = /obj/item/weapon/grenade/frag/m9_hedp
	belt = /obj/item/weapon/gun/projectile/m6d_magnum
	back = /obj/item/weapon/gun/projectile/ma5b_ar

/decl/hierarchy/outfit/liam_gallagher_spartan/kozi_spartan
	name = "kozi - spartan"
	//they share the armour this is literally to make spawning it x100 easier

//Spartan

/obj/item/clothing/head/helmet/spartan/mkv_grenadier
	name = "MJOLNIR Powered Assault Armor Helmet Mark V Grenadier"
	icon_state = "mk5-donorhelm"
	item_state = "mk5-donorhelm-worn"

/obj/item/clothing/suit/armor/special/spartan/mkv_grenadier
	name = "MJOLNIR Powered Assault Armor Mark V Grenadier"
	icon_state = "mk5-donorshell"
	item_state = "mk5-donorshell-worn"

/decl/hierarchy/outfit/liam_gallagher_spartan
	name = "liam_gallagher_spartan"
	uniform = /obj/item/clothing/under/spartan_internal
	suit = /obj/item/clothing/suit/armor/special/spartan/mkv_grenadier
	gloves = /obj/item/clothing/gloves/spartan
	shoes = /obj/item/clothing/shoes/magboots/spartan
	belt = /obj/item/weapon/storage/belt/marine_ammo
	head = /obj/item/clothing/head/helmet/spartan/mkv_grenadier
	l_ear = /obj/item/device/radio/headset/unsc/odsto
	suit_store = /obj/item/weapon/tank/emergency/oxygen/double
	l_pocket = /obj/item/ammo_magazine/m762_ap
	r_pocket = /obj/item/weapon/grenade/frag/m9_hedp
	belt = /obj/item/weapon/gun/projectile/m6d_magnum
	back = /obj/item/weapon/gun/projectile/ma5b_ar


////////mann\\\\\\\\\

//ODST

/obj/item/clothing/head/helmet/odst/donator/mann
	name = "Mann's ODST Helmet"

	item_state = "Odst Helmet Mann"
	icon_state = "Odst Helmet Mann"
	item_state_novisr = "Odst Helmet Mann"
	icon_state_novisr = "Odst Helmet Mann"

/obj/item/clothing/suit/armor/special/odst/donator/mann
	name = "Mann's ODST Armour"

	icon_state = "Odst Armor Mann"

/decl/hierarchy/outfit/mann_odst
	name = "mann - ODST"
	head = /obj/item/clothing/head/helmet/odst/donator/mann
	suit = /obj/item/clothing/suit/armor/special/odst/donator/mann

//Spartan

/obj/item/clothing/head/helmet/spartan/mkv_gungnir_mann
	name = "MJOLNIR Powered Assault Armor Helmet Mark V Gungnir"
	icon_state = "mk5-mistermannhelm"
	item_state = "mk5-mistermannhelm-worn"

/obj/item/clothing/suit/armor/special/spartan/mkv_gungnir_mann
	name = "MJOLNIR Powered Assault Armor Mark V Gungnir"
	icon_state = "mk5-mistermannshell"
	item_state = "mk5-mistermannshell-worn"

/decl/hierarchy/outfit/mann_spartan
	name = "mann - spartan"
	uniform = /obj/item/clothing/under/spartan_internal
	suit = /obj/item/clothing/suit/armor/special/spartan/mkv_gungnir_mann
	gloves = /obj/item/clothing/gloves/spartan
	shoes = /obj/item/clothing/shoes/magboots/spartan
	belt = /obj/item/weapon/storage/belt/marine_ammo
	head = /obj/item/clothing/head/helmet/spartan/mkv_gungnir_mann
	l_ear = /obj/item/device/radio/headset/unsc/odsto
	suit_store = /obj/item/weapon/tank/emergency/oxygen/double
	l_pocket = /obj/item/ammo_magazine/m762_ap
	r_pocket = /obj/item/weapon/grenade/frag/m9_hedp
	belt = /obj/item/weapon/gun/projectile/m6d_magnum
	back = /obj/item/weapon/gun/projectile/ma5b_ar


////////maxattacker\\\\\\\\

//ODST

/obj/item/clothing/head/helmet/odst/donator/maxattacker
	name = "Customized ODST Helmet"

	item_state = "Odst Helmet Maxattacker"
	icon_state = "Odst Helmet Maxattacker"
	item_state_novisr = "Odst Helmet Maxattacker Transparent"
	icon_state_novisr = "Odst Helmet Maxattacker Transparent"

/obj/item/clothing/suit/armor/special/odst/donator/maxattacker
	name = "Customized ODST Recon Armour"

	icon_state = "Odst Armor Maxattacker"

/decl/hierarchy/outfit/maxattacker_odst
	name = "maxattacker - ODST"
	head = /obj/item/clothing/head/helmet/odst/donator/maxattacker
	suit = /obj/item/clothing/suit/armor/special/odst/donator/maxattacker

//ODST - 2

obj/item/clothing/head/helmet/odst/donator/maxattackeralt
	name = "ODST 'Grasshopper' Helmet"
	item_state = "maxattackeralt-helmet_worn"
	icon_state = "maxattackeralt-helmet_obj"
	item_state_novisr = "maxattackeralt-helmet_worn"
	icon_state_novisr = "maxattackeralt-helmet_obj"

/obj/item/clothing/suit/armor/special/odst/donator/maxattackeralt
	name = "ODST 'Thorn' Armour"
	icon_state = "maxattackeralt-armor_obj"
	item_state = "maxattackeralt-armor_worn"

/decl/hierarchy/outfit/maxattacker_odst2
	name = "maxattacker - ODST2"
	head = /obj/item/clothing/head/helmet/odst/donator/maxattackeralt
	suit = /obj/item/clothing/suit/armor/special/odst/donator/maxattackeralt

//Spartan

/obj/item/clothing/head/helmet/spartan/mkv_gungnir_navy
	name = "MJOLNIR Powered Assault Armor Helmet Mark V Gungnir"
	icon_state = "mk5-navygungirhelm"
	item_state = "mk5-navygungirhelm-worn"

/obj/item/clothing/suit/armor/special/spartan/mkv_gungnir_navy
	name = "MJOLNIR Powered Assault Armor Mark V Gungnir"
	icon_state = "mk5-navygungirshell"
	item_state = "mk5-navygungirshell-worn"

/decl/hierarchy/outfit/maxattacker_spartan
	name = "maxattacker - spartan"
	uniform = /obj/item/clothing/under/spartan_internal
	suit = /obj/item/clothing/suit/armor/special/spartan/mkv_gungnir_navy
	gloves = /obj/item/clothing/gloves/spartan
	shoes = /obj/item/clothing/shoes/magboots/spartan
	belt = /obj/item/weapon/storage/belt/marine_ammo
	head = /obj/item/clothing/head/helmet/spartan/mkv_gungnir_navy
	l_ear = /obj/item/device/radio/headset/unsc/odsto
	suit_store = /obj/item/weapon/tank/emergency/oxygen/double
	l_pocket = /obj/item/ammo_magazine/m762_ap
	r_pocket = /obj/item/weapon/grenade/frag/m9_hedp
	belt = /obj/item/weapon/gun/projectile/m6d_magnum
	back = /obj/item/weapon/gun/projectile/ma5b_ar

////////MCLOVIN\\\\\\\\

//URFC


/obj/item/clothing/head/helmet/urfc/mclovin
	name = "Jaguar Helmet"

	item_state = "mclovin-jaguar_worn"
	icon_state = "mclovin-jaguar_helmet"

/obj/item/clothing/suit/armor/special/urfc/mclovin
	name = "Jaguar Armour"

	item_state = "mclovin-jaguar_armour_worn"
	icon_state = "mclovin-jaguar_armour_obj"

/obj/item/clothing/head/helmet/zeal/mclovin
	name = "Eagle Helmet"
	desc = "A heavily modified helmet resembling an Eagle"

	icon = 'code/modules/halo/clothing/urf_commando.dmi'
	icon_override = 'code/modules/halo/clothing/urf_commando.dmi'
	item_state = "mclovin-eagle_worn"
	icon_state = "mclovin-eagle_helmet"

/obj/item/clothing/suit/justice/zeal/mclovin
	name = "Eagle Armour"
	desc = "A heavily modified piece of armour resembling an Eagle"

	icon = 'code/modules/halo/clothing/urf_commando.dmi'
	icon_override = 'code/modules/halo/clothing/urf_commando.dmi'
	item_state = "mclovin-eagle_armour_worn"
	icon_state = "mclovin-eagle_armour_obj"

/obj/item/weapon/material/machete/mclovin
	name = "Aztec Sword"
	desc = "An Aztec sword used to spill the blood of a warrior's enemy."
	icon_state = "mclovin-machete_obj"
	item_state = "mclovin-machete"
	item_icons = list(
		slot_l_hand_str = 'code/modules/halo/weapons/icons/Weapon_Inhands_left.dmi',
		slot_r_hand_str = 'code/modules/halo/weapons/icons/Weapon_Inhands_right.dmi',
		)

/decl/hierarchy/outfit/mclovin_urfc
	name = "mclovin - urfc"
	head = /obj/item/clothing/head/helmet/urfc/mclovin
	suit = /obj/item/clothing/suit/armor/special/urfc/mclovin
	l_hand = /obj/item/weapon/material/machete/mclovin

/decl/hierarchy/outfit/mclovin_zeal
	name = "mclovin - zeal"
	head = /obj/item/clothing/head/helmet/zeal/mclovin
	suit = /obj/item/clothing/suit/justice/zeal/mclovin
	l_hand = /obj/item/weapon/material/machete/mclovin


////////Moerk\\\\\\\\

//ODST

obj/item/clothing/head/helmet/odst/donator/moerk
	name = "Moerk's ODST Helmet"

	item_state = "Odst Helmet Moerk"
	icon_state = "Odst Helmet Moerk"
	item_state_novisr = "Odst Helmet Moerk"
	icon_state_novisr = "Odst Helmet Moerk"

/obj/item/clothing/suit/armor/special/odst/donator/moerk
	name = "Moerk's Customized ODST Armour"

	icon_state = "Odst Armor Moerk"

/decl/hierarchy/outfit/moerk_odst
	name = "moerk - ODST"
	head = /obj/item/clothing/head/helmet/odst/donator/moerk
	suit = /obj/item/clothing/suit/armor/special/odst/donator/moerk

////////M.Green/Dogler\\\\\\\\

//Sangheili

/obj/item/clothing/head/helmet/sangheili/dogler
	name = "Sya'tenee's Sangheili Helmet"
	desc = "Head armour, to be used with the Sangheili Combat Harness."
	icon_state = "dogler_helm_obj"
	item_state = "dogler_helm"

/obj/item/clothing/suit/armor/special/combatharness/dogler
	name = "Sya'tenee's Sangheili Combat Harness"
	icon_state = "dogler_chest_obj"
	item_state = "dogler_chest"
	totalshields = 125

/obj/item/clothing/shoes/sangheili/dogler
	name = "Sya'tenee's Sanghelli Leg Armour"
	desc = "Leg armour, to be used with the Sangheili Combat Harness."
	icon_state = "dogler_legs_obj"
	item_state = "dogler_legs"

/obj/item/clothing/gloves/thick/sangheili/dogler
	name = "Sya'tenee's Sanghelli Combat Gauntlets"
	desc = "Hand armour, to be used with the Sangheili Combat Harness."
	icon_state = "dogler_gloves_obj"
	item_state = "dogler_gloves"

/decl/hierarchy/outfit/dogler_sangheili
	name = "dogler/m.green - sangheili"
	suit = /obj/item/clothing/suit/armor/special/combatharness/dogler
	suit_store = /obj/item/weapon/gun/energy/plasmarifle
	back = /obj/item/weapon/gun/energy/plasmarifle
	belt = /obj/item/weapon/gun/energy/plasmapistol
	gloves = /obj/item/clothing/gloves/thick/sangheili/dogler
	shoes = /obj/item/clothing/shoes/sangheili/dogler
	head = /obj/item/clothing/head/helmet/sangheili/dogler
	l_pocket = /obj/item/weapon/grenade/plasma
////////PANTAS\\\\\\\\

//URFC

/obj/item/clothing/head/helmet/urfc/pantascmdo
	name = "Eridanus Order's Helmet"

	item_state = "pantascmdo_worn"
	icon_state = "pantascmdo_helmet"

/obj/item/clothing/suit/armor/special/urfc/pantascmdo
	name = "Eridanus Order's Armour"

	item_state = "pantascmdo_armour_worn"
	icon_state = "pantascmdo_armour_obj"

/obj/item/weapon/storage/backpack/cmdo/pantascmdo
	name = "Eridanus Order's Backpack"

	icon_state = "c_packO_pantascmdo"
	item_state = "c_pack_pantascmdo_worn"

	item_state_slots = list(
	slot_l_hand_str = "c_pack_pantascmdo",
	slot_r_hand_str = "c_pack_pantascmdo",
	)

/obj/item/weapon/material/machete/pantascmdo
	name = "Judgement of Eridanus"
	desc = "A Holy-Looking sword used to Judge the enemies of Eridanus"
	icon_state = "pantascmdo-machete_obj"
	item_state = "pantascmdo-machete"
	item_icons = list(
		slot_l_hand_str = 'code/modules/halo/weapons/icons/Weapon_Inhands_left.dmi',
		slot_r_hand_str = 'code/modules/halo/weapons/icons/Weapon_Inhands_right.dmi',
		)

/obj/item/weapon/gun/projectile/ma5b_ar/MA3/pantasma3
	name = "Ancient AK-47"
	desc = "An ancient weapon used in forgettable times. How does it even still work?"
	icon_state = "pantasAK47"
	item_state = "pantasAK47"
	item_icons = list(
		slot_l_hand_str = 'code/modules/halo/weapons/icons/Weapon_Inhands_left.dmi',
		slot_r_hand_str = 'code/modules/halo/weapons/icons/Weapon_Inhands_right.dmi',
		)


/obj/item/weapon/gun/projectile/ma5b_ar/MA3/pantasma3/update_icon()
	. = ..()
	if(ammo_magazine)
		icon_state = "pantasAK47"
	else
		icon_state = "pantasAK47_unloaded"

/decl/hierarchy/outfit/pantas_urfc
	name = "pantas - urfc"
	head = /obj/item/clothing/head/helmet/urfc/pantascmdo
	suit = /obj/item/clothing/suit/armor/special/urfc/pantascmdo
	back = /obj/item/weapon/storage/backpack/cmdo/pantascmdo
	l_hand = /obj/item/weapon/material/machete/pantascmdo
	r_hand = /obj/item/weapon/gun/projectile/ma5b_ar/MA3/pantasma3

//SANGHEILI (MINOR)

// Sorcerer (Thousand Sons Chaos Space Marine)

/obj/item/clothing/head/helmet/sangheili/minor/pantas
	name = "Sangheili Helmet (Sorcerer pattern)"
	icon_state = "pantas2_helm_obj"
	item_state = "pantas2_helm"

/obj/item/clothing/suit/armor/special/combatharness/minor/pantas
	name = "Sangheili Combat Harness (Sorcerer pattern)"
	icon_state = "pantas2_chest_obj"
	item_state = "pantas2_chest"

/obj/item/clothing/shoes/sangheili/minor/pantas
	name = "Sanghelli Leg Armour (Sorcerer pattern)"
	icon_state = "pantas2_legs_obj"
	item_state = "pantas2_legs"

/obj/item/clothing/gloves/thick/sangheili/minor/pantas
	name = "Sanghelli Combat Gauntlets (Sorcerer pattern)"
	icon_state = "pantas2_gloves_obj"
	item_state = "pantas2_gloves"

/decl/hierarchy/outfit/pantas_sangheili_minor
	name = "pantas - sangheili minor"
	suit = /obj/item/clothing/suit/armor/special/combatharness/minor/pantas
	back = /obj/item/weapon/gun/energy/plasmarifle
	belt = /obj/item/weapon/gun/energy/plasmapistol
	gloves = /obj/item/clothing/gloves/thick/sangheili/minor/pantas
	shoes = /obj/item/clothing/shoes/sangheili/minor/pantas
	head = /obj/item/clothing/head/helmet/sangheili/minor/pantas
	mask = null
	l_pocket = /obj/item/weapon/grenade/plasma
	r_pocket = null

//SANGHEILI (MAJOR)

/obj/item/clothing/head/helmet/sangheili/major/pantas
	name = "Sangheili Helmet (Berserker pattern)"
	icon_state = "pantas_helm_obj"
	item_state = "pantas_helm"

/obj/item/clothing/suit/armor/special/combatharness/major/pantas
	name = "Sangheili Combat Harness (Berserker pattern)"
	icon_state = "pantas_chest_obj"
	item_state = "pantas_chest"

/obj/item/clothing/shoes/sangheili/major/pantas
	name = "Sanghelli Leg Armour (Berserker pattern)"
	icon_state = "pantas_legs_obj"
	item_state = "pantas_legs"

/obj/item/clothing/gloves/thick/sangheili/major/pantas
	name = "Sanghelli Combat Gauntlets (Berserker pattern)"
	icon_state = "pantas_gloves_obj"
	item_state = "pantas_gloves"

/decl/hierarchy/outfit/pantas_sangheili_major
	name = "pantas - sangheili major"
	suit = /obj/item/clothing/suit/armor/special/combatharness/major/pantas
	suit_store = /obj/item/weapon/gun/energy/plasmarifle
	back = /obj/item/weapon/gun/energy/plasmarifle
	belt = /obj/item/weapon/gun/energy/plasmapistol
	gloves = /obj/item/clothing/gloves/thick/sangheili/major/pantas
	shoes = /obj/item/clothing/shoes/sangheili/major/pantas
	head = /obj/item/clothing/head/helmet/sangheili/major/pantas
	l_pocket = /obj/item/weapon/grenade/plasma

////////Pinstripe\\\\\\\\

//ODST

obj/item/clothing/head/helmet/odst/donator/pinstripe
	name = "Pinstripe's ODST Helmet"
	item_state = "pinstripe-helmet_worn"
	icon_state = "pinstripe-helmet_obj"
	item_state_novisr = "pinstripe-helmet_worn"
	icon_state_novisr = "pinstripe-helmet_obj"

/obj/item/clothing/suit/armor/special/odst/donator/pinstripe
	name = "Pinstripe's ODST Armour"
	icon_state = "pinstripe-armor_obj"
	item_state = "pinstripe-armor_worn"

/decl/hierarchy/outfit/pinstripe_odst
	name = "pinstripe - ODST"
	head = /obj/item/clothing/head/helmet/odst/donator/pinstripe
	suit = /obj/item/clothing/suit/armor/special/odst/donator/pinstripe

//Spartan

/obj/item/clothing/head/helmet/spartan/pinstripe
	name = "MJOLNIR Powered Assault Armor Helmet Mark VI"
	icon_state = "pinstripe-spartanhelm_obj"
	item_state = "pinstripe-spartanhelm_worn"

/obj/item/clothing/suit/armor/special/spartan/pinstripe
	name = "MJOLNIR Powered Assault Armor Mark VI"
	icon_state = "pinstripe-spartanarmor_obj"
	item_state = "pinstripe-spartanarmor_worn"

/decl/hierarchy/outfit/pinstripe_spartan
	name = "pinstripe - spartan"
	uniform = /obj/item/clothing/under/spartan_internal
	suit = /obj/item/clothing/suit/armor/special/spartan/pinstripe
	gloves = /obj/item/clothing/gloves/spartan
	shoes = /obj/item/clothing/shoes/magboots/spartan
	belt = /obj/item/weapon/storage/belt/marine_ammo
	head = /obj/item/clothing/head/helmet/spartan/pinstripe
	l_ear = /obj/item/device/radio/headset/unsc/odsto
	suit_store = /obj/item/weapon/tank/emergency/oxygen/double
	l_pocket = /obj/item/ammo_magazine/m762_ap
	r_pocket = /obj/item/weapon/grenade/frag/m9_hedp
	belt = /obj/item/weapon/gun/projectile/m6d_magnum
	back = /obj/item/weapon/gun/projectile/ma5b_ar

////////ragnarok\\\\\\\\

//ODST

/obj/item/clothing/head/helmet/odst/donator/ragnarok
	name = "Bishop's ODST Helmet"

	item_state = "ragnarok-helmet_worn"
	icon_state = "ragnarok-helmet_obj"
	item_state_novisr = "ragnarok-helmet-open_worn"
	icon_state_novisr = "ragnarok-helmet_obj"

/obj/item/clothing/suit/armor/special/odst/donator/ragnarok
	name = "Bishop's ODST Armour"

	icon_state = "ragnarok-armor_worn"

/decl/hierarchy/outfit/ragnarok_odst
	name = "ragnarok - ODST"
	head = /obj/item/clothing/head/helmet/odst/donator/ragnarok
	suit = /obj/item/clothing/suit/armor/special/odst/donator/ragnarok

////////Spartankiller\\\\\\\\

//ODST

/obj/item/clothing/head/helmet/odst/donator/spartan
	name = "Spartan's ODST Helmet"

	item_state = "Odst Helmet Spartan"
	icon_state = "Odst Helmet Spartan"
	item_state_novisr = "Odst Helmet Spartan Transparent"
	icon_state_novisr = "Odst Helmet Spartan Transparent"

/obj/item/clothing/suit/armor/special/odst/donator/spartan
	name = "Customized ODST CQB Armour"

	icon_state = "Odst Armor Spartan"

/obj/item/weapon/storage/backpack/odst/donator/spartan
	icon = ITEM_INHAND
	icon_override = ODST_OVERRIDE
	name = "Spartan's Backpack"
	item_state = "Odst Spartan Backpack"
	icon_state = "Odst Spartan Backpack"

/decl/hierarchy/outfit/spartan_odst
	name = "spartan - ODST"
	head = /obj/item/clothing/head/helmet/odst/donator/spartan
	suit = /obj/item/clothing/suit/armor/special/odst/donator/spartan
	back = /obj/item/weapon/storage/backpack/odst/donator/spartan

//Spartan

/obj/item/clothing/head/helmet/spartan/spartan_killer
	name = "MJOLNIR Powered Assault Armor Helmet Mark IV Scarred EVA"
	icon_state = "spartankiller-spartanhelm_obj"
	item_state = "spartankiller-spartanhelm_worn"

/obj/item/clothing/suit/armor/special/spartan/spartan_killer
	name = "MJOLNIR Powered Assault Armor Mark IV Scarred EVA"
	icon_state = "spartankiller-spartanarmor_obj"
	item_state = "spartankiller-spartanarmor_worn"

/decl/hierarchy/outfit/spartan_spartan
	name = "spartan - spartan"
	uniform = /obj/item/clothing/under/spartan_internal
	suit = /obj/item/clothing/suit/armor/special/spartan
	gloves = /obj/item/clothing/gloves/spartan
	shoes = /obj/item/clothing/shoes/magboots/spartan
	belt = /obj/item/weapon/storage/belt/marine_ammo
	head = /obj/item/clothing/head/helmet/spartan
	l_ear = /obj/item/device/radio/headset/unsc/odsto
	suit_store = /obj/item/weapon/tank/emergency/oxygen/double
	l_pocket = /obj/item/ammo_magazine/m762_ap
	r_pocket = /obj/item/weapon/grenade/frag/m9_hedp
	belt = /obj/item/weapon/gun/projectile/m6d_magnum
	back = /obj/item/weapon/gun/projectile/ma5b_ar

////////Socks\\\\\\\\

//URFC

/obj/item/clothing/head/helmet/urfc/socks
	name = "H34D Dome Protector (TEXUS)"

	item_state = "socks-helmet_worn"
	icon_state = "socks-helmet_obj"

/obj/item/clothing/suit/armor/special/urfc/socks
	name = "I25B Heavy Chest Rig (TEXUS)"

	item_state = "socks-armor_worn"
	icon_state = "socks-armor_obj"

/obj/item/clothing/under/urfc_jumpsuit/socks
	name = "Eridanus Uniform (TEXUS)"

	item_state = "socks-jumpsuit_worn"
	icon_state = "socks-jumpsuit_obj"

/obj/item/clothing/shoes/magboots/urfc/socks
	name = "F76F Mag Boots (TEXUS)"

	item_state = "socks-boots_worn"
	icon_state = "socks-boots_obj"

/decl/hierarchy/outfit/socks_urfc
	name = "socks - URFC"
	uniform = /obj/item/clothing/under/urfc_jumpsuit/socks
	shoes = /obj/item/clothing/shoes/magboots/urfc/socks
	head = /obj/item/clothing/head/helmet/urfc/socks
	suit = /obj/item/clothing/suit/armor/special/urfc/socks

//Spartan

/obj/item/clothing/head/helmet/spartan/mkiv_domeprotector
	name = "MJOLNIR Powered Assault Armor Helmet Mark IV Special Issue Dome Protector"
	icon_state = "socks-spartanhelm_obj"
	item_state = "socks-spartanhelm_worn"

/obj/item/clothing/suit/armor/special/spartan/mkiv_domeprotector
	name = "MJOLNIR Powered Assault Armor Mark IV Special Issue Body Rig"
	icon_state = "socks-spartanarmor_obj"
	item_state = "socks-spartanarmor_worn"

/decl/hierarchy/outfit/socks_spartan
	name = "socks - spartan"
	uniform = /obj/item/clothing/under/spartan_internal
	suit = /obj/item/clothing/suit/armor/special/spartan/mkiv_domeprotector
	gloves = /obj/item/clothing/gloves/spartan
	shoes = /obj/item/clothing/shoes/magboots/spartan
	belt = /obj/item/weapon/storage/belt/marine_ammo
	head = /obj/item/clothing/head/helmet/spartan/mkiv_domeprotector
	l_ear = /obj/item/device/radio/headset/unsc/odsto
	suit_store = /obj/item/weapon/tank/emergency/oxygen/double
	l_pocket = /obj/item/ammo_magazine/m762_ap
	r_pocket = /obj/item/weapon/grenade/frag/m9_hedp
	belt = /obj/item/weapon/gun/projectile/m6d_magnum
	back = /obj/item/weapon/gun/projectile/ma5b_ar

////////Stingray\\\\\\\\

//Spartan

/obj/item/clothing/head/helmet/spartan/stingray
	name = "Ryan-074's MJOLNIR Powered Assault Armour Helmet"
	desc = "Ave, Imperator, morituri te salutant. The man who wore this looks as though he was very important."
	icon_state = "stingray-spartanhelm_obj"
	item_state = "stingray-spartanhelm_worn"

/obj/item/clothing/suit/armor/special/spartan/stingray
	name = "Ryan-074's MJOLNIR Powered Assault Armour"
	desc = "a technologically-advanced combat exoskeleton system designed to vastly improve the strength, speed, agility, reflexes and durability of a SPARTAN-II, supersoldier in the field of combat.This one appears to have been heavily modified per the user's tactical needs."
	icon_state = "stingray-spartanarmor_obj"
	item_state = "stingray-spartanarmor_worn"

/decl/hierarchy/outfit/stingray_spartan
	name = "stingray - spartan"
	uniform = /obj/item/clothing/under/spartan_internal
	suit = /obj/item/clothing/suit/armor/special/spartan/stingray
	gloves = /obj/item/clothing/gloves/spartan
	shoes = /obj/item/clothing/shoes/magboots/spartan
	belt = /obj/item/weapon/storage/belt/marine_ammo
	head = /obj/item/clothing/head/helmet/spartan/stingray
	l_ear = /obj/item/device/radio/headset/unsc/odsto
	suit_store = /obj/item/weapon/tank/emergency/oxygen/double
	l_pocket = /obj/item/ammo_magazine/m762_ap
	r_pocket = /obj/item/weapon/grenade/frag/m9_hedp
	belt = /obj/item/weapon/gun/projectile/m6d_magnum
	back = /obj/item/weapon/gun/projectile/ma5b_ar


////////wehraboo\\\\\\\\\

//ODST

/obj/item/clothing/head/helmet/odst/donator/wehraboo
	name = "SPI Helmet Mk I"
	item_state = "wehraboo-helmet_worn"
	icon_state = "wehraboo-helmet_obj"
	item_state_novisr = "wehraboo-helmet_worn"
	icon_state_novisr = "wehraboo-helmet_obj"

/obj/item/clothing/suit/armor/special/odst/donator/wehraboo
	name = "SPI Armour Mk I"
	item_state = "wehraboo-armor_worn"
	icon_state = "wehraboo-armor_obj"

/decl/hierarchy/outfit/wehraboo_odst
	name = "wehraboo - ODST"
	head = /obj/item/clothing/head/helmet/odst/donator/wehraboo
	suit = /obj/item/clothing/suit/armor/special/odst/donator/wehraboo

//Spartan

/obj/item/clothing/head/helmet/spartan/markvi_wehraboo
	name = "MJOLNIR Powered Assault Armor Helmet Mark VI"
	icon_state = "wehraboo-spartanhelm_obj"
	item_state = "wehraboo-spartanhelm_worn"

/obj/item/clothing/suit/armor/special/spartan/markvi_wehraboo
	name = "MJOLNIR Powered Assault Armor Mark VI"
	icon_state = "wehraboo-spartanarmor_obj"
	item_state = "wehraboo-spartanarmor_worn"

/decl/hierarchy/outfit/wehraboo_spartan
	name = "wehraboo - spartan"
	uniform = /obj/item/clothing/under/spartan_internal
	suit = /obj/item/clothing/suit/armor/special/spartan/markvi_wehraboo
	gloves = /obj/item/clothing/gloves/spartan
	shoes = /obj/item/clothing/shoes/magboots/spartan
	belt = /obj/item/weapon/storage/belt/marine_ammo
	head = /obj/item/clothing/head/helmet/spartan/markvi_wehraboo
	l_ear = /obj/item/device/radio/headset/unsc/odsto
	suit_store = /obj/item/weapon/tank/emergency/oxygen/double
	l_pocket = /obj/item/ammo_magazine/m762_ap
	r_pocket = /obj/item/weapon/grenade/frag/m9_hedp
	belt = /obj/item/weapon/gun/projectile/m6d_magnum
	back = /obj/item/weapon/gun/projectile/ma5b_ar

////////winterume\\\\\\\\

//ODST

/obj/item/clothing/head/helmet/odst/donator/winterume
	name = "Rose's Recon Helmet"

	item_state = "amy-helmet_worn"
	icon_state = "amy-helmet_obj"
	item_state_novisr = "amy-helmet-open_worn"
	icon_state_novisr = "amy-helmet_obj"

/obj/item/clothing/suit/armor/special/odst/donator/winterume
	name = "Rose's Recon Armor"

	icon_state = "amy-armor_worn"

/decl/hierarchy/outfit/winterume_odst
	name = "winterume - ODST"
	head = /obj/item/clothing/head/helmet/odst/donator/winterume
	suit = /obj/item/clothing/suit/armor/special/odst/donator/winterume

//Spartan

/obj/item/clothing/head/helmet/spartan/mkv_airassault_amy
	name = "MJOLNIR Powered Assault Armor Helmet Mark V Air Assault (customised)"
	icon_state = "amy-spartan-helm"
	item_state = "amy-spartan-helm-worn"

/obj/item/clothing/suit/armor/special/spartan/mkv_airassault_amy
	name = "MJOLNIR Powered Assault Armor Mark V Air Assault (customised)"
	icon_state = "amy-spartan-shell"
	item_state = "amy-spartan-shell-worn"

/decl/hierarchy/outfit/winterume_spartan
	name = "winterume - spartan"
	uniform = /obj/item/clothing/under/spartan_internal
	suit = /obj/item/clothing/suit/armor/special/spartan/mkv_airassault_amy
	gloves = /obj/item/clothing/gloves/spartan
	shoes = /obj/item/clothing/shoes/magboots/spartan
	belt = /obj/item/weapon/storage/belt/marine_ammo
	head = /obj/item/clothing/head/helmet/spartan/mkv_airassault_amy
	l_ear = /obj/item/device/radio/headset/unsc/odsto
	suit_store = /obj/item/weapon/tank/emergency/oxygen/double
	l_pocket = /obj/item/ammo_magazine/m762_ap
	r_pocket = /obj/item/weapon/grenade/frag/m9_hedp
	belt = /obj/item/weapon/gun/projectile/m6d_magnum
	back = /obj/item/weapon/gun/projectile/ma5b_ar



#undef ODST_OVERRIDE
#undef ITEM_INHAND