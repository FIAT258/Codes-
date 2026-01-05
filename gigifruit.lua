-- Fluent
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

-- Window
local Window = Fluent:CreateWindow({
    Title = "FIAT HUB (Blox Fruits)",
    SubTitle = "by fiat",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    Farm = Window:AddTab({ Title = "Farm", Icon = "swords" }),
    Fruta = Window:AddTab({ Title = "Fruta", Icon = "apple" }),
    Missao = Window:AddTab({ Title = "Missão", Icon = "scroll" }),
    V4 = Window:AddTab({ Title = "V4", Icon = "zap" }),
    Config = Window:AddTab({ Title = "Configuração", Icon = "settings" })
}

local Options = Fluent.Options

-- ======================
-- FARM
-- ======================

Tabs.Farm:AddToggle("AutoFarm", {
    Title = "Auto Farm",
    Default = false,
    Callback = function()
        -- $
    end
})

Tabs.Farm:AddToggle("KillAura", {
    Title = "Kill Aura",
    Default = false,
    Callback = function()
        -- $
    end
})

Tabs.Farm:AddToggle("AutoFarmBoss", {
    Title = "Auto Farm Boss",
    Default = false,
    Callback = function()
        -- $
    end
})

Tabs.Farm:AddDropdown("BossSelect", {
    Title = "Selecionar Boss",
    Values = {
        "Gorilla King","Bobby","Yeti","Mob Leader","Vice Admiral","Saber Expert",
        "Warden","Chief Warden","Swan","Magma Admiral","Fishman Lord","Wysper",
        "Thunder God","Cyborg","Diamond","Jeremy","Fajita","Don Swan",
        "Smoke Admiral","Ice Admiral","Awakened Ice Admiral","Tide Keeper",
        "Kilo Admiral","Captain Elephant","Beautiful Pirate","Longma",
        "Cake Queen","Stone","Island Empress","Dough King","rip_indra",
        "Casino","Factory"
    },
    Multi = false,
    Default = 1,
    Callback = function(Value)
        -- $ -- Value contem a seleção do boss
    end
})

-- ======================
-- FRUTA
-- ======================

Tabs.Fruta:AddToggle("AutoCollectFruit", {
    Title = "Auto Coletar Fruta",
    Default = false,
    Callback = function()
        -- $
    end
})

Tabs.Fruta:AddToggle("StoreFruits", {
    Title = "Store Fruits",
    Default = false,
    Callback = function()
        -- $
    end
})

Tabs.Fruta:AddToggle("HopFruit", {
    Title = "Hop Fruit (BETA)",
    Default = false,
    Callback = function()
        -- $
    end
})

Tabs.Fruta:AddToggle("SpinFruit", {
    Title = "Spin Fruit (BAN RISCO)",
    Default = false,
    Callback = function()
        -- $
    end
})

-- ======================
-- MISSÃO
-- ======================

Tabs.Missao:AddToggle("AutoGodHuman", {
    Title = "Auto God Human",
    Default = false,
    Callback = function()
        -- $
    end
})

Tabs.Missao:AddToggle("AutoTushita", {
    Title = "Auto Tushita",
    Default = false,
    Callback = function()
        -- $
    end
})

Tabs.Missao:AddToggle("AutoKatakuriV1", {
    Title = "Auto Katakuri V1",
    Default = false,
    Callback = function()
        -- $
    end
})

Tabs.Missao:AddToggle("AutoKatakuriV2", {
    Title = "Auto Katakuri V2",
    Default = false,
    Callback = function()
        -- $
    end
})

Tabs.Missao:AddToggle("AutoBossTiki", {
    Title = "Auto Boss Tiki",
    Default = false,
    Callback = function()
        -- $
    end
})

Tabs.Missao:AddToggle("EliteBoss", {
    Title = "Elite Boss",
    Default = false,
    Callback = function()
        -- $
    end
})

Tabs.Missao:AddToggle("AutoYama", {
    Title = "Auto Yama (ONE CLICK)",
    Default = false,
    Callback = function()
        -- $
    end
})

Tabs.Missao:AddToggle("AutoCDK", {
    Title = "Auto CDK BETA (need Tushita and Yama)",
    Default = false,
    Callback = function()
        -- $
    end
})

Tabs.Missao:AddToggle("AutoSaberQuest", {
    Title = "Auto Saber Quest (need 200lv)",
    Default = false,
    Callback = function()
        -- $
    end
})

-- ======================
-- V4
-- ======================

Tabs.V4:AddToggle("KaitunV4", {
    Title = "Kaitun V4",
    Default = false,
    Callback = function()
        -- $
    end
})

Tabs.V4:AddToggle("AutoMirage", {
    Title = "Auto Mirage",
    Default = false,
    Callback = function()
        -- $
    end
})

Tabs.V4:AddToggle("AntiHitPlayer", {
    Title = "Anti Hit Player BETA (NEED DRAGON STORM)",
    Default = false,
    Callback = function()
        -- $
    end
})

-- ======================
-- CONFIGURAÇÃO
-- ======================

Tabs.Config:AddToggle("BringMobs", {
    Title = "Bring Mobs",
    Default = false,
    Callback = function()
        -- $
    end
})

Tabs.Config:AddToggle("FullLight", {
    Title = "Full Light",
    Default = false,
    Callback = function()
        -- $
    end
})

Tabs.Config:AddToggle("RemoveFog", {
    Title = "Remover Nevoa",
    Default = false,
    Callback = function()
        -- $
    end
})

Tabs.Config:AddToggle("FastAttack", {
    Title = "Fast Attack (LAG)",
    Default = false,
    Callback = function()
        -- $
    end
})

Tabs.Config:AddToggle("ServerHop", {
    Title = "Server Hop",
    Default = false,
    Callback = function()
        -- $
    end
})

-- ======================
-- MANAGERS
-- ======================

SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})

InterfaceManager:SetFolder("FIATHUB")
SaveManager:SetFolder("FIATHUB/BloxFruits")

InterfaceManager:BuildInterfaceSection(Tabs.Config)
SaveManager:BuildConfigSection(Tabs.Config)

Window:SelectTab(1)

Fluent:Notify({
    Title = "FIAT HUB",
    Content = "Interface carregada com sucesso.",
    Duration = 6
})
