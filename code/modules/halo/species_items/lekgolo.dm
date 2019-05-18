
//Mgalekgolo defines//
/mob/living/simple_animal/mgalekgolo
	name = "mgalekgolo"
	desc = "A hulking monstrosity of flowing worms encased in starship-grade alloy."

	icon = 'code/modules/halo/icons/species/hunters.dmi'
	icon_state = "hunter0"
	icon_living = "hunter0"
	icon_dead = "hunter_dead"

	layer = ABOVE_HUMAN_LAYER

	maxHealth = 400
	health = 400
	unsuitable_atoms_damage = 0
	var/crouched = 0

	stop_automated_movement = 1
	wander = 0
	mob_size = MOB_LARGE
	speed = 2
	var/crouch_speed = 20

	bound_width = 64
	bound_height = 64

	mob_bump_flag = HEAVY
	mob_swap_flags = HEAVY
	mob_push_flags = HEAVY
	var/custom_name

	languages = list(LANGUAGE_SANGHEILI,LANGUAGE_LEKGOLO)
	melee_damage_lower = 30
	melee_damage_upper = 50
	attacktext = "swiped"
	a_intent = I_HURT
	resistance = 35 //5 below an active energy sword
	attack_sound = 'sound/weapons/heavysmash.ogg'

	/*response_help   = "pokes"
	response_disarm = "pokes"
	response_harm   = "thinks better about punching"*/
	harm_intent_damage = 10

	var/datum/mgalekgolo_weapon/active_weapon = /datum/mgalekgolo_weapon/fuel_rod_cannon
	var/atom/current_target
	var/regeneration = 1

	var/hud_setup = 0

/mob/living/simple_animal/mgalekgolo/New()
	. = ..()

	name = capitalize(random_name())

	active_weapon = new active_weapon()

	for(var/language in languages)
		languages -= language
		add_language(language)

	//create our actions
	for(var/action_type in typesof(/obj/item/hunter_action) - /obj/item/hunter_action)
		new action_type(src)

	faction = "Covenant"

/mob/living/simple_animal/mgalekgolo/proc/random_name()
 	var/list/syllables = list("rg","rx","ll","rk","ck","rt","tr","rl","sn","ns","sl","ls","sp","ps")
 	var/list/vowels = list("a","e","i","o","u")
 	var/final_name = pick(syllables) + pick(vowels) + pick(syllables) + pick(vowels) + pick(syllables) + pick(vowels) + pick(syllables) + pick(vowels) + pick(syllables) + pick(vowels) + pick(syllables) + pick(vowels)
 	//The loop that was doing the above in previous versions was causing crashes. I've only done it this way as a temporary fix until a more efficient version does not crash.
 	return final_name

/mob/living/simple_animal/mgalekgolo/Life()
	//handle hud updates. there might be a better way to do this
	if(client)
		if(!hud_setup)
			hud_setup = update_action_buttons()
	else if(hud_setup)
		hud_setup = 0

	. = ..() //Placed here to ensure that it can still check the health before regeneration happens.

	//heal a little
	if(stat != DEAD && health < maxHealth)
		health += regeneration

	//regain charge
	if(active_weapon.charge_amount <= active_weapon.charge_max)
		active_weapon.charge_amount += active_weapon.charge_recharge_amount

/mob/living/simple_animal/mgalekgolo/verb/set_name()
	set name = "Set Name"

	set category = "Abilities"

	if(custom_name)
		to_chat(src,"<span class = 'notice'>You've already changed your name. Contact an admin for further name modification.</span>")
		return
	var/user_input_name = input("Change your name","Name Change",null)
	if(isnull(user_input_name))
		return
	real_name = user_input_name
	name = real_name
	custom_name = real_name

/mob/living/simple_animal/mgalekgolo/SelfMove(turf/n, direct)
	var/olddir = dir
	.  = Move(n, direct)
	if(crouched)
		dir = olddir
