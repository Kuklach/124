local CATEGORY_NAME = "Utility"


function ulx.nolag(ply,targ)

	if (not ply:IsValid()) then return end

	for _, v in pairs( ents.FindByClass( "prop_*" ) ) do

		local phys = v:GetPhysicsObject()

		if IsValid( phys ) then

			if (targ:IsValid() and v:GetOwner() == v) then

				phys:EnableMotion( false )

			else

				phys:EnableMotion( false )

			end

		end

	end

	if (SERVER) then

		ULib.console(_,ply:Name() .. " : Call [ulx nolag]")

	else

		ULib.tsayColor(_,true,Color(0, 93, 104),"All props has been freezed!!!")

	end

end


local nolag = ulx.command( CATEGORY_NAME, "ulx nolag", ulx.nolag, "!nolag")
nolag:addParam{ type = ULib.cmds.PlayerArg, target = "!%superadmin", default = "^", ULib.cmds.optional }
nolag:help( "Freeze all props!" )
nolag:defaultAccess( ULib.ACCESS_ADMIN )
