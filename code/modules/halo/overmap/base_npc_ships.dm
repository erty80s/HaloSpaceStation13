
#define NPC_SHIP_LOSE_DELAY 10 MINUTES
#define ON_PROJECTILE_HIT_MESSAGES list(\
"We're taking fire. Requesting assistance from nearby ships! Repeat; Taking fire!",\
"Our hull has been breached! Help!",\
"Sweet hell, is this what we pay our taxes for?!","We're on your side!","Please, we're unarmed!","Oh god, they're firing on us!",\
"PLEASE! WE HAVE FAMILIES!"\
)
#define ON_DEATH_MESSAGES list(\
"Do you feel like a hero yet?","Oof-",\
"You bastards.","Automated Alert: Fuel lines damaged. Multiple hull breaches. Immediate assistance required."\
)
#define ALL_CIVILIANS_SHIPNAMES list(\
"Pete's Cube","The Nomad","The Alexander","Free Range","Bigger Stick","Fist of Sol","Hammerhead","Spirit of Jupiter","Trident","The Messenger","Slow But Steady","Road Less Travelled","Dawson's Christian","Flexi Taped","Paycheck","Distant Home"\
)

#define STOP_WAIT_TIME 5 MINUTES
#define STOP_DISEMBARK_TIME 2 MINUTES

#define BROADCAST_ON_HIT_PROB 15

/obj/effect/overmap/ship/npc_ship
	name = "Ship"
	desc = "A ship, Duh."

	icon = 'code/modules/halo/overmap/freighter.dmi'
	icon_state = "ship"

	var/list/ship_name_list = ALL_CIVILIANS_SHIPNAMES

	var/list/messages_on_hit = ON_PROJECTILE_HIT_MESSAGES
	var/list/messages_on_death = ON_DEATH_MESSAGES
	var/message_language = "Galactic Common"

	var/hull = 700 //Essentially used to tell the ship when to "stop" trying to move towards it's area.

	var/move_delay = 6 SECONDS //The amount of ticks to delay for when auto-moving across the system map.
	var/turf/target_loc

	var/unload_at = 0
	var/list/ship_datums = list(/datum/npc_ship/ccv_star)
	var/datum/npc_ship/chosen_ship_datum
	var/list/available_ship_requests = newlist(/datum/npc_ship_request/halt)

	var/list/projectiles_to_spawn = list()

	var/list/cargo_contained = list()

	var/list/cargo_containers = list()

/obj/effect/overmap/ship/npc_ship/New()
	generate_ship_name()
	. = ..()

/obj/effect/overmap/ship/npc_ship/proc/cargo_init()
	if(cargo_containers.len == 0 || cargo_contained.len == 0)
		return
	var/counter = 0
	var/objs_per_container = max((cargo_contained.len / cargo_containers.len),1)
	var/list/valid_containers = cargo_containers
	for(var/typepath in cargo_contained)
		var/obj/structure/closet/our_container
		if(counter >= objs_per_container || isnull(our_container))
			our_container.store_contents()
			our_container = pick(valid_containers)
			counter = 0
		if(cargo_contained.Find(typepath) == cargo_contained.len)
			our_container.store_contents()
		counter += 1
		var/obj/new_obj = new typepath
		new_obj.loc = our_container.loc

/obj/effect/overmap/ship/npc_ship/get_faction()
	if(!unload_at)
		return faction
	else if(nav_comp)
		return nav_comp.get_faction()
	else
		return null

/obj/effect/overmap/ship/npc_ship/proc/is_player_controlled()
	for(var/datum/npc_ship_request/player_controlled/pc in available_ship_requests)
		return 1
	return 0

/obj/effect/overmap/ship/npc_ship/proc/can_board() //So this sort of stuff can be overidden later down the line for things like cargo shuttles.
	if(is_player_controlled())
		return 1
	if(hull < initial(hull)/4)
		return 1
	if(isnull(target_loc))
		return 1
	return 0

/obj/effect/overmap/ship/npc_ship/proc/radio_message(var/mob/target_mob = null,var/message = null) //If no targetmob supplied, broadcasts to all players
	if(target_mob)
		if(!istype(target_mob))
			message = target_mob
		else
			to_chat(target_mob,message)
			return

	for(var/mob/living/m in GLOB.player_list)
		if(m.stat == CONSCIOUS)
			to_chat(m,message)

/obj/effect/overmap/ship/npc_ship/proc/lose_to_space()
	if(hull > initial(hull)/4)//If they still have more than quarter of their "hull" left, let them drift in space.
		return
	unload_at = world.time + NPC_SHIP_LOSE_DELAY / 2
	for(var/mob/player in GLOB.player_list)
		if(player.stat != DEAD)
			for(var/z_level in map_z)
				if("[player.z]" == "[z_level]")
					return//Don't disappear if there's people aboard.
	for(var/obj/docking_umbilical/umbi in connectors)//Don't disappear if we're docked with something
		if(umbi.current_connected)
			return
	for(var/z_level in map_z)
		shipmap_handler.free_map(z_level)
		map_z -= z_level
	GLOB.processing_objects -= src
	qdel(src)

/obj/effect/overmap/ship/npc_ship/proc/generate_ship_name()
	name = pick(ship_name_list)

/obj/effect/overmap/ship/npc_ship/Initialize()
	var/turf/start_turf = locate(x,y,z)
	. = ..()
	map_z.Cut()
	if(!isnull(start_turf))
		forceMove(start_turf)
	pick_target_loc()

/obj/effect/overmap/ship/npc_ship/proc/ship_targetedby_defenses()
	target_loc = pick(GLOB.overmap_tiles_uncontrolled)

/obj/effect/overmap/ship/npc_ship/proc/pick_target_loc()

	var/n_x = rand(1, GLOB.using_map.overmap_size - 1)
	var/n_y = rand(1, GLOB.using_map.overmap_size - 1)

	target_loc = locate(n_x,n_y,GLOB.using_map.overmap_z)

/obj/effect/overmap/ship/npc_ship/process()
	if(world.time >= unload_at && unload_at != 0)
		lose_to_space()
	if(hull > initial(hull)/4)
		var/stop_normal_operations = 0
		for(var/datum/npc_ship_request/request in available_ship_requests)
			if(request.request_requires_processing)
				stop_normal_operations = request.do_request_process(src)
		if(stop_normal_operations || is_player_controlled())
			return ..()
		if(loc == target_loc)
			pick_target_loc()
		else

			walk(src,get_dir(src,target_loc),move_delay)
			dir = get_dir(src,target_loc)
			is_still() //A way to ensure umbilicals break when we move.
	else
		if(is_player_controlled())
			. = ..()
		if(target_loc)
			walk(src,0)
			target_loc = null

/obj/effect/overmap/ship/npc_ship/proc/broadcast_hit(var/ship_disabled = 0)
	var/message_to_use = pick(messages_on_hit)
	if(ship_disabled)
		message_to_use = pick(messages_on_death)
	for(var/mob/living/m in GLOB.player_list)
		var/have_lang = 0
		for(var/datum/language/l in m.languages)
			if(l.name == message_language)
				radio_message(m,"<span class = 'radio'>\[EBAND\] [name]: \"[message_to_use]\" \[[x]:[y]\]</span>")
				have_lang = 1
				break
		if(!have_lang)
			var/new_message = ""
			var/datum/language/default = m.get_default_language()
			var/iter
			for(iter = 0; iter <= lentext(message_to_use)/2; iter++)
			if(!isnull(default))
				new_message += pick(default.syllables)
			else
				new_message += pick("a","e","i","o","u")
			radio_message(m,"<span class = 'radio'>\[EBAND\] [name]: \"[new_message]\" \[[x]:[y]\]</span>")

/obj/effect/overmap/ship/npc_ship/proc/take_projectiles(var/obj/item/projectile/overmap/proj,var/add_proj = 1)
	if(add_proj)
		projectiles_to_spawn += proj
	if(is_player_controlled())
		return
	hull -= proj.damage
	if(hull <= initial(hull)/4 && target_loc)
		broadcast_hit(1)
	else
		if(prob(BROADCAST_ON_HIT_PROB)) //If we get the probability, broadcast the hit.
			broadcast_hit()

	if(add_proj && hull <=0) // So we don't delete the ship from damage when it's loaded in.
		lose_to_space()

/obj/effect/overmap/ship/npc_ship/proc/pick_ship_datum()
	chosen_ship_datum = pick(ship_datums)
	chosen_ship_datum = new chosen_ship_datum

/obj/effect/overmap/ship/npc_ship/proc/load_mapfile()
	set background = 1
	if(unload_at)
		return
	if(!chosen_ship_datum)
		pick_ship_datum()
	unload_at = world.time + NPC_SHIP_LOSE_DELAY
	map_bounds = chosen_ship_datum.map_bounds
	fore_dir = chosen_ship_datum.fore_dir
	map_z = list()
	for(var/link in chosen_ship_datum.mapfile_links)
		to_world("Loading Ship-Map: [link]... This may cause lag.")
		sleep(10) //A small sleep to ensure the above message is printed before the loading operation commences.
		var/z_to_load_at = shipmap_handler.get_next_usable_z()
		shipmap_handler.un_free_map(z_to_load_at)
		map_sectors["[z_to_load_at]"] = src
		maploader.load_map(link,z_to_load_at)
		var/obj/effect/landmark/map_data/md = new(locate(1,1,z_to_load_at))
		src.link_zlevel(md)
		map_z += z_to_load_at //The above proc will increase the maxz by 1 to accomodate the new map. This deals with that.
		create_lighting_overlays_zlevel(z_to_load_at)
	cargo_init()
	damage_spawned_ship()
	GLOB.processing_objects += src

/obj/effect/overmap/ship/npc_ship/proc/damage_spawned_ship()
	for(var/obj/item/projectile/overmap/proj in projectiles_to_spawn)
		projectiles_to_spawn -= proj
		proj.do_z_level_proj_spawn(pick(map_z),src)
		qdel(proj)

/obj/effect/overmap/ship/npc_ship/proc/get_requestable_actions(var/authority_level)
	var/list/requestable_actions = list()
	. = requestable_actions
	for(var/datum/npc_ship_request/npc_ship_request in available_ship_requests)
		if(npc_ship_request.request_name == "")
			continue
		if(authority_level in npc_ship_request.request_auth_levels)
			requestable_actions += npc_ship_request.request_name

/obj/effect/overmap/ship/npc_ship/proc/parse_action_request(var/request,var/mob/requester,var/auth_level)
	for(var/datum/npc_ship_request/npc_ship_request in available_ship_requests)
		if(request == npc_ship_request.request_name && auth_level in npc_ship_request.request_auth_levels)
			npc_ship_request.do_request(src,requester)

/datum/npc_ship_request
	var/request_name = "Request" //Name of the request. Use "" if you don't want it to appear in the request-list and merely want to use if for behind-the-scense processing.
	var/list/request_auth_levels = list()
	var/request_requires_processing = 0

/datum/npc_ship_request/proc/do_request(var/obj/effect/overmap/ship/npc_ship/ship_source,var/mob/requester)

/datum/npc_ship_request/proc/do_request_process(var/obj/effect/overmap/ship/npc_ship/ship_source) //Return 1 in this to stop normal NPC ship move processing.

/datum/npc_ship_request/halt
	request_name = "Halt"
	request_auth_levels = list(AUTHORITY_LEVEL_UNSC,AUTHORITY_LEVEL_ONI)
	var/time_leave_at = 0
	var/already_warned = 0

/datum/npc_ship_request/halt/do_request(var/obj/effect/overmap/ship/npc_ship/ship_source,var/mob/requester)
	if(time_leave_at > 0)
		to_world("<span class = 'radio'>\[System\] [ship_source.name]: \"Woah, Calm down. We're already waiting on someone's behalf.\"</span>")
		return
	ship_source.target_loc = null
	to_world("<span class = 'radio'>\[System\] [ship_source.name]: \"Slowing down.. I can only give you [STOP_WAIT_TIME/600] minutes.\"</span>")
	request_requires_processing = 1
	time_leave_at = world.time + STOP_WAIT_TIME

/datum/npc_ship_request/halt/do_request_process(var/obj/effect/overmap/ship/npc_ship/ship_source)
	if(time_leave_at != 0 && world.time > time_leave_at)
		if(already_warned)
			time_leave_at = 0
			ship_source.pick_target_loc()
			already_warned = 0
			request_requires_processing = 0
			return
		already_warned = 1
		to_world("<span class = 'radio'>\[System\] [ship_source.name]: \"I need to leave now. I'll give you [STOP_DISEMBARK_TIME/600] minutes to disembark.\"</span>")
		time_leave_at = world.time + STOP_DISEMBARK_TIME

/datum/npc_ship
	var/list/mapfile_links = list('maps/civ_hauler/civhauler.dmm')//Multi-z maps should be included in a bottom to top order.

	var/fore_dir = WEST //The direction of "fore" for the mapfile.
	var/list/map_bounds = list(1,50,50,1)//Used for projectile collision bounds for the selected mapfile. Format: Topleft-x,Topleft-y,bottomright-x,bottomright-y

/datum/npc_ship/ccv_star
	mapfile_links = list('maps/overmap_ships/CCV_Star.dmm')
	fore_dir = WEST
	map_bounds = list(1,50,50,1)

/datum/npc_ship/ccv_comet
	mapfile_links = list('maps/overmap_ships/CCV_Comet.dmm')
	fore_dir = WEST
	map_bounds = list(1,50,50,1)

/datum/npc_ship/ccv_sbs
	mapfile_links = list('maps/overmap_ships/CCV_Slow_But_Steady.dmm')
	fore_dir = WEST
	map_bounds = list(6,51,72,27)

/datum/npc_ship/unsc_patrol
	mapfile_links = list('maps/overmap_ships/UNSC_Corvette.dmm')
	fore_dir = WEST
	map_bounds = list(7,70,54,29)

#undef NPC_SHIP_LOSE_DELAY
#undef ON_PROJECTILE_HIT_MESSAGES
#undef ON_DEATH_MESSAGES
#undef ALL_Civilian_SHIPNAMES
