//Translate Hack VM to Assembly
//No.1 add
@SP
M=M-1	//SP--
A=M		
D=M		//D = *SP，the value from the stack top
@SP
A=M-1	//A = SP-1，get the address of second top value of stack
M=M+D	//即*SP = *SP + top value


//No.2 push constant 6
@6
D=A
@SP
M=M+1	//SP++
A=M-1	
M=D		//*SP = i，push constant to the stack top


//No.3 push local 3
@3
D=A
@LCL
A=M+D	//move to LCL+3
D=M
@SP
M=M+1	//SP++
A=M-1	//A = SP-1
M=D		//*SP = D


//No.4 pop local 2	//using R13~R15 for temporarily storation
@2
D=A
@LCL
D=M+D	//D = RAM[LCL]+2
@R13
M=D		//R13 to store the address
@SP
M=M-1
A=M
D=M		
@R13
A=M		//A = RAM[R13] = RAM[LCL]+2
M=D		


//No.5 sub
@SP
A=M-1
D=M		//D = *SP
@SP
A=M-1	//get the second top address of stack
M=M-D	


//No.6 neg
@SP
A=M-1	//指向栈顶地址
D=-M	//D = -(*SP)，取反
M=D		//写回栈顶


//No.7 and
@SP
A=M-1	
D=M		//D = *SP
@SP
A=M-1 
M=M&D	//*SP = *SP&D


//No.8 or
@SP
A=M-1	
D=M		
@SP
A=M-1	
M=M|D	//*SP = *SP|D


//No.9 not
@SP
A=M-1	
D=!M	//D = !(*SP)
M=D


//No.10 eq	(equals is -1(0xFFFF)，otherwise 0)
@SP
A=M-1
D=M
@SP
A=M-1
D=D-M
//if equals, goto EQ
@EQ
D;JEQ
//otherwise, push 0
@SP
A=M-1	
M=0
@END
0;JMP
(EQ)
@SP
A=M-1
M=-1
(END)


//No.11 lt
@SP
A=M-1	
D=M
@SP
A=M-1
D=D-M
@LT
D;JGT
@SP
A=M-1
M=0
@END
0;JMP
(LT)
@SP
A=M-1
M=-1
(END)


//No.12 gt
//the same as lt

//No.13 goto (unconditionally goto label)
@manual$<filename>$<label>
0;JMP

//No.14 if-goto	(pop top value of stack, if not 0, goto the label, otherwise don't do it）
@SP
M=M-1
A=M
D=M
@manual$<filename>$<label>
D;JNE	


//No.15 Get the base address of (LCL,ARG,THIS,THAT,POINTER,TEMP,STATIC)
//LOCAL
@i
D=A
@LCL
A=M+D
//ARGUMENT
@i
D=A
@ARG
A=M+D
//THIS和THAT
@i
D=A
@THIS/THAT
A=M+D
//POINTER
@THIS	//pointer 0
@THAT	//pointer 1
//TMEP
@5
...
@12
//STATIC (e.g. do "push static 3" in foo.vm)
@Foo.3	//@filename.i


//No.16 call f n
/***
*(SP) = return-address
*(SP+1) = LCL
*(SP+2) = ARG
*(SP+3) = THIS
*(SP+4) = THAT
ARG = SP - n
LCL = SP + 5
goto f
(return-address)
***/
@RETURN	//return label
D=A
@SP
A=M
M=D	//*SP = return_label
//push LCL
@LCL	
D=M
@SP
A=M+1
M=D		//*(SP+1) = LCL
//push ARG
@ARG	
D=M
@SP
A=M+1
A=A+1
M=D		//*(SP+2) = ARG
//push THIS
@THIS
D=M
@SP
A=M+1
A=A+1
A=A+1
M=D		//*(SP+3) = THIS
//push THAT
@THAT
D=M
@SP
A=M+1
A=A+1
A=A+1
A=A+1
M=D		//*(SP+4) = THAT
//set new ARG = old SP - n
@SP
D=M
@n
D=D-A
@ARG
M=D
//set new LCL = old SP + 5 
@SP
D=M
@5
D=D+A
@LCL
M=D
@call$Main.exam
0;JMP
(return)	


//No.17 function f k	
/***
i =0 
while i<k{
	*(LCL + i) = 0
	i++
}
SP = LCL + k
***/
(Func_start)
//initialize the local variables to 0
@R13	
M=0
(LOOP)
@R13
D=M
@k
D=D-A
@END
D;JEQ
@R13
D=M
M=M+1	//i++
@LCL
A=M+D
M=0		//*(LCL+i) = 0
@LOOP
0;JMP
(END)
//set SP = LCL+k
@k
D=A
@LCL
D=D+M
@SP
M=D


//No.18 return
/***
RET = *(LCL-5)
*ARG = pop()
SP = ARG+1
THAT = *(LCL-1)
THIS = *(LCL-2)
ARG = *(LCL-3)
LCL = *(LCL-4)
goto RET
***/
//store return address to R13
@5
D=A		//D = 5
@LCL
A=M-D	//A = LCL - 5
D=M		//D = *(LCL-5)
@R13
M=D
//pop the return value to *ARG
@SP
A=M-1
D=M
@ARG
A=M
M=D		
D=A+1
@SP
M=D		//SP = ARG+1
//restore THAT
@LCL
A=M-1
D=M
@THAT
M=D
//restore THIS
@LCL
A=M-1
A=A-1
D=M
@THIS
M=D
//restore ARG
@3
D=A
@LCL
A=M-D
D=M
@ARG
M=D
//restore LCL
@4
D=A
@LCL
A=M-D
D=M
@LCL
M=D
//goto return label
@R13
A=M		//A = return address
0;JMP
