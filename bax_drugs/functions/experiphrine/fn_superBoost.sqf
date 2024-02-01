
#include "..\macros.hpp"

params ["_medic", "_patient", "_bodyPart", "_classname", "", "_usedItem"];
[_patient, _usedItem] call ace_medical_treatment_fnc_addToTriageCard;
[_patient, "activity", "%1 applied %2", [name _medic, getText (configFile >> "CfgWeapons" >> _usedItem >> "displayName")]] call ace_medical_treatment_fnc_addToLog;

#ifdef DEBUG
_msg = format ["Experiphrine Call: Medic=%1 | Patient=%2", name _medic, name _patient];
LOG(_msg)
#endif

["bax_drugs_experiphrine_fnc_superBoostLocal", [_patient], _patient] call CBA_fnc_targetEvent;
["bax_drugs_experiphrine_fnc_addExperiphrine", [_patient,_bodyPart,round bax_drugs_experiphrine_dosage], _patient] call CBA_fnc_targetEvent;
