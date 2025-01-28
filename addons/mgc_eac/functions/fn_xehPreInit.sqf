/*
 * Author: magicsh0tz
 */

#include "script_component.hpp"

{
    [_x,"InitPost",{
        [(_this select 0),true] call FUNC(addActions);
    }] call CBA_fnc_addClassEventHandler;
} forEach ALLOWED_TYPES;
