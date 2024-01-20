
[
	"bax_drugs_adrenaline_boostPercent",
	"SLIDER",
	["Speed Increase Percent ","How much speed is increased by per dose"],
	["BAX Drugs", "Adrenaline"],
	[0.01,1,0.12,2]
] call CBA_fnc_addSetting;

[
	"bax_drugs_adrenaline_duration",
	"TIME",
	["Duration","How long the effect lasts, in seconds"],
	["BAX Drugs", "Adrenaline"],
	[0,3600,300]
] call CBA_fnc_addSetting;

[
	"bax_drugs_adrenaline_dosage",
	"SLIDER",
	["Dosage","How much Experiphrine dosage is added by Adrenaline"],
	["BAX Drugs", "Adrenaline"],
	[0,10,2,0]
] call CBA_fnc_addSetting;
