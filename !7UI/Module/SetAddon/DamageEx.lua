local _, addonTable = ...
local config = addonTable.config
if not config.module.SetAddon then
    return
end

local addonFun = config.module.AddonFun
local api = config.module.API

local IsAddOnLoaded = api.IsAddOnLoaded
local wipe = api.wipe

addonFun.DamageEx = function(profileKeys, chars)

    if not IsAddOnLoaded("DamageEx") then
        return
    end

    DEX_Version = ""

    DEX_FontList = {
        "Fonts\\ARHei.TTF",
        "Fonts\\ARKai_C.TTF",
        "Fonts\\ARKai_T.TTF",
        "Fonts\\FRIZQT__.TTF",
        "Fonts\\skurri.TTF",
        "Fonts\\ARHei.TTF",
    }

    if DEX_SAVE then
        wipe(DEX_SAVE)
    end
	
    DEX_SAVE = {
        ["DEX_LOGTIME"] = 10,
        ["DEX_ColorManaSe"] = { 0.3, 0.3, 1, },
        ["DEX_ColorPeriodic"] = { 1, 0.3, 1, },
        ["DEX_ShowBlockNumber"] = 0,
        ["DEX_ColorHealth"] = { 0, 1, 0, },
        ["DEX_ShowDamageHealth"] = 1,
        ["DEX_FontSize"] = 18,
        ["DEX_ShowNameOnCrit"] = 0,
        ["DEX_PosX"] = 355,
        ["DEX_PosY"] = 200,
        ["DEX_ColorNormal"] = { 1, 1, 1, },
        ["DEX_ColorSpec"] = { 0.85, 0.85, 0, },
        ["DEX_ColorPet"] = { 1, 0.6, 0, },
        ["DEX_ShowCurrentOnly"] = 0,
        ["DEX_ShowNameOnMiss"] = 0,
        ["DEX_Speed"] = 80,
        ["DEX_LOGLINE"] = 10,
        ["DEX_ShowOwnHealth"] = 1,
        ["DEX_ShowInterrupt"] = 1,
        ["DEX_ShowSpellName"] = 1,
        ["DEX_ShowOverHeal"] = 0,
        ["DEX_ShowDamageWoW"] = 0,
        ["DEX_ColorSpecSe"] = { 1, 1, 1, },
        ["DEX_ShowWithMess"] = 0,
        ["DEX_ShowDamagePeriodic"] = 1,
        ["DEX_ShowMaxDamage"] = 0,
        ["DEX_ShowDamagePet"] = 1,
        ["DEX_NumberFormat"] = 1,
        ["DEX_ShowSpellIcon"] = 0,
        ["DEX_UniteSpell"] = 1,
        ["DEX_ShowDamageShield"] = 1,
        ["DEX_OutLine"] = 2,
        ["DEX_ColorMode"] = 2,
        ["DEX_ColorPeriodicSe"] = { 1, 0, 1, },
        ["DEX_ColorNormalSe"] = { 0.78, 0.8, 1, },
        ["DEX_ColorHealthSe"] = { 0, 0.85, 0, },
        ["DEX_Font"] = 2,
        ["DEX_ShowSpellIconWithName"] = 0,
        ["DEX_ColorMana"] = { 0, 0, 1, },
        ["DEX_ColorSkill"] = { 1, 1, 0, },
        ["DEX_Enable"] = 1,
        ["DEX_ShowInterruptCrit"] = 1,
        ["DEX_ColorSkillSe"] = { 1, 0.24, 0, },
    }
end