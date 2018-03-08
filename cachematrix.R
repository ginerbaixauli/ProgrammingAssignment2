## Matrix inversion is usually a costly computation so it may be a good idea
## to caching the inverse of a matrix rather than compute it repeatedly.
## In this assignment we are going to write a pair of functions that cache 
## the inverse of a matrix.

## makeCacheMatrix: This function gets a matrix and creates a special matrix
## object that can cache its inverse. It will return a list.

makeCacheMatrix <- function(x = matrix()) {
  
  # Set inverse matrix to null
  im <- NULL
  
  # Set original matrix
  set <- function(y) {
    x <<- y
    im <<- NULL
  }
  
  # Get function and original matrix
  get <- function() x
  
  # Set inverse matrix
  setinv <- function(solve) im <<- solve
  
  # Get inverse matrix
  getinv <- function() im
  
  # Include set, get, setinv and getinv into a list
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}


## cacheSolve: This function computes the inverse of the special matrix
## returned by makeCacheMatrix above. If the inverse has already been
## calculated and the matrix has not changed, then this function should
## retrieve the inverse from the cache. If not, it will get the matrix
## and compute the inverse.

cacheSolve <- function(x, ...) {
  
  # Get inverse matrix
  im <- x$getinv()
  
  # Check if inverse matrix is cached
  if(!is.null(im)) {
    message("getting cached inverse matrix")
    
    # If cached, return inverse matrix
    return(m)
  }
  
  # Else, get original matrix and compute inverse
  mat <- x$get()
  im <- solve(mat, ...)
  
  # Set inverse matrix in cache
  x$setinv(im)
  
  # Return inverse matrix
  im
}
