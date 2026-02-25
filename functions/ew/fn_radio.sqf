if !(isNil {player getVariable "ew_emitting"}) exitWith {};

private _radio = tfar_core_currentTransmittingRadio;
private _isLR = _radio call ew_fnc_isLR;
private _frequency = _isLR call ew_fnc_getActiveFrequency;
private _baseStrength = _isLR call ew_fnc_getBaseStrength;

player setVariable ["ew_emitting", [_frequency, _baseStrength], true];

[{!(call ew_fnc_playerUsingRadio)}, {
  player setVariable ["ew_emitting", nil, true];
}] call CBA_fnc_waitUntilAndExecute;