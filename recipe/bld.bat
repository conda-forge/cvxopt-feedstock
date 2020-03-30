

set CVXOPT_MSVC=1
:: the cvxopt builder for suitesparse looks for static ".lib" libraries (not ".dll"!)
set "CVXOPT_BLAS_LIB_DIR=%LIBRARY_PREFIX%\lib"

set CVXOPT_BLAS_LIB=blas
set CVXOPT_LAPACK_LIB=lapack

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
