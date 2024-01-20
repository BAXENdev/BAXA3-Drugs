
[
	"bax_drugs_swayflex_reducedSwayFactor",
	"SLIDER",
	["Reduction Percent","How much sway is reduced by per dose"],
	["BAX Drugs", "SwayFlex"],
	[0.1,0.9,0.25,2]
] call CBA_fnc_addSetting;

[
	"bax_drugs_swayflex_reducedSwayTime",
	"TIME",
	["Duration","How long the effect lasts, in seconds"],
	["BAX Drugs", "SwayFlex"],
	[0,3600,300]
] call CBA_fnc_addSetting;

[
	"bax_drugs_swayFlex_dosage",
	"SLIDER",
	["Dosage","How much Experiphrine dosage is added by SwayFlex"],
	["BAX Drugs", "SwayFlex"],
	[0,10,1,0]
] call CBA_fnc_addSetting;
