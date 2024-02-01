
#include "..\macros.hpp"

params ["_patient"];

if !(alive _patient) exitWith {
};

bax_drugs_swayflex_swayFactors = bax_drugs_swayflex_swayFactors + 1;
#ifdef DEBUG
_msg = format ["SwayFlex Factors (add: %1): Count=%2", time, bax_drugs_swayflex_swayFactors];
LOG(_msg)
#endif

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
		#ifdef DEBUG
		_msg = format ["SwayFlex Factors (add: %1): %2", time, bax_drugs_swayflex_swayFactors];
		LOG(_msg)
		#endif
	}
] call CBA_fnc_waitUntilAndExecute;
