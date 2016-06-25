local CATEGORY_NAME = "Utility"

function ulx.nolag()

	for k, v in pairs( ents.FindByClass( "prop_*" ) ) do

		local phys = prop:GetPhysicsObject()

		if IsValid( phys ) then

			phys:EnableMotion( false )

		end

	end

end

local nolag = ulx.command( CATEGORY_NAME, "ulx nolag", ulx.nolag, "!nolag" ,false)
nolag:defaultAccess( ULib.ACCESS_ADMIN )
nolag:help( "Freeze all props!" )
