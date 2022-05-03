---
title: "Operator Overloading"
teaching: 10
exercises: 0
questions:
- "What is operator overloading?"
objectives:
- "Overload the '+' operator."
keypoints:
- "Common Fortran operators can be overloaded to work with your custom derived types."
---

Previously in the [Interface Blocks](../interfaces/) episode, we saw how interfaces can be used to map one procedure name onto different underlying procedures based on the number, order, and type or arguments passed to the procedure. However, these interface blocks can be used with more than just procedures they can also be used for operators already defined in Fortran such as `+`,`-`, `*`,`/`,`==`,`/=`, and also operators such as `.gt.`, `.le.` etc.

Below we have added the `+` operator which adds the contents of one of our `t_vector` objects to the contents of another one of our `t_vector` objects creating a new vector that is the combined size of the two vectors and contains all the elements of both vectors.

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
  type(t_vector) <div class="codehighlight">numbers_some,numbers_less,numbers_all</div>
  
<div class="codehighlight">  numbers_some=t_vector(4)
  numbers_some%elements(1)=1
  numbers_some%elements(2)=2
  numbers_some%elements(3)=3
  numbers_some%elements(4)=4
  print*, ""
  print*, "numbers_some"
  call numbers_some%display()</div>
  
<div class="codehighlight">  numbers_less=t_vector(2)
  numbers_less%elements(1)=5
  numbers_less%elements(2)=6
  print*, ""
  print*, "numbers_less"
  call numbers_less%display()</div>
  
<div class="codehighlight">  numbers_all=numbers_some+numbers_less
  print*, ""
  print*, "numbers_all"
  call numbers_all%display()</div>
  
end program
</pre></div></div>
{: .fortran}
[operators.f90](https://github.com/acenet-arc/fortran_oop_as_a_second_language/blob/gh-pages/code/operators.f90)
</div>

In the main program you can see how the operator is used, exactly as if we were adding two numbers together. Lets try it out.

~~~
$ wget https://raw.githubusercontent.com/acenet-arc/fortran_oop_as_a_second_language/gh-pages/code/operators.f90
$ gfortran operators.f90 -o operators
$ ./operators
~~~
{: .bash}
~~~

 numbers_some
 t_vector:
  num_elements=           4
  elements=
      1.00000000
      2.00000000
      3.00000000
      4.00000000

 numbers_less
 t_vector:
  num_elements=           2
  elements=
      5.00000000
      6.00000000

 numbers_all
 t_vector:
  num_elements=           6
  elements=
      1.00000000
      2.00000000
      3.00000000
      4.00000000
      5.00000000
      6.00000000

~~~
{: .output}

her you can see that the two vectors have been combined into `numbers_all` with the left hand `t_vector` object added first followed by the right hand `t_vector` object added second. So the way we have implemented our `operator(+)` the results are order dependent.

{% include links.md %}

