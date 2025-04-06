local _, addonTable = ...
local config = addonTable.config
if not config.module.SetAddon then
    return
end


local addonFun = config.module.AddonFun
local api = config.module.API


local IsAddOnLoaded = api.IsAddOnLoaded
local wipe = api.wipe


addonFun.NOP = function(profileKeys, chars)

	if not IsAddOnLoaded("NOP") then
		return
	end
		
	if NewOpenablesProfile then
		wipe(NewOpenablesProfile)
	end
	
    NewOpenablesProfile = {
        ["char"] = chars,
        ["profileKeys"] = profileKeys,
        ["global"] = {
            ["version"] = "",
        },
        ["profiles"] = {
            ["Default"] = {
                ["skinButton"] = true,
                ["button"] = {
                    nil,
                    "UIParent",
                    nil,
                    470,
                    -100,
                },
                ["iconSize"] = 36,
                ["quest"] = true,
                ["Skip"] = true,
                ["SkipOnError"] = false,
                ["herald"] = false,
                ["lockButton"] = true,
                ["ShowReputation"] = false,
            },
        },
    }
end