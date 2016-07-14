if SERVER then

	function GM:PlayerLoadout( ply )

		ply:RemoveAllItems()

		if (ply.ULXHasGod) then

			ply:Give("gmod_tool")
			ply:Give("weapon_physgun")
			ply:Give("gmod_camera")
			ply:Give("torch")

		else

			ply:Give("weapon_physcannon")
			ply:Give("weapon_medkit")
			ply:Give("weapon_cs_glock")
			ply:Give("weapon_cs_knife")
			ply:GiveAmmo(120,"ent_cs_ammo_9mm",true)
			ply:GiveAmmo(270,"ent_cs_ammo_762mm",true)

		end

		return true

	end

end
