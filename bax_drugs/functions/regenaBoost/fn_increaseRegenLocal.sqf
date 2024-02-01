
#include "..\macros.hpp"

params ["_patient"];

if !(alive _patient) exitWith {};

bax_drugs_regenaboost_amountFactors = bax_drugs_regenaboost_amountFactors + 1;
ace_advanced_fatigue_recoveryFactor = bax_drugs_regenaboost_amountFactors * (round bax_drugs_regenaboost_recoveryFactor) + bax_drugs_regenaboost_defaultValue;

#ifdef DEBUG
_msg = format ["RegenaBoost Factors (add: %1): Count=%2 RecoveryFactor=%3", time, bax_drugs_regenaboost_amountFactors, ace_advanced_fatigue_recoveryFactor];
LOG(_msg)
#endif

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
		ace_advanced_fatigue_recoveryFactor = bax_drugs_regenaboost_amountFactors * (round bax_drugs_regenaboost_recoveryFactor) + bax_drugs_regenaboost_defaultValue;
		
		#ifdef DEBUG
		_msg = format ["RegenaBoost Factors (add: %1): Count=%2 RecoveryFactor=%3", time, bax_drugs_regenaboost_amountFactors, ace_advanced_fatigue_recoveryFactor];
		LOG(_msg)
		#endif
	}
] call CBA_fnc_waitUntilAndExecute;
