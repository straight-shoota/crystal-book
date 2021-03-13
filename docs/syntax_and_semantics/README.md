---
hide:
  - toc        # Hide table of contents
---

# Language Reference

Welcome to the language reference for the Crystal programming language!

Crystal is a programming language with the following goals:

* Have a syntax similar to Ruby (but compatibility with it is not a goal).
* Be statically type-checked, but without having to specify the type of variables or method parameters.
* Be able to call C code by writing bindings to it in Crystal.
* Have compile-time evaluation and generation of code, to avoid boilerplate code.
* Compile to efficient native code.

-----

You can read this document from top to bottom, but it’s advisable to jump through sections because some concepts are interrelated and can’t be explained in isolation.

!!! tip
    In code examples, the comment `#=>` is used to show the value of an expression. For example:

    ```crystal
    a = 1 + 2
    a #=> 3
    ```

    A comment using `:` is used for showing the type of a variable.

    ```crystal
    s = "hello"
    # s : String
    ```

From here, you can jump to anywhere you want in this document. Although, if you are new to the Crystal Language, we suggest that you begin reading the [Getting started](../getting_started/README.md) section.
