---
title: "Modules"
teaching: 10
exercises: 0
questions:
- "What are modules?"
objectives:
- "Create a module."
keypoints:
- "Modules are used to package variables, types, and procedures together."
---

~~~
module m_common
  implicit none
  
  integer:: value_one
  real:: value_two
  
  contains
  
  subroutine print_values()
    implicit none
    print *, "value_one=",value_one
    print *, "value_two=",value_two
  end subroutine
  
end module

program main
  use m_common
  implicit none
  
  value_one=1
  value_two=2
  call print_values()
end program
~~~
{: .fortran}

{% include links.md %}

