
getgenv().AimbotSettings = {
    Aimbot = {
        TargetPart = "Head",
        VisibleCheck = true,
        Use_mousemoverel = true,
        TeamCheck = true, -- Press ] to toggle
        Keybind = Enum.UserInputType.MouseButton2, -- Must be a UserInputType or KeyCode
        AimType = "Hold", -- "Hold" or "Toggle"
        AlwaysActive = false,
    },
    FovCircle = {
        Enabled = true,
        Dynamic = true,
        Radius = 100,
        Transparency = 1,
        Color = Color3.fromRGB(255,255,255),
        NumSides = 64,
    },
    Whitelisted = {}, -- Username or User ID
    Ignore = nil -- Raycast Ignore
} -- v1.1.0
loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/UniversalAimbot.lua"))()
