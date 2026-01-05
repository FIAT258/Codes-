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
    V4 = Window:AddTab({ Title = "V4", Icon = "moon" }),
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
        -- SERVICES
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local VirtualInputManager = game:GetService("VirtualInputManager")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")

-- ======================
-- NOCLIP
-- ======================
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

-- ======================
-- PEGAR MOB MAIS PERTO
-- ======================
local function getClosestMob(radius)
    local enemies = workspace:FindFirstChild("Enemies")
    if not enemies then return nil end

    local closest, minDist = nil, math.huge

    for _, mob in pairs(enemies:GetChildren()) do
        local hum = mob:FindFirstChildOfClass("Humanoid")
        local root = mob:FindFirstChild("HumanoidRootPart")
        if hum and root and hum.Health > 0 then
            local dist = (root.Position - hrp.Position).Magnitude
            if dist < radius and dist < minDist then
                minDist = dist
                closest = mob
            end
        end
    end

    return closest
end

-- ======================
-- HITBOX
-- ======================
local function expandHitbox(mob)
    local root = mob:FindFirstChild("HumanoidRootPart")
    if root then
        root.Size = Vector3.new(130,130,130)
        root.Transparency = 0.6
        root.CanCollide = false
    end
end

-- ======================
-- EQUIPAR ARMA / COMBAT
-- ======================
local function forceFastAttack()
    for _, v in pairs(character:GetDescendants()) do
        if v:IsA("NumberValue") then
            local name = v.Name:lower()
            if name:find("melee") or name:find("combat") or name:find("attack") then
                v.Value = 1.9
            end
        end
    end
end

-- ======================
-- AUTO CLICK
-- ======================
local function autoClick()
    local cam = workspace.CurrentCamera
    local x = cam.ViewportSize.X / 2
    local y = cam.ViewportSize.Y / 2

    VirtualInputManager:SendMouseButtonEvent(x, y, 0, true, game, 1)
    VirtualInputManager:SendMouseButtonEvent(x, y, 0, false, game, 1)
end

-- ======================
-- KILL AURA LOOP
-- ======================
task.spawn(function()
    while true do
        if Options.KillAura.Value then
            local radius = Options.BringMobs.Value and 90 or 230
            local mob = getClosestMob(radius)

            if mob then
                local hum = mob:FindFirstChildOfClass("Humanoid")
                local root = mob:FindFirstChild("HumanoidRootPart")

                if hum and root then
                    expandHitbox(mob)
                    enableNoclip()
                    forceFastAttack()

                    -- APERTA TECLA 1
                    VirtualInputManager:SendKeyEvent(true, "One", false, game)
                    VirtualInputManager:SendKeyEvent(false, "One", false, game)

                    local tweenTime = (root.Position - hrp.Position).Magnitude / 200
                    local tween = TweenService:Create(
                        hrp,
                        TweenInfo.new(tweenTime, Enum.EasingStyle.Linear),
                        {CFrame = root.CFrame}
                    )
                    tween:Play()

                    -- LOOP DURANTE ATAQUE
                    while tween.PlaybackState == Enum.PlaybackState.Playing
                    and hum.Health > 0
                    and Options.KillAura.Value do

                        if Options.BringMobs.Value then
                            for _, v in pairs(workspace.Enemies:GetChildren()) do
                                local r = v:FindFirstChild("HumanoidRootPart")
                                local h = v:FindFirstChildOfClass("Humanoid")
                                if r and h and h.Health > 0 then
                                    if (r.Position - root.Position).Magnitude <= 90 then
                                        r.CFrame = root.CFrame * CFrame.new(0, 0, -4)
                                    end
                                end
                            end
                        end

                        autoClick()
                        task.wait()
                    end
                end
            else
                task.wait(1)
            end
        else
            disableNoclip()
            task.wait(0.5)
        end
    end
end)

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
