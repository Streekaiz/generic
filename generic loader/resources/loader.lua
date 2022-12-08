local Games = {
    8540168650,  -- Stand Upright
}

for _, v in pairs(Games) do
    if game.PlaceId ~= v then
        warn("dummy")
        else
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Streekaiz/generic/main/generic%20loader/games/"..game.PlaceId..".lua", true))()
    end
end
