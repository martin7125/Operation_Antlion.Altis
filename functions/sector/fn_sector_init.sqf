m_attackingSide = east;
m_defendingSide = west;

//Sort sectors alphabetically
m_sector_objectives = allMissionObjects "EmptyDetector" select {toLower (vehicleVarName _x) find "objective" > -1};
m_sector_objectives = [m_sector_objectives, [], {vehicleVarName _x}, "ASCEND"] call BIS_fnc_sortBy;

call m_fnc_createObjective;

