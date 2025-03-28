

//Machines
//The one that works safely.
/obj/structure/machinery/power/smes/batteryrack
	name = "Substation PSU"//"power cell rack PSU"
	desc = "A rack of power cells working as a PSU."
	charge = 0 //you dont really want to make a potato PSU which already is overloaded
	outputting = 0
	input_level = 0
	output_level = 0
	input_level_max = 0
	output_level_max = 0
	should_be_mapped = 1
	icon_state = "gsmes"
	unslashable = FALSE
	var/cells_amount = 0
	var/capacitors_amount = 0
	power_machine = TRUE
	var/list/parts_to_add = list(
		/obj/item/circuitboard/machine/batteryrack,
		/obj/item/cell/high,
		/obj/item/cell/high,
		/obj/item/cell/high,
	)

	// Smaller capacity, but higher I/O
	// Starts fully charged, as it's used in substations. This replaces Engineering SMESs round start charge.
/obj/structure/machinery/power/smes/batteryrack/substation
	name = "Substation PSU"
	desc = "A rack of power cells working as a PSU. This one seems to be equipped for higher power loads."
	output_level = 150000
	input_level = 150000
	outputting = 1
	parts_to_add = list(
		/obj/item/circuitboard/machine/batteryrack,
		/obj/item/cell/high,
		/obj/item/cell,
		/obj/item/cell,
		/obj/item/stock_parts/capacitor,
		/obj/item/stock_parts/capacitor,
		/obj/item/stock_parts/capacitor,
		/obj/item/stock_parts/capacitor,
		/obj/item/stock_parts/capacitor,
	)

	// One high-capacity cell, two regular cells. Lots of room for engineer upgrades
	// Also five basic capacitors. Again, upgradeable.

/obj/structure/machinery/power/smes/batteryrack/New()
	..()
	add_parts()
	RefreshParts()
	start_processing()
	return


//Maybe this should be moved up to obj/structure/machinery
/obj/structure/machinery/power/smes/batteryrack/proc/add_parts()
	QDEL_NULL_LIST(component_parts)
	for(var/typepath in parts_to_add)
		LAZYADD(component_parts, new typepath(src))

/obj/structure/machinery/power/smes/batteryrack/RefreshParts()
	capacitors_amount = 0
	cells_amount = 0
	var/max_level = 0 //for both input and output
	for(var/obj/item/stock_parts/capacitor/CP in component_parts)
		max_level += CP.rating
		capacitors_amount++
	input_level_max = 50000 + max_level * 20000
	output_level_max = 50000 + max_level * 20000

	var/C = 0
	for(var/obj/item/cell/PC in component_parts)
		C += PC.maxcharge
		cells_amount++
	capacity = C * 40   //Basic cells are such crap. Hyper cells needed to get on normal SMES levels.


/obj/structure/machinery/power/smes/batteryrack/updateicon()
	overlays.Cut()
	if(stat & BROKEN)
		return

	if (outputting)
		overlays += image('icons/obj/structures/machinery/power.dmi', "gsmes_outputting")
	if(inputting)
		overlays += image('icons/obj/structures/machinery/power.dmi', "gsmes_charging")

	var/clevel = chargedisplay()
	if(clevel>0)
		overlays += image('icons/obj/structures/machinery/power.dmi', "gsmes_og[clevel]")
	return


/obj/structure/machinery/power/smes/batteryrack/chargedisplay()
	return floor(4 * charge/(capacity ? capacity : 5e6))


/obj/structure/machinery/power/smes/batteryrack/attackby(obj/item/W as obj, mob/user as mob) //these can only be moved by being reconstructed, solves having to remake the powernet.
	. = ..() //SMES attackby for now handles screwdriver, cable coils and wirecutters, no need to repeat that here
	if(open_hatch)
		if(HAS_TRAIT(W, TRAIT_TOOL_CROWBAR))
			if (charge < (capacity / 100))
				if (!outputting && !input_attempt)
					playsound(get_turf(src), 'sound/items/Crowbar.ogg', 25, 1)
					var/obj/structure/machinery/constructable_frame/M = new /obj/structure/machinery/constructable_frame(src.loc)
					M.state = CONSTRUCTION_STATE_PROGRESS
					M.update_icon()
					for(var/obj/I in component_parts)
						if(I.reliability != 100 && crit_fail)
							I.crit_fail = 1
						I.forceMove(src.loc)
					qdel(src)
					return 1
				else
					to_chat(user, SPAN_WARNING("Turn off the [src] before dismantling it."))
			else
				to_chat(user, SPAN_WARNING("Better let [src] discharge before dismantling it."))
		else if ((istype(W, /obj/item/stock_parts/capacitor) && (capacitors_amount < 5)) || (istype(W, /obj/item/cell) && (cells_amount < 5)))
			if (charge < (capacity / 100))
				if (!outputting && !input_attempt)
					if(user.drop_inv_item_to_loc(W, src))
						LAZYADD(component_parts, W)
						RefreshParts()
						to_chat(user, SPAN_NOTICE("You upgrade the [src] with [W.name]."))
				else
					to_chat(user, SPAN_WARNING("Turn off the [src] before dismantling it."))
			else
				to_chat(user, SPAN_WARNING("Better let [src] discharge before putting your hand inside it."))
		else
			user.set_interaction(src)
			interact(user)
			return 1
	return


//The shitty one that will blow up.
/obj/structure/machinery/power/smes/batteryrack/makeshift
	name = "makeshift PSU"
	desc = "A rack of batteries connected by a mess of wires posing as a PSU."
	var/overcharge_percent = 0
	parts_to_add = list(
		/obj/item/circuitboard/machine/ghettosmes,
		/obj/item/cell,
		/obj/item/cell,
		/obj/item/cell,
	)

/obj/structure/machinery/power/smes/batteryrack/makeshift/updateicon()
	overlays.Cut()
	if(stat & BROKEN)
		return

	if (outputting)
		overlays += image('icons/obj/structures/machinery/power.dmi', "gsmes_outputting")
	if(inputting)
		overlays += image('icons/obj/structures/machinery/power.dmi', "gsmes_charging")
	if (overcharge_percent > 100)
		overlays += image('icons/obj/structures/machinery/power.dmi', "gsmes_overcharge")
	else
		var/clevel = chargedisplay()
		if(clevel>0)
			overlays += image('icons/obj/structures/machinery/power.dmi', "gsmes_og[clevel]")
	return

//This mess of if-elses and magic numbers handles what happens if the engies don't pay attention and let it eat too much charge
//What happens depends on how much capacity has the ghetto smes and how much it is overcharged.
//Under 1.2M: 5% of ion_act() per process() tick from 125% and higher overcharges. 1.2M is achieved with 3 high cells.
//[1.2M-2.4M]: 6% ion_act from 120%. 1% of EMP from 140%.
//(2.4M-3.6M] :7% ion_act from 115%. 1% of EMP from 130%. 1% of non-hull-breaching explosion at 150%.
//(3.6M-INFI): 8% ion_act from 115%. 2% of EMP from 125%. 1% of Hull-breaching explosion from 140%.
/obj/structure/machinery/power/smes/batteryrack/makeshift/proc/overcharge_consequences()
	switch (capacity)
		if (0 to (1.2e6-1))
			if (overcharge_percent >= 125)
				if (prob(5))
					ion_act()
		if (1.2e6 to 2.4e6)
			if (overcharge_percent >= 120)
				if (prob(6))
					ion_act()
			else
				return
			if (overcharge_percent >= 140)
				if (prob(1))
					empulse(src.loc, 1, 2, 0)
		if ((2.4e6+1) to 3.6e6)
			if (overcharge_percent >= 115)
				if (prob(7))
					ion_act()
			else
				return
			if (overcharge_percent >= 130)
				if (prob(1))
					empulse(src.loc, 1, 3, 0)
			if (overcharge_percent >= 150)
				if (prob(1))
					explosion(src.loc, 0, 0, 1, 3)
		if ((3.6e6+1) to INFINITY)
			if (overcharge_percent >= 115)
				if (prob(8))
					ion_act()
			else
				return
			if (overcharge_percent >= 125)
				if (prob(2))
					empulse(src.loc, 4, 10, 1)
			if (overcharge_percent >= 140)
				if (prob(1))
					explosion(src.loc, 0, 1, 2, 4)
		else //how the hell was this proc called for negative charge
			charge = 0


#define SMESRATE 0.05 // rate of internal charge to external power
/obj/structure/machinery/power/smes/batteryrack/makeshift/process()
	if(stat & BROKEN)
		return

	//store machine state to see if we need to update the icon overlays
	var/last_disp = chargedisplay()
	var/last_chrg = inputting
	var/last_onln = outputting
	var/last_overcharge = overcharge_percent

	if(terminal)
		var/excess = terminal.surplus()

		if(inputting)
			if(excess >= 0) // if there's power available, try to charge
				var/load = min((capacity * 1.5 - charge)/SMESRATE, input_level) // charge at set rate, limited to spare capacity
				load = add_load(load) // add the load to the terminal side network
				charge += load * SMESRATE // increase the charge


			else // if not enough capacity
				inputting = 0 // stop inputting

		else
			if (input_attempt && excess > 0 && excess >= input_level)
				inputting = 1

	if(outputting) // if outputting
		output_used = min( charge/SMESRATE, output_level) //limit output to that stored
		charge -= output_used*SMESRATE // reduce the storage (may be recovered in /restore() if excessive)
		add_avail(output_used) // add output to powernet (smes side)
		if(charge < 0.0001)
			outputting = 0 // stop output if charge falls to zero

	overcharge_percent = floor((charge / capacity) * 100)
	if (overcharge_percent > 115) //115% is the minimum overcharge for anything to happen
		overcharge_consequences()

	// only update icon if state changed
	if(last_disp != chargedisplay() || last_chrg != inputting || last_onln != outputting || ((overcharge_percent > 100) ^ (last_overcharge > 100)))
		updateicon()
	return

#undef SMESRATE
