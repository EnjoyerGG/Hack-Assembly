//Q: val << shift
//transform it to val*2 << shift-1

//Pseudocode:
//while shift != 0{
//  val *= 2
//  shift--
//}

(loop)
//if shift == 0, goto end_loop
@shift
D=M
@end_loop
D;JEQ
@val
D=M
M=D+M
@shift
M=M-1
(loop)
@loop
0;JMP

(end_loop)
@end_loop
0;JMP
