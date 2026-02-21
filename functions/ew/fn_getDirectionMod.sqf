params ["_object"];

private _directionMod = (abs ((player getRelDir _object) - 180) / 180) ^ 3.5;

_directionMod