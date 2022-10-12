import myhdl


@myhdl.block
def Hello(clk, to="World!"):

    @myhdl.always(clk.posedge)
    def say_hello():
        print("%s Hello %s" % (myhdl.now(), to))

    return say_hello