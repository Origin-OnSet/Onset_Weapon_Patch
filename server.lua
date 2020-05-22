WeaponPlayer = {}

AddEvent("OnPlayerJoin", function(player)
    WeaponPlayer[player] = {}
    
    for i = 1, 3 do
        WeaponPlayer[player][i] = {}
    end
end)

AddEvent("OnPlayerQuit", function(player)
    WeaponPlayer[player] = nil
end)


function SetWeapon(player, model, ammo, equip, slot, bLoaded)
    if player == nil or model == nil then print("[ERROR] Use this syntax SetWeapon(player, model, ammo, equip, slot, bLoaded)") return end
    if slot == nil or slot > 4 or slot < 1 then slot = 1 end
    if ammo == nil or ammo < 0 then ammo = 1 end
    if equip == nil then equip = false end
    if bLoaded == nil then bLoaded = false end

    getReponse = SetPlayerWeapon(player, model, ammo, equip, slot, bLoaded)
    
    if getReponse then
        UpdateWeaponPlayerList(player, model, ammo, equip, slot, bLoaded)
        CallRemoteEvent(player, "weapon:SetCheck", true)
    else
        print("[ERROR] SetWeapon invalid argument(s)")
       return 
    end
    
end
AddFunctionExport("SetWeapon", SetWeapon)

function VerifWeapon(player, weapon)
    local ValideWeapon = 0

    for i = 1, 3 do
        if GetPlayerWeapon(player, i) == weapon[i] then
            ValideWeapon = ValideWeapon + 1
        else
            ReTrySetPlayerWeapon(player, i)
        end
    end

    if ValideWeapon == 3 then
        CallRemoteEvent(player, "weapon:SetCheck", false)
    end
end
AddRemoteEvent("weapon:VerifWeapon", VerifWeapon)

function ReTrySetPlayerWeapon(player, slot)
    SetPlayerWeapon(player, WeaponPlayer[player][slot].model, WeaponPlayer[player][slot].ammo, WeaponPlayer[player][slot].equip, WeaponPlayer[player][slot].slot, WeaponPlayer[player][slot].bLoaded) 
end

function UpdateWeaponPlayerList(player, model, ammo, equip, slot, bLoaded)
    WeaponPlayer[player][slot].model = model
    WeaponPlayer[player][slot].ammo = ammo
    WeaponPlayer[player][slot].equip = equip
    WeaponPlayer[player][slot].slot = slot
    WeaponPlayer[player][slot].bLoaded = bLoaded
end
