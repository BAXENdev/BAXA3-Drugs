
params ["_medic", "_patient", "_bodyPart", "_classname", "", "_usedItem"];
[_patient, _usedItem] call ace_medical_treatment_fnc_addToTriageCard;
[_patient, "activity", "%1 applied %2", [name _medic, getText (configFile >> "CfgWeapons" >> _usedItem >> "displayName")]] call ace_medical_treatment_fnc_addToLog;

["bax_drugs_swayflex_fnc_swayHealLocal", [_patient], _patient] call CBA_fnc_targetEvent;
["bax_drugs_experiphrine_fnc_addExperiphrine", [_patient,_bodyPart,round bax_drugs_swayflex_dosage], _patient] call CBA_fnc_targetEvent;
