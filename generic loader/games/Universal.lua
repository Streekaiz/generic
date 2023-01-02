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
	if tostring(Self) == "Humanoid" and tostring(Key) == "AutoRotate" then
		return
	end
	if tostring(Self) == "Humanoid" and tostring(Key) == "HipHeight" then
		return
	end
    if tostring(Key) == "Gravity" then
        return
    end
    return oldindex(Self, Key)
end)


getgenv().PlayerAmount = 0

local ESP = loadstring(game:HttpGet("https://kiriot22.com/releases/ESP.lua"))() --[[
	its simple, easy to use, and looks decent
	stfu
]]
local Camera = workspace.CurrentCamera
local Old = {
    WS = game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed or game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed or 16,
    JP = game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower or game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").JumpPower or 50,
    G = workspace.Gravity or 196,
	FOV = game.workspace.CurrentCamera.FieldOfView or 70,
	A = game:GetService("Lighting").Ambient,
	B = game:GetService("Lighting").Brightness,
	HH = game:GetService("Players").LocalPlayer.Character.Humanoid.HipHeight or game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").HipHeight or 2,
    Name = game:GetService("Players").LocalPlayer.Name,
    Display = game:GetService("Players").LocalPlayer.DisplayName,
}

local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/Streekaiz/generic/main/generic%20loader/resources/library.lua', true))()
local Window = OrionLib:MakeWindow({
    Name = "universal v1.3 | "..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name, 
    HidePremium = true,
	ConfigFolder = "generic_cfg",
    SaveConfig = true,
    IntroEnabled = true,
    IntroText = "universal | "..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
    IntroIcon = "rbxassetid://6022668955",
    Icon = "rbxassetid://6022668955",
})
local Tab = {
    Home = Window:MakeTab({ Name = "Home", Icon = "rbxassetid://9792650361", PremiumOnly = false }),
    Player = Window:MakeTab({ Name = "Player", Icon = "rbxassetid://9792631906", PremiumOnly = false }),
    Render = Window:MakeTab({ Name = "Rendering", Icon = "rbxassetid://9792631281", PremiumOnly = false }),
	Combat = Window:MakeTab({ Name = "Combat", Icon = "rbxassetid://4483345998", PremiumOnly = false }),
	Scripts = Window:MakeTab({ Name = "Scripts", Icon = "rbxassetid://6034684949", PremiumOnly = false }),
	Misc = Window:MakeTab({ Name = "Miscallaenous", Icon = "rbxassetid://9792633222", PremiumOnly = false }),
}

Tab.Home:AddSection({
	Name = "Discord Server"
})
Tab.Home:AddParagraph("read!!!!!!!!!!!!!!!!!!11","if you dont join our discord you are a loser!!!!!!!!!!!!!!!!!")

Tab.Home:AddButton({
	Name = "Join the Discord",
	Icon = "rbxssetid://6035053278",
	Callback = function()
	    setclipboard("link")
  	end    
})

Tab.Home:AddSection({
	Name = "Changelogs"
})

Tab.Home:AddLabel("removed anchor toggle")
Tab.Home:AddLabel("added scripts tab")
Tab.Player:AddSection({
	Name = "Player Toggles"
})

local OWSToggle = Tab.Player:AddToggle({ -- thanks flags! 
	Name = "Walk Speed",
	Default = false,
	Color = Color3.fromRGB(118, 60, 232),
	Flag = "WST",
	Save = true,
	Callback = function(Value)
		if Value == false then
			game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = Old.WS
		end
	end    
})

local OJPToggle = Tab.Player:AddToggle({
	Name = "Jump Power",
	Default = false,
	Color = Color3.fromRGB(118, 60, 232),
	Flag = "JPT",
	Save = true,
	Callback = function(Value)
		if Value == false then
			game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").JumpPower = Old.JP
		end
	end    
})

local OGToggle = Tab.Player:AddToggle({
	Name = "Gravity",
	Default = false,
	Color = Color3.fromRGB(118, 60, 232),
	Flag = "GT",
	Save = true,
	Callback = function(Value)
	    if Value == false then
			workspace.Gravity = Old.G
		end
	end    
})

local OFOVToggle = Tab.Player:AddToggle({
	Name = "Field Of View",
	Default = false,
	Color = Color3.fromRGB(118, 60, 232),
	Flag = "FOVT",
	Save = true,
	Callback = function(Value)
		if Value == false then
			workspace.CurrentCamera.FieldOfView = Old.FOV
    	end
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
	Color = Color3.fromRGB(118, 60, 232),
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
	Color = Color3.fromRGB(118, 60, 232),
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
	Color = Color3.fromRGB(118, 60, 232),
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
	Color = Color3.fromRGB(118, 60, 232),
	Increment = 1,
	ValueName = "%",
	Flag = "FOVV",
	Save = true,
	Callback = function(Value)
	end    
})

Tab.Render:AddSection({
	Name = "ESP Toggles"
})

Tab.Render:AddToggle({
	Name = "ESP",
	Default = false,
	Color = Color3.fromRGB(106, 47, 222),
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
	Color = Color3.fromRGB(106, 47, 222),
	Flag = "ESPB",
	Save = true,
	Callback = function(Value)
		ESP.Boxes = Value
	end    
})

Tab.Render:AddToggle({
	Name = "Tracers",
	Default = false,
	Color = Color3.fromRGB(106, 47, 222),
	Flag = "ESPT",
	Save = true,
	Callback = function(Value)
		ESP.Tracers = Value
	end    
})

Tab.Render:AddToggle({
	Name = "Names & Distance",
	Default = false,
	Color = Color3.fromRGB(106, 47, 222),
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
	Color = Color3.fromRGB(104, 41, 227),
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
	Default = Color3.fromRGB(112, 49, 235), -- funy
	Flag = "ESPC",
	Save = true,
	Callback = function(Value)
		ESP.Color = Value
	end	  
})

Tab.Combat:AddLabel("theres more shit below just scroll")
Tab.Combat:AddSection({
	Name = "Aimbot"
})

Tab.Combat:AddSection({
	Name = "Silent Aim"
})

Tab.Combat:AddToggle({
	Name = "Enabled",
	Default = false,
	Color = Color3.fromRGB(118, 60, 232),
	Flag = "SAET",
	Save = true,
	Callback = function(Value)
	end    
})

Tab.Combat:AddToggle({
	Name = "Team Check",
	Default = false,
	Color = Color3.fromRGB(118, 60, 232),
	Flag = "SATCT",
	Save = true,
	Callback = function(Value)
	end    
})

Tab.Combat:AddToggle({
	Name = "Wall Check",
	Default = false,
	Color = Color3.fromRGB(118, 60, 232),
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
	Flag = "SHC",
	Save = true,
	Color = Color3.fromRGB(118, 60, 232),
	Increment = 1,
	ValueName = "%",
	Callback = function(Value)
	end    
})

Tab.Combat:AddSection({
	Name = "Anti Aim Settings"
})

Tab.Combat:AddToggle({
	Name = "Anti Aim",
	Default = false,
	Flag = "AntiAim",
	Save = true,
	Color = Color3.fromRGB(118, 60, 232),
	Callback = function(Value)
	end    
})

Tab.Combat:AddDropdown({
	Name = "Yaw Base",
	Default = "Camera",
	Flag = "YAWBASD",
	Save = true,
	Options = {"Camera", "Spin", "Random"},
	Callback = function(Value)
	end    
})

Tab.Combat:AddDropdown({
	Name = "Yaw Modifier",
	Default = "None",
	Flag = "YAWMODD",
	Save = true,
	Options = {"None", "Jitter", "Offset Jitter"},
	Callback = function(Value)
	end    
})

Tab.Combat:AddSlider({
	Name = "yaw modifier",
	Min = -180,
	Max = 180,
	Default = 0,
	Flag = "YAWOFFMODV",
	Save = true,
	Color = Color3.fromRGB(118, 60, 232),
	Increment = 1,
	ValueName = "%",
	Callback = function(Value)
	end    
})
 -- i mixed up the flags
Tab.Combat:AddSlider({
	Name = "yaw offset modifier",
	Min = -180,
	Max = 180,
	Default = 0,
	Flag = "YAWMODV",
	Save = true,
	Color = Color3.fromRGB(118, 60, 232),
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

Tab.Combat:AddColorpicker({
	Name = "FOV Circle Color",
	Default = Color3.fromRGB(118, 60, 232),
	Flag = "SILENTAIMFOVCIRCLE",
	Save = true,
	Callback = function(Value)
	end
})

Tab.Combat:AddSlider({
	Name = "Radius",
	Min = 0,
	Max = 360,
	Default = 50,
	Flag = "SILENTAIMFOVRADIUS",
	Save = true,
	Color = Color3.fromRGB(118, 60, 232),
	Increment = 1,
	ValueName = "%",
	Callback = function(Value)
	end    
})

Tab.Combat:AddSlider({
	Name = "Sides",
	Min = 0,
	Max = 500,
	Default = 100,
	Flag = "SILENTAIMSIDESRADIUS",
	Save = true,
	Color = Color3.fromRGB(118, 60, 232),
	Increment = 1,
	ValueName = "%",
	Callback = function(Value)
	end    
})

Tab.Scripts:AddSection({
	Name = "Load Scripts"
})
local Universal_To_Load = "None"
local Game_To_Load = "None"
local Game_Dropdown = Tab.Scripts:AddDropdown({
	Name = "Select Game",
	Default = "None",
	Flag = "Game_Dropdown",
	Options = {
      "Anime_Adventrues.lua", 
      "Bedwars.lua", 
      "Bee_Swarm_Simulator.lua",
      "Big_Paintball.lua", 
      "Combat_Warriors.lua", 
      "DBZ.lua", 
      "Dark_Life.lua", 
      "Doors.lua", 
      "Fruit_BattleGrounds.lua", 
      "Jailbreak.lua", 
      "Labyrinth.lua", 
      "Mount_Of_The_Gods.lua", 
      "Murder_Mystery_2.lua", 
      "My_Resturant.lua", 
      "Neon_Knights.lua", 
      "New_PLS_Donate.lua", 
      "Pet_Simulator_X.lua", 
      "Road_To_Gamby.lua", 
      "SKYWARS.lua", 
      "Shoot_Out.lua", 
      "Site_76.lua", 
      "Stand_Upright_Rebooted.lua", 
      "Super_Bomb_Survival.lua", 
      "Total_Drama.lua", 
      "Wind_Of_Fortune.lua", 
      "World_Zero.lua", 
      "ZO.lua"
   }
	Callback = function(Value)
	Game_To_Load = Value
	end    
})

local Universal_Dropdown = Tab.Scripts:AddDropdown({
	Name = "Select Universal Script",
	Default = "None",
	Flag = "Universal_Dropdown",
	Options = {"None", "CMD_X.lua", "Domain_X.lua", "Fates_Admin.lua", "GPU_Saver.lua", "Infinite_Yield.lua", "Orca_Hub.lua", "Player_Radar.lua", "Silent_Aim.lua", "Unnamed_ESP.lua", "Vape.lua", "Hitbox_Expander.lua"},
	Callback = function(Value)
	Universal_To_Load = Value
	end    
})

Tab.Scripts:AddButton({
	Name = "Load Selected Scripts",
	Callback = function()
	    if Universal_To_Load ~= "None" then
			loadstring(game:HttpGet("https://raw.githubusercontent.com/Streekaiz/generic/main/scripts/universal/"..Universal_To_Load))()
		end
		if Game_To_Load ~= "None" then
			loadstring(game:HttpGet("https://raw.githubusercontent.com/Streekaiz/generic/main/scripts/regular%20scripts/"..Game_To_Load))()
		end
		Universal_Dropdown:Set("None")
		Game_Dropdown:Set("None")
		Universal_To_Load = "None"
		Game_To_Load = "None"
  	end    
})

Tab.Scripts:AddSection({
	Name = "Hubs"
})

Tab.Scripts:AddLabel("ordered from small hubs to big hubs")

Tab.Scripts:AddParagraph("Quadra Hub (typer based games) (KEY SYSTEM)", "Type or Die, Shortest Answer Wins, Longest Answer Wins")

Tab.Scripts:AddButton({
	Name = "Load Quadra Hub",
	Callback = function()
	    loadstring(game:HttpGet("https://raw.githubusercontent.com/notxkid/Quadra/main/loader.lua"))()
  	end    
})

Tab.Scripts:AddParagraph("Parvus Hub (fps shooter based games)", "Universal, Bad Business, Blackhawk Rescue Mission 5, Apocalypse Rising 2, RAGDOLL UNIVERSE, Those Who Remain, The Wild West, Steel Titans.")

Tab.Scripts:AddButton({
	Name = "Load Parvus Hub",
	Callback = function()
	    loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/AlexR32/Parvus/main/Loader.lua"))()
  	end    
})

Tab.Scripts:AddParagraph("Lazy Hub (anime based games)","Demon Soul Simulator, A0PG, Anime Rifts, A Universal Time, God's Legacy Demo, Demonfall, Project Baki 2, Floppa Simulator, Reaper 2, Stand Upright: Rebooted.")

Tab.Scripts:AddButton({
	Name = "Load Lazy Hub",
	Callback = function()
	    loadstring(game:HttpGet("https://raw.githubusercontent.com/LioK251/RbScripts/main/lazyhub.lua"))()
  	end    
})

Tab.Scripts:AddParagraph("Crystal Hub (hood based games)", "Hood Duels,  Da Hood Aim Trainer, Hood Customs, The Hood, Hood Modded, Dunking Simulator, Assasian, Ninja Tycoon, Murder Mystery 2, Tower Of Hell, Break In, Anime Lifting Simulator.")

Tab.Scripts:AddButton({
	Name = "Load Crystal Hub",
	Callback = function()
	    _G.LowGFX = false
	    loadstring(game:HttpGet("https://crystalhub.ml/crystalhub/main/source.lua", true))()
  	end    
})

Tab.Scripts:AddParagraph("Unfair Hub", "Pet Simulator X, Arsenal, No-Scope Arcade, Strucid, Custom Duels, Giant Simulator, Da Hood, Anime Fighting Simulator, Kat, Slap Battles, Big Paintball, Zombie Attack, Adopt Me, Goal Kick Simulator, Combat Warriors, starving artists, Timber, Ro-Ghoul, Mining Simulator 2, Animal Simulator, PLS DONATE, Brookhaven, Fruit Juice Tycoon: Refreshed, Bedwars, Sword Simulator, Grand Piece Online, The Wild West, Bee Swarm Simulator, Your Bizarre Adventure, Shark Bite 1 & 2, Base Battles, Project Slayers, Doors, Race Clicker, Parkour, Rainbow Friends, Evade, Aimblox, Slime Tower Tycoon, Infectious Smile, Rat Washing Tycoon, Energy Assault, Idle Heroes Simulator, The Rake REMASTERED, Kaizen, Anime Evolution Simulator.")

Tab.Scripts:AddButton({
	Name = "Load Unfair Hub",
	Callback = function()
	    loadstring(game:HttpGet('https://raw.githubusercontent.com/rblxscriptsnet/unfair/main/rblxhub.lua'))()
  	end    
})

Tab.Scripts:AddParagraph("V.G Hub (Very Gamer Hub)", "too many games, goto pastebin.com/raw/kzSaJ5r7 or v3rmillion.net/showthread.php?tid=1127420")

Tab.Scripts:AddButton({
	Name = "Load V.G Hub",
	Callback = function()
	    loadstring(game:HttpGet('https://raw.githubusercontent.com/1201for/V.G-Hub/main/V.Ghub'))()
  	end    
})

Tab.Misc:AddSection({
	Name = "UI Settings"
})

Tab.Misc:AddButton({
	Name = "Unload UI",
	Callback = function()
      	OrionLib:Destroy()
  	end    
})

Tab.Misc:AddSection({
	Name = "Info"
})

local SERAGELABEL = Tab.Misc:AddLabel("Server Age:"..math.floor(workspace.DistributedGameTime / 60 / 60).." "..math.floor(workspace.DistributedGameTime / 60).." "..math.floor(workspace.DistributedGameTime))
local PLRAMOUNTLABEL = Tab.Misc:AddLabel("Players: "..getgenv().PlayerAmount)

	for _, v in pairs(game:GetService("Players"):GetPlayers()) do
		getgenv().PlayerAmount = getgenv().PlayerAmount + 1
		pcall(function() PLRAMOUNTLABEL:Set("Players: "..getgenv().PlayerAmount) end)
	end
	game:GetService("Players").PlayerAdded:Connect(function() getgenv().PlayerAmount = getgenv().PlayerAmount + 1 pcall(function() PLRAMOUNTLABEL:Set("Players: "..getgenv().PlayerAmount) end) end)
	game:GetService("Players").PlayerRemoving:Connect(function() getgenv().PlayerAmount = getgenv().PlayerAmount - 1 pcall(function() PLRAMOUNTLABEL:Set("Players: "..getgenv().PlayerAmount) end) end)


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

Tab.Misc:AddSection({
	Name = "Lighting"
})

Tab.Misc:AddToggle({
	Name = "Ambience",
	Default = false,
	Color = Color3.fromRGB(118, 60, 232),
	Flag = "AMBTOG",
	Save = true,
	Callback = function(Value)
	    if Value ~= true then
			game:GetService("Lighting").Ambient = Old.A
			else
			    game:GetService("Lighting").Ambient = OrionLib.Flags['AMBCOL'].Value
		end
	end
})

Tab.Misc:AddToggle({
	Name = "Global Shadows",
	Default = true,
	Color = Color3.fromRGB(118, 60, 232),
    Flag = "GLOBSHADOWS",
	Save = true,
	Callback = function(Value)
		game:GetService("Lighting").GlobalShadows = Value
	end    
})

Tab.Misc:AddColorpicker({
	Name = "Ambience Color",
	Default = Color3.fromRGB(118, 60, 232),
	Flag = "AMBCOL",
	Save = true,
	Callback = function(Value)
	    if OrionLib.Flags["AMBTOG"].Value then
			game:GetService("Lighting").Ambient = Value
			game:GetService("Lighting").OutdoorAmbient = Value
		end
	end
})

OrionLib:MakeNotification({ Name = "Hey "..Old.Name.."!", Content = "Come join our discord server, it's already been set to your clipboard.", Image = "rbxassetid://9838877673", Time = 5 })


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
		game.workspace.CurrentCamera.FieldOfView = OrionLib.Flags['FOVV'].Value
	end
	pcall(function() -- why do i need to do this lol..
		SERAGELABEL:Set("Hours: "..math.floor(workspace.DistributedGameTime / 60 / 60)..", Minutes: "..math.floor(workspace.DistributedGameTime / 60)..", Seconds: "..math.floor(workspace.DistributedGameTime))
	end)


    local SelfRootPart, SelfHumanoid = game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart"), game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if not game:GetService("Players").LocalPlayer.Character or not SelfRootPart or not SelfHumanoid then return end
    if OrionLib.Flags["AntiAim"].Value then
    game:GetService("Players").LocalPlayer.Character.Humanoid.AutoRotate = false
        local Angle do
            Angle = -math.atan2(Camera.CFrame.LookVector.Z, Camera.CFrame.LookVector.X) + math.rad(-90)
            if OrionLib.Flags['YAWBASD'].Value == "Random" then
                Angle = -math.atan2(Camera.CFrame.LookVector.Z, Camera.CFrame.LookVector.X) + math.rad(math.random(0, 360))
            elseif OrionLib.Flags['YAWBASD'].Value == "Spin" then
                Angle = -math.atan2(Camera.CFrame.LookVector.Z, Camera.CFrame.LookVector.X) + tick() * 10 % 360
            end
        end

        Jitter = not Jitter
		local Offset = math.rad(OrionLib.Flags['YAWOFFMODV'].Value)
        if Jitter then
            if OrionLib.Flags['YAWMODD'].Value == "Jitter" then
                Offset = math.rad(OrionLib.Flags['YAWMODV'].Value)
            elseif OrionLib.Flags['YAWMODD'].Value == "Offset Jitter" then
                Offset = Offset + math.rad(OrionLib.Flags['YAWMODV'].Value)
            end
        end
        local NewAng = CFrame.new(SelfRootPart.Position) * CFrame.Angles(0, Angle + Offset, 0)
        local function YRotate(_CFrame)
            local X, Y, Z = _CFrame:ToOrientation()
            return CFrame.new(_CFrame.Position) * CFrame.Angles(0, Y, 0)
        end
        AntiaimAngle = Angle + Offset
        SelfRootPart.CFrame = YRotate(NewAng)
        else
			SelfHumanoid.AutoRotate = true
    end


end)
OrionLib:Init()
