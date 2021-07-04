# Margin note
s?@=\(latex\)\{0,1\}=[[:space:]]*?\\marginnote{?g
s?[[:space:]]*==@?}?g
# scale images
s?\\marginnote{\\includegraphics?\\marginnote{\\includegraphics[width=1\\linewidth]?g