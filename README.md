# 🚀 16-bit Pipelined ALU (3-Stage)

A high-performance **3-stage pipelined 16-bit ALU** designed in Verilog to improve throughput and support higher clock frequencies.  
This project demonstrates practical RTL design, pipelining concepts, verification methodology, and synthesis analysis.

---

## 📌 Project Overview

This project implements a **16-bit Arithmetic Logic Unit (ALU)** with a **3-stage pipeline architecture** to increase throughput compared to a non-pipelined design.

### ✅ Supported Operations
- Addition
- Subtraction
- Multiplication
- Bitwise AND
- Bitwise OR
- Bitwise XOR
- Shift Left
- Shift Right

---

## 🏗️ Architecture

### 🔹 3-Stage Pipeline Structure

| Stage | Description |
|-------|------------|
| Stage 1 | Input Register Stage (Operands + Opcode latch) |
| Stage 2 | ALU Computation Stage |
| Stage 3 | Output Register Stage |

### Pipeline Flow

Input → [Stage 1 Reg] → [ALU Compute] → [Stage 3 Reg] → Output

---


## ⚙️ Design Highlights

- Fully synchronous RTL design
- Parameterized bit-width (default = 16)
- Modular and scalable architecture
- Pipeline registers inserted between stages
- Optimized for higher clock frequency

---

## 📂 Repository Structure

```
├── rtl/
├── alu_top.v
├── stage1_fetch.v
├── stage2_execute.v
├── stage3_writeback.v
│
├── tb/
│   └── alu_tb.v
│
│
└── README.md
```

---

## 🧪 Verification

- SystemVerilog self-checking testbench
- Randomized input stimulus
- Corner-case testing (overflow, max/min, shift bounds)
- Automatic expected-result comparison
- 100% functional coverage achieved
- Simulated using ModelSim

---

## 📊 Performance Improvement

| Metric | Non-Pipelined | Pipelined |
|--------|--------------|------------|
| Throughput | 1 result after full delay | 1 result per cycle (after fill) |
| Clock Frequency | Limited by full ALU delay | Higher due to stage splitting |
| Throughput Gain | — | ~2× improvement (simulation) |

---

## 🛠️ Synthesis

- Synthesized using Intel Quartus
- Timing analysis performed
- Resource utilization evaluated
- Reduced critical path delay due to pipelining


---

## 🎯 Key Learnings

- Pipeline architecture implementation
- Throughput vs latency trade-off
- RTL design best practices
- Functional verification methodology
- Post-synthesis timing analysis

---

## 🔮 Future Enhancements

- Add hazard detection logic
- Extend to 32-bit architecture
- Add forwarding support
- Integrate into pipelined CPU datapath
- Formal verification

---

## 🏷️ Skills Demonstrated

Verilog | SystemVerilog | RTL Design | Digital Design | Pipelining  
ModelSim | Quartus | Functional Verification | Timing Analysis

---

## 📜 Author

Pratham Patel  
ECE | VLSI & Embedded Systems
