
/*
 * Modified by: BAXENATOR
 * Date: 12/10/23
 * Source: https://github.com/acemod/ACE3/blob/master/addons/medical_treatment/functions/fnc_bandageLocal.sqf
 */


params ["_patient", "_bodyPart", "_amountBandage"];

_bodyPart = toLower _bodyPart;

private _openWounds = (_patient getVariable ["ace_medical_openWounds", createHashMap]);
private _woundsOnPart = _openWounds getOrDefault [_bodyPart, []];

private _treatedDamage = 0;
private _clearConditionCache = false;

private _woundTotal = 0;
{
	_x params ["_woundID","_amountOf"];
	_woundTotal = _woundTotal + _amountOf;
} forEach _woundsOnPart;

if (_woundTotal == 0) exitWith {
    _amountBandage;
};

while { _amountBandage > 0 && _woundTotal > 0 } do {
    _worstWoundIndex = [_woundsOnPart] call bax_drugs_chronoclot_fnc_findWorstWound;

    _worstWound = _woundsOnPart select _worstWoundIndex;
    _worstWound params ["_woundID", "_amountWound","_bleedRate","_woundDamage"];
    
    _amountReduced = _amountWound min _amountBandage;
    
    _amountBandage = _amountBandage - _amountReduced;
    _woundTotal = _woundTotal - _amountReduced;

    _treatedDamage = _treatedDamage + (_amountReduced * _woundDamage);

    [_patient,_bodyPart,[_woundID,_amountReduced,0,_woundDamage]] call bax_drugs_chronoclot_fnc_addStitch;
    if (_amountReduced == _amountWound) then {
        _woundsOnPart deleteAt _worstWoundIndex;
        _clearConditionCache = true;

    } else {
        _worstWound set [1, _amountWound - _amountReduced];
    };
};

_patient setVariable ["ace_medical_openWounds", _openWounds, true];

[_patient] call ace_medical_status_fnc_updateWoundBloodLoss;

if (
    ace_medical_limping == 1
    && {_clearConditionCache}
    && {_bodyPart in ["leftleg", "rightleg"]}
    && {_patient getVariable ["ace_medical_isLimping", false]}
) then {
    [_patient] call ace_medical_engine_fnc_updateDamageEffects;
};

if (ace_medical_treatment_clearTrauma == 2) then {
    ;
    private _partIndex = ["head", "body", "leftarm", "rightarm", "leftleg", "rightleg"] find _bodyPart;
    private _bodyPartDamage = _patient getVariable ["ace_medical_bodyPartDamage", [0,0,0,0,0,0]];
    private _newDam = (_bodyPartDamage select _partIndex) - _treatedDamage;

    
    if (_newDam < 0.05) then {
        _bodyPartDamage set [_partIndex, 0];
    } else {
        _bodyPartDamage set [_partIndex, _newDam];
    };
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


if (_clearConditionCache) then {
    private _nearPlayers = (_patient nearEntities ["CAManBase", 6]) select {_x call ace_common_fnc_isPlayer};
    ["ace_interact_menu_clearConditionCaches", [], _nearPlayers] call CBA_fnc_targetEvent;
};

_amountBandage;
