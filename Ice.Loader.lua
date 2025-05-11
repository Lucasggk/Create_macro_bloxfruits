local Aimc = getgenv().atpl -- true = apenas player, false = player e npc

for _, gui in pairs(game.CoreGui:GetChildren()) do
    if gui:IsA("ScreenGui") and gui:FindFirstChildOfClass("TextButton") and gui:FindFirstChildWhichIsA("TextButton").Text == "Combo PvP" then
        gui:Destroy()
    end
end

-- Serviços
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

-- Referências
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- Configurações
local searchRadius = 750
local cameraOffset = Vector3.new(0, 5, -8)

-- Controle do loop
local camLockConnection

-- Função para encontrar o alvo mais próximo
local function getNearestTarget()
	local character = LocalPlayer.Character
	if not character or not character:FindFirstChild("HumanoidRootPart") then return nil end
	local root = character.HumanoidRootPart.Position
	local closestTarget = nil
	local shortestDistance = math.huge

	for _, v in pairs(workspace:GetDescendants()) do
		if v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v ~= character then
			if Aimc and not Players:GetPlayerFromCharacter(v) then
				continue
			end
			local dist = (v.HumanoidRootPart.Position - root).Magnitude
			if dist < shortestDistance and dist <= searchRadius and v.Humanoid.Health > 0 then
				shortestDistance = dist
				closestTarget = v
			end
		end
	end

	return closestTarget
end

-- Inicia o camera lock
function Start()
	if camLockConnection then return end -- já ativo
	camLockConnection = RunService.RenderStepped:Connect(function()
		local target = getNearestTarget()
		local character = LocalPlayer.Character
		if target and character and character:FindFirstChild("HumanoidRootPart") then
			local originPos = character.HumanoidRootPart.Position + cameraOffset
			local targetPos = target.HumanoidRootPart.Position
			Camera.CFrame = CFrame.new(originPos, targetPos)
		end
	end)
end

-- Para o camera lock
function Stop()
	if camLockConnection then
		camLockConnection:Disconnect()
		camLockConnection = nil
	end
end

-- Cria a GUI
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local Button = Instance.new("TextButton", ScreenGui)

Button.Size = UDim2.new(0, 120, 0, 40)
Button.Position = UDim2.new(0.5, -60, 0.8, 0)
Button.Text = "Combo PvP"
Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.Font = Enum.Font.SourceSansBold
Button.TextSize = 20
Button.BorderSizePixel = 0
Button.BackgroundTransparency = 0.2
Button.Active = true
Button.Draggable = true

local Player = game:GetService("Players").LocalPlayer

-- Desequipa e equipa a ferramenta
local function EquipeItem(nome)
    local humanoid = Player.Character and Player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid:UnequipTools()
        task.wait(0.1)
        local tool = Player.Backpack:FindFirstChild(nome)
        if tool then
            humanoid:EquipTool(tool)
            local start = tick()
            repeat
                task.wait()
            until (Player.Character:FindFirstChildOfClass("Tool") and Player.Character:FindFirstChildOfClass("Tool").Name == nome) or tick() - start > 2
        else
            warn(nome .. " não encontrada no inventário.")
        end
    end
end

-- Função para usar skills
local function UseSkill(skill)
    local VirtualInput = game:GetService("VirtualInputManager")
    VirtualInput:SendKeyEvent(true, skill, false, game)
    task.wait(0.02)
    VirtualInput:SendKeyEvent(false, skill, false, game)
end

-- Função para segurar uma tecla por tempo
local function UseSkillPress(skill, tempo)
    local VirtualInput = game:GetService("VirtualInputManager")
    VirtualInput:SendKeyEvent(true, skill, false, game)
    task.wait(tempo)
    VirtualInput:SendKeyEvent(false, skill, false, game)
end
            
  function raca()    
     local args = {
	"ActivateAbility"
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommE"):FireServer(unpack(args))
 end                 
                        
-- Ao clicar no botão, executa o combo
Button.MouseButton1Click:Connect(function()      	   
EquipeItem("Ice-Ice")  
UseSkill("V")    
task.wait(2.32)               
EquipeItem("Rengoku")
UseSkill("Z")           
task.wait(1.6)       
UseSkill("X")           
task.wait(0.3)          
EquipeItem("Godhuman")                            
UseSkillPress("C", 0.5)        
task.wait(1.7)                                             
UseSkill("X")                                                                                                                                                                                                                                                     
end)
