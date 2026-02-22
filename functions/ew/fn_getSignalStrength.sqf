/*
Returns a signal strength modifier (0-1) based on player distance, direction and terrain occlusion to the emitting object.
*/

params ["_object", "_isLR"];

private _baseStrength = if (_isLR) then {ew_signalStrengthLR} else {ew_signalStrengthSW};

private _range = player distance _object;
if (_range > ew_signalMaxRange) exitWith {0};

private _rangeMod = _range call ew_fnc_getRangeMod;
private _directionMod = _object call ew_fnc_getDirectionMod;
private _terrainMod = _object call ew_fnc_getTerrainMod;

_baseStrength * _rangeMod * _directionMod * _terrainMod