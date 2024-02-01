
#include "..\macros.hpp"

["bax_drugs_experiphrine_fnc_superBoostLocal",bax_drugs_experiphrine_fnc_superBoostLocal] call CBA_fnc_addEventHandler;
["bax_drugs_experiphrine_fnc_addExperiphrine",bax_drugs_experiphrine_fnc_addExperiphrine] call CBA_fnc_addEventHandler;
["bax_drugs_experiphrine_fnc_addExperiphrineLocal",bax_drugs_experiphrine_fnc_addExperiphrineLocal] call CBA_fnc_addEventHandler;
["bax_drugs_experiphrine_fnc_checkExperiphrineLocal",bax_drugs_experiphrine_fnc_checkExperiphrineLocal] call CBA_fnc_addEventHandler;

#ifdef DEBUG
_msg = "***Addon Variables***" + endl;
{
	_x params ["_name","_value"];
	_msg = _msg + (format ["%1: %2",_name,_value]) + endl;
} forEach [
["bax_drugs_adrenaphrine_boostPercent",bax_drugs_adrenaphrine_boostPercent],
["bax_drugs_adrenaphrine_boostMax",bax_drugs_adrenaphrine_boostMax],
["bax_drugs_adrenaphrine_duration",bax_drugs_adrenaphrine_duration],
["bax_drugs_adrenaphrine_dosage",bax_drugs_adrenaphrine_dosage],
["bax_drugs_chronoclot_tickCount",bax_drugs_chronoclot_tickCount],
["bax_drugs_chronoclot_tickDelay",bax_drugs_chronoclot_tickDelay],
["bax_drugs_chronoclot_bandageCount",bax_drugs_chronoclot_bandageCount],
["bax_drugs_chronoclot_painFactor",bax_drugs_chronoclot_painFactor],
["bax_drugs_chronoclot_dosage",bax_drugs_chronoclot_dosage],
["bax_drugs_experiphrine_maxDosage",bax_drugs_experiphrine_maxDosage],
["bax_drugs_experiphrine_doseDuration",bax_drugs_experiphrine_doseDuration],
["bax_drugs_experiphrine_checkLevel",bax_drugs_experiphrine_checkLevel],
["bax_drugs_experiphrine_randomEffectCount",bax_drugs_experiphrine_randomEffectCount],
["bax_drugs_experiphrine_dosage",bax_drugs_experiphrine_dosage],
["bax_drugs_recoilRedux_boostPercent",bax_drugs_recoilRedux_boostPercent],
["bax_drugs_recoilRedux_duration",bax_drugs_recoilRedux_duration],
["bax_drugs_recoilRedux_dosage",bax_drugs_recoilRedux_dosage],
["bax_drugs_recovaMax_dosage",bax_drugs_recovaMax_dosage],
["bax_drugs_recovaMax_delay",bax_drugs_recovaMax_delay],
["bax_drugs_regenaboost_recoveryFactor",bax_drugs_regenaboost_recoveryFactor],
["bax_drugs_regenaboost_duration",bax_drugs_regenaboost_duration],
["bax_drugs_regenaBoost_dosage",bax_drugs_regenaBoost_dosage],
["bax_drugs_swayflex_reducedSwayFactor",bax_drugs_swayflex_reducedSwayFactor],
["bax_drugs_swayflex_reducedSwayTime",bax_drugs_swayflex_reducedSwayTime],
["bax_drugs_swayFlex_dosage",bax_drugs_swayFlex_dosage]
];
LOG(_msg)
#endif
