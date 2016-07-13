if SERVER then

	local chat = function(ply, strText, bTeamOnly)
		local have = false
		for _,pl in pairs(player.GetAll()) do
			local lwr = string.lower(pl:Name())
			local txt = string.lower(strText)
			if (string.find(strText,lwr)) then
				have = true
			end
		end

		if IsValid(ply) and ply:IsPlayer() then

			local nickteam = team.GetColor(ply:Team())
			chat.AddText(nickteam, "[" .. ply:Team() .. "] ", nickteam, ply:Nick(), color_white, ": " .. strText)

		else

			local ConsoleColor = Color(0, 255, 0)
			chat.AddText(ConsoleColor, "Console", color_white, ": ", strText)
			return true

		end

	end

	hook.Remove("OnPlayerChat", "Tags")
	hook.Add("OnPlayerChat", "Tags",chat)
end
