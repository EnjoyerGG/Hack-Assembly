//Draw a zebra block in the center of screen

//Pseudocode:
//addr = 0x4000 + 64*32 + 12
//i = 0
//while i < 128{
//  i = 0
//  while j < 8{
//    RAM[addr] = 0xFF00  // == 0b11111111000000000
//    addr++
//    j++
//  }
//  addr += 24
//  i++
//}

//the key is to get the base address to draw!
