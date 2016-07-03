int runLength;

fun int oneDsix() {
	return Math.random2(0,5);
}

fun int twoDsix() {
	return oneDsix() + oneDsix();
}

fun void pulse() {
	ModalBar modey => PRCRev r => Pan2 panner => dac;
  0.2 => r.mix;
	Std.mtof(45) => modey.freq;
	while (1) {
		(1 + oneDsix()) => modey.preset;
		Math.random2f( 0.2, 0.8 ) => modey.strikePosition;
		Math.random2f( 0.2, 0.6 ) => modey.strike;
		((oneDsix()+1)/3.0)-1.0  => panner.pan;
		(1/6.0)::second +=> now;
		if (runLength == 0) {
			5::second +=> now;
			me.exit();
		}
	}
}

1+ oneDsix() => runLength;;
<<< "Length: ", runLength >>>;

spork ~ pulse();
runLength * 60 => runLength;

while (runLength > 0) {
		<<< runLength >>>;
		1 -=> runLength;
		1::second +=> now;
}

// Make sure last note reverb trails off.
5::second => now;
