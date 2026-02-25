params ["_on"];

if (!_on) exitWith {ew_batteryPFH call CBA_fnc_removePerFrameHandler};

private _discharge = 100 / ew_batteryTimerCapacity;
private _recharge = 100 / ew_batteryTimerRecharge;

ew_batteryPFH = [{
  _this select 0 params ["_discharge", "_recharge"];

  private _timeSinceLastExec = time - (ew_namespace getVariable ["ew_fnc_spectrumBattery_lastExec", 0]);
  private _display = uiNamespace getVariable ["RscWeaponSpectrumAnalyzerGeneric", displayNull];
  private _usingSpectrumSight = _display getVariable ["bin_isgunner", false];

  if (_usingSpectrumSight && _timeSinceLastExec < 5) then {
    ew_batteryCharge = ew_batteryCharge - (_discharge * _timeSinceLastExec);
  } else {
    ew_batteryCharge = ew_batteryCharge + (_recharge * _timeSinceLastExec);
  };

  ew_batteryCharge = (ew_batteryCharge max 0) min 100;

  missionNamespace setVariable ["#EM_Progress", ew_batteryCharge / 100];
  ew_namespace setVariable ["ew_fnc_spectrumBattery_lastExec", time];
}, 0.25, [_discharge, _recharge]] call CBA_fnc_addPerFrameHandler;