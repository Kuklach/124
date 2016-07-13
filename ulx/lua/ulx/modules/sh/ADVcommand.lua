local CATEGORY_NAME = "Utility"
------------------------------ Nolag ------------------------------
function ulx.nolag(calling_ply,target_plys)

	local affected_plys = {}

	for key, target in pairs (target_plys) do

		if ulx.getExclusive( target, calling_ply ) then
			ULib.tsayError( calling_ply, ulx.getExclusive( target, calling_ply ), true )
		else
			table.insert( affected_plys, target )
		end

		for _, p in pairs( ents.FindByClass( "prop_*" ) ) do

			--local PropOwner = NADMOD.Props[p:EntIndex()].Owner
			local phys = p:GetPhysicsObject()
			RunConsoleCommand("say",tostring(phys))
		end

	end

	ulx.fancyLogAdmin( calling_ply, "#A frozen props #T", affected_plys )

end


local nolag = ulx.command( CATEGORY_NAME, "ulx nolag", ulx.nolag, "!nolag")
nolag:addParam{ type = ULib.cmds.PlayerArg}
nolag:defaultAccess( ULib.ACCESS_ADMIN )
nolag:help( "Freeze all props!" )
