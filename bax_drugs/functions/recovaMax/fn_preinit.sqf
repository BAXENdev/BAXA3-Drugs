
[
	"bax_drugs_recovamax_regenerateBlood",
	"CHECKBOX",
	["Regenerate Blood","Regenerate all blood on use"],
	["BAX Drugs", "RecovaMax"],
	true
] call CBA_fnc_addSetting;

[
	"bax_drugs_recovamax_healWounds",
	"CHECKBOX",
	["Heal Wounds","Heal all wounds on use."],
	["BAX Drugs", "RecovaMax"],
	true
] call CBA_fnc_addSetting;

[
	"bax_drugs_recovamax_removeMedications",
	"CHECKBOX",
	["Remove Medications","Remove all medications from system (excluding Experiphrine)"],
	["BAX Drugs", "RecovaMax"],
	true
] call CBA_fnc_addSetting;

[
	"bax_drugs_recovaMax_dosage",
	"SLIDER",
	["Dosage","How much Experiphrine dosage is added by RecovaMax"],
	["BAX Drugs", "RecovaMax"],
	[0,10,7,0]
] call CBA_fnc_addSetting;
