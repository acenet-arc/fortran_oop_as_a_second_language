module m_common
  implicit none
  private
  
  integer:: value_one
  real:: value_two
  
  public:: print_values
  contains
  
  subroutine print_values()
    implicit none
    print *, "value_one=",value_one
    print *, "value_two=",value_two
  end subroutine
  
end module

program main
  use m_common
  implicit none
  
  !value_one=1
  !value_two=2
  call print_values()
end program