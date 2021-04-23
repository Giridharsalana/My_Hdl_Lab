from myhdl import Signal, intbv

from inc import inc

def convert(hdl, width=8):

    B = Signal(intbv(0)[width:])
    G = Signal(intbv(0)[width:])

    inst = inc(B, G)
    inst.convert(hdl=hdl)


convert(hdl='Verilog')
convert(hdl='VHDL')