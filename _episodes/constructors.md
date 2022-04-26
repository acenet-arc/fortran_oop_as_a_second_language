---
title: "Constructors"
teaching: 10
exercises: 0
questions:
- "What is a constructor?"
objectives:
- "How do you create a constructor."
keypoints:
- "A constructor is used to initialize a derive type object."
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

