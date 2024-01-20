
params ["_medic", "_patient", "_bodyPart", "_classname", "", "_usedItem"];

// hint ("Slow Heal: " + (name _medic) + " applying advanced kolto to " + (name _patient));
// diag_log format ["Client %3: %1 called slow heal on %2",_medic,_patient,player];

[_patient, _usedItem] call ace_medical_treatment_fnc_addToTriageCard;
[_patient, "activity", "%1 applied %2", [name _medic, getText (configFile >> "CfgWeapons" >> _usedItem >> "displayName")]] call ace_medical_treatment_fnc_addToLog;

["bax_drugs_chronoclot_fnc_slowHealLocal", [_patient, 1], _patient] call CBA_fnc_targetEvent;
["bax_drugs_experiphrine_fnc_addExperiphrine", [_patient,_bodyPart,round bax_drugs_chronoclot_dosage], _patient] call CBA_fnc_targetEvent;
