DOCUMENT = main
LECTURES = 00-precalc_review 01-trig_review 02-rates_of_change_and_tangents 03-limits_and_limit_laws 04-definition_of_limit 05-one-sided_limits 06-limit_practice 07-continuity 08-limits_involving_infinity 09-derivatives 10-derivatives_practice 11-derivative_rules 12-rates_of_change 13-chain_rule 14-implicit_differentiation 15-related_rates 16-linearization_and_differentials 17-extreme_value_theorem 18-mean_value_theorem 19-first_derivative_test 20-concavity_and_curve_sketching 21-applied_optimization 22-antiderivatives 23-estimation_with_finite_sums 24-definite_integrals 25-fundamental_theorem_of_calculus 26-method_of_substitution
SOURCES = *.tex img/*.png

all: $(DOCUMENT).pdf $(DOCUMENT)_with_solutions.pdf lectures

lectures: $(addsuffix .pdf, $(LECTURES))

$(DOCUMENT).pdf: $(SOURCES)
	latexmk $(addsuffix .tex, $(DOCUMENT))

$(DOCUMENT)_with_solutions.pdf: $(SOURCES)
	latexmk $(addsuffix _with_solutions.tex, $(DOCUMENT))

%.pdf: %.tex preamble.tex img/*.png
	latexmk -pdflatex="pdflatex -recorder -jobname %A '\documentclass[11pt,reqno]{amsbook}\input{preamble}\begin{document}\input{%S}\end{document}'" $<

docx: $(SOURCES)
	pandoc $(addsuffix _with_solutions.tex, $(DOCUMENT)) -o $(addsuffix _with_solutions.docx, $(DOCUMENT)) 

clean:
	latexmk -c

cleanall:
	latexmk -C
	rm -f *.docx
	#rm -f *.aux *.bak *.bbl *.blg *.dvi *.fls *.fdb_latexmk *.idx *.ilg *.ind *.log *.out *.synctex.gz *.toc *.xdv *.pdf

.PHONY: all lectures clean cleanall docx
