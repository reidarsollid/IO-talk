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
