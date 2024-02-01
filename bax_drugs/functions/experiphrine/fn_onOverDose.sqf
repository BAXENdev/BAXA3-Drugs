
#include "..\macros.hpp"

params ["_target","_usedDrug","_overDoseDrugs"];

#ifdef DEBUG
_msg = format ["Experiphrine OverDose: Patient=%1", name _target];
LOG(_msg)
#endif

["ace_medical_CriticalVitals", _target] call CBA_fnc_localEvent;
[_target,true] call ace_medical_status_fnc_setCardiacArrestState;
_bloodVolume = _target getVariable ["ace_medical_bloodVolume",6];
_bloodVolume = (_bloodVolume - 1) max 3.75;
if (_bloodVolume > 3.75) then {
	_bloodVolume = random [3.75, (_bloodVolume min 4.2), (_bloodvolume max 4.2)];
};
_target setVariable ["ace_medical_bloodVolume",_bloodVolume,true];
