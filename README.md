# flecs_odin_bindings
 (current: 3.2.9)
 
## NOTE
 I dont care about "naming standards", I care about seamless bindings and if you start naming everything with different names than the headers, you will go crazy updating the bindings for each time a new version of FLECS comes out.

## TODO
 Puting All types in a file called types.proc
 Puting All procedures in a file called procedures.proc
 Puting All the weird interfacing in a file called lazy.proc or just dont intercae anything (i.e. Users should imp,ement manually $T and size_of(T))

## Usage
I created a folder in Odin/vendor/flecs
And I put all the files in there, the compiled library I put in the root folder of my game, I use the .dll and the .lib when developing, and I use the static lib for release.

## Style Guide
- Functions use as direct as possible from the C api
- Types use RandomCasing
- Macros use WHATEVER_THIS_IS
- Type aliases use asd_random_case_t
