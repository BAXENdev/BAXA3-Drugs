
["bax_drugs_adrenaphrine_fnc_speedBoostLocal",bax_drugs_adrenaphrine_fnc_speedBoostLocal] call CBA_fnc_addEventHandler;
player setVariable ["bax_drugs_adrenaphrine_boostFactors",0,true];
[
	"ace_common_setAnimSpeedCoef",
	{
		params ["_target","_speed"];

		#ifdef DEBUG
		_msg = format ["Ace_Common_SetAnimSpeedCoef CBA_EH: AnimCoef", getAnimSpeedCoef _target];
		LOG_LOCAL(_msg,_target)
		#endif

		if (_speed != 1) exitWith {};
		_speedFactors = _target getVariable ["bax_drugs_adrenaphrine_boostFactors",0];
		_speedMultiplier = (1 + (_speedFactors * bax_drugs_adrenaphrine_boostPercent)) min bax_drugs_adrenaphrine_boostMax;
		_target setAnimSpeedCoef (_speed * _speedMultiplier);

		#ifdef DEBUG
		_msg = format ["Ace_Common_SetAnimSpeedCoef CBA_EH (After): AnimCoef", getAnimSpeedCoef _target];
		LOG_LOCAL(_msg,_target)
		#endif
	}
] call cba_fnc_addEventHandler;
