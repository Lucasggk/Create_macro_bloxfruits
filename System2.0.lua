--[[Como usar:

EquipUseDelay("Nome do item", "Skill", Delay para proximo ataque)
exemplo: 
EquipUseDelay("Godhuman", "X", 0.45)

EquipUseHoldDelay("Nome do item", "Skill", tempo segurando, Delay para próximo ataque)
exemplo:
EquipUseHoldDelay("Godhuman", "C", 0.5, 1.7)

raca()
ativa a habilidade da raca v3

como executar?:

1). coloque o loadstring deste script no inicio de seu script
2). coloque o script dos EquipUse.. no lugar que quiser e execute

]]--

--- Funções 


function EquipUseDelay(Equipe, skill, delay)
local humanoid = Player.Character and Player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid:UnequipTools()
        task.wait(0.1)
        local tool = Player.Backpack:FindFirstChild(Equipe)
        if tool then
            humanoid:EquipTool(tool)
            local start = tick()
            repeat
                task.wait()
            until (Player.Character:FindFirstChildOfClass("Tool") and Player.Character:FindFirstChildOfClass("Tool").Name == Equipe) or tick() - start > 2
        else
            warn(Equipe .. " não encontrada no inventário.")
        end
  end

  local VirtualInput = game:GetService("VirtualInputManager")
    VirtualInput:SendKeyEvent(true, skill, false, game)
    task.wait(0.01)
    VirtualInput:SendKeyEvent(false, skill, false, game)
    task.wait(delay)
end

--- Funções 


function EquipUseHoldDelay(Equipe, skill, segurando, delay)
local humanoid = Player.Character and Player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid:UnequipTools()
        task.wait(0.1)
        local tool = Player.Backpack:FindFirstChild(Equipe)
        if tool then
            humanoid:EquipTool(tool)
            local start = tick()
            repeat
                task.wait()
            until (Player.Character:FindFirstChildOfClass("Tool") and Player.Character:FindFirstChildOfClass("Tool").Name == Equipe) or tick() - start > 2
        else
            warn(Equipe .. " não encontrada no inventário.")
        end
  end

  local VirtualInput = game:GetService("VirtualInputManager")
    VirtualInput:SendKeyEvent(true, skill, false, game)
    task.wait(segurando)
    VirtualInput:SendKeyEvent(false, skill, false, game)
    task.wait(delay)
end

--- Funções 

function raca()
 local args = {
 	"ActivateAbility"
 }
 game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommE"):FireServer(unpack(args))
end 
