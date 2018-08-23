uclathes
------------
2017/06/02, relaeas 3.4

2017/05/31, release 3.3

2017/04/28, release 3.1.3

2012/05/02, release 2.0


WHAT IS UCLATHES?
-----------------

This package is a LaTeX2e document style to format UCLA dissertations
and theses.  This style is based on work from Leslie Lamport,
Dorab Patel, Eduardo Krell, Richard B. Wales, John Heidemann, and
Jose Hales-Garcia.

Several theses and dissertations have been approved based on this
style package.

WHAT IS NEW WITH UCLATHES 3?
------------------------------
v3.4
1. Automatically adds additional PDF bookmarks for "Title Page", "Abstract", 
"Committee", "Dedication", and "Table of Contents" when using the "hyperref" 
package.
2. Reduce the spacing between the first and second lines in the committee page
to conform the 2017 requirements.

v3.3
1. Includes "List of Figures", "List of Table", "Acknowledgments", and
"Vita" pages into the "Table of Contents".
2. Allows users to change the titles of Table of Contents
(\contentsname), List of Figures (\listfigurename), List of Table
(\listtablename), Acknowledgments page (\acksname), Vita page
(\vitaname), and References (\refname).
3. Provides new class options to turn off List of Figures (nolistoffigures)
and List of Tables (nolistoftables).
4. Update demo2.tex to demonstrate how to use new features.
5. Increases \footskip to 0.4 inches while keeping the distance from
page number to bottom of the page as 0.75 inches.

v3.1.3
2017 rules require no bold face and all equal size font on the title and
abstract pages. [These rules were not stated in the Thesis &
Dissertation Filing Requirements PDF but was emphasized in the 2017
Spring Electronic Thesis and Dissertation (ETD) Workshops by Academic
Services, UCLA Graduate Division.]

v3.1.1
To make it compatible with the 'natbib' package.

v3.1
Allows customized publication list in vita page, see 'demo2.tex' for the example.
Fix the bug in \degreeyear.

v3.0 beta
Correct the table width in the vita page.
Correct the order of committee members.
Fix page size to US letter size.
Correct the margins to 1 inch on all sides and 0.75 inch for page numbers.

WHAT IS NEW WITH UCLATHES 2.0?
------------------------------
One inch margins on left and right.
Abstract page follows the copyright page.
Committee list is centered and signature lines removed.

WHAT IS NEW WITH UCLATHES 1.2?
------------------------------

There's a bug in \degreeyear handling.  The workaround is described
below in ``KNOWN PROBLEMS''.


WHAT IS NEW WITH UCLATHES 1.1?
------------------------------

I slightly shrunk page size to clearly conform to the requirements
(problem reported by David Gast).

An example showing dual-mode formatting is present in demo2*.tex.
My dissertation is formatted either with uclathes.cls (the submission
version) and with report.cls (for my committee and a technical report)
because IMHO the thesis requirements are not optimal.  See the manual
for more details how to dual-format your document.


WHAT IS IN UCLATHES?
--------------------

Enclosed in this package are the following files:


    uclathes.cls, uclath12.clo, uclathti.clo
	These three files implement the LaTeX2e "uclathes" document class.

    uclathes.bst
	This file implements the BibTeX "uclathes" bibliography style. (Optional)

    demo.tex, demo.pdf
	The "demo thesis" described in thesdoc.tex.

    demo2.tex, demo2.pdf
	The new demo tex file for v3.X showing a more practical example.

    README
	The file you are now reading.

    thesdoc.tex, thesdoc.pdf
	The old document describing the "uclathes" style material.


HOW TO USE UCLATHES
-----------------------

Copy *.cls, *.clo, and *.bst (optional) files into the directory
where you run your .tex file.

Alternatively, you can copy these files into wherever LaTeX looks
for its inputs.


WHERE'S THE REAL DOCUMENTATION
------------------------------

Rich Wales has prepared a good manual for uclathes.
Read thesdoc.pdf (or format and read thesdoc.tex) before
proceeding. (Not update for v3.0 yet.)


WHERE TO GET UCLATHES
---------------------

The most recent version of this package can be found at
<URL:https://github.com/louis925/uclathes/>.


WHAT TO DO ABOUT BUGS
---------------------

If a thesis formatted with uclathes is rejected by the
Theses and Dissertations Advisor, please let me know
and I will update it accordingly.

The uclathes package is for LaTeX2e.


REPLY-WARE
----------

Uclathes is distributed as reply-ware.  If you get it and use it and
graduate, you're strongly encouraged to send me some e-mail to let me
know that my work was not in vain.


  ---Louis Yang, April 28, 2017
     louis.yang@physics.ucla.edu
