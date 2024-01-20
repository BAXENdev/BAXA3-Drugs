
params ["_patient"];

if !(alive _patient) exitWith {
};

bax_drugs_adrenaline_boostFactors = bax_drugs_adrenaline_boostFactors + 1;
// player setAnimSpeedCoef (1 + (bax_drugs_adrenaline_boostFactors * bax_drugs_adrenaline_boostPercent));
_speed = 1 + (bax_drugs_adrenaline_boostFactors * bax_drugs_adrenaline_boostPercent);
[_patient,_speed] remoteExec ["setAnimSpeedCoef"];

[
    {
        params ["_patient"];
        !alive _patient;
    },
    {
        params ["_patient"];

        bax_drugs_adrenaline_boostFactors = 0;
        player setAnimSpeedCoef 1;
    },
    [_patient],
    bax_drugs_adrenaline_duration,
    {
        params ["_patient"];
        bax_drugs_adrenaline_boostFactors = (bax_drugs_adrenaline_boostFactors - 1) max 0;
        _speed = 1 + (bax_drugs_adrenaline_boostFactors * bax_drugs_adrenaline_boostPercent);
        [_patient,_speed] remoteExec ["setAnimSpeedCoef"];
    }
] call CBA_fnc_waitUntilAndExecute;
