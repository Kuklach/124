local CATEGORY_NAME = "Fun"
------------------------------ PvP & Build ------------------------------
function ulx.pvp(calling_ply,OnBuild)

	if (OnBuild) then

		if (calling_ply.restrictBuild == true) then

			ULib.tsayError( calling_ply, "Охуевшее тело тебе запрещен Build мод!", true )
			calling_ply:KillSilent()
			return

		elseif (timer.Exists(calling_ply:Name())) then

			timer.Remove(calling_ply:Name())
			calling_ply:SetHealth(100)

		end

		if (calling_ply.ULXHasGod) then

			ULib.tsayError( calling_ply, "You arleady in Build mode!", true )

		else

			calling_ply:GodEnable()
			calling_ply.ULXHasGod = true
			hook.Run("PlayerLoadout",calling_ply)
			ulx.fancyLogAdmin( calling_ply, "#A changed mod to Build!" )

		end

	else

		if (calling_ply.ULXHasGod) then

			calling_ply:Spawn()
			calling_ply:GodDisable()
			calling_ply.ULXHasGod = nil
			local exprushens2 = ents.FindByClass("gmod_wire_expression2")
			for _,v in pairs(exprushens2) do
				if (v:IsValid() and calling_ply == E2Lib.getOwner(calling_ply, v) and not calling_ply:IsSuperAdmin()) then
					v:Remove()
				end
			end
			hook.Run("PlayerLoadout",calling_ply)
			ulx.fancyLogAdmin( calling_ply, "#A changed mod to PvP!" )

		else

			ULib.tsayError( calling_ply, "You arleady in PvP mode!", true )

		end

	end

end

local pvp = ulx.command( CATEGORY_NAME, "ulx pvp", ulx.pvp, "!pvp")
pvp:addParam{ type = ULib.cmds.BoolArg, invisible = true }
pvp:defaultAccess( ULib.ACCESS_ALL)
pvp:help( "PvP mod!" )
pvp:setOpposite( "ulx build", {_, true}, "!build" )
