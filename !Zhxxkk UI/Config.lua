local addonName, addonTable = ...
local config = {}
addonTable.config = config


config.module = {
	ActionBar	= true,		-- 动作条
	Minimap		= true,		-- 迷你地图
	Options		= true,		-- 界面选项
	Keyboard	= true,		-- 快捷键
	Code		= true,		-- 代码片段
	ChatFrame	= true,		-- 聊天框体
	SetAddon	= true,		-- 插件配置
	AddonFun	= {},		-- 插件配置函数表
	EditMode	= true,		-- 编辑模式
	UnitFrame	= true,		-- 单位框体
	MoveFrame	= true,		-- 移动框体
	Macro		= true,		-- 宏
}
