/*
Returns base signal strength of current transmitting radio
*/

params ["_type"];

private _strength = ew_signalStrengthSW;

if (_type == 1) then {_strength = ew_signalStrengthLR};

_strength