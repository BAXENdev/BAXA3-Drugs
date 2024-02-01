
#include "..\..\macros.hpp"

params ["_patient", "_bodyPart", "_classname"];

if (!alive _patient) exitWith {};
// if (bax_drugs_experiphrine_disableMaxDosage) exitWith {};

if (!ace_medical_treatment_advancedMedication) exitWith {
    switch (_classname) do {
        case "Morphine": {
            private _painSuppress = (_patient getVariable ["ace_medical_painSuppress", 0]);
            _patient setVariable ["ace_medical_painSuppress", (_painSuppress + 0.6) min 1, true];
        };
        case "Epinephrine": {
            ["ace_medical_WakeUp", _patient] call CBA_fnc_localEvent;
        };
    };
};

private _partIndex = ["head", "body", "leftarm", "rightarm", "leftleg", "rightleg"] find toLower _bodyPart;

if ((((_patient getVariable ["ace_medical_tourniquets", [0,0,0,0,0,0]]) select _partIndex) > 0)) exitWith {
    private _occludedMedications = _patient getVariable ["ace_medical_occludedMedications", []];
    _occludedMedications pushBack [_partIndex, _classname];
    _patient setVariable ["ace_medical_occludedMedications", _occludedMedications, true];
};

private _defaultConfig = configFile >> "ace_medical_treatment" >> "Medication";
private _medicationConfig = _defaultConfig >> _classname;

private _painReduce             = (if (isNumber (_medicationConfig >> "painReduce")) then {getNumber (_medicationConfig >> "painReduce")} else {getNumber (_defaultConfig >> "painReduce")});
private _timeInSystem           = bax_drugs_experiphrine_doseDuration;
private _timeTillMaxEffect      = bax_drugs_experiphrine_doseDuration;
private _maxDose                = bax_drugs_experiphrine_maxDosage;
private _viscosityChange        = (if (isNumber (_medicationConfig >> "viscosityChange")) then {getNumber (_medicationConfig >> "viscosityChange")} else {getNumber (_defaultConfig >> "viscosityChange")});
private _hrIncreaseLow          = (if (isArray (_medicationConfig >> "hrIncreaseLow")) then {getArray (_medicationConfig >> "hrIncreaseLow")} else {getArray (_defaultConfig >> "hrIncreaseLow")});
private _hrIncreaseNormal       = (if (isArray (_medicationConfig >> "hrIncreaseNormal")) then {getArray (_medicationConfig >> "hrIncreaseNormal")} else {getArray (_defaultConfig >> "hrIncreaseNormal")});
private _hrIncreaseHigh         = (if (isArray (_medicationConfig >> "hrIncreaseHigh")) then {getArray (_medicationConfig >> "hrIncreaseHigh")} else {getArray (_defaultConfig >> "hrIncreaseHigh")});
private _incompatibleMedication = (if (isArray (_medicationConfig >> "incompatibleMedication")) then {getArray (_medicationConfig >> "incompatibleMedication")} else {getArray (_defaultConfig >> "incompatibleMedication")});

private _heartRate = (_patient getVariable ["ace_medical_heartRate", 80]);
private _hrIncrease = [_hrIncreaseLow, _hrIncreaseNormal, _hrIncreaseHigh] select (floor ((0 max _heartRate min 110) / 55));
_hrIncrease params ["_minIncrease", "_maxIncrease"];
private _heartRateChange = _minIncrease + random (_maxIncrease - _minIncrease);

[_patient, _className, _timeTillMaxEffect, _timeInSystem, _heartRateChange, _painReduce, _viscosityChange] call ace_medical_status_fnc_addMedicationAdjustment;

[_patient, _className, _maxDose, _incompatibleMedication] call ace_medical_treatment_fnc_onMedicationUsage;

#ifdef DEBUG
_count = [_patient, "experiphrine"] call ace_medical_status_fnc_getMedicationCount;
_msg = format ["Add Experiphrine Local (After): Patient=%1 | Experiphrine Levels=%2/%3", name _patient,_count,bax_drugs_experiphrine_maxDosage,_dosage];
LOG(_msg)
#endif

