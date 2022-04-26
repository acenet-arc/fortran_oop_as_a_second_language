---
title: "Interface Blocks"
teaching: 10
exercises: 0
questions:
- "What is an interface block?"
- "How can one be used to create a constructor for a derived type?"
objectives:
- "How do you create an interface block."
keypoints:
- "An interface block can act as either a block of definitions of your procedures (explicit interface) or as a means of associating different procedures with one common name (generic interface)."
---

<div class="gitfile" markdown="1">
~~~
module m_vector
  implicit none
  
  type t_vector
    integer:: num_elements
    real,dimension(:),allocatable:: elements
  end type
  
  interface t_vector
    procedure:: create_empty_vector
    procedure:: create_sized_vector
  end interface
  
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
  
  numbers_none=t_vector()
  print*, "numbers_none%num_elements=",numbers_none%num_elements
  
  numbers_some=t_vector(4)
  numbers_some%elements(1)=2
  print*, "numbers_some%num_elements=",numbers_some%num_elements
  print*, "numbers_some%elements(1)=",numbers_some%elements(1)
  
end program
~~~
{: .fortran}
[intefrace_blocks.f90](https://github.com/acenet-arc/fortran_oop_as_a_second_language/blob/gh-pages/code/intefrace_blocks.f90)
</div>

This example uses what is called a generic interface which allows you to map a number of procedures to one name. The specific procedure is chosen based on the supplied arguments. Therefore each procedure included in the generic interface must be distinguishable by it number and type of arguments.

The way this interface has been used to create a new object of a given derived type is pattern often reffered to as a constructor in object oriented programming languages.

{% include links.md %}

