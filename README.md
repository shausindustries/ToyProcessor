**_Toy Processor:_**
A toy processor is a clean, minimal and a simple processor (usually used for education purpose). These usually ignore the scalability and the complex architecture to accomodate that scalability. Toy processors are capable of running very limited amounts of programmes or maybe a single script of a programme.
The toy processor implemented in this project is a custom ardchitecture to run a particular script. It utilises an 8-bit instruction width, a 3-bit wide data width and a 5-bit address width.

**_ISA:_**
* R-Type: [opcode (3) | reg (2) | reg (2) | unused (1)]
* I-Type: [opcode (3) | reg (2) | immediate (3)]
* J-Type: [opcode (3) | address (5)]

**_Script:_**
MOV REG1, 3;
MOV REG2, 3;
_add:
    ADD REG1, REG2;
    CMP REG1, REG6;
    JE _halt;
    JNE _add;
_hlt:
    HLT

**_Installation:_**
- To install it clone the repository.
- Open the tcl console of a verilog editor (Xilinx Vivado in my case).
- Access the path to your cloned repository and the tcl_script file
- Run source create_project.tcl
// You can use it to remake the project for yourself, simulate it or implement it on an fpga kit.
