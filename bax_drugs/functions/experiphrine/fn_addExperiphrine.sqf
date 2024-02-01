
#include "..\macros.hpp"

params ["_patient","_bodyPart","_dosage"];

#ifdef DEBUG
_count = [_patient, "experiphrine"] call ace_medical_status_fnc_getMedicationCount;
_msg = format ["Add Experiphrine: Patient=%1 | Experiphrine Levels=%2/%3 | Adding=%4", name _patient,_count,bax_drugs_experiphrine_maxDosage,_dosage];
LOG(_msg)
#endif

for "_i" from 1 to _dosage do {
	["bax_drugs_experiphrine_fnc_addExperiphrineLocal",[_patient, _bodyPart, "experiphrine"], _patient] call CBA_fnc_targetEvent;
};
