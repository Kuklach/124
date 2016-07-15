if SERVER then

	local Max = 5
	local pvp = function(ply,ent,attacker)

		attacker.violations = attacker.violations or 0

		if (attacker == ply or attacker:IsSuperAdmin()) then

			return

		end
		if (not attacker:IsPlayer()) then
			attacker = NADMOD.Props[attacker:EntIndex()].Owner
		end
		if (attacker.violations >= Max) then

			attacker.violations = 0
			timer.Simple(Max * 60,function() attacker.restrictBuild = false ulx.fancyLogAdmin( attacker, "#A тебе снова доступен Build мод!") end)
			attacker.restrictBuild = true
			attacker:GodDisable()
			attacker.ULXHasGod = nil
			attacker:SetHealth(1)
			timer.Create(attacker:Name(),1,0,function() attacker:SetHealth(1) end)
			ulx.fancyLogAdmin( attacker, "#A уебывает в PvP мод на #s минут!",Max)

		elseif (attacker.ULXHasGod or attacker:GetMoveType() == MOVETYPE_NOCLIP) then

			attacker.violations = attacker.violations + 1
			ulx.fancyLogAdmin( attacker, "#A нарушил правила PvP #s/#s раз!", attacker.violations,Max)

		end

	end

	hook.Remove("PlayerDeath","pvp")
	hook.Add("PlayerDeath","pvp",pvp)

	local function PlayerNoClip( ply, desiredState )

		if (ply.ULXHasGod or ply:IsAdmin() or ply:IsSuperAdmin() or desiredState == false) then

			return true

		end

		return false

	end

	hook.Remove( "PlayerNoClip", "PlayerNoClip")
	hook.Add( "PlayerNoClip", "PlayerNoClip",PlayerNoClip)

end
