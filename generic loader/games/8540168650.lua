local name = game:GetService("Players").LocalPlayer.Name
getgenv().Flags = { -- i know orion already has flags
    Items = {
        Farming = false,
        WaitTime = 0.5,
        Notification_Icon = "6034457092",
        Notify = {
            All = false,
            K = false, -- ketchup
            SA = false, -- stand arrow
            CA = false, -- charged arrow
            R = false, -- rokakaka
            RA = false, -- requiem arrow
            SM = false, -- stone mask
            KM = false, -- kars mask
            DD = false, -- dio diary,
            GB = false, -- green baba
        }
    },
}


for _, v in pairs(game:GetService("Workspace").Items:GetChildren()) do
    v.Handle.Anchored = false
end



local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({
    Name = "generic script name", 
    HidePremium = false,  -- 6022668955
    SaveConfig = false,
    IntroEnabled = true,
    IntroText = "generic script name",
    IntroIcon = "rbxassetid://6022668955",
    Icon = "rbxassetid://6022668955",
    CloseCallback = function(hack)
    end
})

game:GetService("Workspace").Items.ChildAdded:Connect(function(v)
    if getgenv().Flags.Items.Farming == true then
    v.Handle.Anchored = false
    end
        if v.Name == "Stand Arrow" and getgenv().Flags.Items.Notify.SA then
            OrionLib:MakeNotification({ Name = "An item spawned!", Content = "The item: "..v.Name.." Spawned!", Image = "rbxassetid://"..getgenv().Flags.Items.Notification_Icon, Time = 5})
            elseif v.Name == "Charged Arrow" and getgenv().Flags.Items.Notify.CA then
                OrionLib:MakeNotification({ Name = "An item spawned!", Content = "The item: "..v.Name.." Spawned!", Image = "rbxassetid://"..getgenv().Flags.Items.Notification_Icon, Time = 5})
                elseif v.Name == "Rokakaka" and getgenv().Flags.Items.Notify.R then
                    OrionLib:MakeNotification({ Name = "An item spawned!", Content = "The item: "..v.Name.." Spawned!", Image = "rbxassetid://"..getgenv().Flags.Items.Notification_Icon, Time = 5})
                    elseif v.Name == "Requiem Arrow" and getgenv().Flags.Items.Notify.RA then
                        OrionLib:MakeNotification({ Name = "An item spawned!", Content = "The item: "..v.Name.." Spawned!", Image = "rbxassetid://"..getgenv().Flags.Items.Notification_Icon, Time = 5})
                        elseif getgenv().Flags.Items.Notify.All then
                            OrionLib:MakeNotification({ Name = "An item spawned!", Content = "The item: "..v.Name.." Spawned!", Image = "rbxassetid://"..getgenv().Flags.Items.Notification_Icon, Time = 5})
                        end
end)

local Tab = {
    Home = Window:MakeTab({ Name = "Home", Icon = "rbxassetid://6026568198", PremiumOnly = false }),
    Items = Window:MakeTab({ Name = "Items", Icon = "rbxassetid://6034470800", PremiumOnly = false }),
    Stands = Window:MakeTab({ Name = "Stands", Icon = "rbxassetid://6022668945", PremiumOnly = false }),
    Lairs = Window:MakeTab({ Name = "Lairs", Icon = "rbxassetid://6035190846", PremiumOnly = false }),
    Quests = Window:MakeTab({ Name = "Quests", Icon = "rbxassetid://6035190846", PremiumOnly = false }),
    Render = Window:MakeTab({ Name = "Rendering", Icon = "rbxassetid://6031075931", PremiumOnly = false }),
    Misc = Window:MakeTab({ Name = "Misc", Icon = "rbxassetid://6034509993", PremiumOnly = false }),

}

local Section = {
	Item = {
        Use = Tab.Items:AddSection({ Name = "Use Items" }),
        Farm = Tab.Items:AddSection({ Name = "Farm Items" }),
        Notify = Tab.Items:AddSection({ Name = "Notify On Spawn" }),
    },
    Info = Tab.Misc:AddSection({ Name = "Player Info" }),
}

Section.Item.Use:AddButton({
	Name = "Rokakaka",
	Callback = function()
        if game.Players.LocalPlayer.Backpack:FindFirstChild("Rokakaka") then
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild("Rokakaka"))
            game.Players.LocalPlayer.Character:WaitForChild("Rokakaka").Use:FireServer()
            else
            OrionLib:MakeNotification({ Name = "You don't have the item to use.", Content = "Unable to find the item in your inventory.", Image = "rbxassetid://"..getgenv().Flags.Items.Notification_Icon, Time = 5 })
        end
  	end    
})

Section.Item.Use:AddButton({
	Name = "Stand Arrow",
	Callback = function()
        if game.Players.LocalPlayer.Backpack:FindFirstChild("Stand Arrow") then
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild("Stand Arrow"))
            game.Players.LocalPlayer.Character:WaitForChild("Stand Arrow").Use:FireServer()
            else
            OrionLib:MakeNotification({ Name = "You don't have the item to use.", Content = "Unable to find the item in your inventory.", Image = "rbxassetid://"..getgenv().Flags.Items.Notification_Icon, Time = 5 })
        end
  	end    
})

Section.Item.Use:AddButton({
	Name = "Charged Arrow",
	Callback = function()
        if game.Players.LocalPlayer.Backpack:FindFirstChild("Charged Arrow") then
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild("Charged Arrow"))
            game.Players.LocalPlayer.Character:WaitForChild("Charged Arrow").Use:FireServer()
            else
            OrionLib:MakeNotification({ Name = "You don't have the item to use.", Content = "Unable to find the item in your inventory.", Image = "rbxassetid://"..getgenv().Flags.Items.Notification_Icon, Time = 5 })
        end
  	end    
})

Section.Item.Use:AddButton({
	Name = "Sell Ketchup [all]",
	Callback = function()
        if game.Players.LocalPlayer.Backpack:FindFirstChild("Ketchup") then
            game:GetService("ReplicatedStorage").Events.SellKetchup:FireServer("Lots")
            else
            OrionLib:MakeNotification({ Name = "You don't have the item to use.", Content = "Unable to find the item in your inventory.", Image = "rbxassetid://"..getgenv().Flags.Items.Notification_Icon, Time = 5 })
        end
  	end    
})

Section.Item.Farm:AddToggle({
	Name = "Autofarm",
	Default = false,
	Callback = function(Value)
        getgenv().Flags.Items.Farming = Value
        if Value then
            game:GetService("Players").LocalPlayer.Character.Humanoid.AutoRotate = false
            else
            game:GetService("Players").LocalPlayer.Character.Humanoid.AutoRotate = true
        end
        task.spawn(function()
            while getgenv().Flags.Items.Farming == true do
               for _, v in pairs(game:GetService("Workspace").Items:GetChildren()) do
                    task.wait(0.1)
                    game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(v.Handle.Position)
                    task.wait(getgenv().Flags.Items.WaitTime)
                end
                task.wait(0.05)
            end
        end)
	end    
})

Section.Item.Farm:AddSlider({
	Name = "Wait Time",
	Min = 0,
	Max = 1,
	Default = 0.1,
	Color = Color3.fromRGB(255,255,255),
	Increment = 0.001,
	ValueName = "%",
	Callback = function(Value)
		getgenv().Flags.Items.WaitTime = Value
	end    
})
Section.Item.Farm:AddParagraph("Warning", "The item farm gets stuck since it sometimes doesn't unanchor the handle. Ill make some future updates to combat this")

Section.Item.Notify:AddToggle({
	Name = "Notify on all items",
	Default = false,
	Callback = function(Value)
        getgenv().Flags.Items.Notify.All = Value
	end    
})

Section.Item.Notify:AddToggle({
	Name = "Notify on common items",
	Default = false,
	Callback = function(Value)
        getgenv().Flags.Items.Notify.SA = Value
        getgenv().Flags.Items.Notify.K = Value
        getgenv().Flags.Items.Notify.CA = Value
        getgenv().Flags.Items.Notify.R = Value
        getgenv().Flags.Items.Notify.SM = Value
        getgenv().Flags.Items.Notify.GB = Value
	end    
})

Section.Item.Notify:AddToggle({
	Name = "Notify on rare items",
	Default = false,
	Callback = function(Value)
        getgenv().Flags.Items.Notify.DD = Value
        getgenv().Flags.Items.Notify.RA = Value
        getgenv().Flags.Items.Notify.KM = Value
	end    
})

local isad = Section.Info:AddLabel("Stand Attack Damage: "..tonumber(game:GetService("Workspace").Living[name].Stats.AttackDmg.Value))
local ist = Section.Info:AddLabel("Stand Tier: "..game:GetService("Workspace").Living[name].Stats.StandTier.Value)



game:GetService("RunService").RenderStepped:Connect(function()
    ist:Set("Stand Tier: "..game:GetService("Workspace").Living[name].Stats.StandTier.Value)
    isad:Set("Stand Attack Damage: "..tonumber(game:GetService("Workspace").Living[name].Stats.AttackDmg.Value))

end)