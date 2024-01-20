
params ["_wounds"];

// Even if there is one wound whose bleed rate is zero, this still returns a valid result.
private _worstIndex = 0;
private _worstRate = 0;

{
	_x params ["_woundID","_amountOf","_bleedRate","_damage"];
	// If im just removing total number of wounds, i want to reduce the bleed rate as much as possible
	// I dont care if its 1 wound. 1 wound with .5 is worst than 5 wounds with 0.1
	// If I only have 3 wounds to remove, the 1 needs removed first
	// _bleedRate = _amountOf * _bleedRate;

	if (_bleedRate > _worstRate) then {
		_worstIndex = _forEachIndex;
		_worstRate = _bleedRate;
	};
} forEach _wounds;

// return worst wound index
_worstIndex;
