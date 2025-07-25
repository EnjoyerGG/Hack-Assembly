//Draw a white block in the center of the black screen

//Pseudocode:
//fill the screen with black
//i = 0, j = 0
//addr = SCREEN
//while i < 256{
//  while j < 32{
//     RAM[addr + i*32 + j] = -1
//     j++
//  }
//  i++
//}
//i = 0,  j = 0
//addr = 0x4000 + 60*32 + 188
//while i < 136{
//  while j < 136{
//    RAM[addr + i*136 + j] = 0
//    j++
//  }
//  i++
//}

























