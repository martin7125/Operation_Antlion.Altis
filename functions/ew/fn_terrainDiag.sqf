/*
Diagnostic function.
Creates markers to represent the terrain mod portion of the signal strength calculation around a given object.
*/

params ["_object", "_range"];

if (!canSuspend) exitWith {hint "Function must be called via spawn"};

private _radius = _range;
private _gridSize = 100;

private _pos = eyepos _object;
private _xStart = (_pos select 0) - _range;
private _yStart = (_pos select 1) - _range;
private _xEnd = (_pos select 0) + _range;
private _yEnd = (_pos select 1) + _range;

for "_x" from _xStart to (_xEnd - _gridSize) step _gridSize do {
    for "_y" from _yStart to (_yEnd - _gridSize) step _gridSize do {
        // Only place markers if the grid square's center is within range
        private _centerX = _x + _gridSize/2;
        private _centerY = _y + _gridSize/2;
        private _dist = sqrt(((_centerX - (_pos select 0))^2) + ((_centerY - (_pos select 1))^2));
        if (_dist <= _range) then {
            // Place a 3x3 pattern of markers in each grid square
            for "_dx" from -1 to 1 do {
                for "_dy" from -1 to 1 do {
                    private _markerName = format ["gridMarker_%1_%2_%3_%4", round _x, round _y, _dx, _dy];
                    private _offsetX = (_dx * (_gridSize/3));
                    private _offsetY = (_dy * (_gridSize/3));
                    private _markerPos = [_centerX + _offsetX, _centerY + _offsetY, 0];
                    if (surfaceIsWater _markerPos) then {continue};
                    private _marker = createMarkerLocal [_markerName, _markerPos];
                    _marker setMarkerShapeLocal "RECTANGLE";
                    _marker setMarkerSizeLocal [_gridSize/6, _gridSize/6]; // 1/3rd of grid square

                    // Calculate color: green (1) to red (0)
                    private _terrainMod = [_object, (ATLToASL _markerPos) vectorAdd [0,0,1.7]] call ew_fnc_getTerrainMod;
                    private _r = 1 - _terrainMod;
                    private _g = _terrainMod;
                    private _b = 0;

                    // Convert to string format
                    private _colorString = format ["#(%1,%2,%3,%4)", _r, _g, _b, 0.7];
                    _marker setMarkerColorLocal _colorString;
                    _marker setMarkerAlphaLocal 0.7;

                    uiSleep 0.000001;
                };
            };
        };
    };
};