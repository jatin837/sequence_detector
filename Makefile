SRC=src/
BUILD=target/
VCC=iverilog
LATEXCC=pdflatex
CODE=code/

presentation: $(SRC)presentation.tex
	$(LATEXCC) $(SRC)presentation.tex
	mv ./presentation* $(BUILD)

code: $(SRC)$(CODE)sequence_detector.v $(SRC)$(CODE)sequence_detector_tb.v
	$(VCC) -o $(BUILD)sequence_detector $(SRC)$(CODE)sequence_detector.v $(SRC)$(CODE)sequence_detector_tb.v

review: code
	vvp $(BUILD)sequence_detector
	mv ./*.vcd $(BUILD)
	gtkwave $(BUILD)*.vcd


clean:
	rm ./target/*

