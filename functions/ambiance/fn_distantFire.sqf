//Object - the object emitting the sound. If sound position is specified this param is ignored
_AsoundSource = player; 
_AsoundSources = [ambientSource01,ambientSource02,ambientSource03,ambientSource04,ambientSource05];
_Asound = "";

//Volume (Number) Default: 1
_Avolume = 5;

_soundsArray = [
"A3\Sounds_F\environment\ambient\battlefield\battlefield_explosions1.wss",
"A3\Sounds_F\environment\ambient\battlefield\battlefield_explosions2.wss",
"A3\Sounds_F\environment\ambient\battlefield\battlefield_explosions3.wss",
"A3\Sounds_F\environment\ambient\battlefield\battlefield_explosions4.wss",
"A3\Sounds_F\environment\ambient\battlefield\battlefield_explosions5.wss",
"A3\Sounds_F\environment\ambient\battlefield\battlefield_firefight1.wss",
"A3\Sounds_F\environment\ambient\battlefield\battlefield_firefight2.wss",
"A3\Sounds_F\environment\ambient\battlefield\battlefield_firefight3.wss",
"A3\Sounds_F\environment\ambient\battlefield\battlefield_firefight4.wss"
];

while {true} do
{
_AsoundPosition = getPosASL (selectRandom _AsoundSources);
_ASound = selectRandom _soundsArray;
playSound3D [_ASound, _AsoundSource, false, _AsoundPosition, _Avolume, 1, 0];
sleep 10;
};