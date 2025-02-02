/*
 * Author: magicsh0tz
 * Checks if a unit can take controls.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Vehicle <OBJECT>
 *
 * Return Value:
 * Can take controls <BOOL>
 *
 * Example:
 * [_unit,_vehicle] call mgc_eac_fnc_canTakeControls
 */

#include "script_component.hpp"

params ["_unit","_vehicle"];

private ["_driver","_controller","_dummyDriver"];

if (isNull _unit || {!(alive _unit)}) exitWith {
    false
};

if (isNull _vehicle || {!(alive _vehicle)}) exitWith {
    false
};

_driver = driver _vehicle;
_controller = _vehicle getVariable [QVAR(controller),objNull];
_dummyDriver = _vehicle getVariable [QVAR(dummyDriver),objNull];

true &&
{
    isNull _driver ||
    {!(alive _driver)}
} &&
{isNull _controller} &&
{isNull _dummyDriver} &&
{[_unit,_vehicle] call FUNC(isGunnerOrCommander)}
