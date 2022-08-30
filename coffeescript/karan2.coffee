findE = (n) ->
	Math.round(Math.E * (10 ** n)) / (10 ** n)

n = 10
console.log "#{findE(n)}"
