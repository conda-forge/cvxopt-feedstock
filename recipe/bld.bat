
set CVXOPT_MSVC=1
set "CVXOPT_BLAS_LIB_DIR=%LIBRARY_LIB%"
set CVXOPT_BLAS_LIB=openblas
set CVXOPT_LAPACK_LIB=openblas

set CVXOPT_BUILD_GLPK=1
set "CVXOPT_GLPK_LIB_DIR=%LIBRARY_LIB%"
set "CVXOPT_GLPK_INC_DIR=%LIBRARY_INC%"

set "CVXOPT_SUITESPARSE_LIB_DIR=%LIBRARY_LIB%"
set "CVXOPT_SUITESPARSE_INC_DIR=%LIBRARY_INC%\suitesparse"

%PYTHON% setup.py install --single-version-externally-managed --record=record.txt
