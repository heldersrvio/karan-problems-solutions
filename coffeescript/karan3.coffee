fibonacci = (n) ->
	if n == 1
		[1]
	else if n == 2
		[1, 1]
	else
		previous = fibonacci(n - 1)
		[...previous, previous[previous.length - 1] + previous[previous.length - 2]]

n = 10
console.log "#{fibonacci(n)}"
