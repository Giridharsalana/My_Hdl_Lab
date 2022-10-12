import myhdl
import ClkDriver
import Hello

@myhdl.block
def Greetings():
    clk1 = myhdl.Signal(0)
    clk2 = myhdl.Signal(0)

    clkdriver_1 = ClkDriver.ClkDriver(clk1)  # positional and default association
    clkdriver_2 = ClkDriver.ClkDriver(clk=clk2, period=19)  # named association

    hello_1 = Hello.Hello(clk=clk1)  # named and default association
    hello_2 = Hello.Hello(to="MyHDL", clk=clk2)  # named association

    return clkdriver_1, clkdriver_2, hello_1, hello_2

inst = Greetings()
inst.run_sim(50)