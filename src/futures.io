futureResult := URL with("http://iteraconsulting.no/") @fetch

writeln("Do something immediatly while fetch goes on in background.....")

writeln("This will block until the result is available.")

writeln("fetched ", futureResult size, " bytes")

