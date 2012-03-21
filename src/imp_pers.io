firstPerson := Person clone setFirstName("Anakin") setLastName("Skywalker")

secondPerson := Person clone do(firstName := "Luke"; lastName := "Skywalker")

writeln(firstPerson firstName)

writeln(secondPerson firstName)

Person toString := method(
	"Firstname : " .. firstName .. " Lastname : " .. lastName
)

writeln(firstPerson toString)
writeln(secondPerson toString)

firstPerson firstName = "Darth"
firstPerson lastName = "Vader"

firstPerson ?notAslot
writeln(firstPerson ?toString)
