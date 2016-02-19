## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

##Creating a "special matrix" that can cache its inverse
  
  makeCacheMatrix <- function(x = matrix()) {
 -
 +        Trying<-NULL
 +        Good <- function(y) {
 +                x <<- y
 +                Trying<-NULL
 +                }
 +        Better <- function() x
 +        setInv <- function(inverse) Trying <<-inverse
 +        getInv <- function() Trying
 +        list(Good = Good, Better = Better,
 +             setInv = setInv,
 +             getInv = getInv)
  }
  
 -
 -## Write a short comment describing this function
 +## The function cacheSolve returns the inverse of the matrix created with 
 +##the makeCacheMatrix function. If the cached inverse is available, cacheSolve retrieves it, and if 
 +##not, it computes, caches, and returns it.
  
  cacheSolve <- function(x, ...) {
 -        ## Return a matrix that is the inverse of 'x'
 +        Contrary <- x$getInv()
 +        if(!is.null(Contrary)) {
 +                message("getting cached data")
 +                return(Contrary)
 +                }
 +        data <- x$Better()
 +        Contrary <- solve(data, ...)
 +        x$setInv(Contrary)
 +        Contrary
  }

