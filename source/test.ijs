NB. test dgeev

load '~Addons/math/eigenpic/source/dgeev.ijs'

mp=: +/ . *

NB. =========================================================
test_dgeev=: 3 : 0
m=. 2 2$,y
r=. <m
'lv ev rv'=. dgeev m
r=. r,<ev;rv
's t'=. ev
'sv tv'=. |: rv
sb=. (m mp sv) -: s * sv
tb=. (m mp tv) -: t * tv
(sb,tb);r
)

NB. =========================================================
NB. eigenpicture demos:
test_dgeev _4 3 1 5 % 2
test_dgeev 1 _1 _1 1
test_dgeev (4-%:3), 1 _3, 4+%:3
test_dgeev 0 1 _2 _3
test_dgeev -1 2 _1 1
test_dgeev -3 2 _1 1
