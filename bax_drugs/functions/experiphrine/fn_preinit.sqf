
[
	"bax_drugs_experiphrine_maxDosage",
	"SLIDER",
	["Max Dosage","The max safe dosage before an OD is possible. Add 1 to your number. If you want 10, put 11. 0 disables overdosing."],
	["Experimental Drugs", "Experiphrine (Dose)"],
	[0,31,11,0]
] call CBA_fnc_addSetting;

[
	"bax_drugs_experiphrine_doseDuration",
	"TIME",
	["Duration","How long a dose stays in the system for"],
	["Experimental Drugs", "Experiphrine (Dose)"],
	[0,3600,2400]
] call CBA_fnc_addSetting;

[
	"bax_drugs_experiphrine_checkLevel",
	"LIST",
	["Allow Check","Training level required to check experiphrine levels."],
	["Experimental Drugs", "Experiphrine (Dose)"],
	[
		[0,1,2],
		["Anyone","Medics","Doctors"],
		1
	]
] call CBA_fnc_addSetting;

[
	"bax_drugs_experiphrine_randomEffectCount",
	"SLIDER",
	["Effect Count","How many random effects are activated by Experiphrine"],
	["Experimental Drugs", "Experiphrine (Drug)"],
	[1,20,7,0]
] call CBA_fnc_addSetting;

[
	"bax_drugs_experiphrine_dosage",
	"SLIDER",
	["Dosage","How much Experiphrine dosage is added by Experiphrine"],
	["Experimental Drugs", "Experiphrine (Drug)"],
	[0,10,10,0]
] call CBA_fnc_addSetting;
