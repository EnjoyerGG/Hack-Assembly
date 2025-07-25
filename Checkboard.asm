Write a program that behaves as follows. While no key is pressed, the screen should be filled with a checkerboard pattern as shown in the image below. The top-left pixel of the screen should always be black. While the “c” key is held, the screen should be filled with the opposite checkerboard pattern, with the top-left pixel of the screen coloured white. The top-left pixel should be coloured correctly no matter when “c” is pressed.

//Pseudocode:
//checkboard = 0  //0 is default checkboard, while 1 is opposite checkboard
//c_pressed = 0  //record if c just pressed
//while true{
//  row_color = 0  //fisrt color of the row
//  row = 0
//  base_address = SCREEN
//  while row < 256{
//    col = 0
//    while col < 32{
//      if RAM[KBD] == c {
//        if c_pressed == 0{
//          checkboard = 1 - checkboard  //switch the check board
//          c_pressed = 1
//        }else{
//          c_pressed = 0
//        }
//        if row_color + checkboard == 1{
//          color == 0xAAAA  //0b1010101010101010
//        }else{
//          COLOR == 0X5555  //0b0101010101010101
//        }
//        
//        addr = base_address + col
//        RAM[addr] = color
//        col++
//    }
//    base_address = base_address + 32
//    row_color = 1 - row_color
//    row++
//  }
//}


@checkboard
M=0
@c_pressed
M=0
(infinite_loop)
@row_color
M=0
@row
M=0
@SCREEN
D=A
@base_address
M=D

(row_loop)
@row
D=M
@256
D=D-A
@infinite_loop	//if row == 256, goto infinite_loop
D;JEQ

@col
M=0
(col_loop)
@32
D=A
@col
D=D-M
@end_colloop	//if col == 32, goto end_colloop
D;JEQ

//if c isn't pressed, update c_pressed = 0
@KBD
D=M
@67
D=D-A
@cpressed
D;JEQ
@c_pressed
M=0
@end_cpressed
0;JMP

//otherwise, if c is pressed and c_pressed == 1
(cpressed)
@c_pressed
D=M
@end_cpressed
D;JGT

//otherwise, toggle checkboard and c_pressed = 1
@c_pressed
M=1
@checkboard
D=M
@1
D=A-D
@checkboard
M=0
(end_cpressed)

//if row_color + checkboard == 1, set color to 0xAAAA
@row_color
D=M
@checkboard
D=D+M
D=D-1
@white
D;JEQ
@21845	//0x5555
D=A
@color
M=D
@endcolor
0;JMP
(white)
@16384	//0x4000
D=A
D=A+D
@10922	//0x2AAAA
D=D+A	//0x8000+0x2AAA = 0xAAAA	//大于0x7FFF的部分只能放在D中，没法放在A中
@color
M=D


(endcolor)
@base_address
D=M
@col
D=M+D
@temp
M=D
@color
D=M
@temp
A=M
M=D
@col
M=M+1
@col_loop
0;JMP

(end_colloop)
@32
D=A
@base_address
M=M+D
D=1
@row_color
M=D-M
@row
M=M+1
@row_loop
0;JMP
