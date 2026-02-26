/*
Returns the radio frequency of the currently transmitting radio
*/

params ["_type"];

private _frequency = switch (_type) do {
  case 1: {call TFAR_fnc_currentLRFrequency};
  case 0: {call TFAR_fnc_currentSWFrequency};
  default {-1};
};

//Returns as string, convert to num
_frequency = parseNumber _frequency;

_frequency