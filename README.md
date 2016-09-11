Hello World
=============

This repository contains "Hello World" in the following language:

- bash
- Ceylon
- dash
- fish
- Go
- Haskell
- Kotlin
- Lua
- mksh
- OCaml
- Python
- Perl
- Racket
- Ruby
- Scheme
- Swift
- rc

Footprint
----------

Use `timeit.sh` to benchmark footprint (startup time, memory usage):

```sh
; git clone https://github.com/weakish/hello-world
; cd hello-world
; sh compileit.sh
; sh timeit.sh
```

The result will be written to `footprint.txt`.

On my machine (`amd64`, Intel i3-3217U, 4G Ram, SSD, Ubuntu 14.04):

* Light-weight:

    - bash 4.3-6
    - dash 0.5.7-4
    - go 1.2.1
    - lua 5.1.5
    - luajit (bytecode) 2.0.2
    - luajit (compiled ELF) 2.0.2
    - ghc 7.6.3
    - mksh 46-2
    - ocaml 4.01.0
    - perl v5.18.2
    - rc 1.7.1-5
    - swift 3.0-PREVIEW-1

* Normal

    - fish 2.2.0-809
    - node v4.4.7
    - kotlin 1.0.1-2 (JRE 1.7.0_111)
    - petite 8.4
    - python 2.7.6
    - python 3.4.3
    - ruby 1.9.3p484
    - ceylon 1.2.3 (JRE 1.7.0_111)

* Heavy

    - racket v5.3.6



### Compiled size

For compiled size:

```
788K+1.4M    Kotlin+avian
2.6M+1.4M    Ceylon+avian
4.8M    Swift
2.2M    Go
1.1M    Haskell
176K    OCaml
```

`avian` is a light-weight JVM, supporting a subset of OpenJDK classes
(`1.3.0-SNAPSHOT` compiled with `process=interpret`).
`avian` 6.8M is uncompressed. Compressed size is 1.4M.
OpenJDK can be stripped to a minimal headless JRE,
from around 100M to 30M (uncompressed) and 12M compressed.


Choice
-------

When choosing a "shell scripting" language,
I will consider the following aspects:

0. Footprint.

    For example, Ceylon may be good for doing long time operations.
    But obviously not for quick runs.

1. Dependencies. For example:

    1. Few systems have Racket or any other scheme environment preinstalled.
    2. Most systems may already have Python, Ruby or even Node installed.
        But *which version* is installed?
    3. All systems have `sh`, but `sh` does not have batteries built-in,
        thus relies on external programs heavily.
    4. Few systems have Haskell or OCaml preinstalled,
        but the environment is development dependency, not run time dependency.
    5. Lua is so small that it can be shipped together.
        And we can ship ELF compiled by LuaJIT.

    6. JVM gives me mixed feelings. A lot of systems have jdk installed.
        But if not, it will need some bandwidth to download.

2. Peculiars.

    For example, Bash, Perl and JavaScript.

    Go does not have generics, and abuses `(ret, err)` to handle errors.

    Haskell overly emphasizes on pureness and laziness.

    Both Haskell and OCaml borrowed Hindley-Milner type system from ML.
    HM is complex and inexpressive.

3. Ecosystem.

    Kotlin, Ceylon, Python and Ruby has a good ecosystem.
    Go and Haskell has a growing ecosystem.
