
["bax_drugs_swayflex_fnc_swayHealLocal",bax_drugs_swayflex_fnc_swayHealLocal] call CBA_fnc_addEventHandler;

bax_drugs_swayflex_swayFactors = 0;
["multiplier",{
	(
		1 - bax_drugs_swayflex_swayFactors * bax_drugs_swayflex_reducedSwayFactor
	) max 0.1;
},"bax_drugs_swayflex_swayFactors"] call ace_common_fnc_addSwayFactor;
