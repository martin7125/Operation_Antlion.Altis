/*
Creates and maintains the array used by the Spectrum Device for display.
*/

params ["_on"];

if (!_on) exitWith {ew_setEMValuesPFH call CBA_fnc_removePerFrameHandler; ew_usingSpectrum = false};

ew_setEMValuesPFH = [{
  private _ew_array = [];

  {
    private _object = _x select 0;
    private _frequency = _x select 1;
    private _isLR = _x select 2;
    private _signalStrength = [_object, _isLR] call ew_fnc_getSignalStrength;

    if (_signalStrength == 0) then {continue};

    _ew_array pushBack _frequency;
    _ew_array pushBack _signalStrength;
  } forEach ew_objects;

  missionNamespace setVariable ["#EM_Values", _ew_array];

  hint format ["%1", daytime]
}, 0.05] call CBA_fnc_addPerFrameHandler;

ew_usingSpectrum = true;