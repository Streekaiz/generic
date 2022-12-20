getgenv().Key = "string"

local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/Streekaiz/generic/main/generic%20loader/resources/library.lua', true))()
local Window = OrionLib:MakeWindow({
    Name = "key_system.lua - streekaiz#1132", 
    HidePremium = true,
    IntroEnabled = true,
    IntroText = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
    IntroIcon = "rbxassetid://6022668955",
    Icon = "rbxassetid://6022668955",
})

local Main = Window:MakeTab({ Name = "", Icon = "", PremiumOnly = false })
Main:AddSection({
	Name = "Key System"
})

Main:AddTextbox({
	Name = "Key Input",
	Default = "blablablabala",
	TextDisappear = false,
	Callback = function(Value)
	getgenv().Key = Value
	end	  
})

Main:AddButton({
	Name = "Check Key",
	Callback = function() 
	   if getgenv().Key == "KEY_HERE" then 
	       else
	   end
  	end    
})

Main:AddSection({
	Name = "Discord"
})

Main:AddParagraph("Join our discord!","so umm you should join our uhh discord because of umm uhh because umm you umm uh yes")

Main:AddButton({
	Name = "Copy Discord Invite",
	Callback = function()
      	setclipboard("uummmuhhuhdjalsppfpzoz")
  	end    
})
