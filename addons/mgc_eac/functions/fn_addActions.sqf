/*
 * Author: magicsh0tz
 * Adds actions to vehicle.
 *
 * Return Value:
 * None
 *
 * Example:
 * [_vehicle] call mgc_eac_fnc_addActions
 */

#include "script_component.hpp"

params ["_vehicle"];

_vehicle addAction [
    "Take controls",
    {
        params ["_target","_caller","_actionID","_arguments"];
        
        [_caller,_target] call FUNC(takeControls);
    },
    nil,
    10,
    false,
    true,
    "",
    QUOTE([ARR_2(_this,_originalTarget)] call FUNC(canTakeControls))
];

_vehicle addAction [
    "Release controls",
    {
        params ["_target","_caller","_actionID","_arguments"];
        
        [_caller,_target] call FUNC(releaseControls);
    },
    nil,
    10,
    false,
    true,
    "",
    QUOTE([ARR_2(_this,_originalTarget)] call FUNC(canReleaseControls))
];
