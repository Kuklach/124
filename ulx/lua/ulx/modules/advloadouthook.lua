if SERVER then

	/*
	такс ето у нас функция которая чекает что игрок возрадился или
	был вызван hook.Call("PlayerLoadout")
	*/
	local function PlayerLoadout( ply )

		ply:RemoveAllItems() //отнимаем все снаряжение
		if (ply.ULXHasGod == true) then // если есть годмод то
			//выдем снаряжения для билда
			ply:Give("gmod_tool")
			ply:Give("weapon_physgun")
			ply:Give("gmod_camera")
			ply:Give("torch")
			//если же игрок не в годе(а это в моем модуле значило что он в пвп моде) то
		else
			//выдем снаряжения для пвп
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
  //подцепляем наш PlayerLoadout(ply) на хук, "kek" это ID нашей подцепленой функции
	hook.Add("PlayerLoadout","kek",PlayerLoadout)
	/*
	тут у нас функция которая чекает что игрок что либо подобрал или
	заспавнил себе.(по идеи если я точно помню даже при спавне через е2 оружия типа owner():giveWeapon())
	срабатывала и не давала взять оружие
	*/
	local function PlayerCanPickupWeapon( ply ,wep)
		//узнаем имя ствола
		local name = tostring(wep)
		//если же игрок не в годе(а это в моем модуле значило что он в пвп моде) и
		//игрок пытаеться поднять не оружие из кс пака то
		if (not ply.ULXHasGod and not string.find(name,"weapon_cs")) then

		  ply:ChatPrint("Доступно только оружие cs!")
			//не даем оружие
			return false

		end
		//иначе даем
		return true

	end
	//подцепляем наш PlayerCanPickupWeapon( ply ,wep) на хук, "kek2" это ID нашей подцепленой функции не более хд)
	hook.Add("PlayerCanPickupWeapon","kek2",PlayerCanPickupWeapon)

end
