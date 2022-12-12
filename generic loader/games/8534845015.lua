repeat task.wait() until game:IsLoaded()

local function Tween(input, studspersecond, offset)
   local char = game:GetService("Players").LocalPlayer.Character;
   local input = input or error("input is nil");
   local studspersecond = studspersecond or 1000;
   local offset = offset or CFrame.new(0,0,0);
   local vec3, cframe;

   if typeof(input) == "table" then
       vec3 = Vector3.new(unpack(input)); cframe = CFrame.new(unpack(input));
   elseif typeof(input) ~= "Instance" then
       return error("wrong format used");
   end;
   
   Time = (char.HumanoidRootPart.Position - (vec3 or input.Position)).magnitude/studspersecond;
   local twn = game.TweenService:Create(char.HumanoidRootPart, TweenInfo.new(Time,Enum.EasingStyle.Linear), {CFrame = (cframe or input.CFrame) * offset});
   twn:Play();
   twn.Completed:Wait();
end;



local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/Library.lua'))()
local ThemeManager = loadstring(game:HttpGet('https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet('https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/addons/SaveManager.lua'))()

local Window = Library:CreateWindow({
    Title = 'Sakura Stand GUI',
    Center = true, 
    AutoShow = true,
})

local Tabs = {
	Items = Window:AddTab('Items'),
	Misc = Window:AddTab('Misc'),  
}

local GroupBox = {
	Items = {
		Autofarm = Tabs.Items:AddLeftGroupbox('Autofarm Items'),
		Notify = Tabs.Items:AddRightGroupbox('Item Notify'),
		Render = Tabs.Items:AddRightGroupbox('Item ESP'),
	},
}

GroupBox.Items.Autofarm:AddToggle('ItemAutoFarm', {
    Text = 'Item Autofarm',
    Default = false,
    Tooltip = 'quite buggy because they spawn fake boxes in death areas', 
}):OnChanged(function(Value)
    if Value then
		for _, v in pairs(game:GetService("Workspace").Item:GetChildren()) do
			if v.Name == "Box" and v:FindFirstChild("Box") then
				Tween(v.Box, Options.ItemAutofarmSpeed.Value, CFrame.new(0, -5, 0))
				fireclickdetector(v.ClickDetector, 1)
				task.wait(0.5)
			end
		end
	end
end)

GroupBox.Items.Autofarm:AddSlider('ItemAutofarmSpeed', {
    Text = 'Studs Per Second',
    Default = 75,
    Min = 5,
    Max = 300,
    Rounding = 3,

    Compact = true,
	Tooltip = "really important that you set it under 25-30 to not get flagged as cheating"
})

GroupBox.Items.Autofarm:AddToggle('ItemFarmMochi', {
    Text = 'Add Mochi Mochi Devil Fruit',
    Default = false
})

game.workspace.Item.ChildAdded:Connect(function(v)
    if Toggles.ItemAutoFarm.Value then
        if v.Name == "Box" and v:FindFirstChild("Box") then
    		Tween(v.Box, Options.ItemAutofarmSpeed.Value, CFrame.new(0, -5, 0))
	    	task.wait(0.5)
    	end
	end
end)
