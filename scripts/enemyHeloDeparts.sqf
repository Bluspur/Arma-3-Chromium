_heloGroup = (group (driver enemyHelo));
{
	_x enableAI "MOVE";
} forEach units _heloGroup;
_wp = (group driver enemyHelo) addWaypoint [getMarkerPos "enemyHeloMarker",0];
_wp setWaypointStatements ["true", "{enemyHelo deleteVehicleCrew _x } forEach crew enemyHelo; deleteVehicle enemyHelo; deleteGroup _heloGroup;"];