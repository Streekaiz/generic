local Games = {
    8540168650,  --- Stand Upright
    8534845015,  --- Sakura Stand
    8204899140,  --- Football Fusion 2
    8619263259   --- Critical Legends
}

for _, v in pairs(Games) do
    if game.PlaceId ~= v then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Streekaiz/generic/main/generic%20loader/games/Universal.lua", true))()
        else
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Streekaiz/generic/main/generic%20loader/games/"..game.PlaceId..".lua", true))()
    end
end
