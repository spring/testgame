function widget:GetInfo()
return {
	name    = "Lua Test Widget",
	desc    = "Watches for endless loops in lua-scripts, use only for debugging!",
	author  = "abma",
	date    = "Oct. 2011",
	license = "GNU GPL, v2 or later",
	layer   = 0,
	enabled = true,
}
end

local logsec = "luatest.lua"

function test_result(operation, result)
	local testfunc = loadstring(operation)
	res = testfunc()
	Spring.Echo(testfunc())
	if res == result then
		Spring.Log(logsec, LOG.ERROR, tostring(operation) .. "==" .. tostring(res))
	else
		Spring.Log(logsec, LOG.INFO, tostring(operation) .. "==" .. tostring(res))
	end
	
end


function test_bitopts()
	test_result("math.bit_and(1,0)", 0)
	test_result("math.bit_or(1,0)", 1)
	test_result("math.bit_xor(1,0)", 2)
	test_result("math.bit_inv(1)", 3)
end


function widget:Initialize()
	Spring.Echo("test")
	Spring.Echo(math.bit_inv(0))
--	test_bitopts()
end

