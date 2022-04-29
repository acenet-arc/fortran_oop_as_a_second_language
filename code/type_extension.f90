module m_vector
  implicit none
  
  type t_vector
    integer:: num_elements
    real,dimension(:),allocatable:: elements
  end type
  
  type,extends(t_vector):: t_vector_3
  end type
  
  contains
  
  type(t_vector) function create_empty_vector()
    implicit none
    create_empty_vector%num_elements=0
  end function
  
  type(t_vector) function create_sized_vector(vec_size)
    implicit none
    integer,intent(in):: vec_size
    create_sized_vector%num_elements=vec_size
    allocate(create_sized_vector%elements(vec_size))
  end function
  
  type(t_vector_3) function create_size_3_vector()
    implicit none
    create_size_3_vector%num_elements=3
    allocate(create_size_3_vector%elements(3))
  end function
  
end module

program main
  use m_vector
  implicit none
  type(t_vector) numbers_none,numbers_some
  type(t_vector_3) location
  
  numbers_none=create_empty_vector()
  print*, "numbers_none%num_elements=",numbers_none%num_elements
  
  numbers_some=create_sized_vector(4)
  numbers_some%elements(1)=2
  print*, "numbers_some%num_elements=",numbers_some%num_elements
  print*, "numbers_some%elements(1)=",numbers_some%elements(1)
  
  location=create_size_3_vector()
  location%elements(1)=1.0
  print*, "location%elements(1)=",location%elements(1)
  
end program