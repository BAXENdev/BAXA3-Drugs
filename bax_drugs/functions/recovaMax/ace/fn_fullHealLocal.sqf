
params ["_patient"];

// hint ("Full Heal: Energized kolto applied to " + (name _patient));

// diag_log format ["SFA Full Heal: Beginning Full Heal on %1",(name _patient)];
// diag_log format ["Client %1: event full heal at time",player,time];

if (!alive _patient) exitWith {};

if ((["ace_fire"] call ace_common_fnc_isModLoaded) && {[_patient] call ace_fire_fnc_isBurning}) then {
    _patient setVariable ["ace_fire_intensity", 0, true];
};

private _state = ([_patient, ace_medical_STATE_MACHINE] call CBA_statemachine_fnc_getCurrentState);

if (_patient getVariable ["ace_medical_inCardiacArrest", false]) then {
    ["ace_medical_CPRSucceeded", _patient] call CBA_fnc_localEvent;
    _state = ([_patient, ace_medical_STATE_MACHINE] call CBA_statemachine_fnc_getCurrentState);
};

_patient setVariable ["ace_medical_pain", 0, true];

if (bax_drugs_recovamax_regenerateBlood) then {
    _patient setVariable ["ace_medical_bloodVolume", 6.0 , true];
};

if (bax_drugs_recovamax_healWounds) then {
    {
        if (_x != 0) then {
            [_patient, "ACE_tourniquet"] call ace_common_fnc_addToInventory;
        };
    } forEach (_patient getVariable ["ace_medical_tourniquets", [0,0,0,0,0,0]]);
    _patient setVariable ["ace_medical_tourniquets", [0,0,0,0,0,0], true];
    _patient setVariable ["ace_medical_treatment_occludedMedications", nil, true];


    _patient setVariable ["ace_medical_openWounds", createHashMap, true];
    _patient setVariable ["ace_medical_bandagedWounds", createHashMap, true];
    _patient setVariable ["ace_medical_stitchedWounds", createHashMap, true];
    _patient setVariable ["ace_medical_isLimping", false, true];
    _patient setVariable ["ace_medical_fractures", [0,0,0,0,0,0], true];

    [_patient] call ace_medical_status_fnc_updateWoundBloodLoss;
};


_patient setVariable ["ace_medical_heartRate", 80, true];
_patient setVariable ["ace_medical_bloodPressure", [80, 120], true];
_patient setVariable ["ace_medical_peripheralResistance", 100, true];

_patient setVariable ["ace_medical_ivBags", nil, true];

_patient setVariable ["ace_medical_bodyPartDamage", [0,0,0,0,0,0], true];


if (_patient getVariable ["ACE_isUnconscious", false]) then {
    ["ace_medical_WakeUp", _patient] call CBA_fnc_localEvent;
    _state = ([_patient, ace_medical_STATE_MACHINE] call CBA_statemachine_fnc_getCurrentState);
};

_patient setVariable ["ace_medical_hemorrhage", 0, true];
_patient setVariable ["ace_medical_inPain", false, true];
_patient setVariable ["ace_medical_painSuppress", 0, true];

// Remove all medications aside from EnergizedKolto
if (bax_drugs_recovamax_removeMedications) then {
    _medications = _patient getVariable ["ace_medical_medications", []];
    _medications = _medications select { (_x select 1) isEqualTo "Experiphrine" };
    _patient setVariable ["ace_medical_medications", _medications, true];
};

_patient setVariable ["ace_medical_triageCard", [], true];

[_patient] call ace_medical_engine_fnc_updateDamageEffects;

_patient setDamage 0;

["ace_medical_FullHeal", _patient] call CBA_fnc_localEvent;
_state = ([_patient, ace_medical_STATE_MACHINE] call CBA_statemachine_fnc_getCurrentState);
