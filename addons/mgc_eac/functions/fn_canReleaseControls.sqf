/*
 * Author: magicsh0tz
 * Checks if a unit can release controls.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Vehicle <OBJECT>
 *
 * Return Value:
 * Can release controls <BOOL>
 *
 * Example:
 * [_unit,_vehicle] call mgc_eac_fnc_canReleaseControls
 */

#include "script_component.hpp"

params ["_unit","_vehicle"];

private ["_controller"];

if (isNull _unit || {!(alive _unit)}) exitWith {
    false
};

if (isNull _vehicle || {!(alive _vehicle)}) exitWith {
    false
};

_controller = _vehicle getVariable [QVAR(controller),objNull];

_controller == _unit
