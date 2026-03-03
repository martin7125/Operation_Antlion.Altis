params ["_objective", "_taskNum"];

[{
  _this params ["_objective", "_taskNum"];

  format ["ATK%1", _taskNum - 1] call BIS_fnc_taskState == "SUCCEEDED" || _taskNum == 1
},
{
  _this params ["_objective", "_taskNum"];

  [_objective, _taskNum] call m_fnc_createTask;
  
}, [_objective, _taskNum]] call CBA_fnc_waitUntilAndExecute;