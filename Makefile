plot: MC_Calculator.gnuplot
	gnuplot MC_Calculator.gnuplot
	
.PHONY: clean
clean:
	rm *.png
	rm *.dat

.PHONY:run
run: plot
	eog *.png
