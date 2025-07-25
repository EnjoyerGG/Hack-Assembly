//Draw a triangle with the scope from left-up to right-down
//assume a = b = 256 (equal-side triangle)

//Pseudocode:
//L = 256
//row = 0
//while row < L{
//  col_max = row + 1
//  col = 0
//  base_addr = 0x4000 + row*32
//  while col < col_max{
//    word_off = col / 16
//    bitpos = col % 16
//    addr = base_addr + word_off
//    mask = 1 << bitpos
//    RAM[addr] = RAM[addr]|mask
//    col++
//  }
//}

@256
D=A
@L
M=D
@row
M=0

(big_loop)
@L
D=M
@row
D=M-D
@end_big_loop
D;JGE
@col
M=0
@row
D=M
@col_max
M=D+1

//base = 16384 + row * 32
//temp = row*32
@temp	
M=0
@row
D=M
@counter	
M=D
(mult_loop)
@counter
D=M
@end_mult_loop
D;JLT
@32
D=A
@temp
M=M+D
@counter
M=M-1
@mult_loop
0;JMP
(end_mult_loop)
@temp
D=M
@16384
D=A+D
@base
M=D

(small_loop)
@col_max
D=M
@col
D=M-D
@end_small_loop
D;JGE

//word_off = col / 16, bitpos = col % 16
@word_off
M=0
@bitpos
M=0
@col
D=M
@bitpos
M=D
(div_loop)
@16
D=A
@bitpos
D=M-D
@end_div_loop
D;JLT
@16
D=A
@bitpos
M=M-D
@word_off
M=M+1
@div_loop
0;JMP
(end_div_loop)

//addr = base + word_off
@word_off
D=M
@base
D=M+D
@addr
M=D

//mask = 1 << bitpos
@bitpos
D=M
@temp	//to store bitpos
M=D
//mask = 1
@mask
M=1
(shift_loop)
@temp
D=M
@end_shift_loop	
D;JLE
@mask
D=M
M=D+M
@temp
M=M-1
@shift_loop
0;JMP
(end_shift_loop)

//RAM[addr] = RAM[addr]|mask
@mask
D=M
@addr
A=M
M=M|D

//col++
@col
M=M+1
@small_loop
0;JMP
(end_small_loop)

//row++
@row
M=M+1
@big_loop
0;JMP
(end_big_loop)
@end_big_loop
0;JMP
