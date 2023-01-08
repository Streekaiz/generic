
local Settings = {
	AutoActive = {
		[1] = false,
		Wait1 = 0,
		[2] = false,
		Wait2 = 0,
		[3] = false,
		Wait3 = 0
	},
	BM = {
		Notify = false
	}
}
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

Rayfield:Notify({
    Title = "Welcome " .. game:GetService("Players").LocalPlayer.Name .. ".",
    Content = "Join our discord, not required but you'll benefit from many things.",
    Duration = 5,
    Image = 9838874163,
    Actions = {
        Ignore = {
            Name = "shut the fuck up bruh",
            Callback = function()
            end
    	},
		YEEEEEEEESSSSSSss = {
			Name = "Copy Discord Link",
			Callback = function()
		        if setclipboard then
					setclipboard("https://discord.gg/Kc5KPJ4Hqc")
				else
					toclipboard("https://discord.gg/Kc5KPJ4Hqc")
				end
			end
		}
    },
})

Rayfield:Notify({
    Title = "Debug Info",
    Content = "Use this notification to help me fix issues. Thanks!\n[Version 1.1] [" .. identifyexecutor() .. "] [" .. math.round(tonumber(string.split(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(), ' ')[1])) .."] [" .. string.format( "%02dd:%02dh:%02dm:%02ds", math.floor( elapsedTime() / 86400 % 24 ),  math.floor( elapsedTime() / 3600 % 60 ), math.floor( elapsedTime() / 60 % 60 ), math.floor( elapsedTime() % 60 ) ) .. "]",
    Duration = 15,
    Image = 9838874163,
    Actions = {},
})

local Window = Rayfield:CreateWindow({
   Name = "Critical Legends V1.1 | streekaiz#1132",
   LoadingTitle = "Critical Legends",
   LoadingSubtitle = "created by streekaiz#1132",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "#"
   },
})
local Tab = { 
	Combat = Window:CreateTab("Combat"),
	Player = Window:CreateTab("Player"),
	Teleport = Window:CreateTab("Teleports"),
	Material = Window:CreateTab("Materials"),
	BM = Window:CreateTab("Black Market"),
	Chests = Window:CreateTab("Chests"),
	Actives = Window:CreateTab("Actives"),
	Settings = Window:CreateTab("Settings", 6034509993),
}

Tab.Settings:CreateSection("Theme") do
	Tab.Settings:CreateDropdown({
        Name = "Themes",
        Options = {"Default","Light"},
        CurrentOption = "Default",
        Flag = "SelectedTheme",
        Callback = function(Option)
		    ChangeTheme(Option)
        end,
    })
end

Tab.Teleport:CreateSection("Spawn Point Teleports") do
	Tab.Teleport:CreateDropdown({
        Name = "Spawn Points",
        Options = {"One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen"},
        CurrentOption = "One",
        Flag = "SelectedTeleport",
        Callback = function(Option)
		    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(workspace.Spawns[Option].Position)
        end,
    })
end

Tab.Teleport:CreateSection("Statues Teleports") do
	Tab.Teleport:CreateDropdown({
        Name = "Statues",
        Options = {"Archer", "Boxer", "Elementalist", "Gunner", "Healer", "Knight", "Reaper", "Samurai", "Skypian", "SpellBook", "Valkyrie", "Warrior", "Virtue", "Wizard"},
        CurrentOption = "Archer",
        Flag = "SelectedStatueTeleport",
        Callback = function(Option)
		    for _, v in next, game:GetService("Workspace").Statues:GetChildren() do
				if v.Name == "StatueOf" .. Option then
					game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v:FindFirstChildWhichIsA("BasePart").Position)
				end
			end
        end,
    })
end

Tab.Teleport:CreateSection("Arsenal Teleports") do
	Tab.Teleport:CreateDropdown({
        Name = "Arsenals",
        Options = {"Abysse of Enis", "Blubbs Kingdom", "Element Door", "Ensis Pond", "Evergreen", "Heart Area", "Heat Lovers Seaside", "Highland", "Initus Bay", "Punky Sky", "Samurai Island", "Sky Islands", "Trading Sky"},
        CurrentOption = "Abysse of Enis",
        Flag = "SelectedArsenalTeleport",
        Callback = function(Option)
		    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(workspace.Arsenals[Option]:FindFirstChildWhichIsA("BasePart").Position)
        end,
    })
end

Tab.Teleport:CreateSection("Campfire Teleports") do
	Tab.Teleport:CreateDropdown({
        Name = "Campfires",
        Options = {"Basic Campfire", "Large Campfire"},
        CurrentOption = "Basic Campfire",
        Flag = "SelectedCampfireTeleport",
        Callback = function(Option)
		    if Option == "Basic Campfire" then
				game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Workspace").Campfires:GetChildren()[11]['Log Seat']:FindFirstChildWhichIsA("BasePart").Position)
			elseif Option == "Large Campfire" then
				game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Workspace").Campfires:GetChildren()[18]['Log Seat']:FindFirstChildWhichIsA("BasePart").Position)
			end
        end,
    })
end

Tab.Teleport:CreateSection("Storage Chests Teleports") do
	Tab.Teleport:CreateButton({
        Name = "Teleport to a storage chest",
        Callback = function()
		    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Workspace").Storage:GetChildren()[3]:FindFirstChildWhichIsA("BasePart").Position)
        end,
    })
end


Tab.Material:CreateSection("Material") do
	Tab.Material:CreateDropdown({
        Name = "[ Experimental ] Selected Material",
        Options = {"Fruit of the Sky", "Healthy Apple", "Mana Weed", "Protection Orange", "Rocky Fruit", "Sky Cherry"},
        CurrentOption = "Fruit of the Sky",
        Flag = "SelectedItem",
        Callback = function(Option)
			for _, v in next, game:GetService("Workspace").MaterialGivers[Option]:GetChildren() do
				firetouchinterest(v.Giver:FindFirstChildWhichIsA("TouchTransmitter"), game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, 1)
				warn("Collected " .. v.Name)
			end
        end,
    })
end

Tab.Chests:CreateSection("Warning") do
	Tab.Chests:CreateParagraph({
		Title = "Warning!",
		Content = "This may be patched and permanently ban you in the future, be safe!"
	})
end

Tab.Chests:CreateSection("Chests") do
	Tab.Chests:CreateButton({
        Name = "Collect All Items",
        Callback = function()
		    for _, v in next, workspace.Chests:GetChildren() do
				if not v:IsA("Script") then
				    firetouchinterest(v.Giver:FindFirstChildWhichIsA("TouchTransmitter"), game:GetService("Players").LocalPlayer.Character.Torso, 1)
				end
			end
        end,
    })
end
Tab.Chests:CreateSection("List of items you can get from a chest") do
	for i, v in next, game:GetService("Workspace").Chests:GetChildren() do
		Tab.Chests:CreateLabel(i .. " " .. v.Name)
	end
end
Tab.Actives:CreateSection("Autouse Actives") do
	Tab.Actives:CreateSection(" Active 1") do
		Tab.Actives:CreateToggle({
            Name = "Autouse Active 1",
            CurrentValue = false,
            Flag = "Active1",
            Callback = function(Value)
			    Settings.AutoActive[1] = Value
            end,
        })
		Tab.Actives:CreateSlider({
 		    Name = "Active 1 Delay",
  		    Range = {0, 60},
  		    Increment = 1,
 		    Suffix = "%",
  		    CurrentValue = 5,
 		    Flag = "Active1Delay",
 		    Callback = function(Value)
			    Settings.AutoActive.Wait1 = Value
 		    end,
		})
	end
	Tab.Actives:CreateSection(" Active 2") do
		Tab.Actives:CreateToggle({
            Name = "Autouse Active 2",
            CurrentValue = false,
            Flag = "Active2",
            Callback = function(Value)
			    Settings.AutoActive[2] = Value
            end,
        })
		Tab.Actives:CreateSlider({
 		    Name = "Active 2 Delay",
  		    Range = {0, 60},
  		    Increment = 1,
 		    Suffix = "%",
  		    CurrentValue = 5,
 		    Flag = "Active2Delay",
 		    Callback = function(Value)
			    Settings.AutoActive.Wait2 = Value
 		    end,
		})
	end
	Tab.Actives:CreateSection(" Active 3") do
		Tab.Actives:CreateToggle({
            Name = "Autouse Active 3",
            CurrentValue = false,
            Flag = "Active3",
            Callback = function(Value)
			    Settings.AutoActive[3] = Value
            end,
        })
		Tab.Actives:CreateSlider({
 		    Name = "Active 3 Delay",
  		    Range = {0, 60},
  		    Increment = 1,
 		    Suffix = "%",
  		    CurrentValue = 5,
 		    Flag = "Active3Delay",
 		    Callback = function(Value)
			    Settings.AutoActive.Wait3 = Value
 		    end,
		})
	end
end
Tab.BM:CreateSection("Status")
local BMStatus = Tab.BM:CreateLabel("The black market has: if you see this report bug pls thx")

Tab.BM:CreateSection("Notifications") do
	Tab.BM:CreateToggle({
        Name = "Notify on black market spawning",
        CurrentValue = false,
        Flag = "NotifyBM",
        Callback = function(Value)
        end,
    })
	Tab.BM:CreateParagraph({
		Title = "Info",
		Content = "The notifications will have options to teleport, so you wont have to open the UI to teleport. We plan to display BM's content in notifications."
	})
end

Tab.BM:CreateSection("Teleport") do
	Tab.Chests:CreateButton({
        Name = "Teleport to BM",
        Callback = function()
		    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(workspace.Stalls:FindFirstChildWhichIsA("BasePart").Position)
        end,
    })
end

task.spawn(function()
    while true do
		if Settings.AutoActive[1] then
            game:GetService("ReplicatedStorage").Server:FireServer("UseItem", 1)
		end
		task.wait(Settings.AutoActive.Wait1)
	end
	while true do
		if Settings.AutoActive[2] then
			game:GetService("ReplicatedStorage").Server:FireServer("UseItem", 2)
		end
		task.wait(Settings.AutoActive.Wait2)
	end
	while true do
		if Settings.AutoActive[3] then
			game:GetService("ReplicatedStorage").Server:FireServer("UseItem", 3)
		end
		task.wait(Settings.AutoActive.Wait3)
	end
end)
