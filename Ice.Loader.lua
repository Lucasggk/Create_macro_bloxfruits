
loadstring(game:HttpGet("https://raw.githubusercontent.com/Lucasggk/Create_macro_bloxfruits/main/System2.0.lua"))()

local uiname = "Best Ice combo"

for _, gui in pairs(game.CoreGui:GetChildren()) do
    if gui:IsA("ScreenGui") and gui:FindFirstChildOfClass("TextButton") and gui:FindFirstChildWhichIsA("TextButton").Text == uiname then
        gui:Destroy()
    end
end

local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local Button = Instance.new("TextButton", ScreenGui)

Button.Size = UDim2.new(0, 150, 0, 40)
Button.Position = UDim2.new(0.5, -60, 0.8, 0)
Button.Text = uiname
Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.Font = Enum.Font.SourceSansBold
Button.TextSize = 20
Button.BorderSizePixel = 0
Button.BackgroundTransparency = 0.2
Button.Active = true
Button.Draggable = true

Button.MouseButton1Click:Connect(function()
EquipUseDelay("Ice-Ice",  "V", "2.25")                      
EquipUseDelay("Gravity Blade", "X", 1.9)                          
UseSkillDelay("Z", 1)                          
EquipUseDelay("Godhuman", "Z", 1.7)
UseSkillDelay("X", 0.4)                 
EquipUseHoldDelay("Godhuman",  "C", 0.3, 1.9)
end)
