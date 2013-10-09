NB. build

writesourcex_jp_ '~Addons/math/eigenpic';'~Addons/math/eigenpic/eigenpic.ijs'

f=. 3 : 0
(jpath '~addons/math/eigenpic/',y) (fcopynew ::0:) jpath '~Addons/math/eigenpic/',y
)

mkdir_j_ jpath '~addons/math/eigenpic'

f 'eigenpic.ijs'
