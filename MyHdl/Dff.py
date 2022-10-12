import myhdl
import random


# Python Myhdl DflipFlop Module

@myhdl.block
def DFlipFlop(q, d, clk):

    @myhdl.always(clk.posedge)
    def DFlipFlop_Core():
        q.next = d

    return DFlipFlop_Core


# Python DFlipFlop Testbench

def Test_DFlipFlop():
    q, d, clk = [myhdl.Signal(bool(0)) for i in range(3)]

    dff_inst = DFlipFlop(q, d, clk)

    @myhdl.always(myhdl.delay(10))
    def clkgen():
        clk.next = not clk
    
    @myhdl.always(clk.negedge)
    def stimulus():
        d.next = random.randrange(2)
    return dff_inst, clkgen, stimulus


def simulate(timesteps):
    tb = myhdl.traceSignals(Test_DFlipFlop)
    sim = myhdl.Simulation(tb)
    sim.run(timesteps)

simulate(200)