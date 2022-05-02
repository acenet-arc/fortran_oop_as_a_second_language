---
title: "Operator Overloading"
teaching: 10
exercises: 0
questions:
- "What is operator overloading?"
objectives:
- "Overload the '+' operator."
keypoints:
- ""
---

<div class="gitfile" markdown="1">
<div class="language-plaintext fortran highlighter-rouge">
<div class="highlight">
<pre class="highlight">
module m_vector
  implicit none
  
  type t_vector
    ...
  end type
  
  interface t_vector
    ...
  end interface
  
<div class="codehighlight">  interface operator(+)
    procedure:: add_vectors
  end interface</div>
  
  type,extends(t_vector):: t_vector_3
    ...
  end type
  
  interface t_vector_3
    procedure:: create_size_3_vector
  end interface
  
  contains
  
<div class="codehighlight">  type(t_vector) function add_vectors(left,right)
    implicit none
    type(t_vector),intent(in):: left, right
    integer:: i,total_size,result_i
    
    total_size=left%num_elements+right%num_elements
    add_vectors=create_sized_vector(total_size)
    
    !copy over left vector elements
    do i=1, left%num_elements
      add_vectors%elements(i)=left%elements(i)
    end do
    
    !copy over right vector elements
    result_i=left%num_elements+1
    do i=1,right%num_elements
      add_vectors%elements(result_i)=right%elements(i)
      result_i=result_i+1
    enddo
    
  end function</div>
  
  subroutine destructor_vector(self)
    ...
  end subroutine
  
  subroutine destructor_vector_3(self)
    ...
  end subroutine
  
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
  type(t_vector) numbers_none,numbers_some,<div class="codehighlight">numbers_less,numbers_all</div>
  type(t_vector_3) location
  
  numbers_none=t_vector()
  call numbers_none%display()
  
  numbers_some=t_vector(4)
  numbers_some%elements(1)=1
  numbers_some%elements(2)=2
  numbers_some%elements(3)=3
  numbers_some%elements(4)=4
  call numbers_some%display()
  
  location=t_vector_3()
  location%elements(1)=1.0
  call location%display()
  
  numbers_less=t_vector(2)
  numbers_less%elements(1)=5
  numbers_less%elements(2)=6
  call numbers_less%display()
  
<div class="codehighlight">  numbers_all=numbers_some+numbers_less
  call numbers_all%display()</div>
  
end program
</pre></div></div>
{: .fortran}
[operators.f90](https://github.com/acenet-arc/fortran_oop_as_a_second_language/blob/gh-pages/code/operators.f90)
</div>

{% include links.md %}

