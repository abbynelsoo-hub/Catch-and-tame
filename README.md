-- Delta Script: Catch and Tame Essentials
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/76c/BoringHub/main/Source.lua"))()
local Window = Library:CreateWindow("Catch and Tame | Mobile Edition")

local ToggleFolder = Window:CreateFolder("Automation")

-- Variables for Toggles
_G.AutoCollect = false
_G.AutoCash = false
_G.AutoLasso = false
_G.AutoStrongest = false

-- 1. Auto Collect Items/Drops
ToggleFolder:CreateToggle("Auto Collect", function(state)
    _G.AutoCollect = state
    while _G.AutoCollect do
        task.wait(0.1)
        -- Logic to fire touch interest or move drops to player
        for _, v in pairs(workspace.DroppedItems:GetChildren()) do
            if v:IsA("Part") or v:IsA("MeshPart") then
                v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            end
        end
    end
end)

-- 2. Auto Cash Out (Selling)
ToggleFolder:CreateToggle("Auto Cash", function(state)
    _G.AutoCash = state
    while _G.AutoCash do
        task.wait(2) -- Prevents rate-limiting
        game:GetService("ReplicatedStorage").Events.SellAnimals:FireServer()
    end
end)

-- 3. Max Lasso Strength (Infinite/Fast)
ToggleFolder:CreateToggle("Auto Lasso Strength", function(state)
    _G.AutoLasso = state
    while _G.AutoLasso do
        task.wait()
        local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
        if tool and tool:FindFirstChild("LassoScript") then
            -- Adjusting internal values for strength/speed
            tool.Configuration.Strength.Value = 9999
            tool.Configuration.ChargeSpeed.Value = 100
        end
    end
end)

-- 4. Auto Catch Strongest Animals
ToggleFolder:CreateToggle("Auto Strongest Catch", function(state)
    _G.AutoStrongest = state
    while _G.AutoStrongest do
        task.wait(0.5)
        local target = nil
        local maxHealth = 0
        
        -- Logic to find the most "Powerful" (Highest Health/Level) animal
        for _, animal in pairs(workspace.Animals:GetChildren()) do
            if animal:FindFirstChild("Health") and animal.Health.Value > maxHealth then
                maxHealth = animal.Health.Value
                target = animal
            end
        end
        
        if target then
            -- Teleport Lasso or trigger catch event
            game:GetService("ReplicatedStorage").Events.CatchAnimal:FireServer(target)
        end
    end
end)
