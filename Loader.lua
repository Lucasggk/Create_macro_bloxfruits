-- Serviços
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

-- Referências
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- Configurações
local searchRadius = 100
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
function StartCamLock()
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
function StopCamLock()
	if camLockConnection then
		camLockConnection:Disconnect()
		camLockConnection = nil
	end
