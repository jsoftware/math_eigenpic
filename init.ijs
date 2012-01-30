3 : 0''
if. IFJ6 do.
  require '~system/extras/migrate/gl2.ijs'
else.
  require 'gui/gtkwd'
end.
''
)
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
if. IFWINCE do.
  FONTSIZE=: 40
  FONTNAME=: 'Tahoma '
else.
  FONTSIZE=: 24
  FONTNAME=: 'Arial '
end.
)