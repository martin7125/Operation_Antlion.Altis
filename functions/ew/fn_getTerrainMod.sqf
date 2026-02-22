params ["_object", "_diagPos"];

private _lineStart = eyepos player;
private _lineEnd = eyepos _object;
private _samples = 50;
private _depthTotal = 0;
private _averageDepth = 0;
private _terrainMod = 1;

if (!isNil "_diagPos") then {_lineStart = _diagPos};

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
    _depthTotal = _depthTotal + _depth;
  };
};

_averageDepth = _depthTotal / _samples;

_terrainMod = 1 - (linearConversion [0, ew_maxTerrainDepth, _averageDepth, 0, 1, true]);

_terrainMod