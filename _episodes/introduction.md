---
title: "Introduction"
teaching: 5
exercises: 0
questions:
- "What is object oriented design?"
- "What features does Fortran include to support object oriented design?"
objectives:
- "Gain a high level understanding of object oriented design (OOP)."
- "Know some of the features that have been introduced to Fortran to support OOP."
keypoints:
- "Fortran supports object oriented design."
- "Some consideration for performance should be taken with object oriented design early on, e.g. create objects containing arrays rather than arrays of objects."
---

Many modern languages support the practice of Object Oriented Programming (OOP). The basic idea here is that data and functionality can be grouped together into a single unit.

There are some basic principles of OOP:
* **Abstraction**: wrap up complex actions into simple verbs.
* **Encapsulation**: keep state and logic internal.
* **Inheritance**: new types can inherit properties and function from existing types and modify and extend those.
* **Polylmorphism**: different types of objects can have the same methods that are internally handled different depending on the type.

Many features have been added to Fortran over the years which has allowed Fortran programs to be written with increasingly object-oriented designs if desired.

However, I should note that care should be taken while designing programs to make use of OOP practices. If not carefully designed it can result in very bad outcomes for performance. It has been stated that premature optimization is the root of all evil, and to some degree that is true. In that you shouldn't worry too much about optimizing code until you know what is important to optimize, e.g. what takes most of the time. However, when using OOP designs some consideration needs to be given up front to performance otherwise significant re-writing will have to happen to allow for later optimizations. For example, it is often a bad idea to have an array of objects and one should instead favor a object containing arrays.

The above principles of OOP should be taken with a grain of salt rather than perfect rules to always follow.

* Fortran 90 introduced:
  * modules
  * derived data types
  * interface blocks
* Fortran 2003 introduced:
  * type extension
  * type-bound procedures

In this part of the workshop we will briefly introduce these features and their role in object oriented programming in Fortran.

{% include links.md %}

