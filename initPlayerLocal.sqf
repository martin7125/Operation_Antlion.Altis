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

signalFalloffRange = 100; //Range at which signal strength will start to decrease (m)
signalStrength = 50; //Maximum signal strength (db)
signalMaxRange = 3000; //Range at which signal strength will be 0

[] spawn {
  waitUntil {player == player};

  while {true} do {
    directionMod = (abs ((player getRelDir balls) - 180) / 180) ^ 4; //Exponential direction modifier

    range = player distance balls;

    //rangeMod = 1 / (1.0008 ^ (range - signalFalloffRange)); //exponential decrease
    rangeMod = -(range / signalMaxRange) + 1; //linear decrease
    rangeMod = 0 max 1 min rangeMod;

    missionNamespace setVariable ["#EM_Values", [call getFrequency, signalStrength * directionMod * rangeMod]];

    sleep 0.001;
  };
};