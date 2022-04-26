---
title: "Derived Types"
teaching: 10
exercises: 0
questions:
- "What is a derived type?"
objectives:
- "How to you make a derived type."
keypoints:
- "A derived type allows you to package together a number of basic types that can then be thought of collectively as one new derived type."
---

A vector derived type.

<div class="gitfile" markdown="1">
~~~
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
~~~
{: .fortran}
[derived_types.f90](https://github.com/acenet-arc/fortran_oop_as_a_second_language/blob/gh-pages/code/derived_types.f90)
</div>


Write some functions to create vectors as this is something we will want to do commonly.
<div class="gitfile" markdown="1">
~~~
module m_vector
  implicit none
  
  type t_vector
    integer:: num_elements
    real,dimension(:),allocatable:: elements
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
  
end module

program main
  use m_vector
  implicit none
  type(t_vector) numbers_none,numbers_some
  
  numbers_none=create_empty_vector()
  print*, "numbers_none%num_elements=",numbers_none%num_elements
  
  numbers_some=create_sized_vector(4)
  numbers_some%elements(1)=2
  print*, "numbers_some%num_elements=",numbers_some%num_elements
  print*, "numbers_some%elements(1)=",numbers_some%elements(1)
  
end program
~~~
{: .fortran}
[derived_types_init.f90](https://github.com/acenet-arc/fortran_oop_as_a_second_language/blob/gh-pages/code/derived_types_init.f90)
</div>

{% include links.md %}

