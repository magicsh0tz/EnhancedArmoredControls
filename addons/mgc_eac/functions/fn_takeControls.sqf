/*
 * Author: magicsh0tz
 * Take controls.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_unit,_vehicle] call mgc_eac_fnc_takeControls
 */

#include "script_component.hpp"

params ["_unit","_vehicle"];

private ["_dummyDriverClass","_dummyDriver"];

if (!isServer) exitWith {
    // Run on server to prevent race condition.
    _this remoteExecCall [QFUNC(takeControls),2,false];
};

if (!([_unit,_vehicle] call FUNC(canTakeControls))) exitWith {};

_dummyDriverClass = (configfile >> "CfgVehicles" >> (typeOf _vehicle) >> "crew") call BIS_fnc_getCfgData;
if (isNil "_dummyDriverClass") exitWith {};

_dummyDriver = createAgent [_dummyDriverClass,[0,0,0],[],0,"CAN_COLLIDE"];
_dummyDriver allowDamage false;
_dummyDriver hideObjectGlobal true;
_dummyDriver moveInDriver _vehicle;

// Prevent driver from turning out
_dummyDriver setBehaviour "COMBAT";

if (HAS_ACE) then {
    // Remove ace interaction
    [_dummyDriver,_dummyDriver] call ace_common_fnc_claim;
};

_vehicle setVariable [QVAR(controller),_unit,true];
_vehicle setVariable [QVAR(dummyDriver),_dummyDriver,true];

_handles = localNamespace getVariable [QVAR(handles),[]];
_handles pushBack [[_unit,_vehicle,_dummyDriver],CURRENT_TIME];
localNamespace setVariable [QVAR(handles),_handles];
