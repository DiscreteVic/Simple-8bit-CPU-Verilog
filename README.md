# Simple-8bit-CPU-Verilog
Verilog implementation of a Simple 8-bit CPU
 - It can performe basic arithmetic operations
 - Binary code generation with assembler (included)
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
| jpi  | 1011 xxxx  | Inconditional Jump|
| jpe  | 1100 xxxx  | Conditional Jump (if equal)|
| jpl  | 1101 xxxx  | Conditional Jump (less than)|
| jpm  | 1110 xxxx  | Conditional Jump (more than)|
| NA   | 1111 xxxx  | Not used|

#### Example assembler code
```
1. lsd 13
2. lsu 12
3. sta 
```
- Decimal parameter (max. 4 bits)
- No comments allowed
- Only one space between opcode and parameter, and only one new line between instructions
 
### DIAGRAM
 
![alt text](https://github.com/viCppDev/Simple-8bit-CPU-Verilog/blob/main/diagram.png?raw=true)