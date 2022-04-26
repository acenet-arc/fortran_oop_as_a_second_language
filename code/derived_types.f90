module m_vector
  implicit none
  
  type t_vector
    integer:: num_elements
    real,dimension(:),allocatable:: elements
  end type
  
end module

program main
  use m_vector
  implicit none
  type(t_vector) numbers
  
  numbers%num_elements=5
  allocate(numbers%elements(numbers%num_elements))
  numbers%elements(1)=2
  print*, "numbers%num_elements=",numbers%num_elements
  print*, "numbers%elements(1)=",numbers%elements(1)
  
end program