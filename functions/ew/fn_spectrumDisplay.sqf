/*
Creates and maintains the array used by the Spectrum Device for display.
*/

params ["_on"];

if (!_on) exitWith {ew_setEMValuesPFH call CBA_fnc_removePerFrameHandler; ew_usingSpectrum = false};

ew_setEMValuesPFH = [{
  private _ew = [];
  private _ewValues = [];

  {
    if (!alive _x || isNil {_x getVariable "ew_emitting"}) then {continue};

    private _vars = _x getVariable ["ew_emitting", [-1,-1]];
    private _frequency = _vars select 0;
    private _baseStrength = _vars select 1;

    _ew pushBack [_x, _frequency, _baseStrength];
  } forEach allPlayers - [player];

  {
    private _object = _x select 0;
    private _frequency = _x select 1;
    private _baseStrength = _x select 2;
    private _signalStrength = [_object, _baseStrength] call ew_fnc_getSignalStrength;

    if (_signalStrength == 0) then {continue};

    _ewValues pushBack _frequency;
    _ewValues pushBack round _signalStrength;
  } forEach _ew + ew_emittingObjects;

  missionNamespace setVariable ["#EM_Values", _ewValues];

  hint format ["%1", daytime];
}, 0.1] call CBA_fnc_addPerFrameHandler;

ew_usingSpectrum = true;