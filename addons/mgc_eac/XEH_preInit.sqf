/*
 * Author: magicsh0tz
 */

#include ".\functions\script_component.hpp"

if (!hasInterface) exitWith {};

{
    [_x,"InitPost",{
        [(_this select 0),true] call FUNC(addActions);
    }] call CBA_fnc_addClassEventHandler;
} forEach ALLOWED_TYPES;
