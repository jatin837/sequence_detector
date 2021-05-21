SRC=src/
BUILD=target/
VCC=iverilog
LATEXCC=pdflatex
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

verilog: $(SRC)mealy_impl/main.v $(SRC)mealy_impl/main_tb.v $(SRC)moore_impl/main.v $(SRC)mealy_impl/main_tb.v
	$(VCC) -o $(BUILD)sequence_detector_mealy_machine $(SRC)mealy_impl/main.v $(SRC)mealy_impl/main_tb.v
	$(VCC) -o $(BUILD)sequence_detector_moore_machine $(SRC)moore_impl/main.v $(SRC)moore_impl/main_tb.v

mealy: $(SRC)mealy_impl/main.go $(SRC)mealy_impl/main.v $(SRC)mealy_impl/main_tb.v
	go build $(SRC)mealy_impl/main.go 
	mv main $(BUILD)

moore: $(SRC)moore_impl/main.go $(SRC)moore_impl/main.v $(SRC)moore_impl/main_tb.v
	go build $(SRC)moore_impl/main.go 
	mv main $(BUILD)
run-sim: $(BUILD)main
	./$(BUILD)main
clean:
	rm ./target/*
