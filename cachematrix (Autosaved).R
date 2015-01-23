##
## Coursera R-Programming "Programming Assignment 2"
## The assignment is to write a pair of functions that cache the inverse of a matrix.
##
##
## Results are included below (after the code)
##

##
## This function creates a special "matrix" object that can cache its inverse.
##

makeCacheMatrix <- function(x = numeric()) {
	cache <- NULL
	
##	
## Set the value of the vector
## This function can actually be bypassed if the matrix is defined
##   in makeCacheMatrix.
##   I like to run makeCacheMatrix "empty" and define the matrix here.	
##

	setMatrix <- function(newValue) {
		x <<- newValue
		cache <<- NULL
	}
	
##	
## Get the value of the vector
##

	getMatrix <- function() {
		x
	}
	
##	
## Cache the inverse of the vector
##

	cacheInverse <- function(solve) {
		cache <<- solve
	}
	
##	
## Get the inverse of the vector
##
	getInverse <- function() {
		cache
	}
	
##	
## List out what has just been done
##
	list(setMatrix=setMatrix, getMatrix=getMatrix, cacheInverse=cacheInverse, getInverse=getInverse)
}

##
## This function computes the inverse of the special "matrix" returned by makeCacheMatrix. If the inverse has
## already been calculated (and the matrix has not changed), then the cacheSolve should retrieve the inverse
## from the cache.
##

cacheSolve <- function(y, ...) {
	
##
## Check to see if this work has already been done.
##	
	inverse <- y$getInverse()
	if(!is.null(inverse)) {
		message("getting cached data")
		return(inverse)
	}
	
##
## Get Matrix, solve, cacheInverse, and print inverse
##	
	data <- y$getMatrix()
	inverse <- solve(data)
	y$cacheInverse(inverse)
	inverse
}
}

##
## RESULTS
##

## > a <- makeCacheMatrix()
## > summary(a)
             Length Class  Mode    
## setMatrix    1      -none- function
## getMatrix    1      -none- function
## cacheInverse 1      -none- function
## getInverse   1      -none- function
## > 
## > a$setMatrix( matrix(c(5,10,15,20), nrow=2, ncol=2) )
## > a$getMatrix()
##     [,1] [,2]
## [1,]    5   15
## [2,]   10   20
## > 
## > cacheSolve(a)
##     [,1] [,2]
## [1,] -0.4  0.3
## [2,]  0.2 -0.1
## > 
## > cacheSolve(a)
## getting cached data
##     [,1] [,2]
## [1,] -0.4  0.3
## [2,]  0.2 -0.1
