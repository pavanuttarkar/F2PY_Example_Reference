subroutine geo(delay_now,&
               W_geometric,& 
               ha,& 
               loc,& 
               dec,& 
               len1)
        !declaring variables
        !Remeber intent out is variables that are sent out of the
        !subroutine..


        
        integer(kind=4), intent(in)                 :: len1 
        real(kind=8), intent(in)                    :: dec
        real(kind=8), intent(in),dimension(3)       :: loc
        real(kind=8), intent(out), dimension(len1)               :: delay_now
        real(kind=8), intent(out), dimension(len1)               :: W_geometric
        real(kind=8), intent(in), dimension(len1)                :: ha
        integer(kind=4)                    :: i 
        REAL(kind=8), DIMENSION(2027520) :: X, Y, Z
        REAL(kind=8)               :: c_per_mus = 299.792458, pi = 3.14159265359
        do i = 1, len1
                X(i)            = (loc(1)*cos(dec*pi/180))/c_per_mus
                Y(i)            = (-1.0*loc(2)*cos(dec*pi/180))/c_per_mus
                Z(i)            = (loc(3)*sin(dec*pi/180))/c_per_mus
                W_geometric(i)  = (X(i)*cos(ha(i)*pi/180) +Y(i)*sin(ha(i)*pi/180) + Z(i))
                delay_now(i)    = X(i)*cos(ha(i)*pi/180) +Y(i)*sin(ha(i)*pi/180)
        enddo
        !return

end subroutine
