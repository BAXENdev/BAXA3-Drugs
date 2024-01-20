
[
	"bax_drugs_recoilRedux_boostPercent",
	"SLIDER",
	["Reduction Percent","How much recoil is reduced by per dose"],
	["BAX Drugs", "RecoilRedux"],
	[0.01,0.9,0.15,2]
] call CBA_fnc_addSetting;

[
	"bax_drugs_recoilRedux_duration",
	"TIME",
	["Duration","How long the effect lasts, in seconds"],
	["BAX Drugs", "RecoilRedux"],
	[0,3600,300]
] call CBA_fnc_addSetting;

[
	"bax_drugs_recoilRedux_dosage",
	"SLIDER",
	["Dosage","How much Experiphrine dosage is added by RecoilRedux"],
	["BAX Drugs", "RecoilRedux"],
	[0,10,2,0]
] call CBA_fnc_addSetting;
