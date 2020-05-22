# Onset_Weapon_Patch
This package is a correction of function SetPlayerWeapon(), it’s allow to add weapon to a player when he jump or run, simple.

## Require
- Nothing Package

## How to install
- Add to your package folder the "Onset_Weapon_Patch" folder

- Edit your server_config.json and add "OnsetWeaponPatch" on your Packages at the very top of the list

```json
"packages": [
	"OnsetWeaponPatch"
],
```
- Add to your Server script "local Weapon = ImportPackage("OnsetWeaponPatch")" for import Onset Weapon Patch function

## Function
```lua
SetWeapon(player, weapon_model, ammo, equip, weapon_slot , bLoaded)
```

## Exemple
[ Simple command who change randomly Weapon of player every 5 seconde ]
```lua
local Weapon = ImportPackage("OnsetWeaponPatch") -- Import to your Server Script OnsetWeaponPatch

AddCommand("w", function(player)
    CreateTimer(function()
        Weapon.SetWeapon(player, math.random(2,21), 200, true, 1, true) -- Use this function to set player weapon now
    end, 5000)
end)
```
## Discord
Join Origin [Discord](https://discord.gg/MDEwtKr) server now !

## License
This project is licensed under the [MIT](https://choosealicense.com/licenses/mit/) License
