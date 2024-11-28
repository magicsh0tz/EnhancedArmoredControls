# Enhanced Armor Controls
Enhanced Armor Controls allows you to operate armored vehicles as a one-man crew, without a dedicated driver.

This mod must be installed on the server and is optional for clients. Clients that do not have the mod installed will not be able to use the mod features.

It is recommended to run [CBA_A3](https://steamcommunity.com/workshop/filedetails/?id=450814997) to optimize the performance of Per Frame Handlers (PFHs).

Submit issues and feature requests [here](https://github.com/magicsh0tz/EnhancedArmorControls/issues).

## Usage
1. Enter a Tank/APC as the gunner or commander.
2. Select "Take controls" in the action menu (scroll wheel) to take control of the vehicle.
3. Control the vehicle using WASD keys. (Select "Release controls" to release the controls)

## Remote Execution Whitelist (if applicable)
```
class CfgRemoteExec
{
    class Functions
    {
        ...
        class mgc_eac_fnc_takeControls { allowedTargets = 2; jip = 0; };
    };
};
```
