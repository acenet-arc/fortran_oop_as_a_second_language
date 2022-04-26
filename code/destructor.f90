module m_vector
  implicit none
  
  type t_vector
    integer:: num_elements
    real,dimension(:),allocatable:: elements
    
    contains
    
    procedure:: display
    final:: destructor
    
  end type
  
  interface t_vector
    procedure:: create_empty_vector
    procedure:: create_sized_vector
  end interface
  
  contains
  
  subroutine destructor(self)
    implicit none
    type(t_vector):: self
    
    print*, "t_vector destruction called"
    if (allocated(self%elements)) then
      deallocate(self%elements)
    endif
  end subroutine
  
  subroutine display(vec)
    implicit none
    class(t_vector),intent(in):: vec
    integer:: i
    
    print*, "t_vector:"
    print*, "  num_elements=",vec%num_elements
    print*, "  elements="
    do i=1,vec%num_elements
      print*, "  ",vec%elements(i)
    end do
  end subroutine
  
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
  
end module

subroutine make_vector_in_different_scope()
  use m_vector
  type(t_vector) test
  
  test=t_vector(4)
end subroutine

program main
  use m_vector
  implicit none
  integer:: temp
  type(t_vector) numbers_none,numbers_some
  
  numbers_none=t_vector()
  call numbers_none%display()
  
  numbers_some=t_vector(4)
  numbers_some%elements(1)=2
  call numbers_some%display()
  
  call make_vector_in_different_scope()
  
end program