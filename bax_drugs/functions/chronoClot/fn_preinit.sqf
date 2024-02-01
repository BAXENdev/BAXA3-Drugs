
[
	"bax_drugs_chronoclot_tickCount",
	"SLIDER",
	["Tick Count","How many times ChronoClot will bandage the patient."],
	["Experimental Drugs", "ChronoClot"],
	[1,100,20,0]
] call CBA_fnc_addSetting;

[
	"bax_drugs_chronoclot_tickDelay",
	"TIME",
	["Tick Delay","The delay for between stim ticks"],
	["Experimental Drugs", "ChronoClot"],
	[0,600,5]
] call CBA_fnc_addSetting;

[
	"bax_drugs_chronoclot_bandageCount",
	"SLIDER",
	["Bandage Count","The number of wounds bandaged per tick."],
	["Experimental Drugs", "ChronoClot"],
	[1, 100, 1, 0]
] call CBA_fnc_addSetting;

[
	"bax_drugs_chronoclot_painFactor",
	"SLIDER",
	["Pain Reduction","The amount of pain reduced each tick"],
	["Experimental Drugs", "ChronoClot"],
	[0, 1, 0.1, 2]
] call CBA_fnc_addSetting;

[
	"bax_drugs_chronoclot_dosage",
	"SLIDER",
	["Dosage","How much Experiphrine dosage is added by ChronoClot"],
	["Experimental Drugs", "ChronoClot"],
	[0,10,5,0]
] call CBA_fnc_addSetting;
