if SERVER then

	local Max = 5
	local pvp = function(ply,ent,attacker)

		attacker.violations = attacker.violations or 0

		if (attacker == ply or attacker:IsAdmin() or attacker:IsSuperAdmin()) then

			return

		end

		if (attacker.violations >= Max) then

			attacker.violations = 0
			RunConsoleCommand("ulx","jail",attacker:Name(),"300")
			ulx.fancyLogAdmin( attacker, "#A получил пиздюлей за нарушение правил PvP!")

		elseif (attacker.ULXHasGod or attacker:GetMoveType() == MOVETYPE_NOCLIP) then

			attacker.violations = attacker.violations + 1
			ulx.fancyLogAdmin( attacker, "#A нарушил правила PvP #s/#s раз!", attacker.violations,Max)

		end

	end

	hook.Remove("PlayerDeath","pvp")
	hook.Add("PlayerDeath","pvp",pvp)

else

	return

end
