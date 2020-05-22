isCheck = false
Timer = nil
Weapon = {}

function SetCheck(value_bool)
    isCheck = value_bool
    if value_bool and Timer == nil then
        Timer = CreateTimer(function()
            Weapon = {}
            for i = 1, 3 do
                Weapon[i] = GetPlayerWeapon(i)
            end
            CallRemoteEvent("weapon:VerifWeapon", Weapon)
        end, 500)
    else
        DestroyTimer(Timer)
        Timer = nil
    end
end

AddRemoteEvent("weapon:SetCheck", SetCheck)
