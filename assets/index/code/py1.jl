# This file was generated, do not modify it. # hide
#hideall
using PyCall
lines = replace("""import numpy as np
import matplotlib.pyplot as plt
plt.plot(x, x**2)
plt.show()""", r"(^|\n)([^\n]+)\n?$" => s"\1res = \2")
py"""
$$lines
"""
println(py"res")