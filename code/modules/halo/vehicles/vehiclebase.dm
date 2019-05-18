#define ALL_VEHICLE_POSITIONS list("driver","passenger","gunner")
#define VEHICLE_LOAD_DELAY 2.5 SECONDS //This is the delay to load people onto the vehicle.
#define VEHICLE_ITEM_LOAD 3.0 SECONDS

/obj/vehicles
	name = "Vehicle"
	desc = "Vehicle"
	density = 1
	plane = ABOVE_HUMAN_PLANE
	layer = ABOVE_HUMAN_LAYER

	var/active = 1
	var/guns_disabled = 0
	var/movement_destroyed = 0
	var/block_enter_exit //Set this to block entering/exiting.

	//Advanced Damage Handling
	var/datum/component_profile/comp_prof = /datum/component_profile

	var/vehicle_move_delay = 1

	var/list/sprite_offsets = list("1" = list(0,0),"2" = list(0,0),"4" = list(0,0),"8" = list(0,0)) //Handled Directionally. Numbers correspond to directions

	//Passenger Management
	var/list/occupants = list(1,1) //Contains all occupants of the vehicle including the driver. First 2 values defines max passengers /gunners. Format: [MobRef] = [PositionName]

	var/list/exposed_positions = list("driver" = 0.0,"gunner" = 0.0,"passenger" = 0.0) //Assoc. Value is the chance of hitting this position

	//Vehicle ferrying//
	var/vehicle_size = 0//The size of the vehicle, used by vehicle cargo ferrying to determine allowed amount and allowed size.

	var/vehicle_view_modifier = 1 //The view-size modifier to apply to the occupants of the vehicle.
	var/move_sound = null

	light_power = 4
	light_range = 6

/obj/vehicles/verb/toggle_headlights()
	set name = "Toggle Headlights"
	set category = "Vehicle"
	set src in view(1)
	var/mob/living/user = usr
	if(!istype(user) || !(user in get_occupants_in_position("driver")))
		to_chat(user,"<span class = 'notice'>You must be the driver of [src] to toggle the headlights.</span>")
		return

	if(light_range == 0)
		to_chat(user,"<span class = 'notice'>You toggle [src]'s headlights on.</span>")
		set_light(initial(light_range))
	else
		to_chat(user,"<span class = 'notice'>You toggle [src]'s headlights off.</span>")
		set_light(0)

/obj/vehicles/New()
	. = ..()
	comp_prof = new comp_prof(src)
	GLOB.processing_objects += src
	update_object_sprites()
	if(light_range != 0)
		verbs += /obj/vehicles/verb/toggle_headlights
		set_light(0) //Switch off at spawn.

/obj/vehicles/examine(var/mob/user)
	. = ..()
	if(!active)
		to_chat(user,"[src]'s engine is inactive.")
	if(guns_disabled)
		to_chat(user,"[src]'s guns are damaged beyond use.")
	if(movement_destroyed)
		to_chat(user,"[src]'s movement is damaged beyond use.")
	show_occupants_contained(user)

/obj/vehicles/proc/update_user_view(var/mob/user,var/reset = 0)
	if(user.client)
		if(reset)
			user.client.view = world.view
			user.client.pixel_x = 0
			user.client.pixel_y = 0
		else
			user.client.view *= vehicle_view_modifier

/obj/vehicles/proc/show_occupants_contained(var/mob/user)
	to_chat(user,"<span class = 'notice'>Its visible occupants are:</span>")
	for(var/mob/M in occupants)
		if(occupants[M] in exposed_positions)
			M.examine(user)

/obj/vehicles/proc/is_atom_adjacent(var/atom/A,var/turf/center_turf)
	if(A in contents || A in occupants)
		return 1
	if(center_turf)
		return center_turf.Adjacent(A)
	else
		for(var/turf/T in locs)
			if(T.Adjacent(A))
				return 1
	return 0

/obj/vehicles/proc/pick_valid_exit_loc()
	var/list/valid_exit_locs = list()
	for(var/turf/t in locs)
		for(var/turf/t_2 in range(1,t))
			if(!(t_2 in locs))
				valid_exit_locs |= t
				break
	if(valid_exit_locs.len == 0)
		return null
	return pick(valid_exit_locs)

/obj/vehicles/Destroy()
	GLOB.processing_objects -= src
	. = ..()

/obj/vehicles/proc/on_death()
	explosion(loc,-1,-1,2,5)
	movement_destroyed = 1
	icon_state = "[initial(icon_state)]_destroyed"

/obj/vehicles/proc/kick_occupants()
	for(var/mob/m in occupants)
		exit_vehicle(m,1)

/obj/vehicles/proc/inactive_pilot_effects() //Overriden on a vehicle-by-vehicle basis.

/obj/vehicles/process()
	if(world.time % 3)
		comp_prof.give_gunner_weapons(src)
		update_object_sprites()
		if(active)
			var/list/drivers = get_occupants_in_position("driver")
			if(!drivers.len || isnull(drivers) || movement_destroyed)
				inactive_pilot_effects()

/obj/vehicles/proc/update_object_sprites() //This is modified on a vehicle-by-vehicle basis to render mobsprites etc, a basic render of playerheads in the top right is used if no overidden.
	underlays.Cut()
	overlays.Cut()
	var/occupant_counter = 0
	for(var/mob/living/carbon/human/h in occupants)
		occupant_counter++
		var/gender_suffix = "m"
		if(h.gender == "female")
			gender_suffix = "f"
		var/image/head_bg = image('code/modules/halo/vehicles/headrep_base.dmi',"base")
		var/image/mob_head = image(h.species.icobase,icon_state = "head_[gender_suffix]",dir = SOUTH)
		var/shift_by
		if(occupant_counter*9 >= bound_width) //Don't bother with more than one line of heads
			return
		if(occupant_counter*9 >= bound_width/2) //Handles basic occupant representation by creating small images of their heads and then shifting them in the top left corner of the icon.
			shift_by = (occupant_counter*9) - 16 //*9 multiplier is applied to lower the amount of overlap on the head icons.
		else
			shift_by = -16 + (occupant_counter*9)
		var/icon/mob_head_icon = new(mob_head.icon,mob_head.icon_state,SOUTH)
		var/extra_shiftby_y = 0
		if(mob_head_icon.Height() > 32)
			extra_shiftby_y = mob_head_icon.Height() - 32
		mob_head.pixel_y = ((bound_height-(32 + extra_shiftby_y)) + 3) + h.species.pixel_offset_y
		head_bg.pixel_y = (bound_height-32) + 3 + h.species.pixel_offset_y
		mob_head.pixel_x = shift_by + h.species.pixel_offset_x
		head_bg.pixel_x = shift_by + h.species.pixel_offset_x
		overlays += head_bg
		overlays += mob_head

/obj/vehicles/Move()
	if(anchored)
		anchored = 0
		. = ..()
		anchored = 1
	else
		. = ..()
	update_object_sprites()

/obj/vehicles/proc/get_occupants_in_position(var/position = null)
	var/list/to_return = list()
	for(var/mob/occupant in occupants)
		if(occupants[occupant] == position)
			to_return += occupant
	return to_return

/obj/vehicles/proc/get_occupant_amount()
	return (occupants.len - 2)

//Returns null to allow the enter, a string to disallow.
/obj/vehicles/proc/check_enter_invalid()
	if(get_occupant_amount() + 1 > (1 + occupants[1] + occupants[2]))
		return "[src] is full!"
	return

/obj/vehicles/proc/check_position_blocked(var/position)
	if(block_enter_exit)
		return 1
	var/list/occupants_in_pos = get_occupants_in_position(position)
	if(position == "passenger" && occupants_in_pos.len + 1 > occupants[1])
		return 1
	if(position == "gunner" && occupants_in_pos.len + 1 > occupants[2])
		return 1
	if(position == "driver" && occupants_in_pos.len >= 1)
		return 1
	return 0

/obj/vehicles/proc/enter_as_position(var/mob/user,var/position = "passenger")
	if(check_position_blocked(position))
		to_chat(user,"<span class = 'notice'>No [position] spaces in [src]</span>")
		return 0
	var/mob/living/h_test = user
	if(!istype(h_test) && position == "driver")
		to_chat(user,"<span class = 'notice'>You don't know how to drive that.</span>") //Let's assume non-living mobs can't drive.
		return
	var/can_enter = check_enter_invalid()
	if(can_enter)
		to_chat(user,"<span class = 'notice'>[can_enter]</span>")
		return 0
	if(user in occupants)
		if(occupants[user] == position)
			to_chat(user,"<span class = 'notice'>You're already a [position] of [src]</span>")
			return 0
		occupants[user] = position
		update_object_sprites()
		return 1

	occupants += user
	occupants[user] = position
	user.loc = contents
	contents += user
	update_object_sprites()
	update_user_view(user)
	return 1

/obj/vehicles/proc/do_seat_switch(var/mob/user,var/position)
	var/list/occ_in_pos = get_occupants_in_position(position)
	if(!occ_in_pos||occ_in_pos.len == 0)
		to_chat(user,"<span class = 'notice'>There are no [position] slots in [src]</span>")
	var/mob/occ_tradewith = pick(occ_in_pos)
	var/user_position = occupants[user]
	var/tradewith_response = alert(occ_tradewith,"[user], [user_position] wants to switch seats with you. Accept?",,"Yes","No")
	if(tradewith_response == "No" || isnull(tradewith_response))
		to_chat(user,"<span class = 'warning'>[occ_tradewith] denied your seat-switch request.</span>")
		return
	occupants[user] = "Awaiting Trade" //Used to allow for debugging if anything goes wrong during seat switch
	occupants[occ_tradewith] = "Awaiting Trade"
	enter_as_position(user,position)
	enter_as_position(occ_tradewith,user_position)

/obj/vehicles/verb/switch_seats()
	set name = "Switch Seats"
	set category = "Vehicle"
	set src in view(1)
	var/mob/user = usr
	if(!istype(user) || !is_atom_adjacent(user))
		return
	var/position_switchto = input(user,"Enter which position?","Vehicle Position Select","Cancel") in ALL_VEHICLE_POSITIONS + list("Cancel")
	if(position_switchto == "Cancel")
		return
	if(check_position_blocked(position_switchto))
		do_seat_switch(user,position_switchto)
		return
	else
		enter_as_position(user,position_switchto)
	update_object_sprites()

/obj/vehicles/verb/verb_exit_vehicle()
	set name = "Exit Vehicle"
	set category = "Vehicle"
	set src in view(1)

	var/mob/user = usr

	exit_vehicle(user)

/obj/vehicles/proc/exit_vehicle(var/mob/user,var/ignore_incap_check = 0)

	if(!(user in occupants) || !is_atom_adjacent(user))
		return
	if(user.incapacitated() && !ignore_incap_check)
		return
	var/loc_moveto = pick_valid_exit_loc()
	if(isnull(loc_moveto))
		to_chat(user,"<span class = 'notice'>There is no valid location to exit at.</span>")
		return
	occupants -= user
	contents -= user
	user.forceMove(loc_moveto)
	update_object_sprites()
	update_user_view(user,1)

/obj/vehicles/verb/enter_vehicle()
	set name = "Enter Vehicle"
	set category = "Vehicle"
	set src in view(1)

	var/mob/living/user = usr
	if(!istype(user) || !is_atom_adjacent(user) || user.incapacitated())
		return
	var/player_pos_choice = input(user,"Enter which position?","Vehicle Entry Position Select","Cancel") in ALL_VEHICLE_POSITIONS + list("Cancel")
	if(player_pos_choice == "Cancel")
		return
	else
		enter_as_position(user,player_pos_choice)

/obj/vehicles/proc/damage_occupant(var/position,var/obj/item/P,var/mob/user = null)
	var/list/occ_list = get_occupants_in_position(position)
	if(isnull(occ_list) || !occ_list.len)
		return 1
	var/mob/mob_to_hit = pick(occ_list)
	if(isnull(mob_to_hit))
		return 1
	if(user)
		mob_to_hit.attackby(P,user)
		return 0
	else
		mob_to_hit.bullet_act(P)
		return 0

/obj/vehicles/proc/should_damage_occ()
	for(var/position in exposed_positions)
		var/hit_chance = exposed_positions[position]
		if(isnull(hit_chance))
			continue
		if(prob(hit_chance))
			return position
	return null

/obj/vehicles/bullet_act(var/obj/item/projectile/P, var/def_zone)
	var/pos_to_dam = should_damage_occ()
	var/mob/mob_to_dam
	if(guns_disabled)
		var/list/mobs = list()
		for(var/mob/m in occupants)
			mobs += m
		mob_to_dam = pick(mobs)
		if(!isnull(mob_to_dam))
			mob_to_dam.bullet_act(P)
			return
	if(!isnull(pos_to_dam))
		var/should_continue = damage_occupant(pos_to_dam,P)
		if(!should_continue)
			return
	comp_prof.take_component_damage(P.get_structure_damage(),P.damtype)

/obj/vehicles/ex_act(var/severity)
	comp_prof.take_comp_explosion_dam(severity)
	for(var/position in exposed_positions)
		for(var/mob/living/m in get_occupants_in_position(position))
			m.apply_damage((250/severity)*(exposed_positions[position]/100),BRUTE,,m.run_armor_check(null,"bomb"))

//TODO: REIMPLEMENT SPEED BASED MOVEMENT
/obj/vehicles/relaymove(var/mob/user, var/direction)
	if(movement_destroyed)
		to_chat(user,"<span class = 'notice'>[src] is in no state to move!</span>")
		return
	if(!active)
		to_chat(user,"<span class = 'notice'>[src] needs to be active to move!</span>")
		return
	var/turf/new_loc = get_step(src.loc,direction)
	var/list/driver_list = get_occupants_in_position("driver")
	var/is_driver = FALSE
	for(var/mob/driver in driver_list)
		if(user == driver)
			is_driver = TRUE
			break
	if(!is_driver)
		return
	Move(new_loc,direction)
	if(move_sound)
		playsound(loc,move_sound,75,0,4)
	user.client.move_delay = world.time + vehicle_move_delay

/obj/vehicles/proc/put_cargo_item(var/mob/user,var/obj/O)
	if(O == src)
		return
	var/confirm = alert(user,"Place [O.name] into [src.name]'s storage?",,"Yes","No")
	if(confirm != "Yes" || !is_atom_adjacent(user) || !is_atom_adjacent(O,user.loc))
		return
	if(!comp_prof.can_put_cargo(O.w_class,istype(O,/obj/vehicles)))
		to_chat(user,"<span class = 'notice'>[src.name] is too full to fit [O.name]</span>")
		return
	if(!istype(O,/obj/vehicles))
		user.drop_from_inventory(O)
	comp_prof.cargo_transfer(O)

/obj/vehicles/proc/get_adjacent_turfs()
	var/list/adj_turfs = list()
	for(var/turf/t in locs)
		adj_turfs += range(1,t)
	return adj_turfs

/obj/vehicles/proc/vehicle_loading_adjacent(var/obj/vehicle,var/list/adj_turfs)
	for(var/loc in vehicle.locs)
		if(loc in adj_turfs)
			return 1
	return 0

/obj/vehicles/proc/load_vehicle(var/obj/vehicles/v,var/mob/user)
	var/list/adj_turfs = get_adjacent_turfs()
	if(!(user.loc in adj_turfs) || !vehicle_loading_adjacent(v,adj_turfs))
		to_chat(user,"<span class = 'notice'>Both the vehicle and the person loading the vehicle must be next to the targeted storage vehicle.</span>")
		return
	if(!comp_prof.can_attach_vehicle(v.vehicle_size))
		to_chat(user,"<span class = 'notice'>[src] is full or cannot fit vehicles of [v]'s size.</span>")
		return
	user.visible_message("<span class = 'notice'>[user] starts loading [v] into [src]\'s storage.</span>")
	if(!do_after(user,VEHICLE_ITEM_LOAD,v))
		return
	user.visible_message("<span class = 'notice'>[user] loads [v] into [src].</span>")
	v.forceMove(pick(src.locs))
	comp_prof.cargo_transfer(v)

/obj/vehicles/MouseDrop(var/obj/over_object)
	var/mob/living/user = usr
	var/obj/vehicles/v = over_object
	if(isnull(user.loc)) return 0
	if(istype(v))
		load_vehicle(v,user)
	else
		var/item_size_use = over_object.w_class
		if(istype(over_object,/obj/structure/closet))
			item_size_use = ITEM_SIZE_GARGANTUAN
		if(!comp_prof.can_put_cargo(item_size_use))
			to_chat(user,"<span class = 'notice'>[src] is full or cannot fit objects of [over_object]'s size.</span>")
			return
		if(!do_after(user,VEHICLE_ITEM_LOAD,over_object))
			return
		user.visible_message("<span class = 'notice'>[user] loads [over_object] into [src].</span>")
		over_object.forceMove(pick(src.locs))
		comp_prof.cargo_transfer(over_object)

/obj/vehicles/verb/get_cargo_item()
	set name = "Retrieve Cargo"
	set category = "Vehicle"
	set src in view(1)

	var/mob/living/user = usr
	if(!istype(user) || user.incapacitated())
		return

	var/list/cargo_list_names = list()
	for(var/obj/item in comp_prof.current_cargo)
		cargo_list_names += comp_prof.current_cargo[item.name]
		cargo_list_names[item.name] = item
	if(isnull(cargo_list_names) || !cargo_list_names.len)
		to_chat(user,"<span class = 'notice'>[src.name]'s cargo hold is empty!</span>")
		return
	var/item_name_remove = input(user,"Pick an item to remove","Item removal selection","Cancel") in cargo_list_names + list("Cancel")
	if(item_name_remove == "Cancel")
		return
	var/obj/object_removed = comp_prof.cargo_transfer(cargo_list_names[item_name_remove],1)
	var/mob/living/carbon/human/H = user
	if(istype(object_removed) && istype(H))
		H.put_in_hands(object_removed)

/obj/vehicles/proc/handle_grab_attack(var/obj/item/grab/I, var/mob/user)
	var/mob/living/grabbed_mob = I.affecting
	var/mob/living/carbon/human/h = user
	if(!istype(grabbed_mob) || !istype(h) || !is_atom_adjacent(grabbed_mob,h.loc) || !is_atom_adjacent(h))
		return
	if(grabbed_mob.stat == CONSCIOUS)
		if(!do_after(user, VEHICLE_LOAD_DELAY,grabbed_mob,1,1,,1))
			return
	var/enter_result = enter_as_position(grabbed_mob,"passenger")
	h.drop_from_inventory(I)
	if(enter_result == 0)
		to_chat(user,"<span class = 'notice'>Something stops you putting [grabbed_mob] in [src.name]'s passenger seat.</span>")
	return

/obj/vehicles/verb/pull_occupant_out()
	set name = "Remove Occupant"
	set category = "Vehicle"
	set src in view(1)

	var/mob/living/puller = usr
	if(!istype(puller) || puller.incapacitated())
		return

	var/list/all_viable_occupants = list()
	for(var/mob/occ in occupants)
		all_viable_occupants += "[occ.name]"
		all_viable_occupants["[occ.name]"] = occ
	var/chosen_occ_name = input(puller,,"Occupant Removal Selection","Cancel") in all_viable_occupants + list("Cancel")
	if(chosen_occ_name == "Cancel")
		return
	var/mob/chosen_occ = all_viable_occupants[chosen_occ_name]
	if(isnull(chosen_occ) || !is_atom_adjacent(puller))
		return
	if(chosen_occ.stat == CONSCIOUS)
		if(!do_after(puller, VEHICLE_LOAD_DELAY*2,src,1,1,,1))
			return
	exit_vehicle(chosen_occ,1)

/obj/vehicles/verb/verb_inspect_components()
	set name = "Inspect Components"
	set category = "Vehicle"
	set src in view(1)

	var/mob/living/user = usr
	if(!istype(user))
		return

	comp_prof.inspect_components(user)

/obj/vehicles/attackby(var/obj/item/I,var/mob/user)
	if(elevation > user.elevation || elevation > I.elevation)
		to_chat(user,"<span class = 'notice'>[name] is too far away to interact with!</span>")
		return
	if(!istype(I))
		return
	if(istype(I,/obj/item/grab))
		handle_grab_attack(I,user)
		return
	if(user.a_intent == I_HURT)
		if(comp_prof.is_repair_tool(I))
			comp_prof.repair_inspected_with_tool(I,user)
			return
		if(istype(I,/obj/item/stack))
			comp_prof.repair_inspected_with_sheet(I,user)
			return
		. = ..()
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		var/pos_to_dam = should_damage_occ()
		if(!isnull(pos_to_dam))
			damage_occupant(pos_to_dam,I,user)
			return
		comp_prof.take_component_damage(I.force,I.damtype)
		return
	put_cargo_item(user,I)

#undef ALL_VEHICLE_POSITIONS
#undef VEHICLE_LOAD_DELAY
