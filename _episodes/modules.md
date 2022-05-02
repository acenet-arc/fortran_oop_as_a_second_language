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

Modules allow procedures (functions and subroutines) and variables to be grouped together as well as some other constructs we will talk about later.

A module is declared as

~~~
modules <module name>
  
  <variable declarations go here>
  
  contains
  
  <procedures go here>
  
end module
~~~
{: .fortran}

The `contains` keyword separates the variable declarations and the procedure implementations.

Modules are not strictly an object oriented only Fortran feature but are very handy to group together related object oriented constructs as we shall see.

Here is an example of a Fortran module.

<div class="gitfile" markdown="1">
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
[modules.f90](https://github.com/acenet-arc/fortran_oop_as_a_second_language/blob/gh-pages/code/modules.f90)
</div>
In the program `main`, to be able to accesses the variables and procedures defined in the module you must indicate you wish to be able to access them with the `use` keyword followed by the module name you would like your program or procedure to have access to.

Compile and run
~~~
$ wget https://raw.githubusercontent.com/acenet-arc/fortran_oop_as_a_second_language/gh-pages/code/modules.f90
$ gfortran modules.f90 -o modules
$ ./modules
~~~
{: .bash}

~~~
 value_one=           1
 value_two=   2.00000000
~~~
{: .output}

{% include links.md %}

