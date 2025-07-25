Your code should do nothing until the letters ‘O’ and ‘M’ are pressed on the keyboard in sequence (‘O’ first, then ‘M’) with no other keys being pressed in between. It should write the value -1 to RAM[0]. For example, if the key sequence ‘OHMOMAAAAHWAITNOIDID- NTMEANTODOTHATUNDOUNDOUNDO’ is entered, then RAM[0] should be changed to -1 on the second ‘M’ and then not do anything further.

//Pseudocode:
//(no_O)
//while RAM[KBD] != 79 {}  //if not O, keep waiting...
//(no_M)
//while RAM[KBD] == 0 {}  //wait for key press
//if RAM[KBD] == 79{
//  goto no_M  //ignore repeat O
//}
//if RAM[KBD] != 77{
//  goto no_O  //if not M, back to beginning
//}
//i = SCREEN
//while i < 0x6000{
//  RAM[i] = -1
//  i++
//}
//while true{}  //halt

//A:
(no_O)
//if O not pressed, goto no_O
@79
D=A
@KBD
D=M-D
@no_O
D;JNE

(no_M)
//if no key is pressed, goto no_M
@KBD
D=M
@no_M
D;JEQ

//if O is pressed, goto no_M
@79
D=A
@KBD
D=M-D
@no_M
D;JEQ

//if any key other than M is pressed, goto no_O
@77
D=A
@KBD
D=M-D
@no_O
D;JNE

//OM has been pressed
@SCREEN
D=A
@i
M=D
(fill_loop)
//if i >= 0x6000, goto end_fill_loop
@KBD
D=A
@i
D=M-D
@end_fill_loop
D;JGE
@i
A=M
M=-1
@i
M=M+1
@fill_loop
0;JMP
(end_fill_loop)

(halt)
@halt
0;JMP

