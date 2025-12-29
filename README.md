# Dual-Port RAM (1024 × 32)

## Overview
A true dual-port **synchronous RAM** implemented in Verilog HDL. The RAM supports simultaneous read and write operations from two independent ports on a single clock. Designed for synthesis on modern FPGAs, it serves as a general-purpose memory module suitable for buffering, data storage, and processor integration.

**Language**: Verilog HDL  
**EDA Tool**: Xilinx Vivado / Intel Quartus  
**Architecture**: Fully synchronous, edge-triggered memory

## Module Interface

**Inputs**:
- `clk` - System clock for both ports  
- `we_a`, `we_b` - Write enable signals for Port A and Port B  
- `addr_a [9:0]`, `addr_b [9:0]` - 10-bit address inputs (1024 locations)  
- `data_a [31:0]`, `data_b [31:0]` - 32-bit data inputs for each port  

**Outputs**:
- `out_a [31:0]`, `out_b [31:0]` - 32-bit data outputs for each port  

## Design Features

- **Memory Depth:** 1024 words  
- **Word Width:** 32 bits  
- **Dual-Port Operation:** Both ports can read or write independently on the same clock  
- **Synchronous Read/Write:** All operations triggered on rising clock edge, ensuring predictable timing  
- **FPGA-Compatible:** Matches block RAM behavior for synthesis  

## Usage

### Simulation

1. Open your preferred FPGA simulation tool (Vivado, ModelSim, etc.)  
2. Add design files:  
   - `dual_port_RAM_1024x32.v` as design source  
   - `dual_port_RAM_1024x32_tb.v` as simulation source  
3. Set the testbench as the top module  
4. Run behavioral simulation and observe `out_a` and `out_b` for correctness  
5. Modify addresses and data in the testbench to test more memory scenarios  

### Synthesis (Optional)

1. Set `dual_port_RAM_1024x32.v` as the top module  
2. Add a constraints file (`.xdc`) appropriate for your FPGA board  
3. Run Synthesis → Implementation → Generate Bitstream  

## Verification

The design has been validated with a dedicated testbench that:

- Performs sequential writes and reads on both ports  
- Tests simultaneous access for dual-port functionality  
- Confirms data integrity across various addresses  
- Demonstrates synchronous read timing (data appears one clock cycle after address input)  

> **Note:** Simultaneous writes to the same address are tool/vendor-specific. Avoid in real designs to prevent undefined behavior.

## Files

| File Name                     | Description                                      |
|-------------------------------|--------------------------------------------------|
| `dual_port_RAM_1024x32.v`     | Main RAM module                                  |
| `dual_port_RAM_1024x32_tb.v`  | Testbench for verification and simulation       |

## Author
**Devansh Joshi**  
GitHub: [@DJdaGOAT1](https://github.com/DJdaGOAT1)
