--[[Como usar:

EquipUseDelay("Nome do item", "Skill", Delay para proximo ataque)
exemplo: 
EquipUseDelay("Godhuman", "X", 0.45)

EquipUseHoldDelay("Nome do item", "Skill", tempo segurando, Delay para próximo ataque)
exemplo:
EquipUseHoldDelay("Godhuman", "C", 0.5, 1.7)

EquipItem("nome do item")
exemplo:
EquipItem("Godhuman")

UseSkillDelay("Skill", Delay para próximo ataque)
exemplo:
UseSkill("X", 0.4)

UseSkillPressDelay("Skill", tempo segurando o ataque, Delay para próximo ataque
exemplo:
UseSkillPressDelay("C", 0.5, 1.7)

raca()
ativa a habilidade da raca v3

EqSword("Dual Cursed Katana")
EqGun("Skull Guitar")
Eqstyle("Godhuman") 

como executar?:

1). coloque o loadstring deste script no inicio de seu script
2). coloque o script dos EquipUse.. no lugar que quiser e execute

]]--

--- Functions ---

--- Funções 

local Player = game:GetService("Players").LocalPlayer

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
            task.wait(0.04)
        else
            warn(Equipe .. " não encontrada no inventário.")
        end
    end

    local VirtualInput = game:GetService("VirtualInputManager")
    VirtualInput:SendKeyEvent(true, skill, false, game)
    task.wait(0.04)
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
            task.wait(0.04)
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

--- Funções 

function EquipItem(Equipe)
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
            task.wait(0.04)
        else
            warn(Equipe .. " não encontrada no inventário.")
        end
    end
end

--- Funções 

function UseSkillDelay(skill, Delay)
    local VirtualInput = game:GetService("VirtualInputManager")
    VirtualInput:SendKeyEvent(true, skill, false, game)
    task.wait(0.04)
    VirtualInput:SendKeyEvent(false, skill, false, game)
    task.wait(Delay)
end

--- Funções 

function UseSkillPressDelay(skill, tempo, delay)
    local VirtualInput = game:GetService("VirtualInputManager")
    VirtualInput:SendKeyEvent(true, skill, false, game)
    task.wait(tempo)
    VirtualInput:SendKeyEvent(false, skill, false, game)
    task.wait(delay)
end

function EqSword(name)
    local args = {
	"LoadItem",
	name
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
end

function EqGun(name)
    local args = {
	"LoadItem",
	name
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
end

function EqStyle(name)
local args = {
	name
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
end 
