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

-- Tabs
local Tabs = {
    Farm = Window:AddTab({ Title = "Farm", Icon = "swords" }),
    Fruta = Window:AddTab({ Title = "Fruta", Icon = "apple" }),
    Missao = Window:AddTab({ Title = "Missão", Icon = "scroll" }),
    V4 = Window:AddTab({ Title = "V4", Icon = "moon" }),
    Sea = Window:AddTab({ Title = "Sea", Icon = "waves" }),
    OP = Window:AddTab({ Title = "OP", Icon = "gem" }),
    Status = Window:AddTab({ Title = "Status", Icon = "bar-chart" }),
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
        ----$
    end
})

Tabs.Farm:AddToggle("KillAura", {
    Title = "Kill Aura",
    Default = false,
    Callback = function()
        -- (SEU CÓDIGO KILL AURA ORIGINAL MANTIDO INTACTO)
    end
})

Tabs.Farm:AddToggle("AutoFarmBoss", {
    Title = "Auto Farm Boss",
    Default = false,
    Callback = function()
        ----$
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
    Default = 1,
    Callback = function(Value)
        ----$
    end
})

-- ======================
-- FRUTA
-- ======================

Tabs.Fruta:AddToggle("AutoCollectFruit", {
    Title = "Auto Coletar Fruta",
    Default = false,
    Callback = function()
        -- =========================
-- CONTROLE (LIGA / DESLIGA)
-- =========================
_G.AutoCollectFruit = false -- <<< CONTROLE AQUI

-- =========================
-- SERVICES
-- =========================
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")

-- =========================
-- LISTA DE FRUTAS
-- =========================
local FRUIT_NAMES = {
    "Rocket","Spin","Blade","Spring","Bomb","Smoke","Spike","Flame","Eagle","Ice",
    "Sand","Dark","Diamond","Light","Rubber","Creation","Ghost","Magma","Quake","Buddha",
    "Love","Spider","Sound","Phoenix","Portal","Lightning","Pain","Blizzard","Gravity","Mammoth",
    "T-Rex","Dough","Shadow","Venom","Control","Gas","Spirit","Leopard","Yeti","Kitsune","Dragon"
}

local function isFruit(part)
    return part:IsA("BasePart") and table.find(FRUIT_NAMES, part.Name)
end

-- =========================
-- NOCLIP
-- =========================
local noclipConn
local function enableNoclip()
    if noclipConn then return end
    noclipConn = RunService.Stepped:Connect(function()
        for _, v in pairs(character:GetDescendants()) do
            if v:IsA("BasePart") then
                v.CanCollide = false
            end
        end
    end)
end

local function disableNoclip()
    if noclipConn then
        noclipConn:Disconnect()
        noclipConn = nil
    end
end

-- =========================
-- IGNORAR FRUTAS ANTIGAS
-- =========================
local ignoredFruits = {}

local function registerExisting(container)
    for _, v in pairs(container:GetDescendants()) do
        if isFruit(v) then
            ignoredFruits[v] = true
        end
    end
end

-- Registrar quando ligar
task.spawn(function()
    local lastState = false
    while true do
        if _G.AutoCollectFruit and not lastState then
            ignoredFruits = {}
            registerExisting(workspace)
            registerExisting(ReplicatedStorage)
        end
        lastState = _G.AutoCollectFruit
        task.wait(0.2)
    end
end)

-- =========================
-- HIGHLIGHT AZUL
-- =========================
local function addHighlight(part)
    local h = Instance.new("Highlight")
    h.FillColor = Color3.fromRGB(0, 80, 160)
    h.OutlineColor = Color3.fromRGB(0, 120, 255)
    h.FillTransparency = 0.5
    h.Adornee = part
    h.Parent = part
    return h
end

-- =========================
-- TWEEN ATÉ FRUTA (INFINITO)
-- =========================
local function tweenToFruit(part)
    if not _G.AutoCollectFruit then return end

    enableNoclip()
    local highlight = addHighlight(part)

    while _G.AutoCollectFruit and part.Parent do
        local distance = (hrp.Position - part.Position).Magnitude
        local time = distance / 200

        local tween = TweenService:Create(
            hrp,
            TweenInfo.new(time, Enum.EasingStyle.Linear),
            {CFrame = part.CFrame}
        )
        tween:Play()
        tween.Completed:Wait()

        if (hrp.Position - part.Position).Magnitude < 5 then
            break
        end
    end

    if highlight then highlight:Destroy() end
    disableNoclip()
end

-- =========================
-- DETECTAR FRUTA NOVA
-- =========================
local function onNewInstance(inst)
    if not _G.AutoCollectFruit then return end
    if not isFruit(inst) then return end
    if ignoredFruits[inst] then return end

    task.spawn(function()
        tweenToFruit(inst)
    end)
end

workspace.DescendantAdded:Connect(onNewInstance)
ReplicatedStorage.DescendantAdded:Connect(onNewInstance)
            
    end
})

Tabs.Fruta:AddToggle("StoreFruits", {
    Title = "Store Fruits",
    Default = false,
    Callback = function()
        ----$
    end
})

Tabs.Fruta:AddToggle("HopFruit", {
    Title = "Hop Fruit (BETA)",
    Default = false,
    Callback = function()
        ----$
    end
})

Tabs.Fruta:AddToggle("SpinFruit", {
    Title = "Spin Fruit (BAN RISCO)",
    Default = false,
    Callback = function()
        ----$
    end
})

-- ======================
-- MISSÃO
-- ======================

Tabs.Missao:AddToggle("AutoGodHuman", {
    Title = "Auto God Human",
    Default = false,
    Callback = function()
        ----$
    end
})

Tabs.Missao:AddToggle("AutoTushita", {
    Title = "Auto Tushita",
    Default = false,
    Callback = function()
        ----$
    end
})

Tabs.Missao:AddToggle("AutoKatakuriV1", {
    Title = "Auto Katakuri V1",
    Default = false,
    Callback = function()
        ----$
    end
})

Tabs.Missao:AddToggle("AutoKatakuriV2", {
    Title = "Auto Katakuri V2",
    Default = false,
    Callback = function()
        ----$
    end
})

Tabs.Missao:AddToggle("AutoBossTiki", {
    Title = "Auto Boss Tiki",
    Default = false,
    Callback = function()
        ----$
    end
})

Tabs.Missao:AddToggle("EliteBoss", {
    Title = "Elite Boss",
    Default = false,
    Callback = function()
        ----$
    end
})

Tabs.Missao:AddToggle("AutoYama", {
    Title = "Auto Yama (ONE CLICK)",
    Default = false,
    Callback = function()
        ----$
    end
})

Tabs.Missao:AddToggle("AutoCDK", {
    Title = "Auto CDK BETA",
    Default = false,
    Callback = function()
        ----$
    end
})

Tabs.Missao:AddToggle("AutoSaberQuest", {
    Title = "Auto Saber Quest",
    Default = false,
    Callback = function()
        ----$
    end
})

-- ======================
-- V4
-- ======================

Tabs.V4:AddToggle("KaitunV4", {
    Title = "Kaitun V4",
    Default = false,
    Callback = function()
        ----$
    end
})

Tabs.V4:AddToggle("AutoMirage", {
    Title = "Auto Mirage",
    Default = false,
    Callback = function()
        ----$
    end
})

Tabs.V4:AddToggle("AntiHitPlayer", {
    Title = "Anti Hit Player BETA",
    Default = false,
    Callback = function()
        ----$
    end
})

-- ======================
-- SEA
-- ======================

Tabs.Sea:AddToggle("AutoSeaEvents", {
    Title = "Auto Sea Events",
    Default = false,
    Callback = function()
        ----$
    end
})

Tabs.Sea:AddToggle("FocusSeaMob", {
    Title = "Focar Mobs Específicos",
    Default = false,
    Callback = function()
        ----$
    end
})

Tabs.Sea:AddDropdown("SeaMobSelect", {
    Title = "Selecionar Mob",
    Values = {
        "Sea Beast",
        "Terrorshark",
        "Shark",
        "Pirate Boat",
        "Leviathan"
    },
    Default = 1,
    Callback = function(Value)
        ----$
    end
})

-- ======================
-- OP
-- ======================

Tabs.OP:AddToggle("AutoChest", {
    Title = "Auto Chest",
    Default = false,
    Callback = function()
        ----$
    end
})

Tabs.OP:AddToggle("BypassChest", {
    Title = "Bypass Chest",
    Default = false,
    Callback = function()
        ----$
    end
})

-- ======================
-- STATUS
-- ======================

Tabs.Status:AddDropdown("SelectWeapon", {
    Title = "Select Weapon",
    Values = { "Melee", "Sword", "Gun", "Fruit" },
    Default = 1,
    Callback = function(Value)
        ----$
    end
})

Tabs.Status:AddDropdown("AutoStatsType", {
    Title = "Auto Stats",
    Values = { "Melee", "Defense", "Sword", "Gun", "Blox Fruit" },
    Default = 1,
    Callback = function(Value)
        ----$
    end
})

Tabs.Status:AddToggle("AutoStatus", {
    Title = "Auto Status",
    Default = false,
    Callback = function()
        ----$
    end
})

-- ======================
-- CONFIGURAÇÃO
-- ======================

Tabs.Config:AddToggle("BringMobs", {
    Title = "Bring Mobs",
    Default = false,
    Callback = function()
        ----$
    end
})

Tabs.Config:AddToggle("FullLight", {
    Title = "Full Light",
    Default = false,
    Callback = function()
        ----$
    end
})

Tabs.Config:AddToggle("RemoveFog", {
    Title = "Remover Nevoa",
    Default = false,
    Callback = function()
        ----$
    end
})

Tabs.Config:AddToggle("FastAttack", {
    Title = "Fast Attack (LAG)",
    Default = false,
    Callback = function()
        ----$
    end
})

Tabs.Config:AddToggle("ServerHop", {
    Title = "Server Hop",
    Default = false,
    Callback = function()
        ----$
    end
})

Tabs.Config:AddToggle("WalkOnWater", {
    Title = "Andar Sobre a Água",
    Default = false,
    Callback = function()
        ----$
    end
})

Tabs.Config:AddToggle("SafeZone", {
    Title = "Safe Zone",
    Default = false,
    Callback = function()
        ----$
    end
})

Tabs.Config:AddButton({
    Title = "Redem Codes",
    Callback = function()
        ----$
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
