local CATEGORY_NAME = "Utility"


function ulx.nolag(calling_ply,target_ply)

	for _, v in pairs( ents.FindByClass( "prop_*" ) ) do

		local phys = v:GetPhysicsObject()

		if phys:IsValid() then

				phys:EnableMotion( false )

		end

	end

	 //if (not pl) then
		 //ulx.fancyLogAdmin( calling_ply, "#A frozen #T props!", target_ply )
	 //else
		 ulx.fancyLogAdmin( calling_ply, "#A froze all the props!")
	 //end

end


local nolag = ulx.command( CATEGORY_NAME, "ulx nolag", ulx.nolag, "!nolag")
//nolag:addParam{ type = ULib.cmds.PlayerArg, hint="player",ULib.cmds.optional}
nolag:defaultAccess( ULib.ACCESS_ADMIN )
nolag:help( "Freeze all props!" )
