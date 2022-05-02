---
title: "Derived Types"
teaching: 10
exercises: 0
questions:
- "What is a derived type?"
objectives:
- "Know how to create a derive type."
- "Know how to access members of a derive type."
keypoints:
- "A derived type allows you to package together a number of basic types that can then be thought of collectively as one new derived type."
---

While modules allow you to package variables together in such a way that you can directly refer to those variables, as we saw previously, derived types allow you to package together variables in such a way as to form a new compound variable. With this new compound variable you can refer to it as a group rather than only by the individual components.

To create a new derived type you use the following format.
~~~
type <type name>
  <member variable declarations>
end type
~~~
{: .fortran}

You can then declare new variables of this derived type as shown.
~~~
type(<type name>):: my_variable
~~~
{: .fortran}
Finally individual elements or members of a derived type variable, or **object**, can be accessed using the `%` operator.
~~~
my_variable%member1
~~~
{: .fortran}
The member variable, `member1`, is declared as part of the derived type.

A full example of creating a new derived type, `t_vector`, which holds an array of `real` values is shown below.

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

~~~
$ wget https://raw.githubusercontent.com/acenet-arc/fortran_oop_as_a_second_language/gh-pages/code/derived_types.f90
$ gfortran ./derived_types.f90 -o derived_types
$ ./derived_types
~~~
{: .bash}

~~~
 numbers%num_elements=           5
 numbers%elements(1)=   2.00000000
~~~
{: .output}


Creating new vectors is a pretty common thing that we want to do. Lets add some functions to create vectors to reduce the amount of repeated code. Lets create one to make empty vectors, `create_empty_vector` and one to create a vector of a given size allocating the required memory to hold all the elements of the vector, `create_sized_vector`.
<div class="gitfile" markdown="1">
<div class="language-plaintext fortran highlighter-rouge">
<div class="highlight">
<pre class="highlight">
module m_vector
  implicit none
  
  type t_vector
    integer:: num_elements
    real,dimension(:),allocatable:: elements
  end type
  
  contains
  
<div class="codehighlight">  type(t_vector) function create_empty_vector()
    implicit none
    create_empty_vector%num_elements=0
  end function</div>
  
<div class="codehighlight">  type(t_vector) function create_sized_vector(vec_size)
    implicit none
    integer,intent(in):: vec_size
    create_sized_vector%num_elements=vec_size
    allocate(create_sized_vector%elements(vec_size))
  end function</div>
  
end module

program main
  use m_vector
  implicit none
  type(t_vector) numbers_none,numbers_some
  
  numbers_none=<div class="codehighlight">create_empty_vector()</div>
  print*, "numbers_none%num_elements=",numbers_none%num_elements
  
  numbers_some=<div class="codehighlight">create_sized_vector(4)</div>
  numbers_some%elements(1)=2
  print*, "numbers_some%num_elements=",numbers_some%num_elements
  print*, "numbers_some%elements(1)=",numbers_some%elements(1)
  
end program
</pre></div></div>
{: .fortran}
[derived_types_init.f90](https://github.com/acenet-arc/fortran_oop_as_a_second_language/blob/gh-pages/code/derived_types_init.f90)
</div>

{% include links.md %}

