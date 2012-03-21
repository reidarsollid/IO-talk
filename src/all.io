//Slide 6 + 7
NewObject := Object clone

anInstance := NewObject clone

NewObject aSlot := "Some text in a slot"

NewObject aMethod := method(
	"This is a method assigned to a slot" println
) 

writeln(anInstance aSlot)

anInstance aMethod

//Slide 8
Singelton := Object clone
Singelton clone := Singelton

testOne := Singelton clone
testTwo := Singelton clone

writeln(TestOne == TestTwo)

//Slide 9
Dog := Object clone
Dog bark := method(writeln("woof!"))

fido := Dog clone
fido bark := method(
    writeln("ruf!")
    super(bark)
)

fido bark

//Slide 10
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

//Slide 12 1/2
//Same as myList := List clone
myList := list(1,2,3)
writeln(myList)
myList prepend(0)
writeln(myList)
myList append(4)
writeln(myList)

Range //Loading range
1 to (5) foreach(v, v println)
myList foreach(string, write(string))
writeln

anotherList := list(65, 21, 122)
anotherList foreach(index, value, write(index, ":", value, ","))
writeln
anotherList foreach(println)

oddList := myList select(isOdd)
writeln(oddList)

doubleList := myList map(v, v*2)
writeln(doubleList)

//Slide 14
myMap := Map clone
myMap atPut("name", "spungebob")
myMap atPut("lastName", "Squarepants")

writeln(myMap)

writeln(myMap asJson)

writeln(myMap asList)

//Slide 15
vizzini := Object clone
vizzini talk := method(
	"Fezzik, are there rocks ahead?" println
	yield
	"No more rhymes now, I mean it." println
	yield
)

fezzik := Object clone
fezzik rhyme := method(
	yield
	"If there are, we'll all be dead." println
	yield
	"Anybody want a peanut?" println
)

vizzini @@talk; fezzik @@rhyme

Coroutine currentCoroutine pause

//Slide 16
futureResult := URL with("http://iteraconsulting.no/") @fetch

writeln("Do something immediatly while fetch goes on in background.....")

writeln("This will block until the result is available.")

writeln("fetched ", futureResult size, " bytes")

futureResult streamTo(File with(ic.htm))

//Slide 17
//person.io
Person := Object clone do(
	firstName ::= ""
	lastName ::= ""
)

//importing person
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

firstPerson ?notAslot //Same as if(firstPerson getSlot("firstName"), )
writeln(firstPerson ?toString)

//Slide 18
//webserver.io
WebRequest := Object clone do(
	handleSocket := method(aSocket,
		aSocket streamReadNextChunk
		request := aSocket readBuffer betweenSeq("GET ", " HTTP")
		//dir := System launchPath .. "/webserv"
		dir := Directory currentWorkingDirectory .. "/webserv"
		writeln(dir)
		f := File with(dir .. request) 
		if(f exists, f streamTo(aSocket), aSocket streamWrite("not found"))
		aSocket close
	)
)

WebServer := Server clone do(
	setPort(8000)
	handleSocket := method(aSocket, 
		WebRequest clone @handleSocket(aSocket)
	)
)


WebServer start
//hello.html -> /webserv
<html>
<body>
	<h1>Hello Io-lang webserver</h1>
	<a href="http://www.iolanguage.com//">Visit Io-lang</a>
</body>	
</html>
