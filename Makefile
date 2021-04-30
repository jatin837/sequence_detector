SRC=src/
BUILD=target/
VCC=iverilog
LATEXCC=pdflatex
VERILOG=verilog/
SIM=sim/
PRESENTATION=presentation/

all: presentation 

presentation: $(SRC)$(PRESENTATION)presentation.tex
	$(LATEXCC) $(SRC)$(PRESENTATION)presentation.tex
	mv ./presentation* $(BUILD)
	mv $(SRC)*.aux $(SRC)*.log $(BUILD)
	mv *.log $(BUILD)

#state_diag_1011: $(SRC)state_diag_1011.tex
#	$(LATEXCC) $(SRC)state_diag_1011.tex
#	mv ./state_diag_1011* $(BUILD)

verilog: $(SRC)$(VERILOG)sequence_detector.v $(SRC)$(VERILOG)sequence_detector_tb.v
	$(VCC) -o $(BUILD)sequence_detector $(SRC)$(VERILOG)sequence_detector.v $(SRC)$(VERILOG)sequence_detector_tb.v

sim: $(SRC)$(SIM)*
	go build $(SRC)$(SIM)*
	mv ./main $(BUILD)
	$(BUILD)main

review: verilog
	vvp $(BUILD)sequence_detector
	mv ./*.vcd $(BUILD)
	gtkwave $(BUILD)*.vcd


clean:
	rm ./target/*

