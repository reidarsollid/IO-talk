//Same as myList := List clone
myList := list(1,2,3)
writeln(myList)
myList prepend(0)
writeln(myList)
myList append(4)
writeln(myList)

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
Range //Loading Range
1 to (5) foreach(v, v println)
