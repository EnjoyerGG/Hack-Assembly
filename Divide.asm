Divide RAM[0] by RAM[1] and put the result in RAM[2] and the remainder in RAM[3].
Test 1
Inputs
RAM[0] = 12
RAM[1] = 6
Outputs
RAM[2] = 2
RAM[3] = 0

Test 2
Inputs
RAM[0] = 12
RAM[1] = 5
Outputs
RAM[2] = 2
RAM[3] = 2


//Pseudocode:
//if RAM[1] == 0, goto halt
//RAM[2] = 0
//RAM[3] = RAM[0]
//while RAM[3] >= RAM[1]{
//  RAM[3] = RAM[3] - RAM[1]
//  RAM[2]++
//}


//A:
@R1
D=M
@halt
D;JEQ
@R2  //store the result
M=0
@R0
D=M
@R3  //store the remainder
M=D

(loop)
//if RAM[3] < RAM[1], goto end_loop
@R1
D=M
@R3
D=M-D
@end_loop
D;JLT
//RAM[3] = RAM[3] - RAM[1]
@R1
D=M
@R3
M=M-D
//RAM[2]++
@R2
M=M+1
@loop
0;JMP
(end_loop)

(halt)
@halt
0;JMP
