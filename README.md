![Lucas Script](logo.png)
![Visualizações](https://komarev.com/ghpvc/?username=Lucasggk&label=VISITAS&color=green&style=plastic)
# Portal Combo - BloxFruits

## How to Use: *use with support aimbot (redzhub)*

Ensure the following equipment and mastery levels:

- **Gravity Blade**: 250+ Mastery  
- **Godhuman**: 350+ Mastery  
- **Portal**: 300+ Mastery  
- **Ghoul V3 or v4**
- **Use points in:** Sword
  
---

## Script - Portal Combo (perfect)

```lua
getgenv().atpl = true --[[
If this is true, the aimlock used in some combos will only target players.
If false, it will target both players and NPCs (THIS COMBO DOES NOT USE, LEAVE TRUE).
]]

loadstring(game:HttpGet("https://github.com/Lucasggk/Create_macro_bloxfruits/raw/main/Portal.Loader.lua", true))()
```
---

# Ice Combo - BloxFruits

## How to Use: *use with support aimbot (redzhub)*

Ensure the following equipment and mastery levels:

- **Rengoku:** 350 Mastery
- **Godhuman:** 350 Mastery
- **Ice:** 150 Mastery **Skill "V" awk**
- **does not use race skills**
- **Use points in:** Sword

---

## Script - Ice Combo (You can escape but it's good if you catch it in the Combo)

```lua
getgenv().atpl = true --[[
If this is true, the aimlock used in some combos will only target players.
If false, it will target both players and NPCs (THIS COMBO DOES NOT USE, LEAVE TRUE).
]]

loadstring(game:HttpGet("https://github.com/Lucasggk/Create_macro_bloxfruits/raw/main/Ice.Loader.lua", true))()
```
---

# Create your combo script

## how to use:

### functions:
---
- **EquipUseHoldDelay("name of the item to equip", "skill to use", time holding the attack, time for next function**

exemple: **EquipUseHoldDelay("Godhuman", "C", 0.5, 1.7)**

explanation: he equips the item, uses the attack, holds the attack for a while, waits that long to switch to another function  
---
- **EquipUseDelay("Item name to equip", "Skill to use", time for next function)**

exemple: **EquipUseDelay("Ice-Ice", "V", 2.2)**

explanation: equip the item, use the attack, wait for the next function
---
- **UseSkillDelay("Skill to use", time for next function)**

exemple: **UseSkillDelay("Z", 1.3)**

explanation: Use the Skill, time for next function
---
- **EquipItem("Item name")**

exemple: **EquipItem("Portal-Portal")**

explanation: Equipe item
---
- **UseSkillPressDelay("skill to use ", time holding the attack, time for next function)**

exemple: **UseSkillPressDelay("C", 0.5, 1.7)**

explanation: holds the selected Skill for the selected time, time for next function  
---
## how to config:

- put your ui name in:
**getgenv().uiname = "your ui name"**

- put your combo in the script part:
 
**Button.MouseButton1Click:Connect(function()**

**--your combo script**

**end)**
