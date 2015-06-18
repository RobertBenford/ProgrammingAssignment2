## Two functions to get and set matrix values then potentially compute these values
## more quickly and efficiently

## First function takes matrix as an arguement gets and sets the matrix values

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                        x <<- y
                        m <<- NULL
        }
        get <- function() x
        setmatrix <- function(matrix) m <<- matrix
        getmatrix <- function() m
        list(set = set, get = get,
              setmatrix = setmatrix,
              getmatrix = getmatrix)
}


## function computes the values for the matrx from prior function but checks 
## the cache first

cacheSolve <- function(x, ...) {
        m <- x$getmatrix()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- matrix(data, ...)
        x$setmatrix(m)
        m
        ## Return a matrix that is the inverse of 'x'
}