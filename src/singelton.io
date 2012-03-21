Singelton := Object clone
Singelton clone := Singelton

testOne := Singelton clone
testTwo := Singelton clone

writeln(TestOne == TestTwo)
