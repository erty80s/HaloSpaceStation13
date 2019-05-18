/datum/job/UNSC_ship/ai
	title = "AI"
	department_flag = SHIPAI
	spawn_positions = 1
	is_whitelisted = 1
	outfit_type = /decl/hierarchy/outfit/job/UNSC_ship/ship_ai
	selection_color = "#ccffcc"
	req_admin_notify = 1
	spawnpoint_override = "AI"
	//job_guide = "Your responsibility is to aid the captain and ship's crew and you are given a vast amount of autonomy to that end. You are entirely loyal to the UNSC and your current mission however."
	equip(var/mob/living/carbon/human/H)
		if(!H)	return 0
		return 1

/datum/job/UNSC_ship/ai/is_position_available()
	return (empty_playable_ai_cores.len != 0)

/datum/job/UNSC_ship/ai/equip_preview(mob/living/carbon/human/H)
	H.equip_to_slot_or_del(new /obj/item/clothing/suit/straight_jacket(H), slot_wear_suit)
	H.equip_to_slot_or_del(new /obj/item/clothing/head/cardborg(H), slot_head)
