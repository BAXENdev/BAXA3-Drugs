
params ["_patient","_count"];

if (_count > round bax_drugs_chronoclot_tickCount) exitWith {};

if !(alive _patient) exitWith {};

// stitch open wounds
_bandageAmount = bax_drugs_chronoclot_bandageCount;
{
	_bandageAmount = [_patient,_x,_bandageAmount] call bax_drugs_chronoclot_fnc_bandageWounds;	
	if (_bandageAmount == 0) then { break; };
} forEach ["head", "body", "leftarm", "rightarm", "leftleg", "rightleg"];

// stitch bandaged wounds
if (_bandageAmount > 0) then {
	{		
		_bandageAmount = [_patient,_x,_bandageAmount] call bax_drugs_chronoclot_fnc_stitchWounds;
		if (_bandageAmount == 0) then { break; };
	} forEach ["head", "body", "leftarm", "rightarm", "leftleg", "rightleg"];
};

[_patient, (-1 * bax_drugs_chronoclot_painFactor)] call ace_medical_fnc_adjustPainLevel;

[
	{
		params ["_patient"];
		!(alive _patient);
	},
	{},
	[_patient,_count],
	bax_drugs_chronoclot_tickDelay,
	{	
		params ["_patient","_count"];
		["bax_drugs_chronoclot_fnc_slowHealLocal", [_patient, (_count + 1)], _patient] call CBA_fnc_targetEvent;
	}
] call CBA_fnc_waitUntilAndExecute;
