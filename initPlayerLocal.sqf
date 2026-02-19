//ew_signalFalloffRange = 100; //Range at which signal strength will start to decrease (m)
ew_signalStrength = 50; //Maximum signal strength (db)
ew_signalMaxRange = 3000; //Range at which signal strength will be 0 (m)

playerUsingRadio = {
  !(tfar_core_currentTransmittingRadio isEqualTo [])
};

//tfar_core_currentTransmittingRadio
//TF_tangent_lr_pressed
//call TFAR_fnc_onLRTangentPressed;

getFrequency = {
  if (isNil {call TFAR_fnc_activeLrRadio}) exitWith {};

  _radio = call TFAR_fnc_activeLrRadio;
  _channel = _radio call TFAR_fnc_getLrChannel;
  _currentFrequency = [_radio, _channel + 1] call TFAR_fnc_getChannelFrequency;
  parseNumber _currentFrequency
};

getSignalStrength = {
  params ["_object"];

  _range = player distance _object;

  if (_range > ew_signalMaxRange) exitWith {};

  _directionMod = (abs ((player getRelDir _object) - 180) / 180) ^ 4;

  _rangeMod = -(_range / ew_signalMaxRange) + 1;
  _rangeMod = 0 max 1 min _rangeMod;

  ew_signalStrength * _directionMod * _rangeMod
};

/*1 / (1.0008 ^ (range - ew_signalFalloffRange)); //exponential decrease*/

ew_objects = [[balls, 250], [balls2, 350], [balls3, 550]];
ew_array = [];

[{
  ew_array = [];

  {
    private _object = _x select 0;
    private _frequency = _x select 1;
    private _signalStrength = _object call getSignalStrength;

    if (isNil "_signalStrength") then {continue};

    ew_array pushBack _frequency;
    ew_array pushBack _signalStrength;
  } forEach ew_objects;

  missionNamespace setVariable ["#EM_Values", ew_array];
}] call CBA_fnc_addPerFrameHandler;