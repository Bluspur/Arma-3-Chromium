params ["_source"];
_chatterArray = ["RussianChatter01","RussianChatter02","RussianChatter03","RussianChatter04","RussianChatter05","RussianChatter06","RussianChatter07","RussianChatter08","RussianChatter09","RussianChatter10","RussianChatter11","RussianChatter12","RussianChatter13","RussianChatter14","RussianChatter15","RussianChatter16","RussianChatter17","RussianChatter18","RussianChatter19","RussianChatter20","RussianChatter21","RussianChatter22","RussianChatter23","RussianChatter24","RussianChatter25","RussianChatter26","RussianChatter27","RussianChatter28","RussianChatter29","RussianChatter30","RussianChatter31","RussianChatter32","RussianChatter33","RussianChatter34","RussianChatter35","RussianChatter36"];

while {alive _source} do {
	_chatter = selectRandom _chatterArray;
	_source say3D _chatter;
	sleep 15;
};
