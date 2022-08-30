findE = (n) ->
	Math.round(Math.PI * (10 ** n)) / (10 ** n)

n = 10
console.log "#{findE(n)}"
