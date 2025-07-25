//right shift x equals right rotates x, and then zero x bits from high to low bit

//Pseudocode:
//shift = 16 - (shift % 16)
//while shift != 0{
//  if val & 0x8000 != 0{
//    left_high = 1
//  }else{
//    left_high = 0
//  }
//  val = val * 2
//  shift--
//  val = val + left_high
//}
//mask = (1 << (16 - shift)) - 1
//result = val & mask

//A:
//shift = 16 - (shift % 16)
@15
D=A
@shift
D=M&D
@16
D=A-D
@shift
M=D

(loop)
//if shift == 0, goto end_loop
@shift
D=M
@end_loop
D;JEQ
//if val & 0x8000 != 0, goto set_lefthigh_1
@0x6000
D=A
@0x2000
D=D+A
@val
D=M&D
@set_lefthigh_1
D;JEQ
@left_high
M=0
@end_if
0;JMP
(set_lefthigh_1)
@left_high
M=1
(end_if)

//val = val * 2
@val
D=M
M=M+D
//shift--
@shift
M=M-1
//val = val + left_high
@left_high
D=M
@val
M=M+D
@loop
0;JMP
(end_loop)

//mask = (1 << (16 - shift)) - 1
@shift
D=M
@16
D=A-D
@i
M=D  //counter
@value
M=1
(mult_loop)
//if i == 0, goto end_mult_loop
@i
D=M
@end_mult_loop
D;JEQ
@value
D=M
M=D+M
@i
M=M-1
@mult_loop
0;JMP
(end_mult_loop)
@value
D=M
D=D-1
@mask
M=D

//result = val & mask
@val
D=M
@mask
D=M&D
@result
M=D








