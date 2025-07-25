You are given a sorted array, from RAM[1000] to RAM[2000] (inclusive.) The number you are searching for is in RAM[0]. Write a program to add the index of that number to RAM[1].

Inputs
RAM[0] = 2403
RAM[1000] = 23
RAM[1001] = 25
...
RAM[1230] = 2297
RAM[1231] = 2403
...
RAM[2000] = 9020

Output
RAM[1] = 1231


//Pseudocode:
//i = 0
//while RAM[1000+i] != RAM[0]{
//  i++
//}
//RAM[1] = 1000+i


//A:
@i
M=0
(loop)
//if RAM[1000+i] == RAM[0], goto end_loop
@1000
D=A
@i
D=D+M
A=D
D=M
@R0
D=D-M
@end_loop
D;JEQ
@i
M=M+1
@loop
0;JMP
(end_loop)

@1000
D=A
@i
D=D+M
@R1
M=D
