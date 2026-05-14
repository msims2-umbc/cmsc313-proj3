# Optimization Analysis
`-O0` produced the median file length, with only one `.cfi_offset` and no `.cfi_restore` directives.
It includes several `cltq` instructions, which no other optimization level has, so presumably this is a runtime expensive instruction that was optimized away for better alternatives.
It is also the only optimization level that used the `leave` instruction.
It has the most amount of `mov` instructions of all the optimization levels.

`-O1` produced the longest file, most likely due to the inclusion of several groups of `.cfi_offset` directives (which is presumably a runtime optimization at the cost of file size) along with a group of `.cfi_restore` directives.
It has the median amount of `mov` instructions of all the optimization levels.
In the data section it appends `.str1.1,"aMS",@progbits,1` to the `.rodata` present in `-O0`.

`-O3` produced the shortest file, with reduced `.cfi_offset` and `.cfi_restore` directives.
It also includes several `.p2align` directives at the ends of some labels.
It also uses significantly more `xor` instructions to zero out registers.
It has the least amount of `mov` instructions of all the optimization levels.
In the data section it inserts `.section    .text.startup,"ax",@progbits` and `.p2align 4` in place of the `.text` present in `.L6:` in both `-O0` and `-O1`.