
params ["_patient"];

if !(alive _patient) exitWith {
};

bax_drugs_swayflex_swayFactors = bax_drugs_swayflex_swayFactors + 1;

[
	{
		params ["_patient"];
		!alive _patient;
	},
	{
		params ["_patient"];

		bax_drugs_swayflex_swayFactors = 0;
	},
	[_patient],
	bax_drugs_swayflex_reducedSwayTime,
	{
		bax_drugs_swayflex_swayFactors = (bax_drugs_swayflex_swayFactors - 1) max 0;
	}
] call CBA_fnc_waitUntilAndExecute;
