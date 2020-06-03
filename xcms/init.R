print("Installing Data.Table, Bioconductor, and XCMS")

install.packages("data.table")

if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

#BiocManager::install("affy")
#BiocManager::install("vsn")
#BiocManager::install("mzR")
#BiocManager::install("mzID")
#BiocManager::install("XML")
#BiocManager::install("MSnbase")
BiocManager::install("xcms")
