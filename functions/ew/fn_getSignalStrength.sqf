/*
Returns a signal strength modifier (0-1) based on player distance, direction and terrain occlusion to the emitting object.
*/

params ["_object", "_isLR"];

private _range = player distance _object;
if (_range > ew_signalMaxRange) exitWith {0};

private _baseStrength = if (_isLR) then {ew_signalStrengthLR} else {ew_signalStrengthSW};

//Direction mod
private _directionMod = (abs ((player getRelDir _object) - 180) / 180) ^ 3.5;

//Range mod
private _rangeMod = -(_range / ew_signalMaxRange) + 1;
private _rangeMod = 0 max 1 min _rangeMod;

//Terrain mod
private _terrainMod = 1;
private _lineStart = eyepos player;
private _lineEnd = eyepos _object;
private _samples = 100;
private _intersectionTotal = 0;

//Sample positions between player and target object
for "_i" from 1 to _samples do {
  private _t = _i / _samples;
  private _pos = [
    (_lineStart select 0) + ((_lineEnd select 0) - (_lineStart select 0)) * _t,
    (_lineStart select 1) + ((_lineEnd select 1) - (_lineStart select 1)) * _t,
    (_lineStart select 2) + ((_lineEnd select 2) - (_lineStart select 2)) * _t
  ];

  private _terrainHeight = getTerrainHeightASL _pos;
  private _zPos = _pos select 2;
  private _depth = _terrainHeight - _zPos;

  //If sample point is below terrain, add to the total
  if (_depth > 0) then {
    _intersectionTotal = _intersectionTotal + _depth;
  };
};

//Normalize depth total over range
_terrainMod = 1 - (_intersectionTotal / _range); //TODO: MIN 0

_baseStrength * _directionMod * _rangeMod * _terrainMod