params ["_isLR"];

private _strength = ew_signalStrengthSW;

if (_isLR) then {_strength = ew_signalStrengthLR};

_strength