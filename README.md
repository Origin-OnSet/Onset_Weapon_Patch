# Onset_Weapon_Patch
This package is a correction of the SetPlayerWeapon() function, it’s allow you to add weapon to a player when he jump or run, simple.

## How to install
- Add the "Onset_Weapon_Patch" folder to your server packages 

- Edit your server_config.json and add "Onset_Weapon_Patch" in the packages section before the files who need it

```json
"packages": [
	"Onset_Weapon_Patch"
],
```
- On the files who needs to add weapons to player, initialize the Onset_Weapon_Pacth using this function  
```lua
local Weapon = ImportPackage("OnsetWeaponPatch")
```
After that you should be able to use the built-in functions

## Function
```lua
SetWeapon(player, weapon_model, ammo, equip, weapon_slot , bLoaded)
```

## Exemple
[ Simple command who randomly change the player weapon every 5 seconds ]
```lua
local Weapon = ImportPackage("OnsetWeaponPatch") -- Import to your Server Script OnsetWeaponPatch

AddCommand("w", function(player)
    CreateTimer(function()
        Weapon.SetWeapon(player, math.random(2,21), 200, true, 1, true) -- Use this function to set player weapon
    end, 5000)
end)
```

## Discord
Join Origin [Discord](https://discord.gg/MDEwtKr) server now !

## License
This project is licensed under the [MIT](https://choosealicense.com/licenses/mit/) License
