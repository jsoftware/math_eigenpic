NB. eigenpicture window

EP=: 0 : 0
pc ep;
menupop "Examples";
menu default "&Default" "" "" "";
menusep;
menu onezero "&Zero Eigenvalue" "" "" "";
menusep;
menu double "&Double Eigenvalue" "" "" "";
menusep;
menu complex "&Complex Eigenvalues (1)" "" "" "";
menusep;
menu complex2 "C&omplex Eigenvalues (2)" "" "" "";
menupopz;
menupop "Help";
menu about "&About" "" "" "";
menupopz;
xywh 9 21 146 14;cc mat edit ws_border es_autohscroll rightmove;
xywh 10 38 115 35;cc matrix static rightmove;
xywh 133 55 47 13;cc negate button leftmove rightmove;cn "Negate";
xywh 6 10 180 70;cc g0 groupbox rightmove;cn "Matrix";
xywh 9 104 110 30;cc ev1 static rightscale;
xywh 9 142 110 30;cc ev2 static rightscale;
xywh 6 87 120 90;cc g1 groupbox rightscale;cn "Eigenvalues";
xywh 138 104 110 30;cc rv1 static leftscale rightmove;
xywh 138 142 110 30;cc rv2 static leftscale rightmove;
xywh 133 87 120 90;cc g2 groupbox leftscale rightmove;cn "Eigenvectors";
xywh 200 16 47 13;cc run button leftmove rightmove;cn "Run";
pas 4 4;
rem form end;
)

NB. =========================================================
iflapackavail=: 3 : 0
try.
  fexist deb dll_jlapack_ -. '"'
catch.
  0
end.
)

NB. =========================================================
ep_run=: 3 : 0

if. -. iflapackavail'' do.
  info 'Demo requires LAPACK'
  return.
end.

wdpclose 'ep'
wdpclose 'epd'

epinit''
wd EP
wd 'pn *',SYSNAME
wd 'set mat *',":,MATCHAR
wd 'set matrix *', addLF MATRIX
wd 'setfont mat ',FIXFONT
wd 'setfont matrix ',FIXFONT
wd 'set ev1;set ev2;set rv1;set rv2'
wd 'setfont ev1 ',FIXFONT
wd 'setfont ev2 ',FIXFONT
wd 'setfont rv1 ',FIXFONT
wd 'setfont rv2 ',FIXFONT

NB. wd 'set top 1'
NB. if. -. IFWINCE do.
NB.   wd 'pcenter'
NB.   fx=. wdqformx''
NB.   wd 'pmove 0 5 ',": 2 }. fx
NB. end.
wd 'pshow'
evtloop^:(-.IFJ6)''
)

NB. =========================================================
ep_close=: 3 : 0
try. wd 'psel epd;pclose' catch. end.
wd 'psel ep;pclose'
)

NB. =========================================================
ep_about_button=: 3 : 0
'About' wdview '';(topara ABOUT);1
)

NB. =========================================================
ep_complex_button=: 3 : 0
MATRIX=: 2 2 $ ". MATCHAR=: '-1 2 _1 1'
epdoit''
)

NB. =========================================================
ep_complex2_button=: 3 : 0
MATRIX=: 2 2 $ ". MATCHAR=: '-3 2 _1 1'
epdoit''
)

NB. =========================================================
ep_default_button=: 3 : 0
MATRIX=: 2 2$ ". MATCHAR=: MATDEFAULT
epdoit''
)

NB. =========================================================
ep_double_button=: 3 : 0
MATRIX=: 2 2 $ ". MATCHAR=: '(4-%:3), 1 _3, 4+%:3'
epdoit''
)

NB. =========================================================
ep_negate_button=: 3 : 0
MATCHAR=: mat
if. '-' = {. MATCHAR do.
  MATCHAR=: }.MATCHAR
else.
  MATCHAR=: '-',MATCHAR
end.
MATRIX=: 2 2$ ". MATCHAR
epdoit''
)

NB. =========================================================
ep_onezero_button=: 3 : 0
MATRIX=: 2 2$ ". MATCHAR=: '1 _1 _1 1'
epdoit''
)

NB. =========================================================
ep_run_button=: 3 : 0
x=. ,@". :: 0: mat
if. (4~:$x) +. 0=isnumeric x do.
  info 'Invalid matrix definition'
else.
  if. iscomplex x do.
    info 'Matrix should be real'
  else.
    MATCHAR=: deb mat
    MATRIX=: 2 2$ x
    epdoit''
  end.
end.
)

NB. NB. =========================================================
NB. ep_top_button=: 3 : 0
NB. wd 'ptop ',": 0 ". top
NB. )

NB. =========================================================
ep_mat_button=: ep_run_button
ep_cancel=: ep_cancel_button=: ep_close

NB. =========================================================
epdoit=: 3 : 0
calc''
wd 'set mat *',":,MATCHAR
wd 'set matrix *', addLF MATRIX
'x1 y1 x2 y2'=. tominus@": each , RV
'e1 e2'=. tominus@": each , EV
wd 'set rv1 *',x1,LF,x2
wd 'set ev1 *', e1
wd 'set rv2 *', y1,LF,y2
wd 'set ev2 *', e2
epdraw''
glpaint''
)

NB. =========================================================
epinit=: 3 : 0
LASTPTS=: i.0 0
SPOKES=: 2 * >. -: SPOKES NB. should be even
)

NB. =========================================================
ep_run''
