/*
 * Author: magicsh0tz
 * Release controls.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_unit,_vehicle] call mgc_eac_fnc_releaseControls
 */

#include "script_component.hpp"

params ["_unit","_vehicle"];

private ["_vehicle","_dummyDriver"];

if (!([_unit,_vehicle] call FUNC(canReleaseControls))) exitWith {};

_vehicle setVariable [QVAR(controller),nil,true];

_dummyDriver = _vehicle getVariable [QVAR(dummyDriver),objNull];
if (isNull _dummyDriver) exitWith {};

doStop _dummyDriver;
