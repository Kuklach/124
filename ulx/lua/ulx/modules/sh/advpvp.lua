local CATEGORY_NAME = "Fun"
------------------------------ PvP ------------------------------
function ulx.pvp(calling_ply)

	if (calling_ply.ULXHasGod) then

		calling_ply:Spawn()
		calling_ply:GodDisable()
		calling_ply.ULXHasGod = nil
		hook.Run("PlayerLoadout",calling_ply)
		ulx.fancyLogAdmin( calling_ply, "#A changed mod to PvP!" )

	else

		ULib.tsayError( calling_ply, "You arleady in PvP mode!", true )

	end

end

local pvp = ulx.command( CATEGORY_NAME, "ulx pvp", ulx.pvp, "!pvp")
pvp:defaultAccess( ULib.ACCESS_ALL)
pvp:help( "PvP mod!" )
------------------------------ Build ------------------------------
function ulx.build(calling_ply)

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

end


local build = ulx.command( CATEGORY_NAME, "ulx build", ulx.build, "!build")
build:defaultAccess( ULib.ACCESS_ALL)
build:help( "Build mod!" )
