# MATH161

$\LaTeX\$ project for Calc I notes primarily based on _Thomas' Calculus_.

## Build instructions.

If you have `make` installed on your system, a `Makefile` is included to aid the building of the various documents.
To build an individual lecture PDF (without solutions to examples) use the following command.
```shell
make <filename.pdf>
```
For example, the following call to `make` will build the lecture notes for the precalculus review roughly corresponding to section 1.1 and 1.2 of _Thomas' Calculus_.
```shell
make 00-precalc_review.pdf
```
To build all lecture PDFs as individual files (without solutions), run the following.
```shell
make lectures
```
To build all lecture notes bound into a single PDF (without solutions to examples) run the following.
```shell
make main.pdf
```
To build all lecture notes bound into a single PDF **including solutions to examples** run the following.
```shell
make main_with_solutions.pdf
```
If `pandoc` is installed on your system, then the following will make an MS Word version of the entire set of notes **with solutions included**.
```shell
make docx
```
However, the conversion sometimes breaks and is not typically as pretty.
**Currently, this functionality appears to be entirely broken.**

Of course, a simple call to `make` with no arguments makes _everything_ mentioned above except for DOCX versions.
