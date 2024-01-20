
params ["_patient"];

if !(alive _patient) exitWith {
};

bax_drugs_recoilRedux_boostFactors = bax_drugs_recoilRedux_boostFactors + 1;
player setUnitRecoilCoefficient (0 max (1 - (bax_drugs_recoilRedux_boostFactors * bax_drugs_recoilRedux_boostPercent)));

[
	{
		params ["_patient"];
		!alive _patient;
	},
	{
		params ["_patient"];

		bax_drugs_recoilRedux_boostFactors = 0;
		player setUnitRecoilCoefficient 1;
	},
	[_patient],
	bax_drugs_recoilRedux_duration,
	{
		params ["_patient"];
		bax_drugs_recoilRedux_boostFactors = (bax_drugs_recoilRedux_boostFactors - 1) max 0;
		_patient setUnitRecoilCoefficient (1 - (bax_drugs_recoilRedux_boostFactors * bax_drugs_recoilRedux_boostPercent));
	}
] call CBA_fnc_waitUntilAndExecute;
