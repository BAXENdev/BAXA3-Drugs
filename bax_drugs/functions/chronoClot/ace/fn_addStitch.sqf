
/*
 * Modified by: BAXENATOR
 * Date: 12/10/23
 * Source: https://github.com/acemod/ACE3/blob/master/addons/medical_treatment/functions/fnc_surgicalKitProgress.sqf
 */

params ["_patient", "_bodyPart", "_wound"];

// private _bandagedWounds = (_patient getVariable ["ace_medical_bandagedWounds", createHashMap]);
// private _bandagedWoundsOnPart = _bandagedWounds get _bodyPart;

// if (_bandagedWoundsOnPart isEqualTo []) exitWith {};

// private _treatedWound = _bandagedWoundsOnPart deleteAt (count _bandagedWoundsOnPart - 1);

_wound params ["_treatedID", "_treatedAmountOf", "", "_treatedDamageOf"];

// Check if we need to add a new stitched wound or increase the amount of an existing one
private _stitchedWounds = (_patient getVariable ["ace_medical_stitchedWounds", createHashMap]);
private _stitchedWoundsOnPart = _stitchedWounds getOrDefault [_bodyPart, [], true];

private _woundIndex = _stitchedWoundsOnPart findIf {
    _x params ["_classID"];
    _classID == _treatedID
};

if (_woundIndex == -1) then {
    _stitchedWoundsOnPart pushBack _wound;
} else {
    private _wound = _stitchedWoundsOnPart select _woundIndex;
    _wound set [1, (_wound select 1) + _treatedAmountOf];
};

if (ace_medical_treatment_clearTrauma == 1) then {
    private _partIndex = ["head", "body", "leftarm", "rightarm", "leftleg", "rightleg"] find _bodyPart;
    ;
    private _bodyPartDamage = _patient getVariable ["ace_medical_bodyPartDamage", []];
    _bodyPartDamage set [_partIndex, (_bodyPartDamage select _partIndex) - (_treatedDamageOf * _treatedAmountOf)];
    _patient setVariable ["ace_medical_bodyPartDamage", _bodyPartDamage, true];
    ;

    switch (_bodyPart) do {
        case "head": { [_patient, true, false, false, false] call ace_medical_engine_fnc_updateBodyPartVisuals; };
        case "body": { [_patient, false, true, false, false] call ace_medical_engine_fnc_updateBodyPartVisuals; };
        case "leftarm";
        case "rightarm": { [_patient, false, false, true, false] call ace_medical_engine_fnc_updateBodyPartVisuals; };
        default { [_patient, false, false, false, true] call ace_medical_engine_fnc_updateBodyPartVisuals; };
    };
};

// _patient setVariable ["ace_medical_bandagedWounds", _bandagedWounds, true];
_patient setVariable ["ace_medical_stitchedWounds", _stitchedWounds, true];


if (
    ace_medical_limping == 2
    && {_patient getVariable ["ace_medical_isLimping", false]}
    && {_bodyPart in ["leftleg", "rightleg"]}
) then {
    ;
    ["ace_medical_engine_updateDamageEffects", _patient, _patient] call CBA_fnc_targetEvent;
};
