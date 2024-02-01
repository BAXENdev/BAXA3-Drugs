
[
	"bax_drugs_recovaMax_dosage",
	"SLIDER",
	["Dosage","How much Experiphrine dosage is added by RecovaMax"],
	["Experimental Drugs", "RecovaMax"],
	[0,10,7,0]
] call CBA_fnc_addSetting;

[
	"bax_drugs_recovaMax_delay",
	"TIME",
	["Delay","How long until the drug takes effect."],
	["Experimental Drugs", "RecovaMax"],
	[0,300,20]
] call CBA_fnc_addSetting;

[
	"bax_drugs_recovaMax_allowUse",
	"LIST",
	["Allow Use","Training level required to use RecovaMax"],
	["Experimental Drugs", "RecovaMax"],
	[
		[0,1,2],
		["Anyone","Medics","Doctors"],
		1
	]
] call CBA_fnc_addSetting;
