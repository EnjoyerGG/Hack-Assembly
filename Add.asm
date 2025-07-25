Q: Add RAM[0] to RAM[1] and put the result in RAM[2].

Input
RAM[0] = 3
RAM[1] = 4
Output
RAM[2] = 7


A:
@R0
D=M
@R1
D=M+D
@R2
M=D
