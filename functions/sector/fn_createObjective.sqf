private _taskNum = 1;

{[_x, _taskNum] call m_fnc_sequenceTasks; _taskNum = _taskNum + 1} forEach m_sector_objectives;