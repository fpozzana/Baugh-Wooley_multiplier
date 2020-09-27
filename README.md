# Baugh-Wooley_multiplier
![](https://img.shields.io/badge/Development-Stopped-red)

Parametric implementation in systemVerilog of a Baugh-Wooley (signed) multiplier. The parameter numBit defines the width of both the multiplicand and multiplier. Vivado is used to gauge the area of the multiplier (with numBit = 16)

*Area after synthesis*

1. Slice Logic
--------------

|        Site Type        | Used | Fixed | Available | Util% |

| Slice LUTs*             |  349 |     0 |     20800 |  1.68 |

|   LUT as Logic          |  349 |     0 |     20800 |  1.68 |

|   LUT as Memory         |    0 |     0 |      9600 |  0.00 |

| Slice Registers         |    0 |     0 |     41600 |  0.00 |

|   Register as Flip Flop |    0 |     0 |     41600 |  0.00 |

|   Register as Latch     |    0 |     0 |     41600 |  0.00 |

| F7 Muxes                |    0 |     0 |     16300 |  0.00 |

| F8 Muxes                |    0 |     0 |      8150 |  0.00 |


7. Primitives
-------------

| Ref Name | Used | Functional Category |
| LUT6     |  186 |                 LUT |
| LUT4     |  120 |                 LUT |
| LUT2     |  115 |                 LUT |
| LUT5     |   58 |                 LUT |
| OBUF     |   32 |                  IO |
| IBUF     |   32 |                  IO |
| LUT3     |    3 |                 LUT |

## Tools

For this project the following tools were used
- Modelsim - Mentor graphics
- Vivado Design Suite - Xilinx
