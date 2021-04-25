presentation: ./src/presentation.tex
	pdflatex ./src/presentation.tex
	mv ./presentation* ./target
clean:
	rm ./target/presentation*
