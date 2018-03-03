pkgs<-c('Rcpp', 'stringr', 'readxl', 'Hmisc', 'R.utils', 'xlsx', 'readODS', 'boot', 'pander',
        'gridExtra', 'RColorBrewer', 'zipfR', 'ggrepel', 'lsr', 'tidyr', 'car', 'broom', 'ggfortify',
        'doMC', 'ROCR', 'glmnet', 'lubridate', 'mice', 'rstan', 'HDInterval',
        'curl', 'entropy', 'data.table', 'dplyr', 'dtplyr', 'ggplot2', 'purrr', 'purrrlyr')
repourl<-c(CRAN="http://cran.microsoft.com")

pkgList <- miniCRAN::pkgDep(pkgs, repos = repourl, type = "source", suggests = FALSE)

makeRepo(pkgList, path = '/mnt/ext4/Lib/Other/r-mirror', repos = repourl, type = c("source"))
