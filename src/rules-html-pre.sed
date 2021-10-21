# thinspace isnt handled very well in html
s?\\,?<span style="white-space:nowrap">\&thinsp;</span>?g
s?\\~?\&nbsp;?g

# Margin note
s?#####[[:space:]]*\(.*\)$?<p class="h5-spacer"></p>\
##### \1\
@== \1 ==@?g

# Use this to show margin notes inline
s?@=latex=?<span style="display: none">?g
s?@==[[:space:]]*?<span class="marginnote">?g
s?[[:space:]]*==@?</span>?g

# OR: use this to enable margin-toggle
# s?@=latex=?<label style="display: none"><span>?g
# s?[[:space:]]*==@?</span></label>?g
# s?@==[[:space:]]*?<label class="mtoggle"><input type="checkbox" class="margin-toggle"><span class="marginnote">?g
