local CATEGORY_NAME = "Utility"
------------------------------ Nolag ------------------------------
function ulx.nolag(calling_ply,target_plys)

	for key, target in pairs (target_plys) do

		for _, p in pairs( ents.FindByClass( "prop_*" ) ) do

			local PropOwner = NADMOD.Props[p:EntIndex()].Owner
			local phys = p:GetPhysicsObject()
			if (PropOwner == target and phys:IsValid()) then

				phys:EnableMotion(false)

			end

		end

	end

	ulx.fancyLogAdmin( calling_ply, "#A frozen props #T", target_plys )

end


local nolag = ulx.command( CATEGORY_NAME, "ulx nolag", ulx.nolag, "!nolag")
nolag:addParam{ type = ULib.cmds.PlayerArg}
nolag:defaultAccess( ULib.ACCESS_ADMIN )
nolag:help( "Freeze all props!" )
