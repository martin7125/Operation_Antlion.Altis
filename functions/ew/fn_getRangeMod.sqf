params ["_object", "_range"];

private _rangeMod = -(_range / ew_signalMaxRange) + 1;
private _rangeMod = 0 max 1 min _rangeMod;

_rangeMod