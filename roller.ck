fun int oneDsix() {
	return Math.random2(0,5);
}

fun int twoDsix() {
	return oneDsix() + oneDsix();
}

fun void piece(int pieceLength) {
	spork ~ pulse();
	// spork voices;
	pieceLength::second +=> now;
	return;
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
	}
}

int runLength;
1+ oneDsix() => runLength;;
<<< "Length: ", runLength >>>;

piece((1+ oneDsix()) * 60);

