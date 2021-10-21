# Margin note
s?@=\(latex\)\{0,1\}=[[:space:]]*?\\marginnote{?g
s?[[:space:]]*==@?}?g
# scale images
s?\\marginnote{\\includegraphics?\\marginnote{\\includegraphics\[width=1\\linewidth\]?g

# For proper clickable check boxes we need to increment the name ids :-/
#s?\\item\[\$\\square\$\]?\\item\[\\CheckBox{}\]?g
#s?\\item\[\$\\boxtimes\$\]?\\item\[\\CheckBox\[checked\]{}\]?g
# OR
s?\\item\[\$\\square\$\]?\\item\[\$\\Box\$\]?g
