
params ["_patient"];

if !(alive _patient) exitWith {};

bax_drugs_regenaboost_amountFactors = bax_drugs_regenaboost_amountFactors + 1;
ace_advanced_fatigue_recoveryFactor = bax_drugs_regenaboost_amountFactors * bax_drugs_regenaboost_recoveryFactor + bax_drugs_regenaboost_defaultValue;

[
	{
		params ["_patient"];
		!alive _patient;
	},
	{
		bax_drugs_regenaboost_amountFactors = 0;
		ace_advanced_fatigue_recoveryFactor = bax_drugs_regenaboost_defaultValue;
	},
	[_patient],
	bax_drugs_regenaboost_duration,
	{
		bax_drugs_regenaboost_amountFactors = bax_drugs_regenaboost_amountFactors - 1;
		ace_advanced_fatigue_recoveryFactor = bax_drugs_regenaboost_amountFactors * bax_drugs_regenaboost_recoveryFactor + bax_drugs_regenaboost_defaultValue;
	}
] call CBA_fnc_waitUntilAndExecute;
