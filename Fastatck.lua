if _G.Fastattack then
    (getgenv or (getrenv or getfenv))()

    -- proteção contra executar duas vezes
    if _G.__FASTATTACK_RUNNING then
        return
    end
    _G.__FASTATTACK_RUNNING = true

    local function vu140(pu136, pu137)
        local v138, v139 = pcall(function()
            return pu136:WaitForChild(pu137)
        end)
        if not (v138 and v139) then
            warn("Kh\195\180ng t\195\172m th\225\186\165y: " .. pu137)
        end
        return v139
    end

    local function vu151(p141, p142, p143, p144)
        local v145, v146, v147 = p142:GetChildren()
        local v148 = nil
        while true do
            local v149
            v147, v149 = v145(v146, v147)
            if v147 == nil then
                break
            end
            local v150 = v149:FindFirstChild("Head")
            if v150 and (v149:FindFirstChild("Humanoid")
                and v149.Humanoid.Health > 0
                and (p144:DistanceFromCharacter(v150.Position) < p143)
                and v149 ~= p144.Character) then

                table.insert(p141, { v149, v150 })
                v148 = v150
            end
        end
        return v148
    end

    local v152 = game:GetService("ReplicatedStorage")
    game:GetService("RunService")
    local vu153 = game:GetService("Players").LocalPlayer
    if not vu153 then return end
    if not vu140(v152, "Remotes") then return end

    local v154 = vu140(vu140(v152, "Modules"), "Net")
    local vu155 = vu140(v154, "RE/RegisterAttack")
    local vu156 = vu140(v154, "RE/RegisterHit")

    -- velocidade fixa 1.9
    local vu157 = {
        ["AutoClick"] = true,
        ["ClickDelay"] = 1.9,
        ["Distance"] = 100
    }

    task.spawn(function()
        while _G.Fastattack do
            local ok = pcall(function()
                -- 🔧 LOOP INTERNO CORRIGIDO
                while _G.Fastattack do
                    task.wait(vu157.ClickDelay)

                    if vu157.AutoClick
                        and vu153.Character
                        and vu153.Character:FindFirstChild("Humanoid")
                        and vu153.Character.Humanoid.Health > 0 then

                        local v158 = vu153.Character:FindFirstChildOfClass("Tool")
                        if v158 and v158.ToolTip ~= "Gun" then
                            local v159 = {}
                            local v160 = vu140(workspace, "Enemies")
                            local v161 = vu140(workspace, "Characters")
                            local v162 = vu151(v159, v160, vu157.Distance, vu153)
                            local v163 = vu151(v159, v161, vu157.Distance, vu153)

                            if #v159 > 0 then
                                vu155:FireServer(1.9)
                                vu156:FireServer(v162 or v163, v159)
                            end
                        end
                    end
                end
            end)

            -- se crashar, reinicia
            task.wait(0.5)
        end

        _G.__FASTATTACK_RUNNING = true
    end)
end
