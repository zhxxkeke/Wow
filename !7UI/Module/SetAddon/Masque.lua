local _, addonTable = ...
local config = addonTable.config
if not config.module.SetAddon then
    return
end


local addonFun = config.module.AddonFun
local api = config.module.API


local IsAddOnLoaded = api.IsAddOnLoaded
local wipe = api.wipe


addonFun.Masque = function(profileKeys)

	if not IsAddOnLoaded("Masque") then
		return
	end
	
	local _, API_VERSION = LibStub("Masque", true)
	
	if MasqueDB then
		wipe(MasqueDB)
	end
	
    MasqueDB = {
        ["namespaces"] = {
            ["LibDualSpec-1.0"] = {},
        },
        ["profileKeys"] = profileKeys,
        ["profiles"] = {
            ["Default"] = {
                ["Groups"] = {
                    ["Masque"] = {
                        ["Colors"] = {
                            ["Normal"] = {0, 0, 0, 1},
                            ["Pushed"] = {0, 0, 0, 1},
                            ["Checked"] = {0, 0, 0, 1},
                            ["Highlight"] = {0, 0, 0, 1},
                            ["Cooldown"] = {0, 0, 0, 1},
                            ["Flash"] = {0, 0, 0, 1},
                        },
                        ["Pulse"] = false,
                        ["SkinID"] = "Azona: Square",
                    },
                },
                ["Effects"] = {
                    ["Interrupt"] = false,
                    ["Reticle"] = false,
                    ["Castbar"] = false,
                },
                ["LDB"] = {
                    ["hide"] = true,
                    ["position"] = 0,
                },
                ["API_VERSION"] = API_VERSION,
                ["SpellAlert"] = {
                    ["State"] = 1,
                },
            },
        },
    }
end