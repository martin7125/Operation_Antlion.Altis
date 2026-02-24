params ["_object"];

private _exp = 4; //Higher = tighter angle
private _directionMod = (abs ((player getRelDir _object) - 180) / 180) ^ _exp;

_directionMod