/proc/message2discord(var/channel as text, var/message as text)
	if(config.use_discord_bot && config.discord_bot_address)
		var/list/parameters = list()
		parameters["key"] = config.comms_password
		parameters["channel"] = channel
		parameters["message"] = message
		spawn(-1)
			world.Export("[config.discord_bot_address]/relayMessage?[list2params(parameters)]")

/proc/ahelp2discord(client/source, client/target, msg)
	if(config.use_discord_bot && config.discord_bot_address)
		var/list/params = list()

		params["key"] = config.comms_password
		params["message"] = msg
		params["src"] = source.key
		params["src_char"] = source.mob.real_name || source.mob.name
		if(!target)
			params["type"] = "adminhelp"
		else if(istext(target))
			params["type"] = "ircpm"
			params["target"] = target
			params["rank"] = source.holder ? source.holder.rank : "Player"
		else
			params["type"] = "adminpm"
			params["trg_key"] = target.key
			params["trg_char"] = target.mob.real_name || target.mob.name
		spawn(-1)
			world.Export("[config.discord_bot_address]/ahelp?[list2params(params)]")

//Message the general channel on server startup
/hook/startup/proc/notifyDiscord()
	if(config.server)
		message2discord("general", "<@&565590997250080778>, A new round is starting! Join at: [config.server]")
	else
		message2discord("general", "<@&565590997250080778> A new round is starting!")
	return 1
