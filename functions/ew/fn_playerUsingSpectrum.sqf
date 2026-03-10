/*
Checks if the player is currently using the spectrum device
*/

private _usingSpectrum = currentWeapon player == "hgun_esd_01_antenna_02_F";
private _usingAntenna = "muzzle_antenna_02_f" in handgunItems player;

_usingSpectrum && _usingAntenna

//TODO: Only specialist role can use device

