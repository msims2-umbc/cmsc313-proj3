gcc main.c -o out
gcc main.c -O0 -S -o opt0.s
gcc main.c -O1 -S -o opt1.s
gcc main.c -O3 -S -o opt3.s