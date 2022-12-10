for _, items in pairs(game:GetService("Workspace").Items:GetChildren()) do
	items.Handle.Anchored = false
end

game:GetService("Workspace").Items.ChildAdded:Connect(function(Child)
    Child:WaitForChild("Handle").Anchored = false
end)


local Old = {
    WS = game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed or game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed or 16,
    JP = game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower or game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").JumpPower or 50,
    G = workspace.Gravity or 196,
	FOV = game.workspace.CurrentCamera.FieldOfView or 70,
	A = game:GetService("Lighting").Ambient,
	B = game:GetService("Lighting").Brightness,
    Name = game:GetService("Players").LocalPlayer.Name,
    Display = game:GetService("Players").LocalPlayer.DisplayName,
}

function EquipRandomT()
    local RandomTool = math.random(1, 3)
	if RandomTool == 1 and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Stand Arrow") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Stand Arrow").Handle.Anchored ~= true then
		game:GetService("Players").LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild("Stand Arrow"))
		elseif RandomTool == 2 and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rokakaka") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rokakaka").Handle.Anchored ~= true then
			game:GetService("Players").LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild("Rokakaka"))
			elseif RandomTool == 3 and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Ketchup") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Ketchup").Handle.Anchored ~= true then
				game:GetService("Players").LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild("Ketchup"))
	end
end
local gmt = getrawmetatable(game)
local oldindex = gmt.__index
setreadonly(gmt, false)
gmt.__index = newcclosure(function(Self, Key)
    if tostring(Self) == "Humanoid" and tostring(Key) == "WalkSpeed" then
        return
    end
    if tostring(Self) == "Humanoid" and tostring(Key) == "JumpPower" then
        return
    end
    if tostring(Key) == "Gravity" then
        return
    end
    return oldindex(Self, Key)
end)
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/Streekaiz/generic/main/generic%20loader/resources/library.lua')))()
local Window = OrionLib:MakeWindow({
    Name = "stand upright | server age: ", 
    HidePremium = true,
	ConfigFolder = "generic_cfg",
    SaveConfig = true,
    IntroEnabled = true,
    IntroText = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
    IntroIcon = "rbxassetid://6022668955",
    Icon = "rbxassetid://6022668955",
})

local Tab = {
    Home = Window:MakeTab({ Name = "Home", Icon = "rbxassetid://9792650361", PremiumOnly = false }),
	Teleporting = Window:MakeTab({ Name = "Teleports", Icon = "rbxassetid://", PremiumOnly = false }),
    Farming = Window:MakeTab({ Name = "Farming", Icon = "rbxassetid://", PremiumOnly = false }),
	Player = Window:MakeTab({ Name = "Player", Icon = "rbxassetid://9792631906", PremiumOnly = false }),
	Misc = Window:MakeTab({ Name = "Miscallaenous", Icon = "rbxassetid://9792633222", PremiumOnly = false }),
}

Tab.Farming:AddSection({
	Name = "Item Farm"
})

Tab.Farming:AddToggle({ -- thanks flags! 
	Name = "Enable Item Farm",
	Default = false,
	Flag = "ITFT",
	Save = true,
	Callback = function(Value)
	    getgenv().itemfarm = Value
	    while getgenv().itemfarm do
			for _, items in pairs(game:GetService("Workspace").Items:GetChildren()) do
				items.Handle.Anchored = false
				task.wait(0.05)
				game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = items.Handle.CFrame
				EquipRandomT() task.wait(0.05) EquipRandomT() task.wait(0.05) 
				task.wait(OrionLib.Flags['ITWV'].Value)
			end
			EquipRandomT()
			task.wait()
		end
	end    
})


Tab.Farming:AddSlider({
	Name = "Wait Value",
	Min = 0.1,
	Max = 2.5,
	Default = 1,
	Color = Color3.fromRGB(44, 118, 222),
	Increment = 0.5,
	ValueName = "%",
	Flag = "ITWV",
	Save = true,
	Callback = function(Value)
	end    
})






Tab.Player:AddSection({
	Name = "Player Toggles"
})

local OWSToggle = Tab.Player:AddToggle({ -- thanks flags! 
	Name = "Walk Speed",
	Default = false,
	Color = Color3.fromRGB(230, 67, 77),
	Flag = "WST",
	Save = true,
	Callback = function(Value)
		if Value ~= true then
			game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = Old.WS
		end
	end    
})

local OJPToggle = Tab.Player:AddToggle({
	Name = "Jump Power",
	Default = false,
	Color = Color3.fromRGB(230, 67, 77),
	Flag = "JPT",
	Save = true,
	Callback = function(Value)
		if Value ~= true then
			game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").JumpPower = Old.JP
		end
	end    
})

local OGToggle = Tab.Player:AddToggle({
	Name = "Gravity",
	Default = false,
	Color = Color3.fromRGB(230, 67, 77),
	Flag = "GT",
	Save = true,
	Callback = function(Value)
	    if Value ~= true then
			workspace.Gravity = Old.G
		end
	end    
})

local OFOVToggle = Tab.Player:AddToggle({
	Name = "Field Of View",
	Default = false,
	Color = Color3.fromRGB(230, 67, 77),
	Flag = "FOVT",
	Save = true,
	Callback = function(Value)
		if Value then
			workspace.CurrentCamera.FieldOfView = Old.FOV
    	end
	end    
})

Tab.Player:AddToggle({
	Name = "Anchor",
	Default = false,
	Color = Color3.fromRGB(230, 67, 77),
	Flag = "ANCHT",
	Save = true,
	Callback = function(Value)
	    game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Anchored = Value
	end    
})


Tab.Player:AddSection({
	Name = "Player Sliders"
})


Tab.Player:AddSlider({
	Name = "Walk Speed Value",
	Min = 0,
	Max = 150,
	Default = Old.WS,
	Color = Color3.fromRGB(44, 118, 222),
	Increment = 1,
	ValueName = "%",
	Flag = "WSV",
	Save = true,
	Callback = function(Value)
	end    
})

Tab.Player:AddSlider({
	Name = "Jump Power Value",
	Min = 0,
	Max = 150,
	Default = Old.JP,
	Color = Color3.fromRGB(44, 118, 222),
	Increment = 1,
	ValueName = "%",
	Flag = "JPV",
	Save = true,
	Callback = function(Value)
	end    
})

Tab.Player:AddSlider({
	Name = "Gravity Value",
	Min = 0,
	Max = 196,
	Default = Old.G,
	Color = Color3.fromRGB(44, 118, 222),
	Increment = 1,
	ValueName = "%",
	Flag = "GV",
	Save = true,
	Callback = function(Value)
	end    
})

Tab.Player:AddSlider({
	Name = "Field Of View Value",
	Min = 0,
	Max = 120,
	Default = Old.FOV,
	Color = Color3.fromRGB(230, 67, 77),
	Increment = 1,
	ValueName = "%",
	Flag = "FOVV",
	Save = true,
	Callback = function(Value)
	end    
})


game:GetService("RunService").RenderStepped:Connect(function()
    if OrionLib.Flags['WST'].Value then
		game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = OrionLib.Flags['WSV'].Value
	end
	if OrionLib.Flags['JPT'].Value then
		game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").JumpPower = OrionLib.Flags['JPV'].Value
	end
	if OrionLib.Flags['GT'].Value then
		cloneref(workspace).Gravity = OrionLib.Flags['GV'].Value
	end
	if OrionLib.Flags['FOVT'].Value then
	    game.workspace.Camera.FieldOfView = OrionLib.Flags['FOVV'].Value
	end
	if OrionLib.Flags['ITFT'].Value then
		game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").AutoRotate = false
		game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame * CFrame.Angles(0, 0.25, 0)
		else
			game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").AutoRotate = true
	end
end)
