---
title: "Destructors"
teaching: 10
exercises: 0
questions:
- "What is a destructor?"
objectives:
- "How do you create a destructor."
keypoints:
- "A destructor is used to perform clean up when an object goes out of scope."
---

<div class="gitfile" markdown="1">
<div class="language-plaintext fortran highlighter-rouge">
<div class="highlight">
<pre class="highlight">
module m_vector
  implicit none
  
  type t_vector
    integer:: num_elements
    real,dimension(:),allocatable:: elements
    
    contains
    
    procedure:: display
    <div class="codehighlight">final:: destructor_vector</div>
    
  end type
  
  interface t_vector
    ...
  end interface
  
  type,extends(t_vector):: t_vector_3
    
    <div class="codehighlight">contains</div>
    
    <div class="codehighlight">final:: destructor_vector_3</div>
    
  end type
  
  interface t_vector_3
    procedure:: create_size_3_vector
  end interface
  
  contains
  
<div class="codehighlight">  subroutine destructor_vector(self)
    implicit none
    type(t_vector):: self
    
    if (allocated(self%elements)) then
      deallocate(self%elements)
    endif
  end subroutine</div>
  
<div class="codehighlight">  subroutine destructor_vector_3(self)
    implicit none
    type(t_vector_3):: self
    
    if (allocated(self%elements)) then
      deallocate(self%elements)
    endif
  end subroutine</div>
  
  subroutine display(vec)
    ...
  end subroutine
  
  type(t_vector) function create_empty_vector()
    ...
  end function
  
  type(t_vector) function create_sized_vector(vec_size)
    ...
  end function
  
  type(t_vector_3) function create_size_3_vector()
    ...
  end function
  
end module

program main
  use m_vector
  implicit none
  type(t_vector) numbers_none,numbers_some
  type(t_vector_3) location
  
  numbers_none=t_vector()
  call numbers_none%display()
  
  numbers_some=t_vector(4)
  numbers_some%elements(1)=2
  call numbers_some%display()
  
  location=t_vector_3()
  location%elements(1)=1.0
  call location%display()
  
end program
</pre></div></div>
{: .fortran}
[destructor.f90](https://github.com/acenet-arc/fortran_oop_as_a_second_language/blob/gh-pages/code/destructor.f90)
</div>

{% include links.md %}

