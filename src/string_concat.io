first := "Square"
last := "Pants"

shortpants := first .. last

writeln(shortpants)

//Interpolate
Person := Object clone
Person giveName := method(name ,
	"My name is #{name}" interpolate
)

reidar := Person clone
writeln(reidar giveName("Reidar"))
