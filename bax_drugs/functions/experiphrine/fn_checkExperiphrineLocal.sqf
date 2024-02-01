
#include "..\macros.hpp"

params ["_medic", "_patient"];

#ifdef DEBUG
_msg = format ["Check Experiphrine Local: Medic=%1 | Patient=%2", name _medic, name _patient];
LOG(_msg)
#endif

_experiphrineCount = [_patient,"experiphrine"] call ace_medical_status_fnc_getMedicationCount;

_logMsg = format ["%1 checked EXP2 Levels: %2mL/10mL",name _medic,_experiphrineCount];
[_patient,"quick_view",_logMsg,[]] call ace_medical_treatment_fnc_addToLog;

_displayMsg = format ["%1 EXP2 Levels: %2mL/10mL",name _patient,_experiphrineCount];
["ace_common_displayTextStructured",[_displayMsg,1.5,_medic],_medic] call CBA_fnc_targetEvent;
