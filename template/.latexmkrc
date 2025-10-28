# Use XeLaTeX
$pdf_mode = 5;  # 5 = xelatex + xdvipdfmx

# XeLaTeX command with synctex enabled
$xelatex = 'xelatex -synctex=1 -interaction=nonstopmode -halt-on-error %O %S';

# Clean up patterns
$clean_ext = 'synctex.gz synctex(busy) aux log out toc fls fdb_latexmk xdv';
