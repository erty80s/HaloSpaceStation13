var/datum/antagonist/insurrectionist/innies

/datum/antagonist/insurrectionist
	id = MODE_INNIE
	role_type = BE_INNIE
	role_text = "Insurrectionist"
	bantype = "operative"
	antag_indicator = "innie"
	role_text_plural = "Insurrectionists"
	landmark_id = "Insurrectionist-Spawn"
	leader_welcome_text = "You are the leader of the Insurrectionist forces, down with the UNSC! Use :t to speak to your underlings."
	welcome_text = "To speak on your group's private channel use :t."
	flags = ANTAG_OVERRIDE_JOB | ANTAG_CLEAR_EQUIPMENT | ANTAG_CHOOSE_NAME | ANTAG_HAS_NUKE | ANTAG_SET_APPEARANCE | ANTAG_HAS_LEADER
	id_type = /obj/item/weapon/card/id/syndicate
	antaghud_indicator = "hudoperative"

	hard_cap = 4
	hard_cap_round = 8
	initial_spawn_req = 4
	initial_spawn_target = 6

/datum/antagonist/insurrectionist/New()
	..()
	innies = src

/datum/antagonist/insurrectionist/create_global_objectives()
	if(!..())
		return 0
	global_objectives = list()
	global_objectives |= new /datum/objective/insurrection
	return 1

/datum/antagonist/insurrectionist/equip(var/mob/living/carbon/human/player)

	if(!..())
		return 0

	player.equip_to_slot_or_del(new /obj/item/clothing/under/syndicate(player), slot_w_uniform)
	player.equip_to_slot_or_del(new /obj/item/clothing/shoes/black(player), slot_shoes)
	player.equip_to_slot_or_del(new /obj/item/clothing/gloves/swat(player), slot_gloves)
	if(player.backbag == 2) player.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack(player), slot_back)
	if(player.backbag == 3) player.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel_norm(player), slot_back)
	if(player.backbag == 4) player.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel(player), slot_back)
	player.equip_to_slot_or_del(new /obj/item/weapon/storage/box/engineer(player.back), slot_in_backpack)
	player.equip_to_slot_or_del(new /obj/item/weapon/reagent_containers/pill/cyanide(player), slot_in_backpack)

	if (player.mind == leader)
		var/obj/item/device/radio/uplink/U = new(player.loc, player.mind, 40)
		player.put_in_hands(U)

	player.update_icons()

	create_id("Insurrectionist", player)
	create_radio(SYND_FREQ, player)
	return 1