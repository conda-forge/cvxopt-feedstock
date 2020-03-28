

set CVXOPT_MSVC=1
:: the cvxopt builder for suitesparse looks for static ".lib" libraries (not ".dll"!)
set "CVXOPT_BLAS_LIB_DIR=%LIBRARY_PREFIX%\lib"
if "%blas_impl%" == "mkl" (
    set CVXOPT_BLAS_LIB=mkl_rt
    set CVXOPT_LAPACK_LIB=mkl_rt
)
if "%blas_impl%" == "openblas" (
    :: see "openblas" output for windows here:
    :: https://github.com/conda-forge/openblas-feedstock/blob/master/recipe/meta.yaml
    set CVXOPT_BLAS_LIB=openblas
    :: see "blas" output for windows here:
    :: https://github.com/conda-forge/lapack-feedstock/blob/master/recipe/meta.yaml
    :: will be split on ';', see https://github.com/cvxopt/cvxopt/blob/master/setup.py
    set CVXOPT_LAPACK_LIB=lapack
)
if "%blas_impl%" == "blis" (
    :: see output for windows here:
    :: https://github.com/conda-forge/blis-feedstock/blob/master/recipe/meta.yaml
    set CVXOPT_BLAS_LIB=blis
    :: same as above for openblas
    set CVXOPT_LAPACK_LIB=lapack
)

set CVXOPT_BUILD_GSL=1
set "CVXOPT_GSL_LIB_DIR=%LIBRARY_PREFIX%\lib"
set "CVXOPT_GSL_INC_DIR=%LIBRARY_PREFIX%\include\gsl"

set CVXOPT_BUILD_FFTW=1
set "CVXOPT_FFTW_LIB_DIR=%LIBRARY_PREFIX%\lib"
set "CVXOPT_FFTW_INC_DIR=%LIBRARY_PREFIX%\include"

set CVXOPT_BUILD_GLPK=1
set "CVXOPT_GLPK_LIB_DIR=%LIBRARY_PREFIX%\lib"
set "CVXOPT_GLPK_INC_DIR=%LIBRARY_PREFIX%\include"

set CVXOPT_BUILD_DSDP=1
set "CVXOPT_DSDP_LIB_DIR=%LIBRARY_PREFIX%\lib"
set "CVXOPT_DSDP_INC_DIR=%LIBRARY_PREFIX%\include"

:: recipe/meta.yaml downloads the suitesparse-sources to this folder; build it
set "CVXOPT_SUITESPARSE_SRC_DIR=%SRC_DIR%\suitesparse"

%PYTHON% setup.py install --single-version-externally-managed --record=record.txt

copy src\C\cvxopt.h %LIBRARY_PREFIX%\include
