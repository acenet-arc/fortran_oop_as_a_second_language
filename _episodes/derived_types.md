---
title: "Derived Types"
teaching: 0
exercises: 0
questions:
- "What is a derived type?"
objectives:
- "How to you make a derived type."
keypoints:
- "A derived type allows you to package together a number of basic types that can then be thought of collectively as one new derived type."
---

~~~
module m_shape
  implicit none
  
  type t_shape
    integer:: num_sides
  end type
  
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

