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

_ppGrain = ppEffectCreate ["filmGrain", 939872053];
_ppGrain ppEffectEnable true;

grainMaxDistance = 400;

sharpness = 0.2;
grainsize = 1.5;
int1 = 1;
int2 = 1;
mono = 0;
intensity = 0.1;

player addBackpack "TFAR_rt1523g";
player linkItem "itemmap";
player addWeapon "hgun_esd_01_antenna_02_F";
player linkItem "TFAR_anprc152";

while {true} do {
  if (getConnectedUAV player isEqualTo objNull && !(isRemoteControlling player)) then {_ppGrain ppEffectEnable false; 0 fadesound 1; continue};

  0 fadeSound 0;
  _ppGrain ppEffectEnable true;

  _distance = getConnectedUAV player distance player;
  _ppGrain ppEffectAdjust [1.0075 ^ (_distance - grainMaxDistance), sharpness, grainsize, int1, int2, mono];
  _ppGrain ppEffectCommit 0;

  sleep 0.001;
};