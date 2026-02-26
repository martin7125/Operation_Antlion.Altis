params ["_radio", "_start", "_type"];

if (!_start) exitWith {player setVariable ["ew_emitting", nil, true]};

private _frequency = _type call ew_fnc_getActiveFrequency;
private _baseStrength = _type call ew_fnc_getBaseStrength;

player setVariable ["ew_emitting", [_frequency, _baseStrength], true];