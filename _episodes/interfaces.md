---
title: "Interface Blocks"
teaching: 0
exercises: 0
questions:
- "What is an interface block?"
objectives:
- "How do you create an interface block."
keypoints:
- "An interface block can act as either a block of definitions of your procedures (explicit interface) or as a means of associating different procedures with one common name (generic interface)."
---

TODO: which should come first, type bound procedures or interface blocks?

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

