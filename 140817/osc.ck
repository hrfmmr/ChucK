fun void snd( float hz, float g )
{
    SinOsc s => NRev r => dac;
	.1 => r.mix;
	g => s.gain;
    hz => s.freq;
    
    1::samp => now;
    while (true) {
        rythm(1, 3)::second => now;
    }
}

fun int rythm(int from, int to) {
	Std.rand2(from, to) => int r;
	return r;
}

fun float gain() {
	[1,3,5,7] @=> int coef[];
	.02 * Std.rand2(0, coef.cap()-1) => float g;
	return g;
}

fun float hz() {
    [0,2,4,7] @=> int hi[];
    Std.mtof(40 + Std.rand2(1,4) * 12 + 
    hi[Std.rand2(0,hi.cap()-1)]) => float f;
    return f;
}

fun void sporking() {
    spork ~ snd(hz(), gain());
}


while (true) {
   sporking();
   rythm(1,3)::second => now;
}
