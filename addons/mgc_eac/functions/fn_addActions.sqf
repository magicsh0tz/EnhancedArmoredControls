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

params ["_vehicle",["_isXeh",false]];

if (!hasInterface) exitWith {};

if (_vehicle getVariable [QVAR(hasActionsAdded),false]) exitWith {
    #ifdef DEBUG_MODE
        player globalChat "Exiting... Already has actions added";
    #endif
};

if (!_isXeh && HAS_CBA_XEH) exitWith {
    #ifdef DEBUG_MODE
        player globalChat "Exiting... Run from XEH instead";
    #endif
};

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

_vehicle setVariable [QVAR(hasActionsAdded),true];

#ifdef DEBUG_MODE
    player globalChat (format ["Actions added (_isXeh=%1)",_isXeh]);
#endif
