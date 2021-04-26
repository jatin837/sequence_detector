CODEDIR=src/code/
TARGETDIR=target/


presentation: ./src/presentation.tex
	pdflatex ./src/presentation.tex
	mv ./presentation* ./target
clean:
	rm ./target/presentation*

code: $(CODEDIR)sequence_detector.v $(CODEDIR)sequence_detector_tb.v
	iverilog -o $(TARGETDIR)sequence_detector $(CODEDIR)sequence_detector.v $(CODEDIR)sequence_detector_tb.v
	vvp $(TARGETDIR)/sequence_detector