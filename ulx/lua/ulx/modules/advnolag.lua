if true then

	local SetPhysTime = function(time)

		RunConsoleCommand("phys_timescale",math.Clamp(timescale,0.01,1))

	end

	local GetPhysTime = function()

		return GetConVar("phys_timescale")

	end

	local function call()

		if (engine.TickInterval() > 0.1) then
			print(engine.TickInterval())
			SetPhysTime(math.Clamp(GetPhysTime() - engine.TickInterval(),0.01,1))

		elseif (GetPhysTime() < 1) then

			SetPhysTime(math.Clamp(GetPhysTime() + 0.1,0.01,1))

		end

	end

	hook.Remove("PhysicsCollide","nolag")
	hook.Add("Think","nolag",call)

end
