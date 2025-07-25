//RAM[0]: number of element to be sorted
//RAM[1]: base address of the list to be sorted

//Pseudocode:
//while i > 0{
//  1 = RAM[1]
//  while i < (RAM[0] + RAM[1]){
//    if RAM[i] > RAM[i+1]{
//      temp = RAM[i]
//      RAM[i] = RAM[i+1]
//      RAM[i+1] = temp
//    }
//    i++
//  }
//  RAM[0]--
//}

//time to translate, relatively easy to do so!
