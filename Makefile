SRC=src/
BUILD=target/
VCC=iverilog
LATEXCC=pdflatex
CODE=code/

all: presentation state_diag_1011

presentation: $(SRC)presentation.tex
	$(LATEXCC) $(SRC)presentation.tex
	mv ./presentation* $(BUILD)

state_diag_1011: $(SRC)state_diag_1011.tex
	$(LATEXCC) $(SRC)state_diag_1011.tex
	mv ./state_diag_1011* $(BUILD)

code: $(SRC)$(CODE)sequence_detector.v $(SRC)$(CODE)sequence_detector_tb.v
	$(VCC) -o $(BUILD)sequence_detector $(SRC)$(CODE)sequence_detector.v $(SRC)$(CODE)sequence_detector_tb.v

review: code
	vvp $(BUILD)sequence_detector
	mv ./*.vcd $(BUILD)
	gtkwave $(BUILD)*.vcd


clean:
	rm ./target/*

