//Enter 'a' to fill the whole screen black

//Pseudocode:
//while true{
//  i = 0x4000  //SCREEN
//  if RAM[KBD] == 97{
//    color = 0xFFFF
//  }else{
//    color = 0x0000
//  }
//  while(i < KBD){
//    RAM[i] = color
//    i++
//  }
//}

(infinite_loop)
@16384
D=A
@i
M=D

//if RAM[KBD] == 97, goto set_black
@97
D=A
@KBD
D=M-D
@set_black
D;JEQ
//otherwise, set white
@color
M=0  //0x0000
@end_if
0;JMP

(set_black)
@color
M=-1  //0xFFFF
@end_if
0;JMP
(end_if)

(loop)
//if i >= KBD, goto end_loop
@KBD
D=A
@i
D=M-D
@end_loop
D;JGE
@color
D=M
@i
A=M
M=D
//i++
@i
M=M+1
@loop
0;JMP
(end_loop)

@infinite_loop
0;JMP
