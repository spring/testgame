function gadget:GetInfo()
    return {
        name      = 'Initial Spawn',
        desc      = 'Handles initial spawning of units',
        author    = 'Niobium',
        version   = 'v1.0',
        date      = 'April 2011',
        license   = 'GNU GPL, v2 or later',
        layer     = 0,
        enabled   = true
    }
end
if not gadgetHandler:IsSyncedCode() then
    return false
end

local SECTION = "test.lua"
local tests = {}

function gadget:Initialize()
	testdirs = VFS.SubDirs("tests")
	for _, dir in ipairs(testdirs) do
		Spring.Log(SECTION, LOG.WARNING, "Found test: " .. dir)
		table.insert(tests, dir)
		local gadgetlua = dir .. "gadget.lua"
		Spring.Log(SECTION, LOG.WARNING, "Trying to load: " .. gadgetlua)
		local g = gadget._G.gadgetHandler:LoadGadget(gadgetlua)
		if g then
			Spring.Log(SECTION, LOG.WARNING, "Loading test: " .. gadgetlua)
			gadget._G.gadgetHandler:InsertGadget(g)
		else
			Spring.Log(SECTION, LOG.ERROR, "Couldn't load "..gadgetlua .. err)
		end
	end
end

function gadget:GameFrame(n)
	--Spring.SendCommands("quit")
end
