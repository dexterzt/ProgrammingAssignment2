## makeCacheMatrix: This function creates a special "matrix" object 
## that can cache its inverse.
## cacheSolve: This function computes the inverse of the special 
## "matrix" returned by makeCacheMatrix above. If the inverse has 
## already been calculated (and the matrix has not changed), then 
## the cacheSolve should retrieve the inverse from the cache.

## The first function, makeCacheMatrix creates a special "matrix", 
## which is really a list containing a function to
## 1.set the value of the matrix
## 2.get the value of the matrix
## 3.set the value of the inverse
## 4.get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinv <- function(inverse) inv <<- inverse
  getinv <- function() inv
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}

## The following function calculates the inverse of the special
## "matrix" created with the above function. It first checks to see
## if the inverse has already been calculated. If so, it gets the 
## inverse from the cache and skips the computation. Otherwise, it 
## calculates the inverse of the matrix and sets the value of the inverse
## in the cache via the setinv function.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inv <- x$getinv()
  if(!is.null(inv)) {
    message("getting cached matrix")
    return(inv)
  }
  matrix <- x$get()
  inv <- solve(matrix, ...)
  x$setinv(inv)
  inv
}