import myhdl


@myhdl.block
def ClkDriver(clk, period=20):

    lowTime = int(period / 2)
    highTime = period - lowTime

    @myhdl.instance
    def drive_clk():
        while True:
            yield myhdl.delay(lowTime)
            clk.next = 1
            yield myhdl.delay(highTime)
            clk.next = 0

    return drive_clk