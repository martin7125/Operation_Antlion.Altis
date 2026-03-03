{
  private _unconscious = _x getVariable ["ACE_isUnconscious", false] || lifeState _x == "INCAPACITATED";

  if (!alive _x || _unconscious) then {continue};

  private _scoreAttack = 0;
  private _scoreDefense = 0;

  
} forEach allPlayers;