local Fluent = loadstring(Game:HttpGet("https://raw.githubusercontent.com/discoart/FluentPlus/refs/heads/main/release.lua", true))() 

local Window = Fluent:CreateWindow({
    Title = "Macro blox fruits",
    SubTitle = "Feito por Lucas",
    TabWidth = 160,
    Size = UDim2.fromOffset(540, 400),
    Acrylic = false,
    Theme = "Dark",
    Center = true,
    IsDraggable = true
})



local selectedWeapons = {}

local weaponDropdown = main:AddDropdown("WeaponOrder", {
    Title = "Select Weapon Order",
    Values = {"Gun", "Sword", "Fighting Style", "Fruit"},
    Multi = true,
    Default = nil
})

weaponDropdown:OnChanged(function(value)
    selectedWeapons = value
    print("Weapon order changed to:", table.concat(value, " > "))
end)
