Your code should read the values in RAM[0] and RAM[1], then behave as follows:
If RAM[1] = 0, multiply RAM[0] by −3 and store the result in RAM[2].
If RAM[1] = 3, subtract 50 from RAM[0] and store the result in RAM[2].
Otherwise, take a bitwise AND of RAM[0] with RAM[1] and store the result in RAM[2].


//A:
//if RAM[1] == 0, goto multiply
@R1
D=M
@multiply
D;JEQ

//if RAM[1] == 3, goto subtract
@R1
D=M
@3
D=D-A
@subtract
D;JEQ

@R1
D=M
@R0
D=M&D
@R2
M=D
@end_if
0;JMP

(multiply)
@R2
M=0
@3
D=A
@i
M=D
(loop)
//if i == 0, goto end_multiply
@i
D=M
@end_multiply
D;JEQ
@R0
D=M
@R2
M=M+D
@i
M=M-1
@loop
0;JMP
(end_multiply)
@R2
D=M
M=-D
@end_if
0;JMP

(substract)
@50
D=A
@R0
D=M-D
@R2
M=D
@end_if
0;JMP

(end_if)
@end_if
0;JMP



















