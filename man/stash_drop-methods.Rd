% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/stash.r
\docType{methods}
\name{stash_drop}
\alias{stash_drop}
\alias{stash_drop,git_repository-method}
\alias{stash_drop,git_stash-method}
\title{Drop stash}
\usage{
stash_drop(object, ...)

\S4method{stash_drop}{git_repository}(object, index)

\S4method{stash_drop}{git_stash}(object)
}
\arguments{
\item{object}{The stash \code{object} to drop or a zero-based
integer to the stash to drop. The last stash has index 0.}

\item{...}{Additional arguments affecting the stash_drop}

\item{index}{Zero based index to the stash to drop. Only used when
\code{object} is a \code{git_repository}.}
}
\value{
invisible NULL
}
\description{
Drop stash
}
\examples{
\dontrun{
## Initialize a temporary repository
path <- tempfile(pattern="git2r-")
dir.create(path)
repo <- init(path)

# Configure a user
config(repo, user.name="Alice", user.email="alice@example.org")

# Create a file, add and commit
writeLines("Hello world!", file.path(path, "test.txt"))
add(repo, 'test.txt')
commit(repo, "Commit message")

# Change file
writeLines(c("Hello world!", "HELLO WORLD!"), file.path(path, "test.txt"))

# Create stash in repository
stash(repo)

# Change file
writeLines(c("Hello world!", "HeLlO wOrLd!"), file.path(path, "test.txt"))

# Create stash in repository
stash(repo)

# View stashes
stash_list(repo)

# Drop git_stash object in repository
stash_drop(stash_list(repo)[[1]])

## Drop stash using an index to stash
stash_drop(repo, 0)

# View stashes
stash_list(repo)
}
}
\keyword{methods}
