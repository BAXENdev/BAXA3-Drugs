
[
	"bax_drugs_regenaboost_recoveryFactor",
	"SLIDER",
	["Recovery Factor","Adjusted recovery factor that is active while the drug is in effect. recommended ""rapid"" regen values are between 10 to 30"],
	["Experimental Drugs", "RegenaBoost"],
	[0,100,8,0]
] call CBA_fnc_addSetting;

[
	"bax_drugs_regenaboost_duration",
	"TIME",
	["Duration","How long the drug lasts"],
	["Experimental Drugs", "RegenaBoost"],
	[0,3600,300]
] call CBA_fnc_addSetting;

[
	"bax_drugs_regenaBoost_dosage",
	"SLIDER",
	["Dosage","How much Experiphrine dosage is added by RegenaBoost"],
	["Experimental Drugs", "RegenaBoost"],
	[0,10,2,0]
] call CBA_fnc_addSetting;
