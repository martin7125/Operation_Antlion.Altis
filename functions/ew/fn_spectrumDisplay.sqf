/*
Creates and maintains the array used by the Spectrum Device for display.
*/

params ["_on"];

if (!_on) exitWith {ew_setEMValuesPFH call CBA_fnc_removePerFrameHandler; ew_usingSpectrum = false};

ew_setEMValuesPFH = [{
  private _ewValues = [];

  {
    private _object = _x;
    private _frequency = -1;
    private _baseStrength = -1;

    if (_x isEqualType []) then {
      _object = _x select 0;
      _frequency = _x select 1;
      _baseStrength = _x select 2;
    } else {
      private _vars = _object getVariable ["ew_emitting", [-1,-1]];
      _frequency = _vars select 0;
      _baseStrength = _vars select 1;
    };

    if (!alive _object || _frequency == -1) then {continue};

    private _signalStrength = [_object, _baseStrength] call ew_fnc_getSignalStrength;

    if (_signalStrength <= 0) then {continue};

    _ewValues pushBack _frequency;
    _ewValues pushBack round _signalStrength;
  } forEach (allPlayers - [player]) + ew_emittingObjects;

  missionNamespace setVariable ["#EM_Values", _ewValues];

  hint format ["%1", daytime];
}, 0.1] call CBA_fnc_addPerFrameHandler;

ew_usingSpectrum = true;