---
title: "Type Bound Procedures"
teaching: 10
exercises: 0
questions:
- "What is a type bound procedure?"
objectives:
- "How do you create a type bound procedure."
keypoints:
- "A type bound procedure allows you to associate a procedure with a type."
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
    
    <span class="codehighlight">contains</span>
    
    <span class="codehighlight">procedure:: display</span>
    
  end type
  
  interface t_vector
    ...
  end interface
  
  type,extends(t_vector):: t_vector_3
  end type
  
  interface t_vector_3
    procedure:: create_size_3_vector
  end interface
  
  contains
  
<span class="codehighlight">  subroutine display(vec)
    implicit none
    class(t_vector),intent(in):: vec
    integer:: i
    
    print*, "t_vector:"
    print*, " num_elements=",vec%num_elements
    print*, " elements="
    do i=1,vec%num_elements
      print*, "  ",vec%elements(i)
    end do
  end subroutine</span>
  
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
  <span class="codehighlight">call numbers_none%display()</span>
  
  numbers_some=t_vector(4)
  numbers_some%elements(1)=2
  <span class="codehighlight">call numbers_some%display()</span>
  
  location=t_vector_3()
  location%elements(1)=1.0
  <span class="codehighlight">call location%display()</span>
  
end program
</pre></div></div>
{: .fortran}
[type_bound_procedures.f90](https://github.com/acenet-arc/fortran_oop_as_a_second_language/blob/gh-pages/code/type_bound_procedures.f90)
</div>

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
  
  type,extends(t_vector):: t_vector_3
  end type
  
  interface t_vector_3
    procedure:: create_size_3_vector
  end interface
  
  contains
  
  subroutine display(vec)
    implicit none
    class(t_vector),intent(in):: vec
    integer:: i
    
<div class="codehighlight">    select type (vec)
      class is (t_vector)
        print*, "t_vector:"
      class is (t_vector_3)
        print*, "t_vector_3:"
    end select</div>
    print*, " num_elements=",vec%num_elements
    print*, " elements="
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
[type_bound_procedures_select_type.f90](https://github.com/acenet-arc/fortran_oop_as_a_second_language/blob/gh-pages/code/type_bound_procedures_select_type.f90)
</div>

{% include links.md %}

