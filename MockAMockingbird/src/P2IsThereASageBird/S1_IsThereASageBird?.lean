import MockAMockingbird.src.P1ToMockAMockingbird.S2_Mockingbird
-- Ch 10 - Is There a Sage Bird?

/-- Inspector Craig of Scotland Yard was a man of many interests.
His activities in crime detection, law, logic, number machines,
retrograde analysis, vampirism, philosophy, and theology are familiar to readers of my earlier puzzle books.

He was equally
interested in ornithological logic - a field that applies combinatory logic to the study of birds. He was therefore delighted
to hear about the bird forest of the last chapter and decided to visit it and do some "inspecting."
When he arrived, the first thing he did was to interview
the bird sociologist of the forest, whose name was Professor Fowler.

Professor Fowler told Craig of the two laws C1 and
C2 , the basic composition law and the existence of a mockingbird, from the first problem of the last chapter. From this,
Inspector Craig was of course able to deduce that every bird was fond of at least one bird.
"However," explained Craig to Fowler, "I would like to
go a bit more deeply into the matter. I am what mathematical
logicians call a constructivist. I am not satisfied to know
merely that given any bird x, there exists somewhere in the
forest a bird y of which x is fond; I would like to know how,
given a bird x, I can find such a bird y. Is there by any chance
a bird in this forest that can supply such information?"
"I really don't understand your question," replied Fowler.
"What do you mean by a bird's supplying such information?"
"What I want to know," said Craig, "is whether or not
there is some special bird which, whenever I call out the name
of a bird x to it, will respond by naming a bird of which x is
fond. Do you know whether there is such a bird?"

"Oh, now I understand what you mean," said Fowler,
"and your question is a very interesting one! All I can tell you
is that it has been rumored that there is such a bird, but its
existence in this forest has not been substantiated. Such birds
are called sage birds - sometimes oracle birds - but, as I said, we
don't know if there are any sage birds here. According to some
history books, whose authenticity, however, is uncertain, sage
birds were first observed in Greece-in Delphi, in fact - which
might account for their also being called oracle birds. Accordingly, the Greek letter Θ is used to denote a sage bird.
If there really is such a bird, then it has the remarkable property
that for any bird x, x is fond of the bird ex-in other words,
x(Θx) = Θx. Or, as you might put it, if you call out x to Θ,
then Θ will name a bird of which x is fond.
"I have been trying to find a sage bird for a long time now,
but I'm afraid I haven't been very successful. If you could
throw any light on the matter, I would be enormously grateful!"

Inspector Craig rose, thanked Professor Fowler, and told
him that he would devote some thought to the matter. Craig
then spent the day walking through the forest concentrating
deeply on the problem. The next morning he returned to Professor Fowler.
"I doubt very much," said Craig, "that - fromjust the two
conditions C1 and C2 that you have told me - it can be determined whether or not this forest contains a sage bird.
"The trouble is this," he explained: "We know that there
is a mockingbird M. And we know that for any bird x there
is some bird y that composes x with the mockingbird M. Then,
as you know, x is fond of the bird yy. But given the bird x,
how does one find a bird y that composes x with M? If there
were some bird A that supplied this information, then the
problem would be solvable. But from what you have told me,
I have no reason to believe that there is such a bird."
"Oh, but there is such a bird," replied Fowler. "I'm sorry but I forgot to tell you that we do have a bird A such that
whatever bird x you call out to A, A will respond by naming
a bird that composes x with M. That is, for any bird x, the
bird Ax composes x with M."
"Splendid!" said Craig. "That completely solves your
problem: This forest does contain a sage bird. "
How did Craig know this?


"Wonderful!" said Fowler, after Craig proved that the forest
contained a sage bird.
"And now, what are your plans? You know, perhaps, that
this forest is only one of a whole chain of remarkable bird
forests. You should definitely visit Curry's Forest, and before
you come to that, you will pass through a forest unusually
rich in bird life. You will probably want to spend a good deal
of time there; there is so much to learn!"
Craig thanked Professor Fowler and departed for the next
forest. He little realized that this was only the beginning of a
summer-long venture!
-/

lemma sage_bird
(C1 : ∀ (A B : Bird), ∃ (C : Bird), is_composition C A B)
(C2 : ∃ (M : Bird), is_mockingbird M) :
true := by rfl
