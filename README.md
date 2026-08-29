# Design of a Custom 8-Bit Processor with Novel ISA & Datapath Architecture

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.17246207.svg)](https://doi.org/10.5281/zenodo.17246207)
![HDL](https://img.shields.io/badge/HDL-Verilog-blue)
![EDA](https://img.shields.io/badge/EDA-Xilinx%20Vivado-red)
![Architecture](https://img.shields.io/badge/Architecture-Custom%208--bit%20RISC-purple)

A custom-designed 8-bit educational processor featuring a specialized Reduced Instruction Set Computer (RISC) Instruction Set Architecture (ISA) and a dedicated hardware execution datapath.

---

## 📚 Research Publication & Citation

This processor architecture, ISA specification, and hardware datapath design are formally published and archived on **Zenodo (CERN / OpenAIRE)**:

> **Design of a Custom 8-bit Processor with Novel ISA and Data path Architecture**  
> *Shaurya*  
> **DOI**: [10.5281/zenodo.17246207](https://doi.org/10.5281/zenodo.17246207)  
> **Permanent Archive**: `https://doi.org/10.5281/zenodo.17246207`

### BibTeX Citation:
```bibtex
@article{shaurya2026custom8bit,
  author    = {Shaurya},
  title     = {Design of a Custom 8-bit Processor with Novel ISA and Data path Architecture},
  year      = {2026},
  publisher = {Zenodo},
  doi       = {10.5281/zenodo.17246207},
  url       = {https://doi.org/10.5281/zenodo.17246207}
}
```

---

## 🏗️ Architectural Overview & Width Specifications

- **Instruction Width**: 8-bit Instruction Word
- **Data Path Width**: 3-bit Data Bus
- **Address Bus Width**: 5-bit Address Space (32 addressable memory locations)
- **Target Implementation**: Xilinx Vivado (Synthesis, Simulation, and FPGA Implementation)

---

## 📋 Instruction Set Architecture (ISA)

The custom 8-bit ISA classifies instructions into three fixed-width encoding formats:

```
R-Type:  ┌──────────────┬──────────────┬──────────────┬────────────┐
         │  Opcode (3)  │  Reg_A (2)   │  Reg_B (2)   │ Unused (1) │
         └──────────────┴──────────────┴──────────────┴────────────┘
         
I-Type:  ┌──────────────┬──────────────┬───────────────────────────┐
         │  Opcode (3)  │  Reg_A (2)   │       Immediate (3)       │
         └──────────────┴──────────────┴───────────────────────────┘
         
J-Type:  ┌──────────────┬──────────────────────────────────────────┐
         │  Opcode (3)  │               Address (5)                │
         └──────────────┴──────────────────────────────────────────┘
```

---

## 📜 Sample Assembly Execution Routine

The hardware datapath is verified using a loop-accumulator test program:

```assembly
    MOV REG1, 3;       # Initialize Register 1 with literal 3
    MOV REG2, 3;       # Initialize Register 2 with literal 3
_add:
    ADD REG1, REG2;    # Accumulate: REG1 = REG1 + REG2
    CMP REG1, REG6;    # Compare accumulator against limit
    JE  _halt;         # Jump to halt if equal
    JNE _add;          # Otherwise loop back to _add
_halt:
    HLT                # Halt processor execution
```

---

## 🛠️ Verification & Vivado Project Setup

1. **Clone the repository**:
   ```bash
   git clone https://github.com/shausindustries/ToyProcessor.git
   cd ToyProcessor
   ```
2. **Recreate the Project in Xilinx Vivado**:
   * Open the Vivado TCL console.
   * Navigate to the repository directory.
   * Run the project generation script:
     ```tcl
     source create_project.tcl
     ```
3. **Simulation & Waveforms**:
   * Functional simulation testbenches and GTKWave/XSIM waveform traces are available in the `tp.sim` and `sim waves` directories.
   * Synthesized RTL schematic is documented in [`schematic.pdf`](schematic.pdf).
