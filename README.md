# F2PY_Example_Reference
This is a f2py compilation example, for any future reference.

Example compilation of f90 Code (interpolation routine from Numerical Recepies):

With out dependencies,


Comipling standalone routines..

   f2py2.7 -c fib.f90 -m fib
   This generates shared object and can be imported into python routines.

Issues to be aware of:

   1. Memory copy from python to FORTRAN starts if the dtype of both FORTRAN and python routine
      is not the same, choking the volatile memory leading to swapping. This can be easily avoided
      by using same data type, down to bit level.
      For example: If using numpy int8, use FORTRAN int (kind=1), if any other dtype is used
                  it will lead to copy of data from Python to FORTRAN.
   
      This is significant is large arrays are being used.

   2. Use F contigious array, not the default C-contigious.
 

 

Example Usage (in Python):
   
   In [1]: import fib

   In [2]: fib?  
   Type:        module
   String form: <module 'fib' from 'fib.so'>
   Docstring:  
   This module 'fib' is auto-generated with f2py (version:2).
   Functions:
   fs = fib_series(num)


   In [3]: fib.fib_series?
   Type:        fortran
   String form: <fortran object>
   Docstring:  
   fs = fib_series(num)
   
   Wrapper for ``fib_series``.

   Parameters
   ----------
   num : input int

   Returns
   -------
   fs : rank-1 array('f') with bounds (num)

   In [4]: fib.fib_series(11)
   Out[4]: 
   array([ 0., 1.,  1.,  2.,  3.,  5.,  8., 13., 21., 34., 55.],
      dtype=float32)

   
   
