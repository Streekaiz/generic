--[[
                                                             ▄▄          
             ██                            ██                ██          
             ██                            ██                            
     ▄██▀████████▀███▄███  ▄▄█▀██  ▄▄█▀██  ██  ▄██▀ ▄█▀██▄ ▀███  █▀▀▀███ 
     ██   ▀▀ ██    ██▀ ▀▀ ▄█▀   ██▄█▀   ██ ██ ▄█   ██   ██   ██  ▀  ███  
     ▀█████▄ ██    ██     ██▀▀▀▀▀▀██▀▀▀▀▀▀ ██▄██    ▄█████   ██    ███   
     █▄   ██ ██    ██     ██▄    ▄██▄    ▄ ██ ▀██▄ ██   ██   ██   ███  ▄ 
     ██████▀ ▀████████▄    ▀█████▀ ▀█████▀████▄ ██▄▄████▀██▄████▄███████                                                                
]]--[[
    a cheat that i dedicated most of my time to unlike all the other games
    have fun with src

]]



local StartLoadTick = tick()

local Library = loadstring(
    game:HttpGet(
        "https://raw.githubusercontent.com/vozoid/ui-libraries/main/drawing/void/source.lua"
    )
)()

local Notify = loadstring(
	game:HttpGet(
		"https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/Library.lua"
	)
)()

repeat task.wait() until game:IsLoaded()
function ACBypass() -- this is gonna get patched eventually lol
local function CheckTable(tbl, ...)
	local Indexes = {...}	
	for _, v in ipairs(Indexes) do
		if not (rawget(tbl, v)) then
			return false
		end
	end
        return true
	end		
	    local u21
			for _,v in ipairs(getgc(true)) do
				if (typeof(v) == "table" and CheckTable(v, "A", "B", "GP", "EN")) then
					u21 = v
					break
				end
			end
			hookfunction(u21.A, function()
			end)
			hookfunction(u21.B, function()		
            end)
end
if game:IsLoaded() then
	ACBypass()
end
Notify:Notify("Loading...")
task.wait(5)
Notify:Notify("Loaded! Time to load: "..StartLoadTick)
local Main = Library:Load{
    Name = "Crimhaxx",
    SizeX = 850,
    SizeY = 500,
    Theme = "Default",
    Extension = "txt",
    Folder = "Crim_Hack"
}

local Tabs = {
    Combat = Main:Tab("Combat"),
    Player = Main:Tab("Player"),
    AntiAim = Main:Tab("Anti-Aim"),
    Render = Main:Tab("Render"),
    Misc = Main:Tab("Miscellaneous"),
    Settings = Main:Tab("Settings"),
}



local Sections = {
    SilentAim = Tabs.Combat:Section{
        Name = "Silent Aim Settings",
        Side = "Left"
    },
    SilentFOV = Tabs.Combat:Section{
        Name = "Silent FOV Settings",
        Side = "Left"
    },
    Movement = Tabs.Player:Section{
        Name = "Movement Settings",
        Side = "Left"
    },
    AntiAim = Tabs.AntiAim:Section{
        Name = "Anti-Aim Settings",
        Side = "Left"
    },
    AntiAim2 = Tabs.AntiAim:Section{
        Name = "More Anti-Aim Settings",
        Side = "Right"
    },
    ItemESP = Tabs.Render:Section{
        Name = "Item ESP Settings",
        Side = "Left"
    },
    PlayerESP = Tabs.Render:Section{
        Name = "Player ESP Settings",
        Side = "Left"
    },
    Self_Chams = Tabs.Render:Section{
        Name = "Self Chams Settings",
        Side = "Right"
    },
    Misc = Tabs.Misc:Section{
        Name = "Miscellaneous",
        Side = "Left"
    },
    Info = Tabs.Misc:Section{
        Name = "Server Info",
        Side = "Right"
    },
    UISettings = Tabs.Settings:Section{
        Name = "UI Settings",
        Side = "Left"
    },
	Configs = Tabs.Settings:Section{
        Name = "Config",
        Side = "Left"
    },
    Themes = Tabs.Settings:Section{
        Name = "UI Themes",
        Side = "Right"
    },
}

Sections.Movement:Separator("Toggles")

Sections.Movement:Toggle{
    Name = "Enable Walk Speed",
    Flag = "Walkspeed Toggle",
    Default = false,
}

Sections.Movement:Toggle{
    Name = "Enable Jump Power",
    Flag = "Jumppower Toggle",
    Default = false,
}

Sections.Movement:Toggle{
    Name = "Enable Gravity",
    Flag = "Gravity Toggle",
    Default = false,
}

Sections.Movement:Separator("Sliders")

Sections.Movement:Slider{
	Name = "Walk Speed Value",
    Text = "[value]",
    Default = 16,
    Min = 0,
    Max = 100,
    Float = 0.05,
    Flag = "Walkspeed Value",
}

Sections.Movement:Slider{
	Name = "Jump Power Value",
    Text = "[value]",
    Default = 16,
    Min = 0,
    Max = 100,
    Float = 0.05,
    Flag = "Jumppower Value",
}

Sections.Movement:Slider{
	Name = "Gravity Value",
    Text = "[value]",
    Default = 196,
    Min = 0,
    Max = 196,
    Float = 0.05,
    Flag = "Gravity Value",
	Callback = function(Value)
		if Library.flags['Gravity Toggle'] then
			cloneref(workspace).Gravity = Value
			else
			cloneref(workspace).Gravity = 196
		end
	end
}

local SilentAimToggle = Sections.SilentAim:Toggle{
    Name = "Enable Silent Aim",
    Flag = "Silent Aim Toggle",
    Default = false,
} SilentAimToggle:Keybind{
    Blacklist = {Enum.UserInputType.MouseButton1},
    Flag = "Silent Aim Keybind",
    Mode = "Toggle",
}

Sections.SilentAim:Toggle{
    Name = "Enable Wall Check",
    Flag = "Wall Check Toggle",
    Default = false,
}

Sections.SilentAim:Dropdown{
    Name = "Silent Aim Part",
    Default = "Head",
    Content = { "Head", "HumanoidRootPart", "Random" },
    Flag = "Silent Aim Part",
}

Sections.SilentAim:Slider{
	Name = "Hit Chance Value",
    Text = "[value]",
    Default = 100,
    Min = 0,
    Max = 100,
    Float = 0.05,
    Flag = "Silent Aim Hit Chance",
}

local SilentAimVisibility = Sections.SilentFOV:Toggle{
    Name = "Enable Silent Aim FOV",
    Flag = "Silent Aim Visibility",
    Default = false,
} 
SilentAimVisibility:ColorPicker{
    Default = Color3.fromRGB(113, 93, 133), 
    Flag = "Silent Aim Color", 
}
Sections.SilentFOV:Toggle{
    Name = "FOV Filled",
    Flag = "Silent Aim Filled",
    Default = false,
}
Sections.SilentFOV:Slider{
	Name = "FOV Radius",
    Text = "[value]",
    Default = 165,
    Min = 5,
    Max = 600,
    Float = 0.5,
    Flag = "Silent Aim Radius",
}

Sections.SilentFOV:Slider{
	Name = "FOV Sides",
    Text = "[value]",
    Default = 64,
    Min = 3,
    Max = 64,
    Float = 0.5,
    Flag = "Silent Aim Sides",
}

Sections.SilentFOV:Slider{
	Name = "FOV Transparency Value",
    Text = "[value]",
    Default = 1,
    Min = 0,
    Max = 1,
    Float = 0.05,
    Flag = "Silent Aim Transparency",
}

if not syn or not protectgui then getgenv().protectgui = function() end end

local Camera = workspace.CurrentCamera
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local GetChildren = game.GetChildren
local GetPlayers = Players.GetPlayers
local WorldToScreen = Camera.WorldToScreenPoint
local WorldToViewportPoint = Camera.WorldToViewportPoint
local GetPartsObscuringTarget = Camera.GetPartsObscuringTarget
local FindFirstChild = game.FindFirstChild
local RenderStepped = RunService.RenderStepped
local GuiInset = GuiService.GetGuiInset
local GetMouseLocation = UserInputService.GetMouseLocation
local ValidTargetParts = {"Head", "HumanoidRootPart"}
local fov_circle = Drawing.new("Circle")
fov_circle.Thickness = 1
fov_circle.NumSides = getgenv().NumSides
fov_circle.Radius = getgenv().Radius
fov_circle.Filled = false
fov_circle.Visible = false
fov_circle.ZIndex = 999
fov_circle.Transparency = 1
fov_circle.Color = Color3.fromRGB(54, 57, 241)
local ExpectedArguments = {
	Raycast = { 
		ArgCountRequired = 3, 
		Args = { "Instance", "Vector3", "Vector3", "RaycastParams" } 
	} 
}
function CalculateChance(Percentage)
    Percentage = math.floor(Percentage)
    local chance = math.floor(Random.new().NextNumber(Random.new(), 0, 1) * 100) / 100
    return chance <= Percentage / 100
end
local function getPositionOnScreen(Vector)
    local Vec3, OnScreen = WorldToScreen(Camera, Vector)
    return Vector2.new(Vec3.X, Vec3.Y), OnScreen
end
local function ValidateArguments(Args, RayMethod)
    local Matches = 0
    if #Args < RayMethod.ArgCountRequired then
        return false
    end
    for Pos, Argument in next, Args do
        if typeof(Argument) == RayMethod.Args[Pos] then
            Matches = Matches + 1
        end
    end
    return Matches >= RayMethod.ArgCountRequired
end
local function getDirection(Origin, Position) return (Position - Origin).Unit * 1000 end
local function getMousePosition() return GetMouseLocation(UserInputService) end
local function IsPlayerVisible(Player)
    local PlayerCharacter = Player.Character
    local LocalPlayerCharacter = LocalPlayer.Character
    if not (PlayerCharacter or LocalPlayerCharacter) then return end 
    local PlayerRoot = FindFirstChild(PlayerCharacter, Library.flags["Silent Aim Part"]) or FindFirstChild(PlayerCharacter, "HumanoidRootPart")
    if not PlayerRoot then return end 
    local CastPoints, IgnoreList = {PlayerRoot.Position, LocalPlayerCharacter, PlayerCharacter}, {LocalPlayerCharacter, PlayerCharacter}
    local ObscuringObjects = #GetPartsObscuringTarget(Camera, CastPoints, IgnoreList)
    return ((ObscuringObjects == 0 and true) or (ObscuringObjects > 0 and false))
end
local function getClosestPlayer()
    if not Library.flags["Silent Aim Part"] then return end
    local Closest
    local DistanceToMouse
    for _, Player in next, GetPlayers(Players) do
        if Player == LocalPlayer then continue end
        local Character = Player.Character
        if not Character then continue end
        if Library.flags["Wall Check Toggle"] and not IsPlayerVisible(Player) then continue end
        local HumanoidRootPart = FindFirstChild(Character, "HumanoidRootPart")
        local Humanoid = FindFirstChild(Character, "Humanoid")
        if not HumanoidRootPart or not Humanoid or Humanoid and Humanoid.Health <= 0 then continue end
        local ScreenPosition, OnScreen = getPositionOnScreen(HumanoidRootPart.Position)
        if not OnScreen then continue end
        local Distance = (getMousePosition() - ScreenPosition).Magnitude
        if Distance <= (DistanceToMouse or Library.flags["Silent Aim Radius"] or 2000) then
            Closest = ((Library.flags["Silent Aim Part"] == "Random" and Character[ValidTargetParts[math.random(1, #ValidTargetParts)]]) or Character[Library.flags["Silent Aim Part"]])
            DistanceToMouse = Distance
        end
    end 
    return Closest
end

local oldNamecall
oldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(...)
    local Method = getnamecallmethod()
    local Arguments = {...}
    local self = Arguments[1]
    local chance = CalculateChance(Library.flags['Silent Aim Hit Chance'])
    if Library.flags['Silent Aim Toggle'] and self == workspace and not checkcaller() and chance == true then
            if ValidateArguments(Arguments, ExpectedArguments.Raycast) then
                local A_Origin = Arguments[2]
                local HitPart = getClosestPlayer()
                if HitPart then
                    Arguments[3] = getDirection(A_Origin, HitPart.Position)
                    return oldNamecall(unpack(Arguments))
                end
            end
        end
    return oldNamecall(...)
end))
coroutine.resume(coroutine.create(function()
    game:GetService("RunService").RenderStepped:Connect(function()
	if Library.flags['Walkspeed Toggle'] then
		if game:GetService("Players").LocalPlayer.Character then
			game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = Library.flags['Walkspeed Value']
		end
	end
	if Library.flags['Jumppower Toggle'] then
		if game:GetService("Players").LocalPlayer.Character then
			game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = Library.flags['Jumppower Value']
		end
	end
        fov_circle.Radius = Library.flags['Silent Aim Radius']
		fov_circle.NumSides = Library.flags['Silent Aim Sides']
        fov_circle.Visible = Library.flags['Silent Aim Visibility']
        fov_circle.Transparency = Library.flags['Silent Aim Transparency']
        fov_circle.Filled = Library.flags['Silent Aim Filled']
        fov_circle.Color = Library.flags['Silent Aim Color']
        fov_circle.Position = game:GetService("UserInputService").GetMouseLocation(game:GetService("UserInputService"))
		--[[ for _, Connection in next, getconnections(game:GetService("ScriptContext").Error) do
			Connection:Disable()
		end
		for _, Connection in next, getconnections(game:GetService("LogService").MessageOut) do
			Connection:Disable()
		end
		]]
	end)
end))
