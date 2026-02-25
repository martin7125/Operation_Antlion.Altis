if (ew_usingSpectrum) exitWith {};

true call ew_fnc_spectrumDisplay;
true call ew_fnc_spectrumBattery;

ew_usingSpectrum = true;

[{!(call ew_fnc_playerUsingSpectrum)}, {
  false call ew_fnc_spectrumDisplay;
  false call ew_fnc_spectrumBattery;
  ew_usingSpectrum = false;
}] call CBA_fnc_waitUntilAndExecute;