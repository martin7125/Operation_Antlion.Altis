if (ew_playerRadioSent) exitWith {};

private _radio = tfar_core_currentTransmittingRadio;
private _isLR = _radio call ew_fnc_isLR;
private _frequency = _isLR call ew_fnc_getActiveFrequency;
private _baseStrength = _isLR call ew_fnc_getBaseStrength;

ew_playerRadioSettings = [player, _frequency, _baseStrength];

ew_objects pushBackUnique [player, _frequency, _baseStrength];

ew_playerRadioSent = true;

[{!(call ew_fnc_playerUsingRadio)}, {
  ew_objects = ew_objects - [ew_playerRadioSettings];
  ew_playerRadioSettings = [];
  ew_playerRadioSent = false;
}] call CBA_fnc_waitUntilAndExecute;