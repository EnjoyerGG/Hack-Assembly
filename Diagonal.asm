//Draw a diagonal from left-up to right-down
//Assume the length is RAM[0]

//Pseudocode:
//L = RAM[0]
//addr = SCREEN
//value_to_write = 1
//i = 0
//while i < L{
//  RAM[addr] = value_to_write
//  addr += 32
//  value_to_write *= 2  //from 0000 0000 0000 0001 to 0000 0000 0000 0010
//  if i % 16 == 0{
//    addr++
//    value_to_write = 1
//  }
//}

//relatively easy! Note that ⬛⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜ = 0000 0000 0000 0001, seems opposite!
