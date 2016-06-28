local CATEGORY_NAME = "Utility"


function ulx.nolag(calling_ply,target_ply)

	local pl = target_ply:IsValid()

	for _, v in pairs( ents.FindByClass( "prop_*" ) ) do

		local phys = v:GetPhysicsObject()

		if IsValid( phys ) then

			if (pl) then

				if (v:GetOwner() == target_ply) then

					phys:EnableMotion( false )

				end

			else

				phys:EnableMotion( false )

			end

		end

	end

	 if (pl) then
		 ulx.fancyLogAdmin( calling_ply, "#A frozen #T props!", target_ply )
	 else
		 ulx.fancyLogAdmin( calling_ply, "#A froze all the props!")
	 end

end


local nolag = ulx.command( CATEGORY_NAME, "ulx nolag", ulx.nolag, "!nolag")
nolag:addParam{ type = ULib.cmds.PlayerArg, ULib.cmds.optional }
nolag:defaultAccess( ULib.ACCESS_ADMIN )
nolag:help( "Freeze all props!" )
