local CATEGORY_NAME = "Utility"

function ulx.nolag(ply)

	for _, v in pairs( ents.FindByClass( "prop_*" ) ) do

		local phys = v:GetPhysicsObject()

		if IsValid( phys ) then

			phys:EnableMotion( false )

		end

	end

	ULib.tsayColor(	_,true,Color(0, 43, 54),"All props has been freezed!!!")

end

local nolag = ulx.command( CATEGORY_NAME, "ulx nolag", ulx.nolag, "!nolag")
nolag:help( "Freeze all props!" )
nolag:defaultAccess( ULib.ACCESS_ADMIN )
