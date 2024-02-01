
[
	"bax_drugs_adrenaphrine_boostPercent",
	"SLIDER",
	["Speed Increase Percent ","How much speed is increased by per dose"],
	["Experimental Drugs", "Adrenaphrine"],
	[0.01,1,0.12,2]
] call CBA_fnc_addSetting;

[
	"bax_drugs_adrenaphrine_boostMax",
	"SLIDER",
	["Speed Increase Max ","Max Speed Boost"],
	["Experimental Drugs", "Adrenaphrine"],
	[1.2,3,1.8,2]
] call CBA_fnc_addSetting;

[
	"bax_drugs_adrenaphrine_duration",
	"TIME",
	["Duration","How long the effect lasts, in seconds"],
	["Experimental Drugs", "Adrenaphrine"],
	[0,3600,300]
] call CBA_fnc_addSetting;

[
	"bax_drugs_adrenaphrine_dosage",
	"SLIDER",
	["Dosage","How much Experiphrine dosage is added by Adrenaphrine"],
	["Experimental Drugs", "Adrenaphrine"],
	[0,10,2,0]
] call CBA_fnc_addSetting;
