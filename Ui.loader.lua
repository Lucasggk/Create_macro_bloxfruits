local getgenv().uiname = ""
local name = getgenv().uiname

for _, gui in pairs(game.CoreGui:GetChildren()) do
    if gui:IsA("ScreenGui") and gui:FindFirstChildOfClass("TextButton") and gui:FindFirstChildWhichIsA("TextButton").Text == name then
        gui:Destroy()
    end
end

local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local Button = Instance.new("TextButton", ScreenGui)

Button.Size = UDim2.new(0, 120, 0, 40)
Button.Position = UDim2.new(0.5, -60, 0.8, 0)
Button.Text = name
Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.Font = Enum.Font.SourceSansBold
Button.TextSize = 20
Button.BorderSizePixel = 0
Button.BackgroundTransparency = 0.2
Button.Active = true
Button.Draggable = true

Button.MouseButton1Click:Connect(function()
    
end)
