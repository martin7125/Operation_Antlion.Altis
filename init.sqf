_ppGrain = ppEffectCreate ["filmGrain", 939872053];
_ppGrain ppEffectEnable true;

grainMaxDistance = 400;

sharpness = 0.2;
grainsize = 1.5;
int1 = 1;
int2 = 1;
mono = 0;
intensity = 0.1;

player addBackpack "TFAR_rt1523g_big";
player linkItem "itemmap";
player addWeapon "hgun_esd_01_antenna_02_F";
player linkItem "TFAR_anprc152";
player linkItem "B_UavTerminal";
player addItem "MTweaks_AR2_Item";
player addMagazine "MTweaks_UAVBattery";

/*
while {true} do {
  if (getConnectedUAV player isEqualTo objNull && !(isRemoteControlling player)) then {_ppGrain ppEffectEnable false; 0 fadesound 1; continue};

  0 fadeSound 0;
  _ppGrain ppEffectEnable true;

  _distance = getConnectedUAV player distance player;
  _ppGrain ppEffectAdjust [1.0075 ^ (_distance - grainMaxDistance), sharpness, grainsize, int1, int2, mono];
  _ppGrain ppEffectCommit 0;

  sleep 0.001;
};