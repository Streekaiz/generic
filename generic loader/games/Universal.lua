local ESP = loadstring(game:HttpGet("https://kiriot22.com/releases/ESP.lua"))() --[[
	its simple, easy to use, and looks decent
	stfu
]]

getgenv().AimbotSettings = {
		TeamCheck = true, -- Press ] to toggle
		VisibleCheck = true,
		IgnoreTransparency = false, -- if enabled, visible check will automatically filter transparent objects
		IgnoredTransparency = 0.5, -- all parts with a transparency greater than this will be ignored (IgnoreTransparency has to be enabled)
		RefreshRate = 10, -- how fast the aimbot updates (milliseconds)
		Keybind = getgenv().A_24_c_9_21413_f,
		ToggleKey = "RightBracket",
		MaximumDistance = 300, -- Set this to something lower if you dont wanna lock on some random person across the map
		AlwaysActive = false,
		Aimbot = {
			Enabled = true,
			TargetPart = "Head",
			Use_mousemoverel = true,
			Strength = 100, -- 1% - 200%
			AimType = "Hold", -- "Hold" or "Toggle"
			AimAtNearestPart = false
		},
		AimAssist = {
			Enabled = false,
			MinFov = 15,
			MaxFov = 80,
			DynamicFov = true,
			ShowFov = false, -- Shows Min & Max fov
			Strength = 55, -- 1% - 100%
			SlowSensitivity = true,
			SlowFactor = 1.75, -- 1% - 10%
			RequireMovement = true
		},
		FovCircle = {
			Enabled = true,
			Dynamic = true,
			Radius = 100,
			Transparency = 1,
			Color = Color3.fromRGB(255,255,255),
			NumSides = 64,
		},
		TriggerBot = {
			Enabled = false,
			Delay = 60, -- how long it waits before clicking (milliseconds)
			Spam = true, -- for semi-auto weapons
			ClicksPerSecond = 10, -- set this to 0 to get anything higher than 37 cps
			UseKeybind = false, -- if enabled, your keybind must be held to use trigger bot
		},
		Crosshair = {
			Enabled = false,
			Transparency = 1,
			TransparencyKeybind = 1, -- when the keybind is held, the crosshair's transparency will be changed to this
			Color = Color3.fromRGB(255, 0, 0),
			RainbowColor = false,
			Length = 15,
			Thickness = 2,
			Offset = 0
		},
		Prediction = {
			Enabled = false,
			Strength = 2
		},
		Priority = {},
		Whitelisted = {}, -- Username or User ID
		WhitelistFriends = false, -- Automatically adds friends to the whitelist
		Ignore = {} -- Raycast Ignore
	}


function doesthisguywannasafeconfigsornah()
    if getgenv().SaveConfigurations == true or getgenv().SaveConfigurations == nil then
		return true
		else
		return false
	end
end
function UnloadCallback(areyousurebro)
    pcall(function() -- aaaaaaaaaa this dont work
	-- maybe later
   	 if areyousurebro == "yesbro" then
			for _, v in pairs(Flags) do
				v = false
			end
			ESP:Toggle(false)
			OWSToggle:Set(false)
			OJPToggle:Set(false)
			OGToggle:Set(false)
			OFOVToggle:Set(false)
			game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = Old.WS
			game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").JumpPower = Old.JP
			workspace.Gravity = Old.G
			workspace.CurrentCamera.FieldOfView = Old.FOV
		end
	end)
end

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
local Flags = { --[[
	i would usually just use the orion lib flags but
	they always bug out of me and it doesnt take too much to just make  your own flags
]]
	WST = false,
	WSV = 16,
	JPT = false,
	JPV = 50,
	GT = false,
	GV = 196,
	FOVT = false,
	FOVV = 80,
	AT = false,
	AV = Color3.fromRGB(0, 0, 0),
	BT = false,
	BV = 1,
}


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
    Name = "universal v1 | "..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name, 
    HidePremium = true,
	ConfigFolder = "generic_cfg",
    SaveConfig = doesthisguywannasafeconfigsornah(),
    IntroEnabled = true,
    IntroText = "universal | "..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
    IntroIcon = "rbxassetid://6022668955",
    Icon = "rbxassetid://6022668955", 
    CloseCallback = function()
		for _, v in pairs(Flags) do
			v = false
		end
	    ESP:Toggle(false)
		OWSToggle:Set(false)
		OJPToggle:Set(false)
		OGToggle:Set(false)
		OFOVToggle:Set(false)
		game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = Old.WS
		game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").JumpPower = Old.JP
		workspace.Gravity = Old.G
		workspace.CurrentCamera.FieldOfView = Old.FOV
    end
})
local Tab = {
    Home = Window:MakeTab({ Name = "Home", Icon = "rbxassetid://9792650361", PremiumOnly = false }),
    Player = Window:MakeTab({ Name = "Player", Icon = "rbxassetid://9792631906", PremiumOnly = false }),
    Render = Window:MakeTab({ Name = "Rendering", Icon = "rbxassetid://9792631281", PremiumOnly = false }),
	Combat = Window:MakeTab({ Name = "Combat", Icon = "rbxassetid://4483345998", PremiumOnly = false }),
	Misc = Window:MakeTab({ Name = "Miscallaenous", Icon = "rbxassetid://9792633222", PremiumOnly = false }),
}

Tab.Home:AddSection({
	Name = "Discord Server"
})
Tab.Home:AddParagraph("read!!!!!!!!!!!!!!!!!!11","if you dont join our discord you are a loser!!!!!!!!!!!!!!!!!")

Tab.Home:AddButton({
	Name = "Join the Discord",
	Callback = function()
	    setclipboard("link")
  	end    
})

Tab.Home:AddSection({
	Name = "Changelogs"
})

Tab.Home:AddLabel("released universal")

Tab.Player:AddSection({
	Name = "Player Toggles"
})

local OWSToggle = Tab.Player:AddToggle({ -- thanks flags! 
	Name = "Walk Speed",
	Default = false,
	Flag = "WST",
	Save = true,
	Callback = function(Value)
		if Value then
			Flags.WST = Value
			else
				Flags.WST = Value
				game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = Old.WS
		end
	end    
})

local OJPToggle = Tab.Player:AddToggle({
	Name = "Jump Power",
	Default = false,
	Flag = "JPT",
	Save = true,
	Callback = function(Value)
		if Value then
			Flags.JPT = Value
			else
				Flags.JPT = Value
				game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").JumpPower = Old.JP
		end
	end    
})

local OGToggle = Tab.Player:AddToggle({
	Name = "Gravity",
	Default = false,
	Flag = "GT",
	Save = true,
	Callback = function(Value)
	    if Value then
			Flags.GT = Value
			else
				Flags.GT = false
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
			Flags.FOVT = Value
			else
				Flags.FOVT = false
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
		Flags.WSV = Value
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
		Flags.JPV = Value
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
		Flags.GV = Value
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
		Flags.FOVV = Value
	end    
})

Tab.Render:AddSection({
	Name = "ESP Toggles"
})

Tab.Render:AddToggle({
	Name = "ESP",
	Default = false,
	Color = Color3.fromRGB(93, 222, 134),
	Flag = "ESPT",
	Save = true,
	Callback = function(Value)
	    ESP:Toggle(Value)
		if Value then
			OrionLib:MakeNotification({
				Name = "ESP Credits",
				Content = "ESP made by kiriot. Why am i using it? easy, simple, and decent.",
				Image = "rbxassetid://9838877673",
				Time = 5
			})
		end
	end    
})

Tab.Render:AddToggle({
	Name = "Boxes",
	Default = false,
	Color = Color3.fromRGB(93, 222, 134),
	Flag = "ESPB",
	Save = true,
	Callback = function(Value)
		ESP.Boxes = Value
	end    
})

Tab.Render:AddToggle({
	Name = "Tracers",
	Default = false,
	Color = Color3.fromRGB(93, 222, 134),
	Flag = "ESPT",
	Save = true,
	Callback = function(Value)
		ESP.Tracers = Value
	end    
})

Tab.Render:AddToggle({
	Name = "Names & Distance",
	Default = false,
	Color = Color3.fromRGB(93, 222, 134),
	Flag = "ESPND",
	Save = true,
	Callback = function(Value)
		ESP.Names = Value
	end    
})

Tab.Render:AddSection({
	Name = "ESP Settings"
})

Tab.Render:AddToggle({
	Name = "Face Camera",
	Default = false,
	Color = Color3.fromRGB(57, 219, 108),
	Flag = "ESPFC",
	Save = true,
	Callback = function(Value)
		ESP.FaceCamera = Value
	end    
})

Tab.Render:AddSection({
	Name = "ESP Color"
})

Tab.Render:AddColorpicker({
	Name = "ESP Color",
	Default = Color3.fromRGB(93, 222, 134), -- funy
	Flag = "ESPC",
	Save = true,
	Callback = function(Value)
		ESP.Color = Value
	end	  
})

Tab.Combat:AddSection({
	Name = "Aimbot"
})

Tab.Combat:AddSection({
	Name = "Silent Aim"
})

Tab.Combat:AddToggle({
	Name = "Enabled",
	Default = false,
	Flag = "SAET",
	Save = true,
	Callback = function(Value)
	end    
})

Tab.Combat:AddToggle({
	Name = "Team Check",
	Default = false,
	Flag = "SATCT",
	Save = true,
	Callback = function(Value)
	end    
})

Tab.Combat:AddToggle({
	Name = "Wall Check",
	Default = false,
	Flag = "SAWCT",
	Save = true,
	Callback = function(Value)
	end    
})

Tab.Combat:AddDropdown({
	Name = "Hit Part",
	Default = "Head",
	Flag = "SHPD",
	Save = true,
	Options = {"Head", "HumanoidRootPart", "Random"},
	Callback = function(Value)
	end    
})

Tab.Combat:AddDropdown({
	Name = "Method",
	Default = "Raycast",
	Flag = "SAMD",
	Save = true,
	Options = {"Raycast","FindPartOnRay","FindPartOnRayWithWhitelist","FindPartOnRayWithIgnoreList","Mouse.Hit/Target"},
	Callback = function(Value)
	end    
})

Tab.Combat:AddSlider({
	Name = "Hit chance",
	Min = 0,
	Max = 100,
	Default = 100,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "%",
	Callback = function(Value)
	end    
})

Tab.Combat:AddSection({
	Name = "Aimbot FOV"
})

Tab.Combat:AddSection({
	Name = "Silent Aim FOV"
})



Tab.Misc:AddButton({
	Name = "Unload UI",
	Callback = function()
      	OrionLib:Destroy()
		UnloadCallback("yesbro")
  	end    
})

Tab.Misc:AddSection({
	Name = "Teleport Service"
})

Tab.Misc:AddButton({
	Name = "Rejoin Server",
	Callback = function()
      	game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId)
  	end    
})

Tab.Misc:AddButton({
	Name = "Server Hop",
	Callback = function()
      	game:GetService("TeleportService"):Teleport(game.PlaceId)
  	end    
})
OrionLib:MakeNotification({ Name = "Hey "..Old.Name.."!", Content = "Come join our discord server, it's already been set to your clipboard.", Image = "rbxassetid://9838877673", Time = 5 })


game:GetService("RunService").RenderStepped:Connect(function()

        if Flags.WST then
    		game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = Flags.WSV
		end

		if Flags.JPT then
			game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").JumpPower = Flags.JPV
		end

		if Flags.GT then
			cloneref(workspace).Gravity = Flags.GV
		end

		if Flags.FOVT then
			game.workspace.CurrentCamera.FieldOfView = Flags.FOVV
		end

end)



OrionLib:Init()
