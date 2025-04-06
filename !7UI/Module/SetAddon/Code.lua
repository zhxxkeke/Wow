local _, addonTable = ...
local config = addonTable.config
if not config.module.SetAddon then
    return
end


-- 初始化数据库
SevenDB = SevenDB or {
    Profile = {},
    Addons = {
        Dominos = {
            chars = {},
            pages = {
                main = {},
                bars = {},
            }
        },
        NOP = {
            chars = {},
        }
    }
}


-- 初始化模块
local addonFun = config.module.AddonFun
local api = config.module.API


-- WOW API
local IsAddOnLoaded = api.IsAddOnLoaded
local GetAddOnMetadata = api.GetAddOnMetadata


-- 配置文件
local className = select(2, UnitClass("player"))

local playerName = UnitName("player")
local realmName = GetRealmName()
local roleInfo = playerName .. " - " .. realmName

if SevenDB.Profile[roleInfo] == nil then
    SevenDB.Profile[roleInfo] = "Default"
end

local profileKeys = SevenDB.Profile



-- Dominos
if SevenDB.Addons.Dominos.pages.main[className] == nil then
	SevenDB.Addons.Dominos.pages.main[className] = { ["dragonriding"] = 10, }
	if className == "DRUID" then
		SevenDB.Addons.Dominos.pages.main[className] = {
            ["cat"] = 6,
            ["tree"] = 7,
            ["bear"] = 8,
            ["moonkin"] = 9,
            ["dragonriding"] = 10,
        }
	end
end

if SevenDB.Addons.Dominos.pages.bars[className] == nil then
    SevenDB.Addons.Dominos.pages.bars[className] = {}
end


-- Quartz
local color = RAID_CLASS_COLORS[className]
local r, g, b = color.r, color.g, color.b
local classColor = {r, g, b}
local bgColor = {r * 0.2, g * 0.2, b * 0.2}


-- NOP
if SevenDB.Addons.NOP.chars[roleInfo] == nil then
	SevenDB.Addons.NOP.chars[roleInfo] = {}
end



-- Main
local frame = CreateFrame("Frame", "SetAddon")
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("UPDATE_FACTION")
frame:SetScript("OnEvent", function(self, event, ...)
	
	-- 不能在战斗中运行
	if InCombatLockdown() then 
		return 
	end
	
	-- Dominos
	local level, maxLevel = UnitLevel("player"), GetMaxPlayerLevel()
	if level == maxLevel then
		SevenDB.Addons.Dominos.chars[roleInfo] = { ["bars"] = { ["exp"] = { ["mode"] = "reputation", }, }, }
	else
		SevenDB.Addons.Dominos.chars[roleInfo] = { ["bars"] = { ["exp"] = { ["mode"] = "xp", }, }, }
	end
	
	if event == "ADDON_LOADED" then
		local arg = select(1, ...)
		if addonFun[arg] ~= nil then
			-- Dominos
			if arg == "Dominos" then
                local chars = SevenDB.Addons.Dominos.chars
                local pages1 = SevenDB.Addons.Dominos.pages.main
                local pages2 = SevenDB.Addons.Dominos.pages.bars
                addonFun[arg](profileKeys, chars, pages1, pages2)
			-- Quartz
			elseif arg == "Quartz" then
				addonFun[arg](profileKeys, classColor, bgColor)
			-- NOP
			elseif arg == "NOP" then
				local chars = SevenDB.Addons.NOP.chars
				addonFun[arg](profileKeys, chars)
			else
				addonFun[arg](profileKeys)
			end			
		end
	end
	
	if event == "PLAYER_LOGIN" then
        if IsAddOnLoaded("Dominos_Cast") then
            C_AddOns.DisableAddOn("Dominos_Cast")
        end
		
		if IsAddOnLoaded("NOP") then
			local version = GetAddOnMetadata("NOP", 'Version')
			NOP.AceDB.global.version = string.format("|cFFFFFFFF%s 使用 |cFFFF00FF/nop|cFFFFFFFF", version)
		end
	end
	
	if event == "PLAYER_ENTERING_WORLD" or event == "UPDATE_FACTION" then
		if IsAddOnLoaded("Dominos") and IsAddOnLoaded("Quartz") then
			if Dominos then
				local factionData = C_Reputation.GetWatchedFactionData()
				local DominosProfile = Dominos.db:GetCurrentProfile()
				local Quartz = LibStub("AceAddon-3.0"):GetAddon("Quartz3")
				local QuartzProfile = Quartz.db:GetCurrentProfile()
				
				if factionData == nil and DominosProfile ~= "Default" then
					Dominos:SetProfile("Default")
					if QuartzProfile ~= "Default" then
						Quartz.db:SetProfile("Default")
					end
				end
				
				if factionData ~= nil and DominosProfile ~= "监视条" then
					Dominos:SetProfile("监视条")
					if QuartzProfile ~= "Dominos" then
						Quartz.db:SetProfile("Dominos")
					end
				end
			end
		end
	end
end)
