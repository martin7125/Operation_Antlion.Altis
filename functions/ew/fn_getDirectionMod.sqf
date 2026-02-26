/*
Returns directionality ratio between player camera and object. Scales exponentially.
*/

params ["_object"];

private _camDirVec = getCameraViewDirection player;
private _camDir = (_camDirVec select 0) atan2 (_camDirVec select 1);

if (_camDir < 0) then {_camDir = _camDir + 360};

private _relDir = (((_camDir - (player getDir _object)) + 540) % 360) - 180;

private _exp = 4.5; //Higher = tighter angle
private _directionMod = (1 - (abs _relDir / 180)) ^ _exp;

_directionMod