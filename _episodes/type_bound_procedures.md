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

~~~
module m_shape
  implicit none
  
  type t_shape
    integer:: num_sides
  end type
  
  !TODO: add some kind of basic interface
  
end module

program main
  use m_shape
  implicit none
  type(t_shape) octogon
  
  octogon%num_sides=8
  print*, "octogon%num_sides=",octogon%num_sides
  
end program
~~~
{: .fortran}

{% include links.md %}

