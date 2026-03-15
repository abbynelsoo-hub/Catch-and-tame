-- 1. Load the Menu Style (The link you found)
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/76c/BoringHub/main/Source.lua"))()

-- 2. Create the Window
local Window = Library:CreateWindow("Catch and Tame | Mobile")
local Main = Window:CreateFolder("Auto Farm")

-- 3. The "Auto Collect" Button
Main:CreateToggle("Auto Collect", function(state)
    _G.Collect = state
    while _G.Collect do
        task.wait(0.1)
        -- This part picks up items around you
        for _, v in pairs(workspace:GetChildren()) do
            if v:IsA("Part") and v.Name == "Drop" then 
                v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            end
        end
    end
end)

-- 4. The "Auto Cash" Button
Main:CreateToggle("Auto Cash", function(state)
    _G.Cash = state
    while _G.Cash do
        task.wait(1)
        -- This sends the "Sell" command to the game
        game:GetService("ReplicatedStorage").Events.Sell:FireServer()
    end
end)
