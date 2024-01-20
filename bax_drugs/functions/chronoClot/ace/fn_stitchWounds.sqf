
/*
 * Modified by: BAXENATOR
 * Date: 12/10/23
 * Source: https://github.com/acemod/ACE3/blob/master/addons/medical_treatment/functions/fnc_bandageLocal.sqf
 */


params ["_patient", "_bodyPart", "_amountBandage"];

_bodyPart = toLower _bodyPart;

private _bandagedWounds = (_patient getVariable ["ace_medical_bandagedWounds", createHashMap]);
private _woundsOnPart = _openWounds getOrDefault [_bodyPart, []];
if (_woundsOnPart isEqualTo []) exitWith {
    _amountBandage;
};

private _woundTotal = 0;
{
	_x params ["_woundID","_amountOf"];
	_woundTotal = _woundTotal + _amountOf;
} forEach _woundsOnPart;

if (_woundTotal == 0) exitWith { _amountBandage; };

while { _amountBandage > 0 && _woundTotal > 0 } do {
    _wound = _woundsOnPart select 0;
    _wound params ["_woundID", "_amountWound","_bleedRate","_woundDamage"];

    _amountReduced = _amountWound min _amountBandage;
    
    _amountBandage = _amountBandage - _amountReduced;
    _woundTotal = _woundTotal - _amountReduced;

    _treatedDamage = _treatedDamage + (_amountReduced * _woundDamage);

    [_patient,_bodyPart,[_woundID,_amountReduced,0,_woundDamage]] call bax_drugs_chronoclot_boosts_fnc_addStitch;
    if (_amountReduced == _amountWound) then {
        _woundsOnPart deleteAt 0;
    } else {
        _wound set [1, _amountWound - _amountReduced];
    };
};

_patient setVariable ["ace_medical_openWounds", _openWounds, true];

[_patient] call ace_medical_status_fnc_updateWoundBloodLoss;

_amountBandage;
