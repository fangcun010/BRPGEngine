'===============================================================================
'程序名：FMEngine
'作者：任杰
'版权声明：随意使用修改而不必通知我O(∩_∩)O哈哈~
'===============================================================================

'===============================================================================
'常量
'===============================================================================
'调试相关
Const DEBUG			=	0
Const DEBUG_SIM		=	9287
'平台相关
Const LCD_SIM_W		=	320
Const LCD_SIM_H		=	240
Const LCD_9288_W		=	320
Const LCD_9288_H		=	240
Const LCD_9288T_W		=	240
Const LCD_9288T_H		=	160
Const LCD_9388_W		=	240		'9388 9588 9688
Const LCD_9388_H		=	320
'资源相关
Const PATH_RES		=	"FMEngine\"	'资源文件目录
Const FILENAME_SYSPIC	=	"Sys"		'系统图片资源文件名
Const FILENAME_MAPPIC	=	"Map"		'地图图片资源文件名
Const FILENAME_NPCPIC	=	"NPC"		'NPC图片资源文件名
Const FILENAME_ACTORPIC	=	"Actor"	'主角战斗图片资源文件名
Const FILENAME_FBPIC	=	"FightBack"	'战斗背景图片资源ID
Const FILENAME_ENEMY	=	"Enemy"	'敌人数据文件名
Const EXT_ENEMYS		=	".emys"	'敌人数据集合文件后缀名
Const EXT_ENEMYLISTS	=	".emylists"	'敌人链集合文件后缀名
Const PICID_MAINMENU	=	7		'主菜单图片资源ID
Const PICID_MMARROW		=	12		'主菜单箭头图片资源ID
Const PICID_NUM		=	1		'数字图片资源ID
'地图相关
Const MAPW_MAX		=	100		'地图最大宽度
Const MAPH_MAX		=	100		'地图最大高度
Const TITLE_W			=	16		'地图块宽
Const TITLE_H			=	16		'地图块高
Const FACE_UP			=	0		'NPC面向-上
Const FACE_DOWN		=	2		'NPC面向-下
Const FACE_LEFT		=	3		'NPC面向-左
Const FACE_RIGHT		=	1		'NPC面向-右
Const NPC_W			=	16		'NPC块图片拼接-长
Const NPC_H			=	32		'NPC块图片拼接-宽
Const NPC_STAY		=	0		'NPC站立不动
Const NPC_WALK		=	1		'NPC自动行走
Const NPC_MAX			=	20		'NPC最多数目
Const NPC_AUTORUNDELAY	=	500		'NPC自动运动延时
'文件相关
Const FN_LOCAL		=	1		'局部文件号
Const FN_SCRIPT		=	2		'脚本文件号
'错误处理相关
Const ERR_WAITMS		=	1000		'错误显示等待
'逻辑相关
Const TRUE			=	1		'真
Const FALSE			=	0		'假
Const NULL			=	0		'空
'战斗相关
Const FT_DEFFBPICID		=	1		'缺省战斗背景图片资源ID
Const FT_COPICID		=	14		'战斗选择对象箭头图片资源ID
Const FB_PICW			=	159		'战斗背景图片宽度
Const FB_PICH			=	96		'战斗背景图片高度
Const FT_ATDELAY		=	150		'战斗攻击动作间隔
'主菜单相关
Const MM_ARROWDELAY		=	300		'主菜单箭头闪动延迟
'其它
Const FORWAITKEY_DELAY	=	500		'ForWaitKey()函数等待延时
Const KEY_DELAY		=	300		'按键检测用时

'===============================================================================
'全局变量
'===============================================================================
'资源数据
Dim g_PicExt$						'图片资源后缀名
Dim g_SysPicFileName$				'系统图片资源文件名
Dim g_MapPicFileName$				'地图图片资源文件名
Dim g_NPCPicFileName$				'NPC图片资源文件名
Dim g_ActorPicFileName$				'主角战斗图片资源文件名
Dim g_EmyPicFileName$				'敌人图片资源文件名
Dim g_FBPicFileName$				'战斗背景图片资源文件名
Dim g_EmyListsFileName$				'敌人链集合文件名
Dim g_EmysFileName$					'敌人数据集合文件名
Dim g_MapsFileName$					'地图数据集合文件名
Dim g_SptsFileName$					'脚本数据集合文件名
'地图数据
Dim g_MapW,g_MapH					'地图宽高
Dim g_Map(MAPW_MAX,MAPH_MAX)			'地图数据数组
Dim g_MapPic						'地图图片
Dim g_MapLineX					'地图图片一行图块数
Dim g_MapPg						'地图绘制页面
'绘图数据
Dim g_LocalPg						'局部使用页面
Dim g_LCDW,g_LCDH					'屏幕宽高
'角色属性
Dim g_ActCount					'角色数量
Dim g_ActPic(3)					'角色图片资源
Dim g_ActbShow(3)					'角色是否显示
Dim g_ActHP(3),g_ActMp(3)				'角色生命魔法
Dim g_ActHpMax(3),g_ActMpMax(4)			'角色生命魔法上限
Dim g_ActAt(3),g_ActDf(3)				'角色攻击防御
Dim g_ActQuick(3)					'角色速
Dim g_ActMagic(3)					'角色灵
Dim g_ActLuck(63)					'角色运
Dim g_ActDrug(3),g_ActMess(3)			'角色毒乱
Dim g_ActSeal(3),g_ActSleep(3)			'角色封眠
Dim g_ActMagicCount					'角色魔法数量
Dim g_ActMagic(3,25)				'角色魔法
'战斗相关
Dim g_FightBackPic					'战斗背景图片资源
Dim g_FtCOPic						'选择对象箭头图片资源
'敌人属性
Dim g_EnemyCount					'敌人数量
Dim g_EnemyID(3)					'战斗对象ID
Dim g_EnemybShow(3)					'敌人是否显示
Dim g_EnemyPic(3)					'敌人图片资源
Dim g_EnemyMp(3),g_EnemyHp(3)			'敌人生命魔法
Dim g_EnemyAt(3),g_EnemyDf(3)			'敌人攻击防御
Dim g_EnemyQuick(3)					'敌人速
Dim g_EnemyDrug(3)					'敌人毒属性
Dim g_EnemyMess(3)					'敌人乱属性
Dim g_EnemySeal(3)					'敌人封属性
Dim g_EnemySleep(3)					'敌人眠属性
Dim g_EnemyChance(3)				'敌人攻击异常几率
Dim g_EnemyRound(3)					'敌人攻击异常持续回合
Dim g_EnemyMagicListID(3)				'敌人魔法链ID
Dim g_EnemyMagicChance(3)				'敌人魔法攻击几率
Dim g_EnemyMagicGodListID(3)			'敌人携带物品链ID
Dim g_EnemyExp(3)					'敌人经验
Dim g_EnemyMoney(3)					'敌人金钱
'NPC数据
Dim g_NPCCount					'NPC计数
Dim g_NPCPic(NPC_MAX)				'NPC图片资源
Dim g_NPCbWalk(NPC_MAX)				'NPC是否自动行走
Dim g_NPCFace(NPC_MAX)				'NPC面向
Dim g_NPCStep(NPC_MAX)				'NPC脚步
Dim g_NPCX(NPC_MAX),g_NPCY(NPC_MAX)		'NPC位置坐标
Dim g_NPCSort(NPC_MAX)				'NPC排序
Dim g_NPCCenterX,g_NPCCenterY			'中心人物坐标
Dim g_NPCRunTick					'NPC上一次自动行走时间
Dim g_MapX,g_MapY					'地图绘制偏移主角坐标
'其它数据
Dim g_NumPic						'数字图片资源

'===============================================================================
'子程式声明
'===============================================================================
Declare Sub Main()					'主调函数
Declare Sub AppInit()				'程序初始化
Declare Sub ForWaitkey()				'应对第一个WaitKey()一闪而过
Declare Function GetKey()				'获取游戏控制按键
Declare Sub OnErr(Text$)				'错误处理
Declare Sub LoadMap(MapID,PicID)			'读取地图文件
Declare Sub MainMenu()				'主菜单
Declare Function GetX(x,w)				'求出按宽为w水平调整后的坐标
Declare Function GetY(y,h)				'求出按高为h垂直调整后的坐标
Declare Sub DrawMapLine(x,y,dx,dy)		'绘制地图行
Declare Sub DrawMapRow(x,y,dx,dy)			'绘制地图列
Declare Sub DrawMap(x,y)				'绘制与屏幕大小相同的地图
Declare Sub ShowMap()				'显示地图
Declare Sub NPCSort()				'排序NPC
'创建NPC
Declare Function CreateNPC(PicID,Face,Step,bWalk,x,y)
Declare Sub DrawAllNPC()				'绘制所有NPC
Declare Sub NPCSport()				'NPC运动处理
Declare Sub DriveMap()				'操纵地图
Declare Function CanMoveTo(x,y)			'检测位置是否可移动
Declare Sub Fight(ID)				'角色战斗
Declare Sub ftLoadEnemy(ID)			'读取敌人数据
Declare Sub ftLoadEnemyData(ID,EmyID)		'读取敌人战斗数据
Declare Sub ftSetFightBack(PicID)			'设置战斗背景图片
Declare Sub ftDrawEnemy(ID,x,y,bAt)		'绘制敌人
Declare Sub ftDrawAllEnemy()			'绘制所有敌人
Declare Sub ftSetActorPic(ID,PicID)		'设置角色战斗图片
Declare Sub ftDrawActor(ID,x,y,Index)		'绘制角色战斗图片
Declare Sub ftDrawAllActor()			'绘制所有角色战斗图片
Declare Function ftCheckActorOver(ID)		'检测角色是否死亡
Declare Sub ftSetActorbShow(bShow1,bShow2,bShow3)'设置是否显示角色
Declare Function ftCheckEnemyOver(ID)		'检测敌人是否死亡
Declare Sub ftSetEnemyShow(bShow1,bShow2,bShow3)'设置是否显示敌人
Declare Function ftChooseObject(bEnemy)		'选择一个战斗对象
Declare Sub ftActorAt(ID,EmyID)			'角色攻击
Declare Sub ftActorUseMagic(ID,MagID)		'角色使用魔法
Declare Sub ftEnemyAt(ID,ActID)			'敌人攻击
Declare Function ftCheckAllOver(bEnemy)		'检测对象是否全部死亡
Declare Function GetStringCount(Param$)		'获取字符串以"|"分割的子串
Declare Function GetStringItem$(Param$,Index)	'获取字符串以"|"分割的第Index个子串
Declare Function Choose(opt$,x,y,Line,Row,Mode)'从选择数据中选择一个项返回该项的ID
Declare Sub ShowNum(Page,Num,x,y)			'显示数字到页面
Declare Sub ShowMsg(Text$)				'显示消息到屏幕中心
Declare Sub Say(x,y,Text$)				'显示对话
Declare Sub RunScript(SptID)			'脚本运行函数
Declare Sub Script()				'脚本函数
'===============================================================================
'函数名：Main()
'说明：主调函数
'输入：
'输出：
'返回：
'备注：
'修改记录：2011-02-13
'===============================================================================
Sub Main()
	Dim Result
	AppInit()'程序初始化
STARTMAINMENU:
	Result=MainMenu()
	If Result=0 Then
		Script()
	Else If Result=1 Then
		ShowMsg("功能未实现！")
		GoTo STARTMAINMENU
	End If
End Sub
'===============================================================================
'函数名：Script()
'说明：脚本函数
'输入：
'输出：
'返回：
'备注：
'修改记录：
'===============================================================================
Sub Script()
	Dim NPCID(20)
	
	LoadMap(3,8)
	NPCID(0)=CreateNPC(1,FACE_DOWN,1,NPC_STAY,15,11)'第一个NPC实际上创建的是主角也就是你操纵的人物
	NPCID(1)=CreateNPC(3,FACE_RIGHT,1,1,14,12)'阿霞
	NPCID(2)=CreateNPC(20,FACE_LEFT,1,1,16,12)
	'地图绘制偏移主角坐标
	g_MapX=g_NPCX(0)-g_NPCCenterX+1
	g_MapY=g_NPCY(0)-g_NPCCenterY+1
	
	DrawMap(g_MapX,g_MapY)
	BitBltPage(g_LocalPg,g_MapPg)
	DrawAllNPC()
	ShowMap()
	Say(20,20,"任杰：对话测试！")
	Say(20,40,"任杰：战斗测试！")
	Fight(1)
	Say(20,20,"任杰：地图驱动测试！")
	DriveMap()
End Sub

'===============================================================================
'函数名：RunScript(SptID)
'说明：脚本运行函数
'输入：
'输出：
'返回：
'备注：
'修改记录：
'===============================================================================
Sub RunScript(SptID)
	Dim Address,over,opt
	
	Open g_SptsFileName$ For Binary As#FN_LOCAL
	
	Address=SptID*4+4
	Seek#FN_LOCAL,Address
	Get#FN_LOCAL,Address
	Address=Address+4
	Seek#FN_LOCAL,Address
	
	over=0
	While Not over
		Get#FN_LOCAL,opt
	Wend
	
	Close#FN_LOCAL
End Sub
'===============================================================================
'函数名：AppInit()
'说明：程序初始化
'输入：
'输出：
'返回：
'备注：
'修改记录：2011-02-13
'===============================================================================
Sub AppInit()
	Dim Env!
	Dim i
	Print"程序初始化中请稍等......"
	If DEBUG Then
		Env!=DEBUG_SIM
	Else
		Env!=GetEnv!()
	End If
	If Env!=ENV_SIM Then
		g_LCDW=LCD_SIM_W
		g_LCDH=LCD_SIM_H
	Else If Env!=ENV_9288 Then
		g_LCDW=LCD_9288_W
		g_LCDH=LCD_9288_H
	Else If Env!=ENV_9288T Then
		g_LCDW=LCD_9288T_W
		g_LCDH=LCD_9288T_H
	Else If Env!=ENV_9388 Then
		g_LCDW=LCD_9388_W
		g_LCDH=LCD_9388_H
	End If
	
	If GetEnv!()=ENV_SIM Then'设置图片资源文件后缀
		g_PicExt$=".rlb"
	Else
		g_PicExt$=".lib"
	End If
	
	SetLCD(g_LCDW,g_LCDH)'设置屏幕大小
	
	Randomize(GetTick())'初始化随机数种子
	
	g_SysPicFileName$=PATH_RES+FILENAME_SYSPIC+g_PicExt$'系统图片资源文件名
	g_MapPicFileName$=PATH_RES+FILENAME_MAPPIC+g_PicExt$'地图图片资源文件名
	g_NPCPicFileName$=PATH_RES+FILENAME_NPCPIC+g_PicExt$'NPC图片资源文件名
	g_ActorPicFileName$=PATH_RES+FILENAME_ACTORPIC+g_PicExt$'角色战斗图片资源文件名
	g_EmyPicFileName$=PATH_RES+FILENAME_ENEMY+g_PicExt$'敌人图片资源文件名
	g_FBPicFileName$=PATH_RES+FILENAME_FBPIC+g_PicExt$'战斗背景图片资源文件名
	g_EmyListsFileName$=PATH_RES+FILENAME_ENEMY+EXT_ENEMYLISTS'敌人链集合文件名
	g_EmysFileName$=PATH_RES+FILENAME_ENEMY+EXT_ENEMYS'敌人数据集合文件名
	g_MapsFileName$=PATH_RES+FILENAME_MAPPIC+".maps"'地图数据集合文件
	g_SptsFileName$=PATH_RES+"Script.spts"'脚本数据集合文件
	
	g_LocalPg=CreatePage()'申请局部使用绘制页面
	g_MapPg=CreatePage()'申请地图绘制页面
	
	'初始化NPC数据
	g_NPCCount=0
	g_MapPic=NULL'设置地图图片资源句柄为空
	g_NPCCenterX=(g_LCDW/TITLE_W)/2'算出中心人物坐标
	g_NPCCenterY=(g_LCDH/TITLE_H)/2
	
	g_NumPic=LoadRes(g_SysPicFileName$,PICID_NUM)
	
	If g_NumPic=-1 Then
		OnErr(g_SysPicFileName$+"文件不存在或损坏！")
	End If
	
	'设置默认战斗背景图片
	g_FightBackPic=NULL
	ftSetFightBack(FT_DEFFBPICID)
	
	g_FtCOPic=LoadRes(g_SysPicFileName$,FT_COPICID)
	
	If g_FtCOPic=-1 Then
		OnErr(g_SysPicFileName$+"文件不存在或损坏！")	
	End If
	
	'初始化角色战斗图片资源
	i=0
	While i<3
		g_ActPic(i)=NULL
		ftSetActorPic(i,i+1)
		i=i+1
	Wend
	
	'初始化角色
	g_ActCount=1
	ftSetActorbShow(TRUE,TRUE,TRUE)
End Sub
'===============================================================================
'函数名：OnErr(Text$)
'说明：错误处理
'输入：Text$:要显示的错误说明文本
'输出：
'返回：
'备注：
'修改记录：2011-02-14
'===============================================================================
Sub OnErr(Text$)
	Cls
	Print Text$
	Print ERR_WAITMS+"毫秒后自动退出！"
	MsDelay(ERR_WAITMS)
	End
End Sub

'===============================================================================
'函数名：LoadMap(FileName$,PicID)
'说明：从文件中读取地图数据
'输入：FileName$:地图文件名称;PicID:地图块图片资源ID
'输出：
'返回：
'备注：
'修改记录：2011-02-13
'===============================================================================
Sub LoadMap(MapID,PicID)
	Dim x,y
	Dim Address
	
	Open g_MapsFileName$ For Binary As#FN_LOCAL
	Address=(MapID-1)*4+4
	Seek#FN_LOCAL,Address
	Get#FN_LOCAL,Address
	Address=Address+4
	Seek#FN_LOCAL,Address
	Get#FN_LOCAL,g_MapW'读取地图宽度
	Get#FN_LOCAL,g_MapH'读取地图高度
	x=0
	y=0
	While x<g_MapW
		y=0
		While y<g_MapH
			Get#FN_LOCAL,g_Map(x,y)
			y=y+1
		Wend
		x=x+1
	Wend
	
	Close#FN_LOCAL
	
	If g_MapPic Then'如果已存在图片句柄
		FreeRes(g_MapPic)'释放图片句柄
		g_MapPic=NULL
	End If
	
	g_MapPic=LoadRes(g_MapPicFileName$,PicID)
	
	If g_MapPic=-1 Then
		OnErr(g_MapPicFileName$+"文件不存在或损坏！")
	End If
	g_MapLineX=GetPicWid(g_MapPic)/TITLE_W
End Sub
'===============================================================================
'函数名：MainMenu()
'说明：主菜单
'输入：
'输出：
'返回：
'备注：
'修改记录：2011-02-13
'===============================================================================
Sub MainMenu()
	Dim pic,i,pw,ph
	Dim ArrowPic(2)
	Dim cp,Tick
	Dim Over
	
	pic=LoadRes(g_SysPicFileName$,PICID_MAINMENU)'载入主菜单图片
	ArrowPic(0)=LoadRes(g_SysPicFileName$,PICID_MMARROW)'载入箭头图片
	ArrowPic(1)=LoadRes(g_SysPicFileName$,PICID_MMARROW+1)'载入箭头图片
	
	If pic=-1 Then
		OnErr(g_SysPicFileName$+"文件丢失或损坏！")
	End If
	
	pw=GetPicWid(pic)
	ph=GetPicHgt(pic)

	FillPage(g_LocalPg,0,0,g_LCDW,G_LCDH,0)'将整个页面刷黑
	i=0
	cp=0
	Over=0
	Tick=GetTick()
	While Not KeyPress(KEY_ENTER) And Not Over
		If KeyPress(KEY_UP) Then
			i=0
			MainMenu=0
		Else If KeyPress(KEY_DOWN) Then
			i=1
			MainMenu=1
		Else If KeyPress(KEY_ESCAPE) Then
			MainMenu=-1
			Over=1
		End If
		If GetTick()-Tick>MM_ARROWDELAY Then
			Tick=GetTick()
			If cp=0 Then
				cp=1
			Else
				cp=0
			End If
		End If
		ShowPic(g_LocalPg,pic,GetX(0,pw),GetY(0,ph),pw,ph,0,0,1)
		ShowPic(g_LocalPg,ArrowPic(cp),GetX(88,pw),GetY(10+i*16,ph),pw,ph,0,0,1)
		FlipPage(g_LocalPg)
	Wend
	
	FreeRes(Pic)
	FreeRes(ArrowPic(0))
	FreeRes(ArrowPic(1))
End Sub	
'===============================================================================
'函数名：GetX(x,w)
'说明：求出按宽为w水平调整后的坐标
'输入：x:w,h区域内x坐标;w:宽;h:
'输出：
'返回：
'备注：
'修改记录：2011-02-13
'===============================================================================
Function GetX(x,w)
	GetX=(g_LCDW-w)/2+x
End Function
'===============================================================================
'函数名：GetY(y,h)
'说明：求出按高为h垂直调整后的坐标
'输入：y:w,h区域内y坐标;w:宽;h:
'输出：
'返回：
'备注：
'修改记录：2011-02-13
'===============================================================================
Function GetY(y,h)
	GetY=(g_LCDH-h)/2+y
End Function
'===============================================================================
'函数名：DrawMapLine(x,y,dx,dy)
'说明：绘制从x,y处开始的地图到页面dx*TITLE_W,dy*TITLE_H处开始绘制长度与屏幕相兼容
'输入：x,y:开始绘制位置
'输出：
'返回：
'备注：
'修改记录：2011-02-14
'===============================================================================
Sub DrawMapLine(x,y,dx,dy)
	Dim ex
	Dim px,py
	
	ex=(g_LCDW-dx*TITLE_W)/TITLE_W
	
	While dx<ex
		If x<g_MapW And y<g_MapH And x>=0 And y>=0 Then
			px=(ABS(g_Map(x,y)) Mod g_MapLineX)*TITLE_W
			py=(ABS(g_Map(x,y))/g_MapLineX)*TITLE_H
			ShowPic(g_MapPg,g_MapPic,dx*TITLE_W,dy*TITLE_H,TITLE_W,TITLE_H,px,py,1)
		Else
			FillPage(g_MapPg,dx*TITLE_W,dy*TITLE_H,TITLE_W,TITLE_H,0)
		End If
		dx=dx+1
		x=x+1
	Wend
End Sub
'===============================================================================
'函数名：DrawMapRow(x,y,dx,dy)
'说明：绘制从x,y处开始的地图到页面dx*TITLE_W,dy*TITLE_H处开始绘制长度与屏幕相兼容
'输入：x,y:开始绘制位置
'输出：
'返回：
'备注：
'修改记录：2011-02-14
'===============================================================================
Sub DrawMapRow(x,y,dx,dy)
	Dim ey
	Dim px,py

	ey=(g_LCDH-dy*TITLE_H)/TITLE_H

	While dy<ey
		If x<g_MapW And y<g_MapH And x>=0 And y>=0 Then
			px=(ABS(g_Map(x,y)) Mod g_MapLineX)*TITLE_W
			py=(ABS(g_Map(x,y))/g_MapLineX)*TITLE_H
			ShowPic(g_MapPg,g_MapPic,dx*TITLE_W,dy*TITLE_H,TITLE_W,TITLE_H,px,py,1)
		Else
			FillPage(g_MapPg,dx*TITLE_W,dy*TITLE_H,TITLE_W,TITLE_H,0)
		End If
		dy=dy+1
		y=y+1
	Wend
End Sub	
'===============================================================================
'函数名：DrawMap(x,y)
'说明：从地图(x,y)位置开始绘制与屏幕大小相等的地图
'输入：
'输出：
'返回：
'备注：
'修改记录：2011-02-14
'===============================================================================
Sub DrawMap(x,y)
	Dim dx,dy
	
	ey=g_LCDH/TITLE_H
	
	dy=0
	While dy<ey
		DrawMapLine(x,y+dy,0,dy)
		dy=dy+1
	Wend
End Sub

'===============================================================================
'函数名：ShowMap()
'说明：显示地图
'输入：
'输出：
'返回：
'备注：
'修改记录：2011-02-14
'===============================================================================
Sub ShowMap()
	FlipPage(g_LocalPg)
End Sub

'===============================================================================
'函数名：CreateNPC(PicID,Face,bWalk,x,y)
'说明：创建NPC
'输入：PicID:NPC图片资源ID;Face:NPC面向;x,y:要创建到地图的位置
'输出：
'返回：
'备注：
'修改记录：2011-02-14
'===============================================================================
Function CreateNPC(PicID,Face,Step,bWalk,x,y)
	g_NPCPic(g_NPCCount)=LoadRes(g_NPCPicFileName$,PicID)
	
	If g_NPCPic(g_NPCCount)=-1 Then
		OnErr(g_NPCPicFileName$+"文件不存在或损坏！")
	End If
	g_NPCFace(g_NPCCount)=Face
	g_NPCStep(g_NPCCount)=Step
	g_NPCbWalk(g_NPCCount)=bWalk
	g_NPCX(g_NPCCount)=x
	g_NPCY(g_NPCCount)=y
	
	CreateNPC=g_NPCCount
	g_NPCCount=g_NPCCount+1
End Function
'===============================================================================
'函数名：NPCSort()
'说明：NPC排序
'输入：
'输出：
'返回：
'备注：
'修改记录：2011-02-14
'===============================================================================
Sub NPCSort()
	Dim i,i2,tmp

	'初始化排序数组
	i=0
	
	While i<g_NPCCount
		g_NPCSort(i)=i
		i=i+1
	Wend
	
	i=0
	While i<g_NPCCount And i+1<g_NPCCount
		i2=0
		While i2<g_NPCCount And i2+1<g_NPCCount
			If g_NPCY(g_NPCSort(i2))>g_NPCY(g_NPCSort(i2+1)) Then
				tmp=g_NPCSort(i2)
				g_NPCSort(i2)=g_NPCSort(i2+1)
				g_NPCSort(i2+1)=tmp
			End If
			i2=i2+1
		Wend
		i=i+1
	Wend
End Sub
'===============================================================================
'函数名：DriveMap()
'说明：操纵地图
'输入：
'输出：
'返回：
'备注：
'修改记录：2011-02-14
'===============================================================================
Sub DriveMap()
	Dim Over
	Dim Key
	Dim ax,ay
	Dim Result
	'地图绘制偏移主角坐标
	g_MapX=g_NPCX(0)-g_NPCCenterX+1
	g_MapY=g_NPCY(0)-g_NPCCenterY+1
	DrawMap(g_MapX,g_MapY)
	g_NPCRunTick=GetTick()'初始化NPC上一次运动时间
	
	Over=0
	While Not Over
		BitBltPage(g_LocalPg,g_MapPg)
		NPCSPort()
		NPCSort()
		DrawAllNpc()
		ShowMap()
		ax=g_NPCX(0)
		ay=g_NPCY(0)
		Key=GetKey()
		If Key<>0 And Key<>KEY_ENTER And Key<>KEY_SPACE And Key<>KEY_ESCAPE Then
			g_NPCStep(0)=g_NPCStep(0)+1
			If g_NPCStep(0)>=3 Then
				g_NPCStep(0)=0
			End If
		End If
		If Key=KEY_UP Then
			g_NPCFace(0)=FACE_UP
			ay=ay-1
		Else If Key=KEY_DOWN Then
			g_NPCFace(0)=FACE_DOWN
			ay=ay+1
		Else If Key=KEY_LEFT Then
			g_NPCFace(0)=FACE_LEFT
			ax=ax-1
		Else If Key=KEY_RIGHT Then
			g_NPCFace(0)=FACE_RIGHT
			ax=ax+1
		Else If Key=KEY_ENTER Then
			
		Else If Key=27 Then
			Result=Choose("继续游戏|退出游戏|",GetX(0,FB_PICW),GetY(0,FB_PICH),4,2,0)
			If Result=1 Then
				End
			End If
		End If
		If CanMoveTo(ax,ay) Then
			g_NPCX(0)=ax
			g_NPCY(0)=ay
			If Key=KEY_UP Then
				g_MapY=g_MapY-1
				BitBltPage(g_LocalPg,g_MapPg)
				StretchBltPage(0,TITLE_H,g_MapPg,g_LocalPg)
				DrawMapLine(g_MapX,g_MapY,0,0)
			Else If Key=KEY_DOWN Then
				g_MapY=g_MapY+1
				BitBltPage(g_LocalPg,g_MapPg)
				StretchBltPage(0,-TITLE_H,g_MapPg,g_LocalPg)
				DrawMapLine(g_MapX,g_MapY+(g_LCDH-TITLE_H)/TITLE_H,0,(g_LCDH-TITLE_H)/TITLE_H)
			Else If Key=KEY_LEFT Then
				g_MapX=g_MapX-1
				BitBltPage(g_LocalPg,g_MapPg)
				StretchBltPage(TITLE_W,0,g_MapPg,g_LocalPg)
				DrawMapRow(g_MapX,g_MapY,0,0)
			Else If Key=KEY_RIGHT Then
				g_MapX=g_MapX+1
				BitBltPage(g_LocalPg,g_MapPg)
				StretchBltPage(-TITLE_W,0,g_MapPg,g_LocalPg)
				DrawMapRow(g_MapX+(g_LCDW-TITLE_W)/TITLE_W,g_MapY,(g_LCDW-TITLE_W)/TITLE_W,0)
			End If
		End If
	Wend
End Sub
'===============================================================================
'函数名：CheckMsg(x,y,bNPC)
'说明：检测位置是否有地图切换点或NPC
'输入：x,y:要检测的位置;bNPC:是否是检测NPC
'输出：
'返回：
'备注：
'修改记录：
'===============================================================================
Function CheckMsg(x,y,bNPC)
End Function

'===============================================================================
'函数名：Fight(ID)
'说明：角色战斗
'输入：ID:敌人链ID
'输出：
'返回：
'备注：
'修改记录：2011-02-15
'===============================================================================
Sub Fight(ID)
	Dim Shared Fight_Opt(3),Fight_EmyID(3)
	Dim Shared Fight_Kind
	Dim Shared Fight_i
	Dim Kind

	ftSetEnemyShow(TRUE,TRUE,TRUE)
	ftLoadEnemy(ID)'载入敌人数据

	BitBltPage(g_LocalPg,g_MapPg)'绘制地图页面到临时页面
	ShowPic(g_LocalPg,g_FightBackPic,GetX(0,FB_PICW),GetY(0,FB_PICH),FB_PICW,FB_PICH,0,0,1)'绘制战斗背景图片
	
	g_ActCount=3
	g_ActHpMax(0)=100
	g_ActHp(0)=100
	g_ActAt(0)=60
FightRound:
	'战斗选择
	Fight_i=0
	While Fight_i<g_ActCount
		If Not ftCheckActorOver(Fight_i) Then
FightChoose:
			ftDrawAllEnemy()
			ftDrawAllActor()
			FlipPage(g_LocalPg)
			Fight_Opt(Fight_i)=Choose("攻击|魔法|物品|逃跑|",GetX(120,FB_PICW),GetY(0,FB_PICH),2,4,0)
			MsDelay(KEY_DELAY)
			If Fight_Opt(Fight_i)=0 Then
				Fight_EmyID(Fight_i)=ftChooseObject(1)
				If Fight_EmyID(Fight_i)=-1 Then GoTo FightChoose
			Else If Fight_Opt(Fight_i)<>0 Then
				ShowMsg("功能暂不支持！")
				GoTo FightChoose
			End If
		End If
		Fight_i=Fight_i+1
	Wend
	
	'战斗处理
	Fight_i=0
	While Fight_i<g_ActCount
		If Not ftCheckActorOver(Fight_i) Then
			ftActorAt(Fight_i,Fight_EmyID(Fight_i))
		End If
		Fight_i=Fight_i+1
	Wend
	
	If Not ftCheckAllOver(1) Then'敌人自动攻击
		Fight_i=0
		While Fight_i<g_EnemyCount
			If Not ftCheckEnemyOver(Fight_i) Then
				Kind=1
				If g_EnemyMagicChance(Fight_i)>0 Then
					Kind=Rnd(g_EnemyMagicChance(Fight_i))
				End If
				If Kind>=g_EnemyMagicChance(Fight_i) Then'普通攻击
					ftEnemyAt(Fight_i,Rnd(g_ActCount))
				Else'魔法攻击
				End If
			End If
			Fight_i=Fight_i+1
		Wend
	End If
	
	If Not ftCheckAllOver(0) And Not ftCheckAllOver(1) Then GoTo FightRound
	
	ShowMsg("战斗胜利！")
End Sub

'===============================================================================
'函数名：ftActorUseMagic(ID,MagID)
'说明：角色使用魔法
'输入：
'输出：
'返回：
'备注：
'修改记录：
'===============================================================================
Sub ftActorUseMagic(ID,MagID)
	
End Sub
'===============================================================================
'函数名：ftCheckAllOver(bEnemy)
'说明：检测对象是否全部死亡
'输入：bEnemy:是否为敌人
'输出：
'返回：
'备注：
'修改记录：
'===============================================================================
Function ftCheckAllOver(bEnemy)
	Dim i
	
	i=0
	If bEnemy Then
		While i<g_EnemyCount
			If Not ftCheckEnemyOver(i) Then
				ftCheckAllOver=FALSE
				GoTo EndftCheckAllOver
			End If
			i=i+1
		Wend
	Else
		While i<g_ActCount
			If Not ftCheckActorOver(i) Then
				ftCheckAllOver=FALSE
				GoTo EndftCheckAllOver
			End If
			i=i+1
		Wend		
	End If
	ftCheckAllOver=TRUE
EndftCheckAllOver:
End Function
'===============================================================================
'函数名：ftEnemyAt(ID,ActID)
'说明：敌人攻击
'输入：ID:进行攻击的敌人ID;ActID;要攻击的角色ID
'输出：
'返回：
'备注：
'修改记录：
'===============================================================================
Sub ftEnemyAt(ID,ActID)
	Dim x,y
	Dim Index
	Dim StepX
	Dim StepY
	Dim i
	Dim Harm
	
	If g_ActHp(ActID)<=0 Then
		If ActID=0 Then
			ActID=1
			If g_ActHp(ActID)<=0 Then
				ActID=2
			End If
		Else If ActID=1 Then
			ActID=0
			If g_ActHP(ActID)<=0 Then
				ActID=2
			End If
		Else If ActID=2 Then
			ActID=0
			If g_ActHP(ActID)<=0 Then
				ActID=1
			End If
		End If
	End If
	
	'计算伤害
	Harm=g_EnemyAt(ID)-g_ActDf(ActID)
	If Harm<=0 Then
		Harm=1
	End If
	
	g_EnemybShow(ID)=FALSE
	
	x=15+ID*30
	y=10-ID*5
	StepX=(x-ActID*30-40)/4
	StepY=(y-50+ActID*5)/4
	i=0
	While i<5
		ShowPic(g_LocalPg,g_FightBackPic,GetX(0,FB_PICW),GetY(0,FB_PICH),FB_PICW,FB_PICH,0,0,1)'绘制战斗背景图片
		ftDrawAllEnemy()
		ftDrawEnemy(ID,x,y,1)
		ftDrawAllActor()
		FlipPage(g_LocalPg)
		MsDelay(FT_ATDELAY)
		x=x-StepX
		y=y-StepY
		i=i+1
	Wend
	g_EnemybShow(ID)=TRUE
	g_ActbShow(ActID)=FALSE
	i=0
	While i<=3
		ShowPic(g_LocalPg,g_FightBackPic,GetX(0,FB_PICW),GetY(0,FB_PICH),FB_PICW,FB_PICH,0,0,1)'绘制战斗背景图片
		ftDrawAllEnemy()
		ftDrawAllActor()
		ftDrawActor(ActID,GetX(40+ActID*30,FB_PICW),GetY(50-ActID*5,FB_PICH),9)
		ShowNum(g_LocalPg,Harm,GetX(x+10,FB_PICW),GetY(y-i*2,FB_PICH))
		FlipPage(g_LocalPg)
		MsDelay(FT_ATDELAY)
		i=i+1
	Wend
	g_ActbShow(ActID)=TRUE
		
	g_ActHp(ActID)=g_ActHp(ActID)-Harm
	ShowPic(g_LocalPg,g_FightBackPic,GetX(0,FB_PICW),GetY(0,FB_PICH),FB_PICW,FB_PICH,0,0,1)'绘制战斗背景图片
	ftDrawAllEnemy()
	ftDrawAllActor()
End Sub

'===============================================================================
'函数名：ftActorAt(ID,EmyID)
'说明：角色攻击
'输入：ID:进行攻击的角色ID;EmyID:要攻击的敌人ID
'输出：
'返回：
'备注：
'修改记录：
'===============================================================================
Sub ftActorAt(ID,EmyID)
	Dim Shared ftActorAt_x,ftActorAt_y
	Dim Shared ftActorAt_Index
	Dim Shared ftActorAt_StepX
	Dim Shared ftActorAt_StepY
	Dim Shared ftActorAt_i
	Dim Harm
	
	If g_EnemyHp(EmyID)<=0 Then
		If EmyID=0 Then
			EmyID=1
			If g_EnemyHp(EmyID)<=0 Then
				EmyID=2
			End If
		Else If EmyID=1 Then
			EmyID=0
			If g_EnemyHP(EmyID)<=0 Then
				EmyID=2
			End If
		Else If EmyID=2 Then
			EmyID=0
			If g_EnemyHP(EmyID)<=0 Then
				EmyID=1
			End If
		End If
	End If
	'计算伤害
	Harm=g_ActAt(ID)-g_EnemyDf(EmyID)
	
	If Harm<=0 Then
		Harm=1
	End If

	g_ActbShow(ID)=FALSE
	
	ftActorAt_x=40+ID*30
	ftActorAt_y=50-ID*5
	ftActorAt_StepX=(15+EmyID*30-40-ID*30)/4
	ftActorAt_StepY=(10-EmyID*5-50+ID*5)/4
	
	ftActorAt_Index=1

	While ftActorAt_Index<5
		ShowPic(g_LocalPg,g_FightBackPic,GetX(0,FB_PICW),GetY(0,FB_PICH),FB_PICW,FB_PICH,0,0,1)'绘制战斗背景图片
		ftDrawAllEnemy()
		ftDrawAllActor()
		ftDrawActor(ID,GetX(ftActorAt_x+10,FB_PICW),GetY(ftActorAt_y,FB_PICH),ftActorAt_Index)
		FlipPage(g_LocalPg)
		MsDelay(FT_ATDELAY)
		ftActorAt_x=ftActorAt_x+ftActorAt_StepX
		ftActorAt_y=ftActorAt_y+ftActorAt_StepY

		ftActorAt_Index=ftActorAt_Index+1
	Wend
	g_ActbShow(ID)=TRUE
	g_EnemybShow(EmyID)=FALSE
	ftActorAt_i=0
	While ftActorAt_i<=3
		ShowPic(g_LocalPg,g_FightBackPic,GetX(0,FB_PICW),GetY(0,FB_PICH),FB_PICW,FB_PICH,0,0,1)'绘制战斗背景图片
		ftDrawAllEnemy()
		ftDrawEnemy(EmyID,15+EmyID*30,10-EmyID*5,TRUE)
		ftDrawAllActor()
		ShowNum(g_LocalPg,Harm,GetX(ftActorAt_x,FB_PICW),GetY(5+ftActorAt_y-ftActorAt_i*2,FB_PICH))
		FlipPage(g_LocalPg)
		MsDelay(FT_ATDELAY)
		ftActorAt_i=ftActorAt_i+1
	Wend
	g_EnemybShow(EmyID)=TRUE
		
	g_EnemyHp(EmyID)=g_EnemyHp(EmyID)-Harm
	ShowPic(g_LocalPg,g_FightBackPic,GetX(0,FB_PICW),GetY(0,FB_PICH),FB_PICW,FB_PICH,0,0,1)'绘制战斗背景图片
	ftDrawAllEnemy()
	ftDrawAllActor()
End Sub

'===============================================================================
'函数名：ftCheckEnemyOver(ID)
'说明：检测敌人是否死亡
'输入：ID:要检测的敌人ID
'输出：
'返回：敌人是否死亡
'备注：
'修改记录：
'=============================================================================== 
Function ftCheckEnemyOver(ID)
	If g_EnemyHp(ID)<=0 Then
		ftCheckEnemyOver=TRUE
	Else
		ftCheckEnemyOver=FALSE
	End If
End Function

'===============================================================================
'函数名：ftSetEnemyShow(bShow1,bShow2,bShow3)
'说明：设置敌人是否显示
'输入：是否要显示
'输出：
'返回：
'备注：
'修改记录：
'===============================================================================
Sub ftSetEnemyShow(bShow1,bShow2,bShow3)
	g_EnemybShow(0)=bShow1
	g_EnemybShow(1)=bShow2
	g_EnemybShow(2)=bShow3
End Sub
'===============================================================================
'函数名：ftSetActorPic(ID,PicID)
'说明：设置角色战斗图片
'输入：ID:要设置的角色ID;PicID:图片ID
'输出：
'返回：
'备注：
'修改记录：
'===============================================================================
Sub ftSetActorPic(ID,PicID)
	If g_ActPic(ID) Then
		FreeRes(g_ActPic(ID))
	End If
	g_ActPic(ID)=LoadRes(g_ActorPicFileName$,PicID)
	If g_ActPic(ID)=-1 Then
		OnErr(g_ActorPicFileName$+"不存在或损坏！")
	End If
End Sub
'===============================================================================
'函数名：ftDrawAllActor()
'说明：绘制所有战斗角色
'输入：
'输出：
'返回：
'备注：
'修改记录：
'===============================================================================
Sub ftDrawAllActor()
	Dim i
	Dim x,y,Index
	
	i=0
	x=40
	y=50
	
	While i<g_ActCount
		If g_ActbShow(i) Then
			Index=0
			If g_ActHp(i)<=(g_ActHpMax(i)/10) And g_ActHp(i)>0 Then
				Index=10
			Else If g_ActHp(i)<=0 Then
				Index=11
			End If

			ftDrawActor(i,GetX(x,FB_PICW),GetY(y,FB_PICH),Index)
		End If
		i=i+1
		x=x+30
		y=y-5
	Wend
End Sub

'===============================================================================
'函数名：ftDrawActor(ID,x,y,Index)
'说明：
'输入：
'输出：
'返回：
'备注：
'修改记录：
'===============================================================================
Sub ftDrawActor(ID,x,y,Index)
	Dim w,h,px,py

	w=GetPicWid(g_ActPic(ID))/4
	h=GetPicHgt(g_ActPic(ID))/3
	px=(Index Mod 4)*w
	py=(Index/4)*h
	ShowPic(g_LocalPg,g_ActPic(ID),x,y,w,h,px,py,1)
End Sub
'===============================================================================
'函数名：ftCheckActorOver(ID)
'说明：检测角色是否死亡
'输入：ID:角色ID
'输出：
'返回：
'备注：
'修改记录：
'===============================================================================
Function ftCheckActorOver(ID)
	If g_ActHp(ID)<=0 Then
		ftCheckActorOver=TRUE
	Else
		ftCheckActorOver=FALSE
	End If
End Function
'===============================================================================
'函数名：ftSetActorbShow(bShow1,bShow2,bShow3)
'说明：设置是否显示角色
'输入：是否显示
'输出：
'返回：
'备注：
'修改记录：
'===============================================================================
Sub ftSetActorbShow(bShow1,bShow2,bShow3)
	g_ActbShow(0)=bShow1
	g_ActbShow(1)=bShow2
	g_ActbShow(2)=bShow3
End Sub
'===============================================================================
'函数名：ftDrawAllEnemy()
'说明：绘制所有敌人
'输入：
'输出：
'返回：
'备注：
'修改记录：
'===============================================================================
Sub ftDrawAllEnemy()
	Dim i
	Dim x,y
	
	i=0
	x=5
	y=10
	While i<g_EnemyCount
		If Not ftCheckEnemyOver(i) And g_EnemybShow(i) Then
			ftDrawEnemy(i,x,y,FALSE)
		End If
		i=i+1
		x=x+30
		y=y-5
	Wend
End Sub

'===============================================================================
'函数名：ftDrawEnemy(ID,x,y,bAt)
'说明：绘制敌人
'输入：ID:敌人ID;x,y:绘制到的位置;bAt:是否为攻击图像
'输出：
'返回：
'备注：
'修改记录：2011-02-15
'===============================================================================
Sub ftDrawEnemy(ID,x,y,bAt)
	Dim Pic,w,h
	
	Pic=g_EnemyPic(ID)
	x=GetX(x,FB_PICW)
	y=GetY(y,FB_PICH)
	w=GetPicWid(Pic)/2
	h=GetPicHgt(Pic)
	ShowPic(g_LocalPg,Pic,x,y,w,h,bAt*w,0,1)
End Sub
'===============================================================================
'函数名：ftLoadEnemy(ID)
'说明：载入敌人
'输入：ID:敌人在敌人链集合文件中的ID
'输出：
'返回：
'备注：
'修改记录：2011-02-15
'===============================================================================
Sub ftLoadEnemy(ID)
	Dim i,Count
	Dim Address
	Dim Over
	
	Open g_EmyListsFileName$ For Binary As#FN_LOCAL
	
	Address=(ID-1)*4+4
	Seek#FN_LOCAL,Address
	Get#FN_LOCAL,Address
	Address=Address+4
	Seek#FN_LOCAL,Address
	g_EnemyCount=0'敌人数量归0
	i=0
	over=0
	Count=0
	While i<3 And Not over

		Get#FN_LOCAL,g_EnemyID(i)
		If g_EnemyID(i)<>0 Then
			Count=Count+1
		Else
			over=1
		End If
		i=i+1
	Wend
	g_EnemyCount=Count
	If g_EnemyCount=0 Then
		OnErr("敌人数量不能为0！")
	End If
	
	Close#FN_LOCAL
	i=0
	While i<g_EnemyCount
		ftLoadEnemyData(g_EnemyID(i),i)
		i=i+1
	Wend
End Sub
'===============================================================================
'函数名：ftChooseObject(bEnemy)
'说明：选择一个战斗对象
'输入：bEnemy:是否是选择敌人对象
'输出：
'返回：选择的对象ID
'备注：
'修改记录：
'===============================================================================
Function ftChooseObject(bEnemy)
	Dim Shared ftChooseEnemy_x,ftChooseEnemy_y
	Dim Shared ftChooseEnemy_w,ftChooseEnemy_h
	Dim Shared ftChooseEnemy_i
	Dim Shared ftChooseEnemy_Over
	Dim Shared ftChooseEnemy_Key
	
	If bEnemy Then
		ftChooseEnemy_x=15
		ftChooseEnemy_y=10
	Else
		ftChooseEnemy_x=45
		ftChooseEnemy_y=40
	End If
	ftChooseEnemy_w=GetPicWid(g_FtCOPic)
	ftChooseEnemy_h=GetPicHgt(g_FtCOPic)
	ftDrawAllEnemy()
	ftDrawAllActor()
	FlipPage(g_LocalPg)
	ftChooseEnemy_i=0
	If bEnemy Then
		While ftCheckEnemyOver(ftChooseEnemy_i)
			ftChooseEnemy_i=ftChooseEnemy_i+1
		Wend
	End If
	ShowPic(-1,g_FtCOPic,GetX(ftChooseEnemy_x+ftChooseEnemy_i*30,FB_PICW),GetY(ftChooseEnemy_y-ftChooseEnemy_i*5,FB_PICH),ftChooseEnemy_w,ftChooseEnemy_h,0,0,1)
	ftChooseEnemy_over=0
	While Not ftChooseEnemy_over
		ftChooseEnemy_Key=GetKey()
		If ftChooseEnemy_Key=KEY_LEFT Then
			ftChooseEnemy_i=ftChooseEnemy_i-1
			If bEnemy And ftCheckEnemyOver(ftChooseEnemy_i) Then
				ftChooseEnemy_i=ftChooseEnemy_i-1
				If ftCheckEnemyOver(ftChooseEnemy_i) Then
					ftChooseEnemy_i=ftChooseEnemy_i+2
				End If
			End If
			If ftChooseEnemy_i=-1 Then
				ftChooseEnemy_i=0
			Else
				FlipPage(g_LocalPg)
				ShowPic(-1,g_FtCOPic,GetX(ftChooseEnemy_x+ftChooseEnemy_i*30,FB_PICW),GetY(ftChooseEnemy_y-ftChooseEnemy_i*5,FB_PICH),ftChooseEnemy_w,ftChooseEnemy_h,0,0,1)
			End If
		Else If ftChooseEnemy_Key=KEY_RIGHT Then
			ftChooseEnemy_i=ftChooseEnemy_i+1
			If bEnemy And ftCheckEnemyOver(ftChooseEnemy_i) Then
				ftChooseEnemy_i=ftChooseEnemy_i+1
				If ftCheckEnemyOver(ftChooseEnemy_i) Then
					ftChooseEnemy_i=ftChooseEnemy_i-2
				End If
			End If
			If ftChooseEnemy_i=3 Then
				ftChooseEnemy_i=2
			Else
				FlipPage(g_LocalPg)
				ShowPic(-1,g_FtCOPic,GetX(ftChooseEnemy_x+ftChooseEnemy_i*30,FB_PICW),GetY(ftChooseEnemy_y-ftChooseEnemy_i*5,FB_PICH),ftChooseEnemy_w,ftChooseEnemy_h,0,0,1)
			End If
		Else If ftChooseEnemy_Key=KEY_ENTER Then
			ftChooseEnemy_over=1
		Else If ftChooseEnemy_Key=KEY_ESCAPE Then
			ftChooseObject=-1
			GoTo EndftChooseEnemy
		End If
	Wend
	ftChooseObject=ftChooseEnemy_i
EndftChooseEnemy:
	FlipPage(g_LocalPg)
End Function

'===============================================================================
'函数名：ftLoadEnemyData(ID,EmyID)
'说明：读取敌人战斗数据
'输入：ID:敌人战斗数据在数据集合文件中的ID;EmyID:要载入到的敌人数据变量ID
'输出：
'返回：
'备注：
'修改记录：2011-02-15
'===============================================================================
Sub ftLoadEnemyData(ID,EmyID)
	Dim Address
	Dim tmp

	Open g_EmysFileName$ For Binary As#FN_LOCAL
	
	Address=(ID-1)*4+4
	Seek#FN_LOCAL,Address
	Get#FN_LOCAL,Address
	Address=Address+4
	Seek#FN_LOCAL,Address
	Get#FN_LOCAL,tmp'读取敌人图片资源ID
	g_EnemyPic(EmyID)=LoadRes(g_EmyPicFileName$,tmp)
	If g_EnemyPic(EmyID)=-1 Then
		OnErr(g_EmyPicFileName$+"文件不存在或损坏！")
	End If
	Get#FN_LOCAL,g_EnemyHp(EmyID)
	Get#FN_LOCAL,g_EnemyMp(EmyID)
	Get#FN_LOCAL,g_EnemyAt(EmyID)
	Get#FN_LOCAL,g_EnemyDf(EmyID)
	Get#FN_LOCAL,g_EnemyQuick(EmyID)
	Get#FN_LOCAL,g_EnemyDrug(EmyID)
	Get#FN_LOCAL,g_EnemyMess(EmyID)
	Get#FN_LOCAL,g_EnemySeal(EmyID)
	Get#FN_LOCAL,g_EnemySleep(EmyID)
	Get#FN_LOCAL,g_EnemyChance(EmyID)
	Get#FN_LOCAL,g_EnemyRound(EmyID)
	Get#FN_LOCAL,g_EnemyMagicListID(EmyID)
	Get#FN_LOCAL,g_EnemyMagicChance(EmyID)
	Get#FN_LOCAL,g_EnemyMagicGodListID(EmyID)
	Get#FN_LOCAL,g_EnemyExp(EmyID)
	Get#FN_LOCAL,g_EnemyMoney(EmyID)
	
	Close#FN_LOCAL
End Sub
'===============================================================================
'函数名：ftSetFightBack(PicID)
'说明：设置战斗背景图片
'输入：PicID:战斗背景图片ID
'输出：
'返回：
'备注：
'修改记录：
'===============================================================================
Sub ftSetFightBack(PicID)
	If g_FightBackPic Then
		FreeRes(g_FightBackPic)
		g_FightBackPic=-NULL
	End If
	
	g_FightBackPic=LoadRes(g_FBPicFileName$,PicID)
	
	If g_FightBackPic=-1 Then
		OnErr(g_FBPicFileName$+"文件不存在或损坏！")
	End If
End Sub

'===============================================================================
'函数名：ForWaitkey()
'说明：等待几个特殊按键(解决Waitkey()函数一闪就过的bug但无返回值)
'输入：
'输出：
'返回：
'备注：
'修改记录：2011-02-14
'===============================================================================
Sub ForWaitkey()
	Msdelay(200)
	While Not Keypress(Key_Escape) And Not Keypress(Key_Enter) And Not Keypress(Key_Up) And Not Keypress(Key_Down) And Not Keypress(Key_Left) And Not Keypress(Key_Right) And Not Keypress(Key_Space)
	Wend
End Sub
'===============================================================================
'函数名：DrawAllNPC()
'说明：绘制所有NPC
'输入：
'输出：
'返回：
'备注：
'修改记录：2011-02-14
'===============================================================================
Sub DrawAllNPC()
	Dim i
	Dim dx,dy
	Dim srcx,srcy
	
	i=0
	While i<g_NPCCount
		dx=(-g_MapX+g_NPCX(g_NPCSort(i)))*TITLE_W
		dy=(-1-g_MapY+g_NPCY(g_NPCSort(i)))*TITLE_H
		srcx=g_NPCStep(g_NPCSort(i))*NPC_W
		srcy=g_NPCFace(g_NPCSort(i))*NPC_H

		ShowPic(g_LocalPg,g_NPCPic(g_NPCSort(i)),dx,dy,NPC_W,NPC_H,srcx,srcy,1)
		i=i+1
	Wend
End Sub
'===============================================================================
'函数名：NPCSport()
'说明：NPC运动处理
'输入：
'输出：
'返回：
'备注：
'修改记录：2011-02-15
'===============================================================================
Sub NPCSport()
	Dim i
	Dim x,y
	Dim Face
	
	If GetTick()-g_NPCRunTick>NPC_AUTORUNDELAY Then
		i=0
	
		While i<g_NPCCount
			If g_NPCbWalk(i) Then
				Face=g_NPCFace(i)
				g_NPCFace(i)=Rnd(4)
				x=g_NPCX(i)
				y=g_NPCY(i)
				If g_NPCFace(i)=FACE_UP And Face=FACE_UP Then
					y=y-1
				Else If g_NPCFace(i)=FACE_DOWN And Face=FACE_DOWN Then
					y=y+1
				Else If g_NPCFace(i)=FACE_LEFT And Face=FACE_LEFT Then
					x=x-1
				Else If g_NPCFace(i)=FACE_RIGHT And Face=FACE_RIGHT Then
					x=x+1
				End If
				If CanMoveTo(x,y) Then
					g_NPCX(i)=x
					g_NPCY(i)=y
				End If
				g_NPCStep(i)=g_NPCStep(i)+1
				If g_NPCStep(i)>=3 Then
					g_NPCStep(i)=0
				End If
			End If
			i=i+1
		Wend
		g_NPCRunTick=GetTick()
	End If
End Sub
'===============================================================================
'函数名：
'说明：
'输入：
'输出：
'返回：
'备注：
'修改记录：
'===============================================================================

'===============================================================================
'函数名：GetKey()
'说明：获取游戏控制按键
'输入：KEY_DELAY常量(按键延时，扩大按键响应时间）
'输出：	
'返回：游戏控制键值
'备注：
'修改记录：2011-02-15
'===============================================================================
Function GetKey()
	Dim GetKey_Tick,Getkey_over
	GetKey_Tick=Gettick()
	getkey_over=1
	While GetTick()-Getkey_Tick<KEY_DELAY
		if Getkey_over=1 then
			If Keypress(KEY_UP) Then
				Getkey=KEY_UP
				getkey_over=0
			Else If Keypress(KEY_DOWN) Then
				Getkey=KEY_DOWN
				getkey_over=0
			Else If Keypress(KEY_LEFT) Then
				Getkey=KEY_LEFT
				getkey_over=0
			Else If Keypress(KEY_RIGHT) Then
				Getkey=KEY_RIGHT
				getkey_over=0
			Else If Keypress(KEY_ENTER) Then
				Getkey=KEY_ENTER
				getkey_over=0
			Else If Keypress(32) Then
				Getkey=KEY_SPACE
				getkey_over=0
			Else If Keypress(KEY_ESCAPE) Then
				Getkey=KEY_ESCAPE
				getkey_over=0
			Else
				Getkey=0
			End If
		end if
	Wend
End Function
'===============================================================================
'函数名：CanMoveTo(x,y)
'说明：检测x,y位置可移动
'输入：x,y:要检测的位置
'输出：
'返回：
'备注：
'修改记录：2011-02-14
'===============================================================================
Function CanMoveTo(x,y)
	Dim i
	
	If g_Map(x,y)>0 And x<g_MapW And y<g_MapH And x>=0 And Y>=0 Then
		i=0
		While i<g_NPCCount
			If g_NPCX(i)=x And g_NPCY(i)=y Then
				CanMoveTo=FALSE
				GoTo EndCanMoveTo
			End If
			i=i+1
		Wend
		CanMoveTo=TRUE
	Else
		CanMoveTo=FALSE
	End If
EndCanMoveTo:
End Function
'===============================================================================
'函数名：GetStringCount(Param$)
'说明：获取字符串以"|"分割的子串个数
'输入：Param$:要分析的字符串
'输出：
'返回：
'备注：
'修改记录：2011-02-15
'===============================================================================
Function GetStringCount(Param$)
	Dim Shared GetStringCount_Count
	Dim Shared GetStringCount_spos
	Dim Shared GetStringCount_StrLen
	
	GetStringCount_Count=0
	GetStringCount_spos=Instr(GetStringCount_spos,"|",Param$)
	While GetStringCount_spos<>0 And GetStringCount_spos<>-1
		GetStringCount_spos=Instr(GetStringCount_spos+1,"|",Param$)
		GetStringCount_Count=GetStringCount_Count+1
	Wend
	GetStringCount=GetStringCount_Count
End Function

'===============================================================================
'函数名：GetStringItem$(Param$,Index)
'说明：获取字符串以"|"分割的第Index个子串
'输入：Param$:要分析的字符串;Index:要获取的字串
'输出：
'返回：
'备注：
'修改记录：2011-02-15
'===============================================================================
Function GetStringItem$(Param$,Index)
	Dim i,Count
	Dim StrLen
	Dim spos,epos
	Dim Item$
	
	i=0
	StrLen=Len(Param$)
	spos=0
	epos=Instr(spos,"|",Param$)
	While epos<>0 And epos<>-1
		If i=Index Then
			Item$=Mid$(Param$,spos,epos-spos)
			GoTo EndGetStringItem
		End If
		i=i+1
		spos=epos+1
		epos=Instr(spos,"|",Param$)
	Wend
EndGetStringItem:
	GetStringItem$=Item$
End Function

'===============================================================================
'函数名：Choose(opt$,,x,y,Line,Row,Mode)
'说明：从选择数据中选择一个项返回该项的ID
'输入：opt$:选择数据;x,y:选择框位置;Line:一行容纳的字符;Row:一列容纳的字符;Mode:是否可退出选择
'输出：
'返回：-1:未选择退出，其它为选择的选项序号
'备注：
'修改记录：2011-02-15
'===============================================================================
Function Choose(opt$,x,y,Line,Row,Mode)
	Dim Count
	Dim w,h
	Dim i
	Dim ShowSel,LastShowSel
	Dim Key
	Dim over
	
	Count=GetStringCount(opt$)'获取子串总数
	
	w=Line*16+6
	h=Row*16+6
	
	'绘制矩形框
	Fillpage(-1,x,y,w,h,0)
	FillPage(-1,x+2,y+2,w-4,h-4,&hFFFFFF)
	
	SetBkMode(OPAQUE)
	Color(&hFFFFFF,0,0)
	Font(FONT_16SONG)
	i=0
	FillPage(-1,x+3,i*116+y+3,w-6,16,0)
	PixLocate(x+3,y+3)
	Print GetStringItem$(opt$,0)

	i=1
	Color(0,&hFFFFFF,0)
	While i<Count And i<Row
		PixLocate(x+3,y+3+i*16)
		Print GetStringItem$(opt$,i)
		i=i+1
	Wend
	
	i=0
	Key=0
	over=0
	LastShowSel=0
	ShowSel=0
	While Not over
		Key=GetKey()
		If Key=KEY_UP Then
			Color(0,&hFFFFFF,0)
			FillPage(-1,x+3,i*16+y+3,w-6,16,&hFFFFFF)
			PixLocate(x+3,y+3+i*16)
			Print GetStringItem$(opt$,ShowSel+i)
			i=i-1
		Else If Key=KEY_DOWN Then
			If ShowSel+i<Count-1 Then
				Color(0,&hFFFFFF,0)
				FillPage(-1,x+3,i*16+y+3,w-6,16,&hFFFFFF)
				PixLocate(x+3,y+3+i*16)
				Print GetStringItem$(opt$,ShowSel+i)
				i=i+1
			End If
		Else If Key=KEY_ENTER Then
			Choose=ShowSel+i
			GoTo EndChoose
		End If
		If i=-1 Then
			If ShowSel<>0 Then
				ShowSel=ShowSel-1
			End If
			i=0
		Else If i=Row And i<Count Then
			If ShowSel<>Count-Row Then
				ShowSel=ShowSel+1
			End If
			i=Row-1
		End If
		If Key<>0 Then
			If ShowSel<LastShowSel Then
				i=0
				Color(0,&hFFFFFF,0)
				While ShowSel+i<Count And i<Row
					FillPage(-1,x+3,i*16+y+3,w-6,16,&hFFFFFF)
					PixLocate(x+3,y+3+i*16)
					Print GetStringItem$(opt$,ShowSel+i)
					i=i+1
				Wend
				i=0
			Else If ShowSel>LastShowSel Then
				i=Row-1
				Color(0,&hFFFFFF,0)
				While i>=0
					FillPage(-1,x+3,i*16+y+3,w-6,16,&hFFFFFF)
					PixLocate(x+3,y+3+i*16)
					Print GetStringItem$(opt$,ShowSel+i)
					i=i-1
				Wend
				i=Row-1
			End If
			Color(&hFFFFFF,0,0)
			FillPage(-1,x+3,i*16+y+3,w-6,16,0)
			PixLocate(x+3,y+3+i*16)
			Print GetStringItem$(opt$,ShowSel+i)
		End If
		If Mode Then
			If Key=KEY_ESCAPE Then
				Choose=-1
				GoTo EndChoose
			End If
		End If
		LastShowSel=ShowSel
	Wend
EndChoose:

End Function
'===============================================================================
'函数名：ShowNum(Page,Num,x,y)
'说明：显示数字到页面
'输入：Page:要显示到的页面;Num:要显示的数字;x,y:要显示到的位置
'输出：
'返回：
'备注：
'修改记录：
'===============================================================================
Sub ShowNum(Page,Num,x,y)
	Dim Text$
	Dim i,StrLen,px
	Dim w,h
	
	w=GetPicWid(g_NumPic)/10
	h=GetPicHgt(g_NumPic)
	
	Text$=Str$(Num)
	StrLen=Len(Text$)
	i=0
	While i<StrLen
		px=Val(Mid$(Text$,i,1))*w
		ShowPic(Page,g_NumPic,x+i*w,y,w,h,px,0,1)
		i=i+1
	Wend
End Sub
'===============================================================================
'函数名：ShowMsg(Text$)
'说明：在屏幕中心显示消息
'输入：Text$:要显示的消息文本
'输出：
'返回：
'备注：
'修改记录：
'===============================================================================
Sub ShowMsg(Text$)
	Dim w,h
	
	w=Len(Text$)*8
	h=16
	
	SetBkMode(OPAQUE)
	Color(0,&hFFFFFF,0)
	Font(Font_16Song)
	PixLocate(GetX(0,w),GetY(0,h))
	Print Text$
	ForWaitKey()
End Sub
'===============================================================================
'函数名：Say(x,y,Text$)
'说明：显示对话
'输入：x,y:对话框显示位置;Text$:要显示的文本
'输出：
'返回：
'备注：
'修改记录：
'===============================================================================
Sub Say(x,y,Text$)
	Dim w,h
	Dim PgCount
	Dim i,l
	Dim CurPg
	
	x=GetX(x,FB_PICW)
	y=GetY(y,FB_PICH)
	w=16*8+2
	h=16*2+2
	
	Font(Font_16Song)
	FillPage(-1,x,y,w,h,0)
	SetBkMode(OPAQUE)
	Color(0,&hFFFFFF,0)
	
	PgCount=Len(Text$)/32
	If Len(Text$) Mod 32>0 Then
		PgCount=PgCount+1
	End If
	CurPg=0
	While CurPg<PgCount
		i=0
		FillPage(-1,x+1,y+1+i*16,w-2,h-2,&hFFFFFF)
		While i<2
			If (Len(Text$)-i*16-CurPg*32>=16) Then
				l=16
			Else
				l=Len(Text$)-i*16-CurPg*32
				If l<0 Then l=0
			End If
			PixLocate(x+1,y+1+i*16)
			If l>0 Then
				Print Mid$(Text$,i*16+CurPg*32,l)
			End If	
			i=i+1
		Wend
		ForWaitKey()
		CurPg=CurPg+1
	Wend
	ShowMap()
End Sub
'===============================================================================
'主程序
'===============================================================================
Asm
	Jmp STACKEND
	STACKSTART:'扩展栈大小为10KB
	.Block 10240,0
	STACKEND:
	LD int rb,STACKSTART
	LD int rs,STACKEND
	Cal int Add rs,-4
EndAsm
Main()


'===============================================================================
'Data区
'===============================================================================
