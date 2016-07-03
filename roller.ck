int runLength;

fun int oneDsix() {
	return 1 + Math.random2(0,5);
}

fun int twoDsix() {
	return oneDsix() + oneDsix();
}

fun void pulse() {
	ModalBar modey => PRCRev r => Pan2 panner => dac;
  0.2 => r.mix;
	Std.mtof(45) => modey.freq;
	while (1) {
		oneDsix() => modey.preset;
		Math.random2f( 0.2, 0.8 ) => modey.strikePosition;
		Math.random2f( 0.2, 0.6 ) => modey.strike;
		(oneDsix()/3.0)-1.0  => panner.pan;
		(1/6.0)::second +=> now;
		if (runLength == 0) {
			5::second +=> now;
			me.exit();
		}
	}
}

oneDsix() => runLength;;
<<< "Length: ", runLength >>>;

spork ~ pulse();
runLength * 60 => runLength;

int sections, sectionLength, layers;
;
twoDsix() => sections;;
runLength/sections => sectionLength;
<<< sections, " sections ", sectionLength, "seconds each" >>>;

while (runLength > 0) {
		<<< runLength >>>;
		// Check to see if we've switched sections. We should get a
		// section switch on the first time through the loop.
		if (runLength % sectionLength == 0) {
			// Start a new section. Calculate the number of voices, the notes they'll
			// play, and the start point and duration of each note. Spork each one off
			// to a new player, which will terminate when out of notes.
			<<< "Section ", sections >>>;
			 oneDsix() => layers;
			<<< layers, " layers this section" >>>;
      int i;
			for (1 => i; i <= layers; 1 +=> i) {
				// generate notes and durations for this layer
				spork ~ playLayer(i);
			}
		}
		1 -=> runLength;
		1::second +=> now;
}

fun void playLayer(int layerType) {
	// each layer plays from 1 to 6 notes.
	// The notes are selected from one of six scales, chosen
	// by evaluating the global timestamp modulo 6, and the
	// specific note values and octave are determined by a
	// d6 roll. The sustain is chosen randomly as well, based
	// on the sectionLength. When this layer runs out of notes,
	// it exits.
	<<< "layer ", layerType, " starting" >>>;
	sectionLength::second => now;
	<<< "layer ", layerType, " stopping" >>>;
}

// Make sure last note reverb trails off.
5::second => now;
