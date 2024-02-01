
#include "..\macros.hpp"

params ["_patient"];

if !(alive _patient) exitWith {
};

// bax_drugs_adrenaphrine_boostFactors = bax_drugs_adrenaphrine_boostFactors + 1;
_boostFactors = (_patient getVariable ["bax_drugs_adrenaphrine_boostFactors",0]) + 1;
_patient setVariable ["bax_drugs_adrenaphrine_boostFactors",_boostFactors,true];
["ace_common_setAnimSpeedCoef",[_patient,1]] call cba_fnc_globalEvent;

// #ifdef DEBUG
// _msg = format ["RecoilRedux Call: AnimCoef", getAnimSpeedCoef _patient];
// LOG(_msg)
// #endif

// bax_drugs_adrenaphrine_boostFactors = bax_drugs_adrenaphrine_boostFactors + 1;
// player setAnimSpeedCoef (1 + (bax_drugs_adrenaphrine_boostFactors * bax_drugs_adrenaphrine_boostPercent));
// _speed = (1 + (bax_drugs_adrenaphrine_boostFactors * bax_drugs_adrenaphrine_boostPercent)) min bax_drugs_adrenaphrine_boostMax;


#ifdef DEBUG
_msg = format ["RecoilRedux Local: Factors:", _patient getVariable ["bax_drugs_adrenaphrine_boostFactors",0]];
LOG(_msg)
#endif

[
    {
        params ["_patient"];
        !alive _patient;
    },
    {
        params ["_patient"];

        _patient setVariable ["bax_drugs_adrenaphrine_boostFactors",0,true];
        ["ace_common_setAnimSpeedCoef",[_patient,1]] call cba_fnc_globalEvent;
    },
    [_patient],
    bax_drugs_adrenaphrine_duration,
    {
        params ["_patient"];

        _boostFactors = _patient getVariable ["bax_drugs_adrenaphrine_boostFactors",0] - 1;
        _patient setVariable ["bax_drugs_adrenaphrine_boostFactors",_boostFactors max 0,true];
        ["ace_common_setAnimSpeedCoef",[_patient,1]] call cba_fnc_globalEvent;

        // bax_drugs_adrenaphrine_boostFactors = (bax_drugs_adrenaphrine_boostFactors - 1) max 0;
        // _speed = (1 + (bax_drugs_adrenaphrine_boostFactors * bax_drugs_adrenaphrine_boostPercent)) min bax_drugs_adrenaphrine_boostMax;
        // [_patient,_speed] remoteExec ["setAnimSpeedCoef"];

        #ifdef DEBUG
        _msg = format ["RecoilRedux Local: Factors:", _patient getVariable ["bax_drugs_adrenaphrine_boostFactors",0]];
        LOG(_msg)
        #endif
    }
] call CBA_fnc_waitUntilAndExecute;
