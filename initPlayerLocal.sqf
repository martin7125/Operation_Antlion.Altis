ew_signalStrengthLR = 47;
ew_signalStrengthSW = 37;
ew_signalMaxRange = 3000; //Range at which signal strength will be 0 (m)
ew_usingSpectrum = false;

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

ew_objects = [[balls, 250, true], [balls2, 350, false], [balls3, 550, false]];

call ew_fnc_init;