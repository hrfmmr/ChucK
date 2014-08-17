Noise n => Pan2 p => dac;
.01 => n.gain;

fun void sazanami(float cycle) {
    Math.sin(now/cycle::second*2*pi) => p.pan;
    100::ms => now;
}

while (true) {
	sazanami(3);
}
