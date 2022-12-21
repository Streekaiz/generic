--[[
    Football Fusion 2
]]

getgenv().Settings = {
    Mag = false,
}

local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/Streekaiz/generic/main/generic%20loader/resources/library.lua', true))()
local Window = OrionLib:MakeWindow({
    Name = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name, 
    HidePremium = true,
    IntroEnabled = true,
    IntroText = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
    IntroIcon = "rbxassetid://6022668955",
    Icon = "rbxassetid://6022668955",
})

local Main = Window:MakeTab({ Name = "Combat", Icon = "rbxassetid://4483345998", PremiumOnly = false })
Main:AddSection({
	Name = "Mag"
})

Main:AddToggle({
	Name = "Enable Legit Mag",
	Default = false,
    Flag = "MagToggle",
	Color = Color3.fromRGB(219, 68, 136),
	Callback = function(Value)
        getgenv().Settings.Mag = Value
	end    
})
local MagValue = Main:AddLabel("Mag Enabled: boolean")

Main:AddSection({
	Name = "Values"
})

local QBValue = Main:AddLabel("Quarter Back: boolean")
local FBValue = Main:AddLabel("Fumble Chance: number")

function Mag(Part) 
    if Part and game:GetService("Players").LocalPlayer.Character ~= nil then
        firetouchinterest(game:GetService("Players").LocalPlayer.Character["Left Arm"], Part, 0)
        firetouchinterest(game:GetService("Players").LocalPlayer.Character["Right Arm"], Part, 0)
        task.wait()
        firetouchinterest(game:GetService("Players").LocalPlayer.Character["Left Arm"], Part, 1)
        firetouchinterest(game:GetService("Players").LocalPlayer.Character["Right Arm"], Part, 1)
    end
end







game:GetService("RunService").RenderStepped:Connect(function()
   if getgenv().Settings.Mag == true and not game:GetService("ReplicatedStorage").Values.HomeQB.Value:match(game:GetService("Players").LocalPlayer.Name) and not game:GetService("ReplicatedStorage").Values.AwayQB.Value:match(game:GetService("Players").LocalPlayer.Name) then
        for i,v in pairs(workspace:GetChildren()) do
            if v.Name == "Football" and v:IsA("BasePart") then
                task.wait()
                if game:GetService("Players").LocalPlayer.Character then
                   firetouchinterest(game:GetService("Players").LocalPlayer.Character["Left Arm"], v, 0)
                    firetouchinterest(game:GetService("Players").LocalPlayer.Character["Right Arm"], v, 0)
                    task.wait()
                    firetouchinterest(game:GetService("Players").LocalPlayer.Character["Right Arm"], v, 1)
                    firetouchinterest(game:GetService("Players").LocalPlayer.Character["Left Arm"], v, 1)
                end
			else
               MagValue:Set("Mag Enabled: true")
            end
        end
		else
		task.wait()
        MagValue:Set("Mag Enabled: false")
    end
end)

task.spawn(function()
    while task.wait(math.random(2.5, 5)) do
        if game:GetService("ReplicatedStorage").Values.HomeQB.Value:match(game:GetService("Players").LocalPlayer.Name) and not game:GetService("ReplicatedStorage").Values.AwayQB.Value:match(game:GetService("Players").LocalPlayer.Name)then
	    	QBValue:Set("Quarter Back: true")
	    	else
		    	QBValue:Set("Quarter Back: false")
		end
		FBValue:Set("Fumble Chance: "..game.ReplicatedStorage.Values.Rule_Fumble.Value)
	end

end)
