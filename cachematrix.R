## function makeCacheMatrix creates a list of functions using the matrix x. In this function 
## it returns accessor and modifier functions that help retrieve the x matrix or its inverse matrix (invMatrix)

makeCacheMatrix <- function(x = matrix()) {
  #initialises the inverse matrix to null
  invMatrix <- NULL
  
  #modifier and accessor functions of matrix x
  set <- function(y) {
    x <<- y
    invMatrix <<- NULL
  }
  get <- function() x 
  
  #modifier and accessor functions of the inverse matrix of x
  setInvMat <- function(y) invMatrix <<- y  
  getInvMat <- function() invMatrix  
  
  #returns the list of functions
  list(set = set, get = get,
       setInvMat = setInvMat,
       getInvMat = getInvMat)
}


## cacheSolve uses the R solve() function to calculate the inverse matrix of x
## if it's not been calculated yet. It will calculate the inverse matrix and store the inverse matrix as the 
## invMatrix variable of x
## the function cacheSolve assumes that the list imported has all the accessor or modifier
## functions to set or get the variable x or its invMatrix

cacheSolve <- function(x, ...) {
  
  invMat <- x$getInvMat()
  if(!is.null(invMat)) {
    message("getting cached data")  #if there's already an inverse matrix for x print message
  } else {
    mat <- x$get()
    message("No cached inverse matrix, calculating for you...") #if there's no cached inverse matrix, calculate it and tell the user
    invMat <- solve(mat, ...)  #calculate the inverse matrix 
    x$setInvMat(invMat) #set invMat as the inverse matrix for x 
  }
  invMat #return the inverse matrix
}




