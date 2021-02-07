# Simple-8bit-CPU-Verilog
Verilog implementation of a Simple 8-bit CPU
 - It can performe basic arithmetic operations
 - Example: Debug version with manual execution (step by step)
 
### Instruction set 
| Opcode | Mnemonic | Operation |
| ------------- | ------------- | ------------- |  
| add  | 0000 xxxx  | Addition of registers A and B preloaded|
| sub  | 0001 xxxx  | Subtraction of registers A and B preloaded|
| sta  | 0010 xxxx  | Store register A|
| stb  | 0011 xxxx  | Store register B|
| stz  | 0100 xxxx  | Store register Z|
| lsd A| 0101 aaaa  | Load shifter down position|
| lsu A| 0110 aaaa  | Load shifter up position|
| sty  | 0111 xxxx  | Store register Y|
| srn  | 1000 xxxx  | Store in RAM new value|
| srr  | 1001 xxxx  | Store in RAM result value|
| lzr  | 1010 xxxx  | Store register Z from RAM|
| TBD  | 1011 xxxx  | To be defined|
| TBD  | 1100 xxxx  | To be defined|
| TBD  | 1101 xxxx  | To be defined|
| TBD  | 1110 xxxx  | To be defined|
| TBD  | 1111 xxxx  | To be defined|
 
### DIAGRAM
 
![alt text](https://github.com/viCppDev/Simple-8bit-CPU-Verilog/blob/main/diagram.png?raw=true)
