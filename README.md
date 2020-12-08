# Baugh-Wooley_multiplier
![](https://img.shields.io/badge/Development-Stopped-red)

Parametric implementation in systemVerilog of a Baugh-Wooley (signed) multiplier. The parameter numBit defines the width of both the multiplicand and multiplier. Vivado is used to gauge the area of the multiplier (with numBit = 16)

*Area after synthesis*

1. Slice Logic

349 LUT as Logic out of 20800, 1.68% of total.

7. Primitives

LUT6 - 186  
LUT4 - 120  
LUT2 - 115  
LUT5 - 58  
OBUF - 32  
IBUF - 32  
LUT3 - 3  

## Tools

For this project the following tools were used
- Modelsim - Mentor graphics
- Vivado Design Suite - Xilinx
