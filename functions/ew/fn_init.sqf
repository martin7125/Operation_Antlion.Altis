ew_signalStrengthLR = 47; //Strength of LR radio (db)
ew_signalStrengthSW = 37; //Strength of SW radio (db)
ew_signalMaxRange = 5000; //Range at which signal strength will be 0 - follows a linear falloff (m)
ew_usingSpectrum = false;

missionNamespace setVariable ["#EM_FMin", 0];
missionNamespace setVariable ["#EM_FMax", 600];

missionNamespace setVariable ["#EM_SMin", 0];
missionNamespace setVariable ["#EM_SMax", 50];

//Scroll increment seems to always be 0.03 * EM_FMax
missionNamespace setVariable ["#EM_SelMin", 0];
missionNamespace setVariable ["#EM_SelMax", 18];

call ew_fnc_addTogglePFH;