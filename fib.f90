

subroutine fib_series(num,fs)
      
      !Example function taken from numpy cookbook..      
      !Remember declaring varibales :)
      !This is how it's done :P


      integer(kind=8), intent(in) :: num
      real(kind=8), intent(out), dimension(num)::fs
      integer(kind=8)             :: i
      

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
