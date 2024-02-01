
#include "..\macros.hpp"

params ["_medic", "_patient", "_bodyPart"];

#ifdef DEBUG
_msg = format ["Check Experiphrine: Medic=%1 | Patient=%2", name _medic, name _patient];
LOG(_msg)
#endif

["bax_drugs_experiphrine_fnc_checkExperiphrineLocal", [_medic, _patient], _patient] call CBA_fnc_targetEvent;
