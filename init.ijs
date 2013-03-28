require 'gl2'

require '~addons/math/lapack/lapack.ijs'
require '~addons/math/lapack/dgeev.ijs'

coclass 'eigenpic'
coinsert 'jgl2'

dgeev_z_=: dgeev_jlapack_

BLUE=: 0 0 255
RED=: 255 0 0
WHITE=: 255 255 255
BLACK=: 0 0 0

FORECOLOR=: BLACK
BACKCOLOR=: WHITE
AXISCOLOR=: BLUE
EIGENCOLOR=: RED

XMARGIN=: 0.07
YMARGIN=: 0.07
TICMAJOR=: 0.01
TICMINOR=: 0.007

MATCHAR=: MATDEFAULT=: '4 3 1 5 % 2'
MATRIX=: 2 2$ ". MATCHAR

IFSPOKES=: 1
SPOKES=: 60

SYSNAME=: 'Eigenpicture'

3 : 0''
if. IFWIN do.
  FONTSIZE=: 24
  FONTNAME=: 'Arial '
else.
  FONTSIZE=: 24
  FONTNAME=: 'Sans '
end.
)
