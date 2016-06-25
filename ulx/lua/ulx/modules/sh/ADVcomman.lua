local CATEGORY_NAME = "Utility"

function ulx.nolag()

	for _, v in pairs( ents.FindByClass( "prop_*" ) ) do

		local phys = prop:GetPhysicsObject()

		if IsValid( phys ) then

			phys:EnableMotion( false )

		end

	end

	ULib.tsayColor(	nil,true,Color(0, 43, 54),"All props has been freezed!!!")

end

local nolag = ulx.command( CATEGORY_NAME, "ulx nolag", ulx.nolag, "!nolag" ,true)
nolag:defaultAccess( ULib.ACCESS_ADMIN )
nolag:help( "Freeze all props!" )
