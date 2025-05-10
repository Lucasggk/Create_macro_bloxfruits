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

-- // variáveis // -- 

local selectedWeapons = {}

-- // Tabs // -- 

local main = Window:AddTab({  Title = "macro settings", Icon = "settings"  })

-- // scripts // -- 

local weaponDropdown = main:AddDropdown("WeaponOrder", {
    Title = "selecionar ordem de armas: ",
    Values = {"Gun", "Sword", "Fighting Style", "Fruit"},
    Multi = true,
    Default = nil
})

weaponDropdown:OnChanged(function(value)
    selectedWeapons = value
    print("Ordem dos atacks :", table.concat(value, " > "))
end)
