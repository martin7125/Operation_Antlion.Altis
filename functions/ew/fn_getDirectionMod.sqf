/*
Returns directionality ratio between player and object. Scales exponentially.
*/

params ["_object"];

private _exp = 4.5; //Higher = tighter angle
private _directionMod = (abs ((player getRelDir _object) - 180) / 180) ^ _exp;

_directionMod