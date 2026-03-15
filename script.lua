local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/76c/BoringHub/main/Source.lua"))()
local Window = Library:CreateWindow("Catch and Tame")
local Folder = Window:CreateFolder("Main Hacks")

-- Auto Collect
Folder:CreateToggle("Auto Collect", function(state)
    _G.Collect = state
    while _G.Collect do
        task.wait(0.5)
        print("Collecting items...")
    end
end)

-- Auto Cash
Folder:CreateToggle("Auto Cash", function(state)
    _G.Cash = state
    while _G.Cash do
        task.wait(2)
        print("Cashing out...")
    end
end)

