//using bitwise operation to do so

//Pseudocode:
//bitmask = 1
//RAM[2] = 0
//while RAM[1] > 0{
//  if RAM[1] & bitmask != 0{
//    RAM[2] += RAM[0]
//    RAM[1] -= bitmask
//  }
//  bitmask *= 2  //same as bitmask = bitmask << 1
//  RAM[0] = RAM[0] << 1
//}

//A:
@bitmask
M=1
@R2
M=0
(loop)
//if RAM[1] <= 0, goto end_loop
@R1
D=M
@end_loop
D;JLE
//if RAM[1] & bitmask == 0, goto end_if
@R1
D=M
@bitmask
D=M&D
@end_if
D;JEQ
//RAM[2] += RAM[0]
@R0
D=M
@R2
M=D+M
//RAM[1] -= bitmask
@bitmask
D=M
@R1
M=M-D
(end_if)
//bitmask *= 2
@bitmask
D=M
M=D+M
//RAM[0] = RAM[0] << 1
@R0
D=M
M=D+M
@loop
0;JMP
(end_loop)

(halt)
@halt
0;JMP
