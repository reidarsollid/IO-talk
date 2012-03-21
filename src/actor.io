slower := Object clone
faster := Object clone

slower start := method(
	wait(2); writeln("slowly")
)

faster start := method(
	wait(1); writeln("quickly")
)

writeln("Normal")
slower start; faster start
writeln; wait(1)
writeln("Actor")
slower @@start; faster @@start; wait(3)
