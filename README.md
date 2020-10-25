# F2PY_Example_Reference
This is a f2py compilation example, for any future reference.

Example compilation of f90 Code (interpolation routine from Numerical Recepies):

With out dependencies,

f2py2.7 -c  internal_standalone.f90 -L/usr/lib/x86_64-linux-gnu/ -lfftw3 -m internal_loop2 -DF2PY_REPORT_ON_ARRAY_COPY=1

Issues to be aware of:

1. Memory copy from python to FORTRAN starts if the dtype of both FORTRAN and python routine
   is not the same, choking the volatile memory leading to swapping. This can be easily avoided
   by using same data type, down to bit level.
   For example: If using numpy int8, use FORTRAN int (kind=1), if any other dtype is used
                 it will lead to copy of data from Python to FORTRAN.
   
   This is significant is large arrays are being used.

2. Use F contigious array, not the default C-contigious.


