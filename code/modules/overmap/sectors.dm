//===================================================================================
//Overmap object representing zlevel(s)
//===================================================================================
GLOBAL_LIST_EMPTY(overmap_tiles_uncontrolled) //This is any overmap sectors that are uncontrolled by any faction

var/list/points_of_interest = list()

/obj/effect/overmap
	name = "map object"
	icon = 'icons/obj/overmap.dmi'
	icon_state = "object"
	var/list/map_z = list()
	var/list/map_z_data = list()
	var/list/targeting_locations = list() // Format: "location" = list(TOP_LEFT_X,TOP_LEFT_Y,BOTTOM_RIGHT_X,BOTTOM_RIGHT_Y)
	var/weapon_miss_chance = 0
	var hit // for icon changes  when damaged

	//This is a list used by overmap projectiles to ensure they actually hit somewhere on the ship. This should be set so projectiles can narrowly miss, but not miss by much.
	var/list/map_bounds = list(1,255,255,1) //Format: (TOP_LEFT_X,TOP_LEFT_Y,BOTTOM_RIGHT_X,BOTTOM_RIGHT_Y)

	var/list/generic_waypoints = list()    //waypoints that any shuttle can use
	var/list/restricted_waypoints = list() //waypoints for specific shuttles

	var/start_x			//coordinates on the
	var/start_y			//overmap zlevel

	var/base = 0		//starting sector, counts as station_levels
	var/known = 1		//shows up on nav computers automatically
	var/in_space = 1	//can be accessed via lucky EVA

	var/list/hull_segments = list()
	var/superstructure_failing = 0
	var/list/connectors = list() //Used for docking umbilical type-items.
	var/faction = "civilian" //The faction of this object, used by sectors and NPC ships (before being loaded in). Ships have an override

	var/datum/targeting_datum/targeting_datum = new

	var/glassed = 0
	var/nuked = 0

	var/last_adminwarn_attack = 0

/obj/effect/overmap/New()
	//this should already be named with a custom name by this point
	if(name == "map object")
		name = "invalid-\ref[src]"

	if(!(src in GLOB.mobs_in_sectors))
		GLOB.mobs_in_sectors[src] = list()

	//custom tags are allowed to be set in map or elsewhere
	if(!tag)
		tag = name

	. = ..()

/obj/effect/overmap/Initialize()
	. = ..()
	setup_object()

/obj/effect/overmap/proc/get_superstructure_strength() //Returns a decimal percentage calculated from currstrength/maxstrength
	var/list/hull_strengths = list(0,0)
	for(var/obj/effect/hull_segment/hull_segment in hull_segments)
		if(hull_segment.is_segment_destroyed() == 0)
			hull_strengths[1] += hull_segment.segment_strength
		hull_strengths[2] += hull_segment.segment_strength

	if(hull_strengths[2] == 0)
		return null

	return (hull_strengths[1]/hull_strengths[2])

/obj/effect/overmap/proc/get_faction()
	return faction

/obj/effect/overmap/proc/setup_object()

	/*
	if(!GLOB.using_map.use_overmap)
		return INITIALIZE_HINT_QDEL
		*/

	if(!GLOB.using_map.overmap_z && GLOB.using_map.use_overmap)
		build_overmap()

	map_z |= loc.z
	//map_z = GetConnectedZlevels(z)
	//for(var/zlevel in map_z)
	map_sectors["[z]"] = src
	if(GLOB.using_map.use_overmap)
		var/turf/move_to_loc = pick(GLOB.overmap_tiles_uncontrolled)

		forceMove(move_to_loc)

		testing("Located sector \"[name]\" at [move_to_loc.x],[move_to_loc.y], containing Z [english_list(map_z)]")
	//points_of_interest += name

	/*
	GLOB.using_map.player_levels |= map_z
		*/

	/*
	if(!in_space)
		GLOB.using_map.sealed_levels |= map_z
		*/

	/*
	if(base)
		GLOB.using_map.station_levels |= map_z
		GLOB.using_map.contact_levels |= map_z
		*/

	//find shuttle waypoints
	var/list/found_waypoints = list()
	for(var/waypoint_tag in generic_waypoints)
		var/obj/effect/shuttle_landmark/WP = locate(waypoint_tag)
		if(WP)
			found_waypoints += WP
		else
			log_error("Sector \"[name]\" containing Z [english_list(map_z)] could not find waypoint with tag [waypoint_tag]!")
	generic_waypoints = found_waypoints

	for(var/shuttle_name in restricted_waypoints)
		found_waypoints = list()
		for(var/waypoint_tag in restricted_waypoints[shuttle_name])
			var/obj/effect/shuttle_landmark/WP = locate(waypoint_tag)
			if(WP)
				found_waypoints += WP
			else
				log_error("Sector \"[name]\" containing Z [english_list(map_z)] could not find waypoint with tag [waypoint_tag]!")
		restricted_waypoints[shuttle_name] = found_waypoints

/obj/effect/overmap/proc/link_zlevel(var/obj/effect/landmark/map_data/new_data)
	if(new_data)
		map_sectors["[new_data.z]"] = src
		map_z |= new_data.z

		var/obj/effect/landmark/map_data/above
		var/obj/effect/landmark/map_data/below
		for(var/obj/effect/landmark/map_data/check_data in map_z_data)

			//possible candidate for above
			if(check_data.z < new_data.z)
				//check_data is higher than new_data

				if(!above || check_data.z > above.z)
					//gottem
					above = check_data


			//possible candidate for below
			if(check_data.z > new_data.z)
				//check_data is lower than new_data

				if(!below || check_data.z < below.z)
					//gottem
					below = check_data


		//update the other linkages
		new_data.above = above
		if(above)
			above.below = new_data
		//
		new_data.below = below
		if(below)
			below.above = new_data

		//add it to our list
		map_z_data.Add(new_data)

/obj/effect/overmap/proc/get_waypoints(var/shuttle_name)
	. = generic_waypoints.Copy()
	if(shuttle_name in restricted_waypoints)
		. += restricted_waypoints[shuttle_name]

/obj/effect/overmap/proc/do_superstructure_fail()
	for(var/mob/player in GLOB.mobs_in_sectors[src])
		player.dust()
	loc = null
	message_admins("NOTICE: Overmap object [src] has been destroyed. Please wait as it is deleted.")
	log_admin("NOTICE: Overmap object [src] has been destroyed.")
	sleep(10)//To allow the previous message to actually be seen
	for(var/z_level in map_z)
		shipmap_handler.free_map(z_level)
	qdel(src)

/obj/effect/overmap/proc/pre_superstructure_failing()
	for(var/mob/player in GLOB.mobs_in_sectors[src])
		to_chat(player,"<span class = 'danger'>SHIP SUPERSTRUCTURE FAILING. ETA: [SUPERSTRUCTURE_FAIL_TIME/600] minutes.</span>")
	superstructure_failing = 1
	spawn(SUPERSTRUCTURE_FAIL_TIME)
		do_superstructure_fail()

/obj/effect/overmap/process()
	if(!isnull(targeting_datum.current_target) && !(targeting_datum.current_target in range(src,7)))
		targeting_datum.current_target = null
		targeting_datum.targeted_location = "target lost"
	if(superstructure_failing == -1)
		return
	if(superstructure_failing == 1)
		//TODO: Special messages/other effects whilst the superstructure fails.
		return
	var/list/superstructure_strength = get_superstructure_strength()
	if(isnull(superstructure_strength))
		superstructure_failing = -1
		return
	if(superstructure_strength <= SUPERSTRUCTURE_FAIL_PERCENT)
		pre_superstructure_failing()

/obj/effect/overmap/sector
	name = "generic sector"
	desc = "Sector with some stuff in it."
	icon_state = "sector"
	layer = TURF_LAYER
	anchored = 1

/obj/effect/overmap/sector/Initialize()
	. = ..()
	GLOB.processing_objects += src
	for(var/obj/machinery/computer/helm/H in GLOB.machines)
		H.get_known_sectors()

/obj/effect/overmap/sector/process()
	. = ..()
	if(15<=hit)
		src.icon_state="bombed"


/obj/effect/overmap/proc/adminwarn_attack(var/attacker)
	if(world.time > last_adminwarn_attack + 1 MINUTE)
		last_adminwarn_attack = world.time
		var/msg = "[src] is under attack[attacker ? " by [attacker]" : ""]"
		log_admin(msg)
		message_admins(msg)

/proc/build_overmap()
	if(!GLOB.using_map.use_overmap)
		return 1

	report_progress("Building overmap...")
	world.maxz++
	GLOB.using_map.overmap_z = world.maxz
	var/list/turfs = list()
	for (var/square in block(locate(1,1,GLOB.using_map.overmap_z), locate(GLOB.using_map.overmap_size,GLOB.using_map.overmap_size,GLOB.using_map.overmap_z)))
		var/turf/T = square
		if(T.x == GLOB.using_map.overmap_size || T.y == GLOB.using_map.overmap_size)
			T = T.ChangeTurf(/turf/unsimulated/map/edge)
		else
			T = T.ChangeTurf(/turf/unsimulated/map/)
			GLOB.overmap_tiles_uncontrolled += T
		T.lighting_clear_overlay()
		turfs += T

	var/area/overmap/A = new
	A.contents.Add(turfs)

	GLOB.using_map.sealed_levels |= GLOB.using_map.overmap_z

	report_progress("Overmap build complete.")
	shipmap_handler.max_z_cached = world.maxz
	return 1


