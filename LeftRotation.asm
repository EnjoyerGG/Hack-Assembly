//val << shift and then plus left_high

//Pseudocode:
//while shift != 0{
//  if val & 0x8000 != 0{
//    left_high = 1
//  }else{
//    left_high = 0
//  }
//  val *= 2
//  shift--
//  val = val + left_high
//}

//A:
(loop)
//if shift == 0, goto end_loop
@shift
D=M
@end_loop
D;JEQ
//if val & 0x8000 != 0, goto set_left_high_one
@24576  //0x6000
D=A
@8192  //0x2000
D=D+A
@val
D=M&D
@set_left_high_one
D;JNE
@left_high
M=0
@end_if
0;JMP

(set_left_high_one)
@left_high
M=1
(end_if)

@val
D=M
M=D+M
@shift
M=M-1
@left_high
D=M
@val
M=M+D
@loop
0;JMP

(end_loop)
@end_loop
0;JMP
