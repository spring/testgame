function gadget:GetInfo()
        return {
                name      = "test gadget 1",
                desc      = "test gadget for testing!",
                author    = "abma",
                date      = "January, 2013",
                license   = "GNU GPL, v2 or later",
                layer     = 0,
                enabled   = true  --  loaded by default?
        }
end
function gadget:Initialize()
	Spring.Log("gadget.lua", LOG.ERROR, "initialize called!")
end

function gadget:GameFrame(n)
	Spring.Log("gadget.lua", LOG.ERROR, n)
end