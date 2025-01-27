/*
 * Author: magicsh0tz
 * Get the current unit that the player controls.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * The unit that the player currently controls <OBJECT>
 *
 * Example:
 * [] call mgc_eac_fnc_getPlayer
 */

#include "script_component.hpp"

missionNamespace getVariable ["BIS_fnc_moduleRemoteControl_unit",player];
