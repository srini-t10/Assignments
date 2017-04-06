#*******************************************************************************************************
# Function Name: 
# This script defines two functions makeCacheMatrix() and cacheSolve()
#
# Arguments: 
# 1. makeCacheMatrix() takes one argument 'x' which is a matrix
# 2. cacheSolve() takes one argument 'x' which should be a special matrix returned by makeCacheMatrix()
#
# Description: 
# 1. makeCacheMatrix(),
#    This function creates a special "matrix" object that can cache its inverse.
#
# 2. cacheSolve(), 
#    This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
#    If the inverse has already been calculated (and the matrix has not changed), then the 
#    cachesolve retrieves the inverse from the cache.
#
# Author: srini-t10 (https://github.com/srini-t10)
#
# Version: 1.0
#
#*******************************************************************************************************

# Begin makeCacheMatrix funtion ... 

makeCacheMatrix <- function(x = matrix()) {
      m <- NULL
      set <- function(y) {
            x <<- y
            m <<- NULL
      }
      get <- function() x
      setInverse <- function(matrix) m <<- solve(matrix)
      getInverse <- function() m
      list(set = set, get = get,
           setInverse = setInverse,
           getInverse = getInverse)
}

# End makeCacheMatrix function

# Begin cacheSolve funtion ... 

cacheSolve <- function(x) {
      m <- x$getInverse()
      if(!is.null(m)) {
            message("Getting cached data..")
            return(m)
      }
      data <- x$get()
      m <- solve(data)
      x$setInverse(data)
      m
}

# End cacheSolve funtion 

#****************************************************************************************************