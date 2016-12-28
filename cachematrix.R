
## Takes a matrix x as input and creates a special matrix object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
    inverse <- NULL
    st <- function(a){
    x <<- a
    inverse <<- NULL
  }
  get <- function() x
  sinv <- function(solveMatrix) inverse <<- solveMatrix
  ginv <- function() inverse
  list(set = set, get = get, sinv = sinv, ginv = ginv)
}


## computes the inverse by calling the functions of the above makeCacheMatrix

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inverse <- x$ginv()
        mat <- x$get()
        inverse <- solve(mat)
        x$sinv(inverse)
        inverse      
}
