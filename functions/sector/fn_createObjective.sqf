if (!isServer) exitWith {};

private _objNum = 1;
private _taskNum = 1;

{
  private _objective = _x;
  private _area = triggerArea _objective;
  _area params ["_sizeA", "_sizeB", "_angle", "_isRectangle"];

  private _markerName = format ["m_sector_obj_%1", _taskNum];
  createMarker [_markerName, getPos _objective];
  _markerName setMarkerShape (if (_isRectangle) then {"RECTANGLE"} else {"ELLIPSE"});
  _markerName setMarkerSize [_sizeA, _sizeB];
  _markerName setMarkerDir _angle;
  _markerName setMarkerColor "ColorBLUFOR";

  private _sectorNameLong = text nearestLocation [_objective, ""];
  private _sectorNameShort = _sectorNameLong select [0,1];
  private _missionStatusText = format ["<t align='center' size='1.2' font='PuristaBold' color='#ffffff' shadow='2'>%1</t>", _sectorNameShort];
  private _taskState = if (_forEachIndex == 0) then {"ASSIGNED"} else {"CREATED"};

  [m_defendingSide, format ["DEF%1", _taskNum], [format ["Hold control of %1 until mission end.", _sectorNameLong], format ["Hold %1", _sectorNameLong]], getpos _objective, _taskState] call BIS_fnc_taskCreate;
  [m_attackingSide, format ["ATK%1", _taskNum], [format ["Gain control of %1 by mission end.", _sectorNameLong], format ["Control %1", _sectorNameLong]], getpos _objective, _taskState] call BIS_fnc_taskCreate;
  
  [
    _taskNum,
    _missionStatusText,
    "\A3\ui_f\data\map\markers\nato\n_installation.paa",
    [m_defendingSide, false] call BIS_fnc_sideColor,
    0,
    [0,0,0],
    0
  ] remoteExec ["BIS_fnc_setMissionStatusSlot", 0, true];

  _taskNum = _taskNum + 1;
} forEach m_sector_objectives;




