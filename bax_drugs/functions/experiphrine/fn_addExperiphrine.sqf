
params ["_patient","_bodyPart","_dosage"];

for "_i" from 1 to _dosage do {
	["ace_medical_treatment_medicationLocal",[_patient, _bodyPart, "experiphrine"], _patient] call CBA_fnc_targetEvent;
};
