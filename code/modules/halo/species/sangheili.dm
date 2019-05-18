/datum/species/sangheili
	name = "Sangheili"
	name_plural = "Sangheili"
	blurb = "The Sangheili (Macto cognatus, \"I glorify my kin\"), known to humans as Elites, \
		are a saurian species of strong, proud, and intelligent warriors, as well as skilled \
		combat tacticians. Due to their skill in combat, the Sangheili have formed the military \
		backbone of the Covenant for almost the entirety of its existence. They had a very strong \
		rivalry with the upstart, crude Jiralhanae."
	flesh_color = "#4A4A64"
	blood_color = "#AB36AF"
	icobase = 'code/modules/halo/icons/species/r_elite.dmi' //The DMI needed modification to fit the usual format (see other species' dmis)
	deform = 'code/modules/halo/icons/species/r_elite.dmi'
	icon_template = 'code/modules/halo/icons/species/Sangheili_template.dmi'
	default_language = "Sangheili"
	language = "Sangheili"
	flags = NO_MINOR_CUT
	total_health = 250 // Stronger than humans at base health.
	radiation_mod = 0.6 //Covie weapons emit beta radiation. Resistant to 1/3 types of radiation.
	spawn_flags = SPECIES_CAN_JOIN
	brute_mod = 0.9
	pain_mod = 0.75 //Pain has quarter an effect on them
	slowdown = -0.5
	pixel_offset_x = -8
	item_icon_offsets = list(16,0)
	inherent_verbs = list(/mob/living/carbon/human/proc/dual_wield_weapons)
	default_faction = "Covenant"

	has_organ = list(
	BP_HEART =    /obj/item/organ/internal/heart,
	"second heart" =	 /obj/item/organ/internal/heart_secondary,
	BP_LUNGS =    /obj/item/organ/internal/lungs,
	BP_LIVER =    /obj/item/organ/internal/liver,
	BP_KIDNEYS =  /obj/item/organ/internal/kidneys,
	BP_BRAIN =    /obj/item/organ/internal/brain,
	BP_APPENDIX = /obj/item/organ/internal/appendix,
	BP_EYES =     /obj/item/organ/internal/eyes
	)

	equipment_slowdown_multiplier = 0.5
	ignore_equipment_threshold = 3

	pain_scream_sounds = list(\
	'code/modules/halo/sounds/species_pain_screams/elitescream_1.ogg',
	'code/modules/halo/sounds/species_pain_screams/elitescream_2.ogg',
	'code/modules/halo/sounds/species_pain_screams/elitescream_3.ogg',
	'code/modules/halo/sounds/species_pain_screams/elitescream_4.ogg',
	'code/modules/halo/sounds/species_pain_screams/elitescream_5.ogg',
	'code/modules/halo/sounds/species_pain_screams/elitescream_6.ogg',
	'code/modules/halo/sounds/species_pain_screams/elitescream_7.ogg',
	'code/modules/halo/sounds/species_pain_screams/elitescream_8.ogg',
	'code/modules/halo/sounds/species_pain_screams/elitescream_9.ogg',
	'code/modules/halo/sounds/species_pain_screams/elitescream_10.ogg',
	'code/modules/halo/sounds/species_pain_screams/elitescream_11.ogg')

/datum/species/sangheili/equip_survival_gear(var/mob/living/carbon/human/H,var/extendedtank = 1)
	return

/datum/species/sangheili/get_random_name(var/gender)
	var/newname = pick(GLOB.first_names_sangheili)
	newname += " "
	newname += pick(GLOB.last_names_sangheili)
	return newname
