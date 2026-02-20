/*
Returns a signal strength modifier (0-1) based on player distance and direction to the emitting object.
*/

params ["_object", "_isLR"];

private _range = player distance _object;
if (_range > ew_signalMaxRange) exitWith {0};

private _baseStrength = if (_isLR) then {ew_signalStrengthLR} else {ew_signalStrengthSW};

private _directionMod = (abs ((player getRelDir _object) - 180) / 180) ^ 4;

private _rangeMod = -(_range / ew_signalMaxRange) + 1;
private _rangeMod = 0 max 1 min _rangeMod;

_baseStrength * _directionMod * _rangeMod