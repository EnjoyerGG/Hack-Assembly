Subtract RAM[1] from RAM[0] and put the result in RAM[2]. Or, put another way: RAM[2] = RAM[0] - RAM[1].

Inputs
RAM[0] = 6
RAM[1] = 12
Outputs
RAM[2] = -6

//A:
@R0
D=M
@R1
D=D-M
@R2
M=D
