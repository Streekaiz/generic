local TickExecute = tick()

local Rayfield = loadstring(
	game:HttpGet(
		'https://raw.githubusercontent.com/shlexware/Rayfield/main/source'
	)
)()

local Setting = {
	Player = {
		Variable = game:GetService("Players").LocalPlayer.Character.Humanoid,
		Toggle = {
			WS = false,
			CF = false,
			JP = false,
			G = false,
		},
		Value = {
			WS = 150,
			CF = 5,
			JP = 150,
			G = 98,
		},
		OldValues = {
			WS = game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed or 16,
			JP = game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower or 50,
			G = workspace.Gravity
		}
	},
	Players = {
		Selected = game:GetService("Players").LocalPlayer.Name
	}
}


local Window = Rayfield:CreateWindow({
	Name = "Universal | " .. game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
	LoadingTitle = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
	LoadingSubtitle = "Universal",
	ConfigurationSaving = {
		Enabled = false,
		FolderName = nil,
		FileName = "UniversalConfig"
	}
})

local Tabs = {
	[1] = Window:CreateTab("Home", 6026568198),
	[2] = Window:CreateTab("Player", 6022668945),
	[3] = Window:CreateTab("Players", 6023426915),
	[4] = Window:CreateTab("Render", 6031763426),
	[5] = Window:CreateTab("Scripts", 6034684949),
	[6] = Window:CreateTab("Misc"),
}

Tabs[1]:CreateSection("Thanks for using our script!") do
	Tabs[1]:CreateButton({
		Name = "Destroy UI",
		Callback = function()
		Rayfield:Destroy()
		end,
    })
end

Tabs[1]:CreateSection("Changelogs") do
	Tabs[1]:CreateParagraph({
		Title = "Changelogs V1.3", 
		Content = "NEW UI!"
	})
end

Tabs[1]:CreateSection("Discord") do
	Tabs[1]:CreateParagraph({
		Title = "Join our discord!", 
		Content = "Why should you join our discord? I don't know, just join."
	})
    Tabs[1]:CreateButton({
		Name = "Copy Discord Link",
		Callback = function()

		end,
    })
end



Tabs[2]:CreateSection("Toggles") do
	Tabs[2]:CreateToggle({
		Name = "Walkspeed Toggle",
		CurrentValue = false,
		Flag = "WalkspeedToggle",
		Callback = function(Value)
		    Setting.Player.Toggle.WS = Value
			if Value ~= true then
				Setting.Player.Variable.WalkSpeed = Setting.Player.OldValues.WS
			end
        end
    })
	Tabs[2]:CreateToggle({
		Name = "Use CFrame",
		CurrentValue = false,
		Flag = "CFrameToggle",
		Callback = function(Value)
		    Setting.Player.Toggle.CF = Value
        end
    })
	Tabs[2]:CreateToggle({
		Name = "Jumppower Toggle",
		CurrentValue = false,
		Flag = "JumppowerToggle",
		Callback = function(Value)
		    Setting.Player.Toggle.JP = Value
			if Value ~= true then
				Setting.Player.Variable.JumpPower = Setting.Player.OldValues.JP
			end
        end
    })
	Tabs[2]:CreateToggle({
		Name = "Gravity Toggle",
		CurrentValue = false,
		Flag = "GravityToggle",
		Callback = function(Value)
		    Setting.Player.Toggle.G = Value
			if Value ~= true then
				workspace.Gravity = Setting.Player.OldValues.G
			end
        end
    })
end

Tabs[2]:CreateSection("Sliders") do
	Tabs[2]:CreateSlider({
		Name = "Walkspeed Value",
		Range = {0, 300},
		Increment = 0.025,
		Suffix = "%",
		CurrentValue = 150,
		Flag = "WalkspeedValue",
		Callback = function(Value)
		    Setting.Player.Value.WS = Value
		end,
	})
	Tabs[2]:CreateSlider({
		Name = "CFrame Multiplier",
		Range = {0, 10},
		Increment = 0.025,
		Suffix = "%",
		CurrentValue = 5,
		Flag = "CFrameValue",
		Callback = function(Value)
		    Setting.Player.Value.CF = Value
		end,
	})
	Tabs[2]:CreateSlider({
		Name = "Jumppower Value",
		Range = {0, 300},
		Increment = 0.025,
		Suffix = "%",
		CurrentValue = 150,
		Flag = "JumppowerValue",
		Callback = function(Value)
		    Setting.Player.Value.JP = Value
		end,
	})
	Tabs[2]:CreateSlider({
		Name = "Gravity Value",
		Range = {0, 196},
		Increment = 1,
		Suffix = "%",
		CurrentValue = 196 / 2,
		Flag = "GravityValue",
		Callback = function(Value)
		    Setting.Player.Value.G = Value
		end,
	})
end

Tabs[3]:CreateSection("Select Players") do
	local SelectedPlayer = Tabs[3]:CreateLabel("Selected Player: None")
	Tabs[3]:CreateInput({
 	   Name = "Input Player Name",
 	   PlaceholderText = game:GetService("Players").LocalPlayer.DisplayName,
 	   RemoveTextAfterFocusLost = true,
 	   Callback = function(Text)
	        for _, v in next, game:GetService("Players"):GetPlayers() do
				if v.Name ~= Text then
					warn("bruh")
				elseif v.Name:match(Text) then
					SelectedPlayer:Set("Selected Player: " .. Text)
					Setting.Players.Selected = Text
				end
	        end
 	   end,
    })
end

Tabs[3]:CreateSection("Actions") do
	Tabs[3]:CreateButton({
        Name = "Teleport to Player",
        Callback = function()
		    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Players")[Setting.Players.Selected].Character.HumanoidRootPart.Position)
        end,
    })
	Tabs[3]:CreateToggle({
		Name = "View Player",
		CurrentValue = false,
		Flag = "ViewPlayerToggle",
		Callback = function(Value)
		    if Value then
				workspace.CurrentCamera.CameraSubject = game:GetService("Players")[Setting.Players.Selected].Character
			else
				workspace.CurrentCamera.CameraSubject = game:GetService("Players").LocalPlayer.Character
			end
        end
    })
end

Tabs[6]:CreateSection("Player & Server Profile"); local WSLabel = Tabs[6]:CreateLabel("Walkspeed: "); local JPLabel = Tabs[6]:CreateLabel("Jumppower: "); local GLabel = Tabs[6]:CreateLabel("Gravity: "); local ServerUptime = Tabs[6]:CreateLabel("Server Uptime: "); 

game:GetService("RunService").RenderStepped:Connect(function()
    WSLabel:Set("Walkspeed: " .. math.round(game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed))
	JPLabel:Set("Jumppower: " .. math.round(game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower))
    GLabel:Set("Gravity: " .. workspace.Gravity)
	ServerUptime:Set("Server Uptime: " .. math.floor( elapsedTime() ) .. " Seconds, " .. math.floor( elapsedTime() / 60) .. " Minutes")
	if Setting.Player.Toggle.WS then
		cloneref(game:GetService("Players").LocalPlayer.Character.Humanoid).WalkSpeed = Setting.Player.Value.WS
	end
	if Setting.Player.Toggle.JP then
		cloneref(game:GetService("Players").LocalPlayer.Character.Humanoid).JumpPower = Setting.Player.Value.JP
	end
	if Setting.Player.Toggle.G then
		cloneref(workspace).Gravity = Setting.Player.Value.G
	end
	if Setting.Player.Toggle.CF then
		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame + game:GetService("Players").LocalPlayer.Character.Humanoid.MoveDirection * Setting.Player.Value.CF
	end
end)
