
params ["_unit", "_fatigue", "_speed", "_overexhausted"];

ace_advanced_fatigue_lastBreath = ace_advanced_fatigue_lastBreath + 1;
if (_fatigue > 0.4 && {ace_advanced_fatigue_lastBreath > (_fatigue * -10 + 9)} && {!underwater _unit}) then {
    if (!isGameFocused) exitWith {};
    switch (true) do {
        case (_fatigue < 0.6): {
            playSound ("ace_advanced_fatigue_breathLow" + str(floor random 6));
        };
        case (_fatigue < 0.85): {
            playSound ("ace_advanced_fatigue_breathMid" + str(floor random 6));
        };
        default {
            playSound ("ace_advanced_fatigue_breathMax" + str(floor random 6));
        };
    };
    ace_advanced_fatigue_lastBreath = 0;
};

ace_advanced_fatigue_ppeBlackoutLast = ace_advanced_fatigue_ppeBlackoutLast + 1;
if (ace_advanced_fatigue_ppeBlackoutLast == 1) then {
    ace_advanced_fatigue_ppeBlackout ppEffectAdjust [1,1,0,[0,0,0,1],[0,0,0,0],[1,1,1,1],[10,10,0,0,0,0.1,0.5]];
    ace_advanced_fatigue_ppeBlackout ppEffectCommit 1;
} else {
    if (_fatigue > 0.85) then {
        if (ace_advanced_fatigue_ppeBlackoutLast > (100 - _fatigue * 100) / 3) then {
            ace_advanced_fatigue_ppeBlackout ppEffectAdjust [1,1,0,[0,0,0,1],[0,0,0,0],[1,1,1,1],[2,2,0,0,0,0.1,0.5]];
            ace_advanced_fatigue_ppeBlackout ppEffectCommit 1;
            ace_advanced_fatigue_ppeBlackoutLast = 0;
        };
    };
};

if (ace_advanced_fatigue_isSwimming) exitWith {
    if (ace_advanced_fatigue_setAnimExclusions isEqualTo []) then {
        _unit setAnimSpeedCoef linearConversion [0.7, 0.9, _fatigue, 1, 0.5, true];
    };
    if ((isSprintAllowed _unit) && {_fatigue > 0.7}) then {
        [_unit, "blockSprint", "ace_advanced_fatigue", true] call ace_common_fnc_statusEffect_set;
    } else {
        if ((!isSprintAllowed _unit) && {_fatigue < 0.7}) then {
            [_unit, "blockSprint", "ace_advanced_fatigue", false] call ace_common_fnc_statusEffect_set;
        };
    };
};
if ((getAnimSpeedCoef _unit) != 1) then {
    if (ace_advanced_fatigue_setAnimExclusions isEqualTo []) then {
		_speedFactors = _unit getVariable ["bax_drugs_adrenaphrine_boostFactors",0];
		_speedMultiplier = (1 + (_speedFactors * bax_drugs_adrenaphrine_boostPercent)) min bax_drugs_adrenaphrine_boostMax;
        _unit setAnimSpeedCoef _speedMultiplier;
    };
};

if (_overexhausted) then {
    [_unit, "forceWalk", "ace_advanced_fatigue", true] call ace_common_fnc_statusEffect_set;
} else {
    if (isForcedWalk _unit && {_fatigue < 0.7}) then {
        [_unit, "forceWalk", "ace_advanced_fatigue", false] call ace_common_fnc_statusEffect_set;
    } else {
        if ((isSprintAllowed _unit) && {_fatigue > 0.7}) then {
            [_unit, "blockSprint", "ace_advanced_fatigue", true] call ace_common_fnc_statusEffect_set;
        } else {
            if ((!isSprintAllowed _unit) && {_fatigue < 0.6}) then {
                [_unit, "blockSprint", "ace_advanced_fatigue", false] call ace_common_fnc_statusEffect_set;
            };
        };
    };
};

_unit setVariable ["ace_advanced_fatigue_aimFatigue", _fatigue];
