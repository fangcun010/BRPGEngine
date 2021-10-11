'===============================================================================
'函数名：Say$(x,y,Text$)
'说明：显示对话
'输入：x,y:对话框显示位置;Text$:要显示的文本
'输出：
'返回：
'备注：
'修改记录：
'===============================================================================
Sub Say$(x,y,Text$)
	Dim w,h
	Dim PgCount
	Dim i
	
	w=16*8+2
	h=16*2+2
	
	FillPage(-1,x,y,w,h,0)
	FillPage(-1,x+1,y+1,w-2,h-2,&hFFFFFF)
	SetBkMode(OPAQUE)
	Color(0,&hFFFFFF,0)
	
	PgCount=Len(Text$)/16
	i=0
	While i<=PgCount
		PixLocate(x+1,y+1)
		Print Mid$(Text$,i*16,16)
		PixLocate(x+1,y+1+16)
		Print Mid$(Text$,(i+1)*16,16)
		ForWaitKey()
		i=i+1
	Wend
End Sub

Color(0,&hffffff,0)
cls
Say$(0,0,"tt")