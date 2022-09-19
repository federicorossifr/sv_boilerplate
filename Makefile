


register_file.v: src/register_file.sv
	sv2v $^ > build/$@

register_tb.v: src/register.sv tests/register_tb.sv
	sv2v $^ > build/$@

register_file_tb.v: src/register_file.sv src/register.sv tests/register_file_tb.sv
	sv2v $^ > build/$@

register_file_tb.out: register_file_tb.v
	iverilog -o build/$@ build/$<

register_tb.out: register_tb.v
	iverilog -o build/$@ build/$<



all: register_tb.out register_file_tb.out


run: all
	cd build; ./$(TOP)