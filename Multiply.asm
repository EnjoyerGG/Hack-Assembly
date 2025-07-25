Multiply RAM[0] by RAM[1] and store the result in RAM[2]. The program assumes that RAM[0] >= 0, RAM[1] >= 0, and RAM[0] * RAM[1] < 32768.

//A:
//Pseudocode:
//i = RAM[1]
//RAM[2] = 0
//while i > 0{
//  RAM[2] += RAM[0]
//  i--
//}

@R1
D=M
@i
M=D
@R2
M=0

(loop)
//if i<=0, goto end_loop
@i
D=M
@end_loop
D;JLE
@R0
D=M
@R2
M=D+M
@i
M=M-1
@loop
0;JMP
(end_loop)

//Some of the compiler may came across some issues like "run-time error". If so, switch the RAM[1] and RAM[0]
