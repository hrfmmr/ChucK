SinOsc s => NRev r => dac;
.2 => s.gain;
.1 => r.mix;

fun void low() {
    [0, 2, 4] @=> int low[];
    Std.mtof(40 + Std.rand2(-1,2) * 12 + 
    low[Std.rand2(0, low.cap()-1)] ) => s.freq;    
    140::ms => now;        
}

fun void high() {
    [0, 2, 4, 7] @=> int hi[];
    Std.mtof(40 + Std.rand2(1,4) * 12 + 
    hi[Std.rand2(0, hi.cap()-1)] ) => s.freq;
    100::ms => now;    
}

spork ~ low();

while (true) {
    high();
}
