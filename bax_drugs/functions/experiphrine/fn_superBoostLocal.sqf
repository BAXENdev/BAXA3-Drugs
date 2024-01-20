
params ["_patient"];

if !(alive _patient) exitWith {
};

["bax_drugs_adrenaline_fnc_speedBoostLocal", [_patient], _patient] call CBA_fnc_targetEvent;
["bax_drugs_adrenaline_fnc_speedBoostLocal", [_patient], _patient] call CBA_fnc_targetEvent;

["bax_drugs_chronoclot_fnc_slowHealLocal", [_patient, 1], _patient] call CBA_fnc_targetEvent;

["bax_drugs_recoilRedux_fnc_recoilBoostLocal", [_patient], _patient] call CBA_fnc_targetEvent;
["bax_drugs_recoilRedux_fnc_recoilBoostLocal", [_patient], _patient] call CBA_fnc_targetEvent;

// ["bax_drugs_recovamax_fnc_fullHealLocal", [_patient], _patient] call CBA_fnc_targetEvent;

["bax_drugs_regenaboost_fnc_increaseRegenLocal", [_patient], _patient] call CBA_fnc_targetEvent;
["bax_drugs_regenaboost_fnc_increaseRegenLocal", [_patient], _patient] call CBA_fnc_targetEvent;

["bax_drugs_swayflex_fnc_swayHealLocal", [_patient], _patient] call CBA_fnc_targetEvent;
["bax_drugs_swayflex_fnc_swayHealLocal", [_patient], _patient] call CBA_fnc_targetEvent;
