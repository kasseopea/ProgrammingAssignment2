## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  invMatrix <- NULL
  set <- function(y) {
    x <<- y
    invMatrix <<- NULL
  }
  get <- function() x
  setInvMat <- function(y) invMatrixl <<- y
  getInvMat <- function() invMatrix
  list(set = set, get = get,
       setInvMat = setInvMat,
       getInvMat = getInvMat)
}
  

## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  
    invMat <- x$getInvMat()
    if(!is.null(invMat)) {
      message("getting cached data")
    }
    else{
      mat <- x$get()
      message("No cache, calculating...")
      invMat <- solve(mat, ...)
      x$setInvMat(invMat)
    }
    invMat
  }
  
  


