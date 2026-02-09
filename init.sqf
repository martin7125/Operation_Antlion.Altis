_sectorLong = text nearestLocation [objective_1, ""];
_sectorShort = _sectorLong select [0,1];

_text = format ["<t align='center' size='1.2' font='PuristaBold' color='#ffffff' shadow='2'>%1</t>", _sectorShort];

[
  0,
  _text,
  "\A3\ui_f\data\map\markers\nato\n_installation.paa",
  [east, false] call BIS_fnc_sideColor,
  0,
  [0,0,0],
  0.1
] call BIS_fnc_setMissionStatusSlot;

call BIS_fnc_showMissionStatus;

_ppGrain = ppEffectCreate ["filmGrain", 4398725];
_ppGrain ppEffectEnable true;

grainMaxDistance = 400;

sharpness = 0.2;
grainsize = 1.5;
int1 = 1;
int2 = 1;
mono = 0;

while {true} do {
  if (getConnectedUAV player isEqualTo objNull) then {continue};

  _distance = getConnectedUAV player distance player;
  _ppGrain ppEffectAdjust [(_distance/grainMaxDistance) min 0.125, sharpness, grainsize, int1, int2, mono];
  _ppGrain ppEffectCommit 0;

  sleep 0.001;
};