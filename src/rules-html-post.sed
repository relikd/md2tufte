# Margin note
#s?==@?</span>?g
#s?@==?<span class="marginnote">?g
s?@==[[:space:]]*\(.*\)[[:space:]]*==@?<span class="marginnote">\1</span>?g
s?@=latex=\(.*\)==@??g
# sectioning
s?<h2?</section><section><h2?g
s?</section><section><h2 class="no-sect"?<h2?g