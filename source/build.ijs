NB. build

mkdir_j_ jpath '~Addons/math/eigenpic'
mkdir_j_ jpath '~addons/math/eigenpic'

writesourcex_jp_ '~Addons/math/eigenpic/source';'~Addons/math/eigenpic/eigenpic.ijs'
writesourcex_jp_ '~Addons/math/eigenpic/source';'~addons/math/eigenpic/eigenpic.ijs'

('~Addons/math/eigenpic/manifest.ijs') (fcopynew ::0:) '~Addons/math/eigenpic/source/manifest.ijs'
