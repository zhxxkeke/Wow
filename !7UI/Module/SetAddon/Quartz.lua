local _, addonTable = ...
local config = addonTable.config
if not config.module.SetAddon then
    return
end


local addonFun = config.module.AddonFun
local api = config.module.API


local IsAddOnLoaded = api.IsAddOnLoaded
local wipe = api.wipe


addonFun.Quartz = function(profileKeys, classColor, bgColor)

    if not IsAddOnLoaded("Quartz") then
        return
    end

    if Quartz3DB then
        wipe(Quartz3DB)
    end

    Quartz3DB = {
        ["namespaces"] = {
            ["Swing"] = {},
            ["Buff"] = {},
            ["LibDualSpec-1.0"] = {},
            ["Flight"] = {},
            ["Pet"] = {
                ["profiles"] = {
                    ["Default"] = {
                        ["x"] = 860,
                    },
                    ["Dominos"] = {
                        ["x"] = 860,
                    },
                },
            },
            ["Range"] = {},
            ["Player"] = {
                ["profiles"] = {
                    ["Default"] = {
                        ["h"] = 24,
                        ["w"] = 220,
                        ["x"] = 0,
                        ["y"] = 142,
                        ["iconalpha"] = 1,
                        ["point"] = "BOTTOM",
                        ["texture"] = "Blizzard Raid Bar",
                        ["timetextx"] = 4,
                        ["nametextx"] = 4,
                        ["timefontsize"] = 14,
                    },
                    ["Dominos"] = {
                        ["h"] = 24,
                        ["w"] = 220,
                        ["x"] = 0,
                        ["y"] = 168,
                        ["iconalpha"] = 1,
                        ["point"] = "BOTTOM",
                        ["texture"] = "Blizzard Raid Bar",
                        ["timetextx"] = 4,
                        ["nametextx"] = 4,
                        ["timefontsize"] = 14,
                    },
                },
            },
            ["EnemyCasts"] = {},
            ["GCD"] = {},
            ["Focus"] = {
                ["profiles"] = {
                    ["Default"] = {
                        ["noInterruptShield"] = false,
                        ["showhostile"] = true,
                        ["timefontsize"] = 14,
                        ["noInterruptBorderColor"] = { 0, 0, 0, 1 },
                        ["showfriendly"] = true,
                        ["showtarget"] = true,
                        ["w"] = 180,
                        ["h"] = 24,
                        ["font"] = "聊天",
                        ["iconalpha"] = 1,
                        ["icongap"] = 2,
                        ["point"] = "BOTTOM",
                        ["noInterruptColor"] = { 1, 0, 0, 1 },
                        ["texture"] = "Blizzard Raid Bar",
                        ["noInterruptChangeColor"] = true,
                        ["x"] = 160,
                        ["y"] = 828,
                        ["noInterruptChangeBorder"] = true,
                        ["nametextx"] = 4,
                        ["timetextx"] = 4,
                    },
                    ["Dominos"] = {
                        ["noInterruptShield"] = false,
                        ["showhostile"] = true,
                        ["timefontsize"] = 14,
                        ["noInterruptBorderColor"] = { 0, 0, 0, 1 },
                        ["showfriendly"] = true,
                        ["showtarget"] = true,
                        ["w"] = 180,
                        ["h"] = 24,
                        ["font"] = "聊天",
                        ["iconalpha"] = 1,
                        ["icongap"] = 2,
                        ["point"] = "BOTTOM",
                        ["noInterruptColor"] = { 1, 0, 0, 1 },
                        ["texture"] = "Blizzard Raid Bar",
                        ["noInterruptChangeColor"] = true,
                        ["x"] = 160,
                        ["y"] = 828,
                        ["noInterruptChangeBorder"] = true,
                        ["nametextx"] = 4,
                        ["timetextx"] = 4,
                    },
                },
            },
            ["Target"] = {
                ["profiles"] = {
                    ["Default"] = {
                        ["x"] = 860,
                    },
                    ["Dominos"] = {
                        ["x"] = 860,
                    },
                },
            },
            ["Interrupt"] = {},
            ["Mirror"] = {},
            ["Latency"] = {
                ["profiles"] = {
                    ["Default"] = {
                        ["lagtext"] = false,
                    },
                    ["Dominos"] = {
                        ["lagtext"] = false,
                    },
                },
            },
        },
        ["profileKeys"] = profileKeys,
        ["profiles"] = {
            ["Default"] = {
                ["completecolor"] = { 0, 0, 0, 0 },
                ["failcolor"] = { 1, 0, 0, 1 },
                ["modules"] = {
                    ["Swing"] = false,
                    ["Buff"] = false,
                    ["Interrupt"] = false,
                    ["Flight"] = false,
                    ["Mirror"] = false,
                    ["GCD"] = false,
                    ["Timer"] = false,
                    ["Range"] = false,
                    ["Target"] = false,
                    ["Pet"] = false,
                },
                ["backgroundcolor"] = bgColor,
                ["castingcolor"] = classColor,
                ["sparkcolor"] = { 0, 0, 0, 0 },
            },
            ["Dominos"] = {
                ["completecolor"] = { 0, 0, 0, 0 },
                ["failcolor"] = { 1, 0, 0, 1 },
                ["modules"] = {
                    ["Swing"] = false,
                    ["Buff"] = false,
                    ["Interrupt"] = false,
                    ["Flight"] = false,
                    ["Mirror"] = false,
                    ["GCD"] = false,
                    ["Timer"] = false,
                    ["Range"] = false,
                    ["Target"] = false,
                    ["Pet"] = false,
                },
                ["backgroundcolor"] = bgColor,
                ["castingcolor"] = classColor,
                ["sparkcolor"] = { 0, 0, 0, 0 },
            },
        },
    }
end