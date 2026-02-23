params ["_radio"];

private _isLR = false;
private _LR = call TFAR_fnc_activeLrRadio;

if (_radio isEqualTo _LR) then {_isLR = true};

_isLR