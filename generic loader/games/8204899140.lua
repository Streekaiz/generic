getgenv().Settings = {}
getgenv().Settings = {
    Mag = false,
	Triggerbot = false,
	TriggerbotDistance = 5,
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

Main:AddSection({
	Name = "Triggerbot"
})

Main:AddToggle({
	Name = "Enable Triggerbot",
	Default = false,
        Flag = "Triggerbot",
	Color = Color3.fromRGB(219, 68, 136),
	Callback = function(Value)
        getgenv().Settings.Triggerbot = Value
	end    
})

Main:AddSlider({
	Name = "Slider",
	Min = 0,
	Max = 10,
	Default = 5,
	Color = Color3.fromRGB(219, 68, 136),
	Increment = 1,
	ValueName = "%",
	Callback = function(Value)
		getgenv().Settings.TriggerbotDistance = Value
	end    
})

local MagValue = Main:AddLabel("Mag Enabled: boolean")

Main:AddSection({
	Name = "Values"
})

local QBValue = Main:AddLabel("Quarter Back: boolean")
local FBValue = Main:AddLabel("Fumble Chance: number")

-- hi


game:GetService("RunService").RenderStepped:Connect(function()
   if getgenv().Settings.Mag == true and not game:GetService("ReplicatedStorage").Values.HomeQB.Value:match(game:GetService("Players").LocalPlayer.Name) and not game:GetService("ReplicatedStorage").Values.AwayQB.Value:match(game:GetService("Players").LocalPlayer.Name) then
        for i,v in pairs(workspace:GetChildren()) do
            if v.Name == "Football" and v:IsA("BasePart") then
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
game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().Settings.Triggerbot == true and not game:GetService("ReplicatedStorage").Values.HomeQB.Value:match(game:GetService("Players").LocalPlayer.Name) and not game:GetService("ReplicatedStorage").Values.AwayQB.Value:match(game:GetService("Players").LocalPlayer.Name) then
		for _, v in pairs(workspace:GetChildren()) do
			if v.Name == "Football" and v:IsA("BasePart") then
				local FootballDistance = (v.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
				if FootballDistance < getgenv().Settings.TriggerbotDistance then
					mouse1click()
				end	
			end
		end
	end
end)
