params ["_objective"];

private _atkScore = 0;
private _defScore = 0;
private _area = triggerArea _objective;
_area params ["_sizeX", "_sizeY"];
private _objMinLength = _sizeX min _sizeY;

{
  private _player = _x;
  private _unconscious = _player getVariable ["ACE_isUnconscious", false] || lifeState _player == "INCAPACITATED";

  if (!alive _player || _unconscious || !(_player inArea _objective)) then {continue};

  private _distance = _player distance2D _objective;
  private _playerScore = (linearConversion [_objMinLength, 0, _distance, 0, 1]) ^ 1.5;
  private _side = _player call BIS_fnc_objectSide;

  if (_side == m_attackingSide) then {_atkScore = _atkScore + _playerScore};
  if (_side == m_defendingSide) then {_defScore = _defScore + _playerScore};  
} forEach allPlayers;

_atkScore - _defScore