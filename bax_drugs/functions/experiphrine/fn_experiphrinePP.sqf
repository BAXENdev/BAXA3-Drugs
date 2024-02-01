// 0 spawn {
//  hint "Start";
//  h1 = ppEffectCreate ["ColorCorrections",20];
//  h2 = ppEffectCreate ["RadialBlur",21];
 
//  h1 ppEffectAdjust [1,1,0,[0.7,0,0,0.4],[1,1,1,1],[0,0,0,0]];
//  h2 ppEffectAdjust [0.01,0.01,0.36,0.36];

//  [h1,h2] ppEffectCommit 3;
//  [h1,h2] ppEffectEnable true;
//  sleep 3;
//  hint "Mid";
//  h1 ppEffectAdjust [1,1,0,[0,0,0,0],[1,1,1,1],[0,0,0,0]];
//  h2 ppEffectAdjust [0,0,0,0]; 

//  [h1,h2] ppEffectCommit 1.3;
//  sleep 2;
//  ppEffectDestroy [h1,h2];
//  hint "Stop";
// };