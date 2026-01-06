-- SERVICES
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local VirtualInputManager = game:GetService("VirtualInputManager")

local player = Players.LocalPlayer

-- SCREEN GUI
local gui = Instance.new("ScreenGui")
gui.Name = "CtrlButtonGUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- QUADRADO
local frame = Instance.new("Frame")
frame.Size = UDim2.fromOffset(120, 120)
frame.Position = UDim2.fromScale(0.5, 0.5)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.Parent = gui

-- CONTORNO VERMELHO
local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(255, 0, 0)
stroke.Thickness = 3
stroke.Parent = frame

-- CANTO LEVEMENTE ARREDONDADO (opcional)
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = frame

-- IMAGEM NO CENTRO
local image = Instance.new("ImageLabel")
image.Size = UDim2.fromScale(0.8, 0.8)
image.Position = UDim2.fromScale(0.5, 0.5)
image.AnchorPoint = Vector2.new(0.5, 0.5)
image.BackgroundTransparency = 1
image.Image = "rbxassetid://133464837091679"
image.Parent = frame

-- BOTÃO INVISÍVEL PARA CLICK
local button = Instance.new("TextButton")
button.Size = UDim2.fromScale(1, 1)
button.BackgroundTransparency = 1
button.Text = ""
button.Parent = frame

-- =========================
-- SIMULAR CTRL
-- =========================

button.MouseButton1Down:Connect(function()
    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.LeftControl, false, game)
end)

button.MouseButton1Up:Connect(function()
    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.LeftControl, false, game)
end)

-- =========================
-- SISTEMA DE ARRASTAR
-- =========================

local dragging = false
local dragStart
local startPos

button.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)
