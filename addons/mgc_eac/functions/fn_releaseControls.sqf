/*
 * Author: magicsh0tz
 * Release controls.
 *
 * Arguments:
 * 0: unit that will release controls <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_unit] call mgc_eac_fnc_releaseControls
 */

#include "script_component.hpp"

params ["_unit","_vehicle"];

private ["_vehicle","_dummyDriver"];

if (!([_unit,_vehicle] call FUNC(canReleaseControls))) exitWith {};

_vehicle setVariable [QVAR(controller),nil,true];

_dummyDriver = _vehicle getVariable [QVAR(dummyDriver),objNull];
if (isNull _dummyDriver) exitWith {};

doStop _dummyDriver;
