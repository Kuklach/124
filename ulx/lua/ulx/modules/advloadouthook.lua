if SERVER then

	local function PlayerLoadout( ply )

		ply:RemoveAllItems()
		if (ply.ULXHasGod == true) then

			ply:Give("gmod_tool")
			ply:Give("weapon_physgun")
			ply:Give("gmod_camera")
			ply:Give("torch")

		else

			ply:Give("weapon_cs_glock")
			ply:Give("weapon_cs_ak47")
			ply:Give("weapon_physcannon")
			ply:Give("weapon_medkit")
			ply:Give("weapon_cs_knife")
			ply:GiveAmmo(120,"ent_cs_ammo_9mm",true)
			ply:GiveAmmo(270,"ent_cs_ammo_762mm",true)

		end

		return true

	end

	hook.Remove("PlayerLoadout","kek")
	hook.Add("PlayerLoadout","kek",PlayerLoadout)

	local function PlayerCanPickupWeapon( ply ,wep)

		local name = tostring(wep)
		if (not ply.ULXHasGod and not string.find(name,"weapon_cs")) then

		  ply:ChatPrint("You can take onli cs weapons!")
			return false

		end

		return true

	end

	hook.Remove("PlayerCanPickupWeapon","kek2")
	hook.Add("PlayerCanPickupWeapon","kek2",PlayerCanPickupWeapon)

end
