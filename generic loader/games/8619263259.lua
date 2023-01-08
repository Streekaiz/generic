_G.Debug = true
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
   Name = "Critical Legends | streekaiz#1132",
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
	Chests = Window:CreateTab("Chests"),
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
