# Disquiet Junto 0235: Dice Music

In a complete departure for me, I decided that this challenge - many different random number checks,
careful timings, and so on - were much better suited to automation than trying to run them myself.

I decided that I'd use ChucK for this - it's well-suited for dynamically adding and removing layers
and programatically arranging and synthesizing music.

I started out by stealing bits from the modal-o-matic example; this is a program that randomly plays
different configurations of the ModalBar unit generator. The only really salvageable part (for my
piece, anyway) was the code that did the different strikes and positions on the virtual bar. Playing
around with this, I decided to use a single note (middle C) with different strikes, positions, and 
presets on every note as an ostinato, and then create dynamic "shreds" that would compute the 
note timings and durations according to the original plan.

After a few hours of programming, mostly figuring out the timing, I was about to record the final
version, when I realized that because this was ChucK, I could actually run six independent copies 
of the piece at the same time; a couple of takes (every take is different!) and I had the final
six-layer version.

## Recommended performance

chuck nopulse.ck nopulse.ck nopulse.ck nopulse.ck nopulse.ck nopulse.ck pulse.ck


