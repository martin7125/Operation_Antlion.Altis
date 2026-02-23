params ["_isLR"];

private _frequency = switch (_isLR) do {
  case true: {call TFAR_fnc_currentLRFrequency};
  case false: {call TFAR_fnc_currentSWFrequency};
  default {-1};
};

_frequency = parseNumber _frequency;

_frequency