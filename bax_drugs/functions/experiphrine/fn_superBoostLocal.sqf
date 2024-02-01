
#include "..\macros.hpp"

params ["_patient"];

if !(alive _patient) exitWith {
};

#ifdef DEBUG
_msg = format ["Experiphrine Local: Patient=%1", name _patient];
LOG(_msg)
#endif

["bax_drugs_chronoclot_fnc_slowHealLocal", [_patient, 1], _patient] call CBA_fnc_targetEvent;

for "_i" from 1 to (round bax_drugs_experiphrine_randomEffectCount) do {
	_event = selectRandom [
		"bax_drugs_adrenaphrine_fnc_speedBoostLocal",
		"bax_drugs_recoilRedux_fnc_recoilBoostLocal",
		"bax_drugs_regenaboost_fnc_increaseRegenLocal",
		"bax_drugs_swayflex_fnc_swayHealLocal"
	];
	
	#ifdef DEBUG
	_msg = format ["Experiphrine Local: Calling=%1", _event];
	LOG(_msg)
	#endif
	[_event, [_patient], _patient] call CBA_fnc_targetEvent;
};
