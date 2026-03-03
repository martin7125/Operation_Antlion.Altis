params ["_objective", "_taskNum"];
  
private _sectorNameLong = text nearestLocation [_objective, ""];
private _sectorNameShort = _sectorNameLong select [0,1];
private _missionStatusText = format ["<t align='center' size='1.2' font='PuristaBold' color='#ffffff' shadow='2'>%1</t>", _sectorNameShort];

[
  _taskNum,
  _missionStatusText,
  "\A3\ui_f\data\map\markers\nato\n_installation.paa",
  [m_defendingSide, false] call BIS_fnc_sideColor,
  0,
  [0,0,0],
  0
] call BIS_fnc_setMissionStatusSlot;

[m_defendingSide, format ["DEF%1", _taskNum], [format ["Hold control of %1 until mission end.", _sectorNameLong], format ["Hold %1", _sectorNameLong]], getpos _objective, "ASSIGNED"] call BIS_fnc_taskCreate;
[m_attackingSide, format ["ATK%1", _taskNum], [format ["Gain control of %1 by mission end.", _sectorNameLong], format ["Control %1", _sectorNameLong]], getpos _objective, "ASSIGNED"] call BIS_fnc_taskCreate;
