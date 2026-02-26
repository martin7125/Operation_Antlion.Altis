ew_signalStrengthLR = 47; //Strength of LR radio (db)
ew_signalStrengthSW = 37; //Strength of SW radio (db)
ew_signalMaxRange = 4000; //Range at which signal strength will be 0 - follows a linear falloff (m)
ew_maxTerrainDepth = 10; //Average terrain depth between player and emitting object where signal strength will be 0 (m) -- Default: 15

ew_usingSpectrum = false;
ew_batteryTimerCapacity = 180; //Total battery capacity for spectrum device (seconds)
ew_batteryTimerRecharge = 600; //Time it takes for spectrum device to recharge from empty (seconds)
ew_batteryCharge = 100;
ew_objects = [];

ew_namespace = false call CBA_fnc_createNamespace;

//Frequency range of device
missionNamespace setVariable ["#EM_FMin", 0];
missionNamespace setVariable ["#EM_FMax", 600];

//Signal range of device (db)
missionNamespace setVariable ["#EM_SMin", 0];
missionNamespace setVariable ["#EM_SMax", 50];

//Frequency selection width
//Scroll increment seems to always be 0.03 * EM_FMax
missionNamespace setVariable ["#EM_SelMin", 0];
missionNamespace setVariable ["#EM_SelMax", 18];

//Handle Spectrum Device display
ew_spectrumPFH = [{
  if (call ew_fnc_playerUsingSpectrum) then {call ew_fnc_spectrum};
}, 2] call CBA_fnc_addPerFrameHandler;

//Handle radio updates
["TFAR_event_OnTangent", {
  params ["_unit", "_radio", "_type", "_isAdditional", "_start"];

  [_radio, _start, _type] call ew_fnc_radio;
}] call CBA_fnc_addEventHandler;