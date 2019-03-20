#!/bin/bash


export CVXOPT_BLAS_LIB_DIR="${PREFIX}/lib"
export CVXOPT_BLAS_LIB="blas"
export CVXOPT_LAPACK_LIB="lapack"

export CVXOPT_BUILD_GSL=1
export CVXOPT_GSL_LIB_DIR="${PREFIX}/lib"
export CVXOPT_GSL_INC_DIR="${PREFIX}/include"

export CVXOPT_BUILD_FFTW=1
export CVXOPT_FFTW_LIB_DIR="${PREFIX}/lib"
export CVXOPT_FFTW_INC_DIR="${PREFIX}/include"

export CVXOPT_BUILD_GLPK=1
export CVXOPT_GLPK_LIB_DIR="${PREFIX}/lib"
export CVXOPT_GLPK_INC_DIR="${PREFIX}/include"

export CVXOPT_BUILD_DSDP=1
export CVXOPT_DSDP_LIB_DIR="${PREFIX}/lib"
export CVXOPT_DSDP_INC_DIR="${PREFIX}/include"

export CVXOPT_SUITESPARSE_LIB_DIR="${PREFIX}/lib"
export CVXOPT_SUITESPARSE_INC_DIR="${PREFIX}/include"

$PYTHON setup.py install --single-version-externally-managed --record=record.txt

cp src/C/cvxopt.h ${PREFIX}/include
