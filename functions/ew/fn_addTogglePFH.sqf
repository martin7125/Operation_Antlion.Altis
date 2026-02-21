/*
Handles toggling the usage of the spectrum device.
*/

ew_togglePFH = [{
  if (currentWeapon player == "hgun_esd_01_antenna_02_F") then {
    if (!ew_usingSpectrum) then {true call ew_fnc_spectrumDisplay};
  } else {
    if (ew_usingSpectrum) then {false call ew_fnc_spectrumDisplay};
  };
}, 1] call CBA_fnc_addPerFrameHandler;