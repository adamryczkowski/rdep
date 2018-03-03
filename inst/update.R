#!/bin/env Rscript
repo <- c(CRAN = "http://cran.us.r-project.org")
if(!require("devtools")) {install.packages("devtools", ask=FALSE, repos=repo);devtools::install_github("hadley/devtools")}
devtools::install_github("adamryczkowski/rdep")

package_list<-packrat:::recursivePackageDependencies("rdep",lib.loc = .libPaths()[1])


if(!require("packrat")) install.packages("packrat", ask=FALSE, repos=repo)
package_list<-packrat:::recursivePackageDependencies("rdep",lib.loc = .libPaths()[1])
if(!require("miniCRAN")) install.packages("miniCRAN", ask=FALSE, repos=repo)
all_packages <- suppressWarnings(miniCRAN::pkgDep(package_list, repos = repo))

pth<-getwd()
#to_update<-oldPackages(path = pth, repos = revolution, type = "source")[, 1:3]
#miniCRAN::makeRepo(pkgs_expanded, path = pth, repos = repo, type = "source")

existing_packages<-miniCRAN::pkgAvail(repos=pth)[,1]

to_install<-setdiff(all_packages, existing_packages)

miniCRAN::updatePackages(path=pth, repos=repo, type="source", ask=FALSE)
miniCRAN::addPackage(pkgs=to_install, path = pth, repos = repo, type = "source")
