subroutine fib_series(num,fs)
      
      integer(kind=1), intent(in) :: num
      real(kind=4)   , intent(out)::fs(num) 
      integer(kind=1)             :: i
      

      do i=1,num
         if (i.EQ.1) then
            fs(i) = 0.0

         elseif (i.EQ.2) then
            fs(i) = 1.0

         else
            fs(i) = fs(i-1) + fs(i-2)

        endif
      enddo
      end subroutine
