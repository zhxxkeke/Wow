local addonName, addonTable = ...
local config = {}
addonTable.config = config


-- 加载模块
config.module = {
    SetAddon    = true, -- 设置插件
    AddonFun    = {},   -- 插件功能
	API			= {},	-- WOW  API
}


-- WOW API
config.module.API = {
    IsAddOnLoaded = C_AddOns.IsAddOnLoaded,
	GetAddOnMetadata = C_AddOns.GetAddOnMetadata,
    wipe = table.wipe,
}


-- 全局函数
config.global = {}


-- 隐藏
config.global.Hide = function(self)
    if self then
        self:SetAlpha(0)
        self:Hide()
    end
end
