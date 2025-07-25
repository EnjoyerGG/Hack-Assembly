//right rotates x equals left rotation 16-(x % 16)

//Pseudocode:
//shift = 16 - (x % 16)   // == 16 - (x & 0x000F)
//while shift != 0{
//  if cal & 0x8000 != 0{
//    left_high = 1
//  }else{
//    left_high = 0
//  }
//  val = val * 2
//  shift--
//  val = val + left_high
//}
