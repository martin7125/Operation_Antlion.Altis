/*
Returns signal modifier for building wall and rock intersections
*/

params ["_object"];

private _startPos = eyepos player;
private _endPos = eyepos _object;
private _attenuation = 0.8;

private _intersections = 0;
private _intersectionSurfaces = lineIntersectsSurfaces [_startPos, _endPos, player, _object, true, 10, "FIRE", "NONE", false];

{
  _x params ["", "", "_obj", "_parent"];

  private _obj = if (isNull _parent) then {_obj} else {_parent};

  private _modelStr = toLower ((getModelInfo _obj) joinString " ");
  private _rockOrWall = (_modelStr find "rock" > -1) || (_modelStr find "wall" > -1);

  if (_obj isKindOf "House" || _obj isKindOf "Building" || _rockOrWall) then {
    _intersections = _intersections + 1;
  };
} forEach _intersectionSurfaces;

private _objectMod = _attenuation ^ _intersections;

_objectMod