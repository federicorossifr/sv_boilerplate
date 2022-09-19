




register_tb.v: src/register.sv tests/register_tb.sv
	sv2v src/register.sv tests/register_tb.sv > build/register_tb.v

register_tb.out: register_tb.v
	iverilog -o build/$@ build/$<

