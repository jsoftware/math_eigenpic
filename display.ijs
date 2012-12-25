NB. eigenpicture window

EPD=: 0 : 0
pc epd closeok;
xywh 0 0 200 200;cc g isigraph ws_border rightmove bottommove;
pas 0 0;
rem form end;
)

NB. =========================================================
epd_close=: 3 : 0
wd'pclose'
)

NB. =========================================================
epd_g_mmove=: 3 : 0
'x y w h'=. 4 {. 0 ". sysdata
y=. h - y
rim=. unitvec (x,y) - -: w,h
end=. rim + MATRIX mp rim
j=. (MX,MY) + rim * X1,Y1
pts=. flipypos 2 4$(MX,MY), j, j, (MX,MY) + end * X1,Y1
glsel 'g'
setcolor BACKCOLOR
glpen 2 0
drawpin LASTPTS
setcolor EIGENCOLOR
glpen 2 0
drawpin pts
drawpic''
glpaint ''
LASTPTS=: pts
)

NB. =========================================================
epd_g_paint=: epdraw

NB. =========================================================
epd_cancel_button=: epd_close

NB. =========================================================
epdraw=: 3 : 0

if. opened=. 0=wdisparent 'epd' do.
  wd EPD
  wd 'pn *',SYSNAME
  wdfit''
end.
wd'pshow'

wd 'psel epd'
glsel 'g'
'x y w h'=. wdqchildxywhx 'g'
CX=: CY=: w <. h

OFF=: -: (w-CX), h-CY

glrgb BACKCOLOR
glbrush''
glrect 0 0,w,h

glrgb FORECOLOR
glbrush''
glpen 1 0
gltextcolor ''
drawframe WID * _1 _1 2 2
genpic WID * _1 _1 2 2

if. opened do. wd'pshow' end.

drawpic''
)
