'===============================================================================
'��������FMEngine
'���ߣ��ν�
'��Ȩ����������ʹ���޸Ķ�����֪ͨ��O(��_��)O����~
'===============================================================================

'===============================================================================
'����
'===============================================================================
'�������
Const DEBUG			=	0
Const DEBUG_SIM		=	9287
'ƽ̨���
Const LCD_SIM_W		=	320
Const LCD_SIM_H		=	240
Const LCD_9288_W		=	320
Const LCD_9288_H		=	240
Const LCD_9288T_W		=	240
Const LCD_9288T_H		=	160
Const LCD_9388_W		=	240		'9388 9588 9688
Const LCD_9388_H		=	320
'��Դ���
Const PATH_RES		=	"FMEngine\"	'��Դ�ļ�Ŀ¼
Const FILENAME_SYSPIC	=	"Sys"		'ϵͳͼƬ��Դ�ļ���
Const FILENAME_MAPPIC	=	"Map"		'��ͼͼƬ��Դ�ļ���
Const FILENAME_NPCPIC	=	"NPC"		'NPCͼƬ��Դ�ļ���
Const FILENAME_ACTORPIC	=	"Actor"	'����ս��ͼƬ��Դ�ļ���
Const FILENAME_FBPIC	=	"FightBack"	'ս������ͼƬ��ԴID
Const FILENAME_ENEMY	=	"Enemy"	'���������ļ���
Const EXT_ENEMYS		=	".emys"	'�������ݼ����ļ���׺��
Const EXT_ENEMYLISTS	=	".emylists"	'�����������ļ���׺��
Const PICID_MAINMENU	=	7		'���˵�ͼƬ��ԴID
Const PICID_MMARROW		=	12		'���˵���ͷͼƬ��ԴID
Const PICID_NUM		=	1		'����ͼƬ��ԴID
'��ͼ���
Const MAPW_MAX		=	100		'��ͼ�����
Const MAPH_MAX		=	100		'��ͼ���߶�
Const TITLE_W			=	16		'��ͼ���
Const TITLE_H			=	16		'��ͼ���
Const FACE_UP			=	0		'NPC����-��
Const FACE_DOWN		=	2		'NPC����-��
Const FACE_LEFT		=	3		'NPC����-��
Const FACE_RIGHT		=	1		'NPC����-��
Const NPC_W			=	16		'NPC��ͼƬƴ��-��
Const NPC_H			=	32		'NPC��ͼƬƴ��-��
Const NPC_STAY		=	0		'NPCվ������
Const NPC_WALK		=	1		'NPC�Զ�����
Const NPC_MAX			=	20		'NPC�����Ŀ
Const NPC_AUTORUNDELAY	=	500		'NPC�Զ��˶���ʱ
'�ļ����
Const FN_LOCAL		=	1		'�ֲ��ļ���
Const FN_SCRIPT		=	2		'�ű��ļ���
'���������
Const ERR_WAITMS		=	1000		'������ʾ�ȴ�
'�߼����
Const TRUE			=	1		'��
Const FALSE			=	0		'��
Const NULL			=	0		'��
'ս�����
Const FT_DEFFBPICID		=	1		'ȱʡս������ͼƬ��ԴID
Const FT_COPICID		=	14		'ս��ѡ������ͷͼƬ��ԴID
Const FB_PICW			=	159		'ս������ͼƬ���
Const FB_PICH			=	96		'ս������ͼƬ�߶�
Const FT_ATDELAY		=	150		'ս�������������
'���˵����
Const MM_ARROWDELAY		=	300		'���˵���ͷ�����ӳ�
'����
Const FORWAITKEY_DELAY	=	500		'ForWaitKey()�����ȴ���ʱ
Const KEY_DELAY		=	300		'���������ʱ

'===============================================================================
'ȫ�ֱ���
'===============================================================================
'��Դ����
Dim g_PicExt$						'ͼƬ��Դ��׺��
Dim g_SysPicFileName$				'ϵͳͼƬ��Դ�ļ���
Dim g_MapPicFileName$				'��ͼͼƬ��Դ�ļ���
Dim g_NPCPicFileName$				'NPCͼƬ��Դ�ļ���
Dim g_ActorPicFileName$				'����ս��ͼƬ��Դ�ļ���
Dim g_EmyPicFileName$				'����ͼƬ��Դ�ļ���
Dim g_FBPicFileName$				'ս������ͼƬ��Դ�ļ���
Dim g_EmyListsFileName$				'�����������ļ���
Dim g_EmysFileName$					'�������ݼ����ļ���
Dim g_MapsFileName$					'��ͼ���ݼ����ļ���
Dim g_SptsFileName$					'�ű����ݼ����ļ���
'��ͼ����
Dim g_MapW,g_MapH					'��ͼ���
Dim g_Map(MAPW_MAX,MAPH_MAX)			'��ͼ��������
Dim g_MapPic						'��ͼͼƬ
Dim g_MapLineX					'��ͼͼƬһ��ͼ����
Dim g_MapPg						'��ͼ����ҳ��
'��ͼ����
Dim g_LocalPg						'�ֲ�ʹ��ҳ��
Dim g_LCDW,g_LCDH					'��Ļ���
'��ɫ����
Dim g_ActCount					'��ɫ����
Dim g_ActPic(3)					'��ɫͼƬ��Դ
Dim g_ActbShow(3)					'��ɫ�Ƿ���ʾ
Dim g_ActHP(3),g_ActMp(3)				'��ɫ����ħ��
Dim g_ActHpMax(3),g_ActMpMax(4)			'��ɫ����ħ������
Dim g_ActAt(3),g_ActDf(3)				'��ɫ��������
Dim g_ActQuick(3)					'��ɫ��
Dim g_ActMagic(3)					'��ɫ��
Dim g_ActLuck(63)					'��ɫ��
Dim g_ActDrug(3),g_ActMess(3)			'��ɫ����
Dim g_ActSeal(3),g_ActSleep(3)			'��ɫ����
Dim g_ActMagicCount					'��ɫħ������
Dim g_ActMagic(3,25)				'��ɫħ��
'ս�����
Dim g_FightBackPic					'ս������ͼƬ��Դ
Dim g_FtCOPic						'ѡ������ͷͼƬ��Դ
'��������
Dim g_EnemyCount					'��������
Dim g_EnemyID(3)					'ս������ID
Dim g_EnemybShow(3)					'�����Ƿ���ʾ
Dim g_EnemyPic(3)					'����ͼƬ��Դ
Dim g_EnemyMp(3),g_EnemyHp(3)			'��������ħ��
Dim g_EnemyAt(3),g_EnemyDf(3)			'���˹�������
Dim g_EnemyQuick(3)					'������
Dim g_EnemyDrug(3)					'���˶�����
Dim g_EnemyMess(3)					'����������
Dim g_EnemySeal(3)					'���˷�����
Dim g_EnemySleep(3)					'����������
Dim g_EnemyChance(3)				'���˹����쳣����
Dim g_EnemyRound(3)					'���˹����쳣�����غ�
Dim g_EnemyMagicListID(3)				'����ħ����ID
Dim g_EnemyMagicChance(3)				'����ħ����������
Dim g_EnemyMagicGodListID(3)			'����Я����Ʒ��ID
Dim g_EnemyExp(3)					'���˾���
Dim g_EnemyMoney(3)					'���˽�Ǯ
'NPC����
Dim g_NPCCount					'NPC����
Dim g_NPCPic(NPC_MAX)				'NPCͼƬ��Դ
Dim g_NPCbWalk(NPC_MAX)				'NPC�Ƿ��Զ�����
Dim g_NPCFace(NPC_MAX)				'NPC����
Dim g_NPCStep(NPC_MAX)				'NPC�Ų�
Dim g_NPCX(NPC_MAX),g_NPCY(NPC_MAX)		'NPCλ������
Dim g_NPCSort(NPC_MAX)				'NPC����
Dim g_NPCCenterX,g_NPCCenterY			'������������
Dim g_NPCRunTick					'NPC��һ���Զ�����ʱ��
Dim g_MapX,g_MapY					'��ͼ����ƫ����������
'��������
Dim g_NumPic						'����ͼƬ��Դ

'===============================================================================
'�ӳ�ʽ����
'===============================================================================
Declare Sub Main()					'��������
Declare Sub AppInit()				'�����ʼ��
Declare Sub ForWaitkey()				'Ӧ�Ե�һ��WaitKey()һ������
Declare Function GetKey()				'��ȡ��Ϸ���ư���
Declare Sub OnErr(Text$)				'������
Declare Sub LoadMap(MapID,PicID)			'��ȡ��ͼ�ļ�
Declare Sub MainMenu()				'���˵�
Declare Function GetX(x,w)				'�������Ϊwˮƽ�����������
Declare Function GetY(y,h)				'�������Ϊh��ֱ�����������
Declare Sub DrawMapLine(x,y,dx,dy)		'���Ƶ�ͼ��
Declare Sub DrawMapRow(x,y,dx,dy)			'���Ƶ�ͼ��
Declare Sub DrawMap(x,y)				'��������Ļ��С��ͬ�ĵ�ͼ
Declare Sub ShowMap()				'��ʾ��ͼ
Declare Sub NPCSort()				'����NPC
'����NPC
Declare Function CreateNPC(PicID,Face,Step,bWalk,x,y)
Declare Sub DrawAllNPC()				'��������NPC
Declare Sub NPCSport()				'NPC�˶�����
Declare Sub DriveMap()				'���ݵ�ͼ
Declare Function CanMoveTo(x,y)			'���λ���Ƿ���ƶ�
Declare Sub Fight(ID)				'��ɫս��
Declare Sub ftLoadEnemy(ID)			'��ȡ��������
Declare Sub ftLoadEnemyData(ID,EmyID)		'��ȡ����ս������
Declare Sub ftSetFightBack(PicID)			'����ս������ͼƬ
Declare Sub ftDrawEnemy(ID,x,y,bAt)		'���Ƶ���
Declare Sub ftDrawAllEnemy()			'�������е���
Declare Sub ftSetActorPic(ID,PicID)		'���ý�ɫս��ͼƬ
Declare Sub ftDrawActor(ID,x,y,Index)		'���ƽ�ɫս��ͼƬ
Declare Sub ftDrawAllActor()			'�������н�ɫս��ͼƬ
Declare Function ftCheckActorOver(ID)		'����ɫ�Ƿ�����
Declare Sub ftSetActorbShow(bShow1,bShow2,bShow3)'�����Ƿ���ʾ��ɫ
Declare Function ftCheckEnemyOver(ID)		'�������Ƿ�����
Declare Sub ftSetEnemyShow(bShow1,bShow2,bShow3)'�����Ƿ���ʾ����
Declare Function ftChooseObject(bEnemy)		'ѡ��һ��ս������
Declare Sub ftActorAt(ID,EmyID)			'��ɫ����
Declare Sub ftActorUseMagic(ID,MagID)		'��ɫʹ��ħ��
Declare Sub ftEnemyAt(ID,ActID)			'���˹���
Declare Function ftCheckAllOver(bEnemy)		'�������Ƿ�ȫ������
Declare Function GetStringCount(Param$)		'��ȡ�ַ�����"|"�ָ���Ӵ�
Declare Function GetStringItem$(Param$,Index)	'��ȡ�ַ�����"|"�ָ�ĵ�Index���Ӵ�
Declare Function Choose(opt$,x,y,Line,Row,Mode)'��ѡ��������ѡ��һ����ظ����ID
Declare Sub ShowNum(Page,Num,x,y)			'��ʾ���ֵ�ҳ��
Declare Sub ShowMsg(Text$)				'��ʾ��Ϣ����Ļ����
Declare Sub Say(x,y,Text$)				'��ʾ�Ի�
Declare Sub RunScript(SptID)			'�ű����к���
Declare Sub Script()				'�ű�����
'===============================================================================
'��������Main()
'˵������������
'���룺
'�����
'���أ�
'��ע��
'�޸ļ�¼��2011-02-13
'===============================================================================
Sub Main()
	Dim Result
	AppInit()'�����ʼ��
STARTMAINMENU:
	Result=MainMenu()
	If Result=0 Then
		Script()
	Else If Result=1 Then
		ShowMsg("����δʵ�֣�")
		GoTo STARTMAINMENU
	End If
End Sub
'===============================================================================
'��������Script()
'˵�����ű�����
'���룺
'�����
'���أ�
'��ע��
'�޸ļ�¼��
'===============================================================================
Sub Script()
	Dim NPCID(20)
	
	LoadMap(3,8)
	NPCID(0)=CreateNPC(1,FACE_DOWN,1,NPC_STAY,15,11)'��һ��NPCʵ���ϴ�����������Ҳ��������ݵ�����
	NPCID(1)=CreateNPC(3,FACE_RIGHT,1,1,14,12)'��ϼ
	NPCID(2)=CreateNPC(20,FACE_LEFT,1,1,16,12)
	'��ͼ����ƫ����������
	g_MapX=g_NPCX(0)-g_NPCCenterX+1
	g_MapY=g_NPCY(0)-g_NPCCenterY+1
	
	DrawMap(g_MapX,g_MapY)
	BitBltPage(g_LocalPg,g_MapPg)
	DrawAllNPC()
	ShowMap()
	Say(20,20,"�νܣ��Ի����ԣ�")
	Say(20,40,"�νܣ�ս�����ԣ�")
	Fight(1)
	Say(20,20,"�νܣ���ͼ�������ԣ�")
	DriveMap()
End Sub

'===============================================================================
'��������RunScript(SptID)
'˵�����ű����к���
'���룺
'�����
'���أ�
'��ע��
'�޸ļ�¼��
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
'��������AppInit()
'˵���������ʼ��
'���룺
'�����
'���أ�
'��ע��
'�޸ļ�¼��2011-02-13
'===============================================================================
Sub AppInit()
	Dim Env!
	Dim i
	Print"�����ʼ�������Ե�......"
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
	
	If GetEnv!()=ENV_SIM Then'����ͼƬ��Դ�ļ���׺
		g_PicExt$=".rlb"
	Else
		g_PicExt$=".lib"
	End If
	
	SetLCD(g_LCDW,g_LCDH)'������Ļ��С
	
	Randomize(GetTick())'��ʼ�����������
	
	g_SysPicFileName$=PATH_RES+FILENAME_SYSPIC+g_PicExt$'ϵͳͼƬ��Դ�ļ���
	g_MapPicFileName$=PATH_RES+FILENAME_MAPPIC+g_PicExt$'��ͼͼƬ��Դ�ļ���
	g_NPCPicFileName$=PATH_RES+FILENAME_NPCPIC+g_PicExt$'NPCͼƬ��Դ�ļ���
	g_ActorPicFileName$=PATH_RES+FILENAME_ACTORPIC+g_PicExt$'��ɫս��ͼƬ��Դ�ļ���
	g_EmyPicFileName$=PATH_RES+FILENAME_ENEMY+g_PicExt$'����ͼƬ��Դ�ļ���
	g_FBPicFileName$=PATH_RES+FILENAME_FBPIC+g_PicExt$'ս������ͼƬ��Դ�ļ���
	g_EmyListsFileName$=PATH_RES+FILENAME_ENEMY+EXT_ENEMYLISTS'�����������ļ���
	g_EmysFileName$=PATH_RES+FILENAME_ENEMY+EXT_ENEMYS'�������ݼ����ļ���
	g_MapsFileName$=PATH_RES+FILENAME_MAPPIC+".maps"'��ͼ���ݼ����ļ�
	g_SptsFileName$=PATH_RES+"Script.spts"'�ű����ݼ����ļ�
	
	g_LocalPg=CreatePage()'����ֲ�ʹ�û���ҳ��
	g_MapPg=CreatePage()'�����ͼ����ҳ��
	
	'��ʼ��NPC����
	g_NPCCount=0
	g_MapPic=NULL'���õ�ͼͼƬ��Դ���Ϊ��
	g_NPCCenterX=(g_LCDW/TITLE_W)/2'���������������
	g_NPCCenterY=(g_LCDH/TITLE_H)/2
	
	g_NumPic=LoadRes(g_SysPicFileName$,PICID_NUM)
	
	If g_NumPic=-1 Then
		OnErr(g_SysPicFileName$+"�ļ������ڻ��𻵣�")
	End If
	
	'����Ĭ��ս������ͼƬ
	g_FightBackPic=NULL
	ftSetFightBack(FT_DEFFBPICID)
	
	g_FtCOPic=LoadRes(g_SysPicFileName$,FT_COPICID)
	
	If g_FtCOPic=-1 Then
		OnErr(g_SysPicFileName$+"�ļ������ڻ��𻵣�")	
	End If
	
	'��ʼ����ɫս��ͼƬ��Դ
	i=0
	While i<3
		g_ActPic(i)=NULL
		ftSetActorPic(i,i+1)
		i=i+1
	Wend
	
	'��ʼ����ɫ
	g_ActCount=1
	ftSetActorbShow(TRUE,TRUE,TRUE)
End Sub
'===============================================================================
'��������OnErr(Text$)
'˵����������
'���룺Text$:Ҫ��ʾ�Ĵ���˵���ı�
'�����
'���أ�
'��ע��
'�޸ļ�¼��2011-02-14
'===============================================================================
Sub OnErr(Text$)
	Cls
	Print Text$
	Print ERR_WAITMS+"������Զ��˳���"
	MsDelay(ERR_WAITMS)
	End
End Sub

'===============================================================================
'��������LoadMap(FileName$,PicID)
'˵�������ļ��ж�ȡ��ͼ����
'���룺FileName$:��ͼ�ļ�����;PicID:��ͼ��ͼƬ��ԴID
'�����
'���أ�
'��ע��
'�޸ļ�¼��2011-02-13
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
	Get#FN_LOCAL,g_MapW'��ȡ��ͼ���
	Get#FN_LOCAL,g_MapH'��ȡ��ͼ�߶�
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
	
	If g_MapPic Then'����Ѵ���ͼƬ���
		FreeRes(g_MapPic)'�ͷ�ͼƬ���
		g_MapPic=NULL
	End If
	
	g_MapPic=LoadRes(g_MapPicFileName$,PicID)
	
	If g_MapPic=-1 Then
		OnErr(g_MapPicFileName$+"�ļ������ڻ��𻵣�")
	End If
	g_MapLineX=GetPicWid(g_MapPic)/TITLE_W
End Sub
'===============================================================================
'��������MainMenu()
'˵�������˵�
'���룺
'�����
'���أ�
'��ע��
'�޸ļ�¼��2011-02-13
'===============================================================================
Sub MainMenu()
	Dim pic,i,pw,ph
	Dim ArrowPic(2)
	Dim cp,Tick
	Dim Over
	
	pic=LoadRes(g_SysPicFileName$,PICID_MAINMENU)'�������˵�ͼƬ
	ArrowPic(0)=LoadRes(g_SysPicFileName$,PICID_MMARROW)'�����ͷͼƬ
	ArrowPic(1)=LoadRes(g_SysPicFileName$,PICID_MMARROW+1)'�����ͷͼƬ
	
	If pic=-1 Then
		OnErr(g_SysPicFileName$+"�ļ���ʧ���𻵣�")
	End If
	
	pw=GetPicWid(pic)
	ph=GetPicHgt(pic)

	FillPage(g_LocalPg,0,0,g_LCDW,G_LCDH,0)'������ҳ��ˢ��
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
'��������GetX(x,w)
'˵�����������Ϊwˮƽ�����������
'���룺x:w,h������x����;w:��;h:
'�����
'���أ�
'��ע��
'�޸ļ�¼��2011-02-13
'===============================================================================
Function GetX(x,w)
	GetX=(g_LCDW-w)/2+x
End Function
'===============================================================================
'��������GetY(y,h)
'˵�����������Ϊh��ֱ�����������
'���룺y:w,h������y����;w:��;h:
'�����
'���أ�
'��ע��
'�޸ļ�¼��2011-02-13
'===============================================================================
Function GetY(y,h)
	GetY=(g_LCDH-h)/2+y
End Function
'===============================================================================
'��������DrawMapLine(x,y,dx,dy)
'˵�������ƴ�x,y����ʼ�ĵ�ͼ��ҳ��dx*TITLE_W,dy*TITLE_H����ʼ���Ƴ�������Ļ�����
'���룺x,y:��ʼ����λ��
'�����
'���أ�
'��ע��
'�޸ļ�¼��2011-02-14
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
'��������DrawMapRow(x,y,dx,dy)
'˵�������ƴ�x,y����ʼ�ĵ�ͼ��ҳ��dx*TITLE_W,dy*TITLE_H����ʼ���Ƴ�������Ļ�����
'���룺x,y:��ʼ����λ��
'�����
'���أ�
'��ע��
'�޸ļ�¼��2011-02-14
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
'��������DrawMap(x,y)
'˵�����ӵ�ͼ(x,y)λ�ÿ�ʼ��������Ļ��С��ȵĵ�ͼ
'���룺
'�����
'���أ�
'��ע��
'�޸ļ�¼��2011-02-14
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
'��������ShowMap()
'˵������ʾ��ͼ
'���룺
'�����
'���أ�
'��ע��
'�޸ļ�¼��2011-02-14
'===============================================================================
Sub ShowMap()
	FlipPage(g_LocalPg)
End Sub

'===============================================================================
'��������CreateNPC(PicID,Face,bWalk,x,y)
'˵��������NPC
'���룺PicID:NPCͼƬ��ԴID;Face:NPC����;x,y:Ҫ��������ͼ��λ��
'�����
'���أ�
'��ע��
'�޸ļ�¼��2011-02-14
'===============================================================================
Function CreateNPC(PicID,Face,Step,bWalk,x,y)
	g_NPCPic(g_NPCCount)=LoadRes(g_NPCPicFileName$,PicID)
	
	If g_NPCPic(g_NPCCount)=-1 Then
		OnErr(g_NPCPicFileName$+"�ļ������ڻ��𻵣�")
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
'��������NPCSort()
'˵����NPC����
'���룺
'�����
'���أ�
'��ע��
'�޸ļ�¼��2011-02-14
'===============================================================================
Sub NPCSort()
	Dim i,i2,tmp

	'��ʼ����������
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
'��������DriveMap()
'˵�������ݵ�ͼ
'���룺
'�����
'���أ�
'��ע��
'�޸ļ�¼��2011-02-14
'===============================================================================
Sub DriveMap()
	Dim Over
	Dim Key
	Dim ax,ay
	Dim Result
	'��ͼ����ƫ����������
	g_MapX=g_NPCX(0)-g_NPCCenterX+1
	g_MapY=g_NPCY(0)-g_NPCCenterY+1
	DrawMap(g_MapX,g_MapY)
	g_NPCRunTick=GetTick()'��ʼ��NPC��һ���˶�ʱ��
	
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
			Result=Choose("������Ϸ|�˳���Ϸ|",GetX(0,FB_PICW),GetY(0,FB_PICH),4,2,0)
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
'��������CheckMsg(x,y,bNPC)
'˵�������λ���Ƿ��е�ͼ�л����NPC
'���룺x,y:Ҫ����λ��;bNPC:�Ƿ��Ǽ��NPC
'�����
'���أ�
'��ע��
'�޸ļ�¼��
'===============================================================================
Function CheckMsg(x,y,bNPC)
End Function

'===============================================================================
'��������Fight(ID)
'˵������ɫս��
'���룺ID:������ID
'�����
'���أ�
'��ע��
'�޸ļ�¼��2011-02-15
'===============================================================================
Sub Fight(ID)
	Dim Shared Fight_Opt(3),Fight_EmyID(3)
	Dim Shared Fight_Kind
	Dim Shared Fight_i
	Dim Kind

	ftSetEnemyShow(TRUE,TRUE,TRUE)
	ftLoadEnemy(ID)'�����������

	BitBltPage(g_LocalPg,g_MapPg)'���Ƶ�ͼҳ�浽��ʱҳ��
	ShowPic(g_LocalPg,g_FightBackPic,GetX(0,FB_PICW),GetY(0,FB_PICH),FB_PICW,FB_PICH,0,0,1)'����ս������ͼƬ
	
	g_ActCount=3
	g_ActHpMax(0)=100
	g_ActHp(0)=100
	g_ActAt(0)=60
FightRound:
	'ս��ѡ��
	Fight_i=0
	While Fight_i<g_ActCount
		If Not ftCheckActorOver(Fight_i) Then
FightChoose:
			ftDrawAllEnemy()
			ftDrawAllActor()
			FlipPage(g_LocalPg)
			Fight_Opt(Fight_i)=Choose("����|ħ��|��Ʒ|����|",GetX(120,FB_PICW),GetY(0,FB_PICH),2,4,0)
			MsDelay(KEY_DELAY)
			If Fight_Opt(Fight_i)=0 Then
				Fight_EmyID(Fight_i)=ftChooseObject(1)
				If Fight_EmyID(Fight_i)=-1 Then GoTo FightChoose
			Else If Fight_Opt(Fight_i)<>0 Then
				ShowMsg("�����ݲ�֧�֣�")
				GoTo FightChoose
			End If
		End If
		Fight_i=Fight_i+1
	Wend
	
	'ս������
	Fight_i=0
	While Fight_i<g_ActCount
		If Not ftCheckActorOver(Fight_i) Then
			ftActorAt(Fight_i,Fight_EmyID(Fight_i))
		End If
		Fight_i=Fight_i+1
	Wend
	
	If Not ftCheckAllOver(1) Then'�����Զ�����
		Fight_i=0
		While Fight_i<g_EnemyCount
			If Not ftCheckEnemyOver(Fight_i) Then
				Kind=1
				If g_EnemyMagicChance(Fight_i)>0 Then
					Kind=Rnd(g_EnemyMagicChance(Fight_i))
				End If
				If Kind>=g_EnemyMagicChance(Fight_i) Then'��ͨ����
					ftEnemyAt(Fight_i,Rnd(g_ActCount))
				Else'ħ������
				End If
			End If
			Fight_i=Fight_i+1
		Wend
	End If
	
	If Not ftCheckAllOver(0) And Not ftCheckAllOver(1) Then GoTo FightRound
	
	ShowMsg("ս��ʤ����")
End Sub

'===============================================================================
'��������ftActorUseMagic(ID,MagID)
'˵������ɫʹ��ħ��
'���룺
'�����
'���أ�
'��ע��
'�޸ļ�¼��
'===============================================================================
Sub ftActorUseMagic(ID,MagID)
	
End Sub
'===============================================================================
'��������ftCheckAllOver(bEnemy)
'˵�����������Ƿ�ȫ������
'���룺bEnemy:�Ƿ�Ϊ����
'�����
'���أ�
'��ע��
'�޸ļ�¼��
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
'��������ftEnemyAt(ID,ActID)
'˵�������˹���
'���룺ID:���й����ĵ���ID;ActID;Ҫ�����Ľ�ɫID
'�����
'���أ�
'��ע��
'�޸ļ�¼��
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
	
	'�����˺�
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
		ShowPic(g_LocalPg,g_FightBackPic,GetX(0,FB_PICW),GetY(0,FB_PICH),FB_PICW,FB_PICH,0,0,1)'����ս������ͼƬ
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
		ShowPic(g_LocalPg,g_FightBackPic,GetX(0,FB_PICW),GetY(0,FB_PICH),FB_PICW,FB_PICH,0,0,1)'����ս������ͼƬ
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
	ShowPic(g_LocalPg,g_FightBackPic,GetX(0,FB_PICW),GetY(0,FB_PICH),FB_PICW,FB_PICH,0,0,1)'����ս������ͼƬ
	ftDrawAllEnemy()
	ftDrawAllActor()
End Sub

'===============================================================================
'��������ftActorAt(ID,EmyID)
'˵������ɫ����
'���룺ID:���й����Ľ�ɫID;EmyID:Ҫ�����ĵ���ID
'�����
'���أ�
'��ע��
'�޸ļ�¼��
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
	'�����˺�
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
		ShowPic(g_LocalPg,g_FightBackPic,GetX(0,FB_PICW),GetY(0,FB_PICH),FB_PICW,FB_PICH,0,0,1)'����ս������ͼƬ
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
		ShowPic(g_LocalPg,g_FightBackPic,GetX(0,FB_PICW),GetY(0,FB_PICH),FB_PICW,FB_PICH,0,0,1)'����ս������ͼƬ
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
	ShowPic(g_LocalPg,g_FightBackPic,GetX(0,FB_PICW),GetY(0,FB_PICH),FB_PICW,FB_PICH,0,0,1)'����ս������ͼƬ
	ftDrawAllEnemy()
	ftDrawAllActor()
End Sub

'===============================================================================
'��������ftCheckEnemyOver(ID)
'˵�����������Ƿ�����
'���룺ID:Ҫ���ĵ���ID
'�����
'���أ������Ƿ�����
'��ע��
'�޸ļ�¼��
'=============================================================================== 
Function ftCheckEnemyOver(ID)
	If g_EnemyHp(ID)<=0 Then
		ftCheckEnemyOver=TRUE
	Else
		ftCheckEnemyOver=FALSE
	End If
End Function

'===============================================================================
'��������ftSetEnemyShow(bShow1,bShow2,bShow3)
'˵�������õ����Ƿ���ʾ
'���룺�Ƿ�Ҫ��ʾ
'�����
'���أ�
'��ע��
'�޸ļ�¼��
'===============================================================================
Sub ftSetEnemyShow(bShow1,bShow2,bShow3)
	g_EnemybShow(0)=bShow1
	g_EnemybShow(1)=bShow2
	g_EnemybShow(2)=bShow3
End Sub
'===============================================================================
'��������ftSetActorPic(ID,PicID)
'˵�������ý�ɫս��ͼƬ
'���룺ID:Ҫ���õĽ�ɫID;PicID:ͼƬID
'�����
'���أ�
'��ע��
'�޸ļ�¼��
'===============================================================================
Sub ftSetActorPic(ID,PicID)
	If g_ActPic(ID) Then
		FreeRes(g_ActPic(ID))
	End If
	g_ActPic(ID)=LoadRes(g_ActorPicFileName$,PicID)
	If g_ActPic(ID)=-1 Then
		OnErr(g_ActorPicFileName$+"�����ڻ��𻵣�")
	End If
End Sub
'===============================================================================
'��������ftDrawAllActor()
'˵������������ս����ɫ
'���룺
'�����
'���أ�
'��ע��
'�޸ļ�¼��
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
'��������ftDrawActor(ID,x,y,Index)
'˵����
'���룺
'�����
'���أ�
'��ע��
'�޸ļ�¼��
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
'��������ftCheckActorOver(ID)
'˵��������ɫ�Ƿ�����
'���룺ID:��ɫID
'�����
'���أ�
'��ע��
'�޸ļ�¼��
'===============================================================================
Function ftCheckActorOver(ID)
	If g_ActHp(ID)<=0 Then
		ftCheckActorOver=TRUE
	Else
		ftCheckActorOver=FALSE
	End If
End Function
'===============================================================================
'��������ftSetActorbShow(bShow1,bShow2,bShow3)
'˵���������Ƿ���ʾ��ɫ
'���룺�Ƿ���ʾ
'�����
'���أ�
'��ע��
'�޸ļ�¼��
'===============================================================================
Sub ftSetActorbShow(bShow1,bShow2,bShow3)
	g_ActbShow(0)=bShow1
	g_ActbShow(1)=bShow2
	g_ActbShow(2)=bShow3
End Sub
'===============================================================================
'��������ftDrawAllEnemy()
'˵�����������е���
'���룺
'�����
'���أ�
'��ע��
'�޸ļ�¼��
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
'��������ftDrawEnemy(ID,x,y,bAt)
'˵�������Ƶ���
'���룺ID:����ID;x,y:���Ƶ���λ��;bAt:�Ƿ�Ϊ����ͼ��
'�����
'���أ�
'��ע��
'�޸ļ�¼��2011-02-15
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
'��������ftLoadEnemy(ID)
'˵�����������
'���룺ID:�����ڵ����������ļ��е�ID
'�����
'���أ�
'��ע��
'�޸ļ�¼��2011-02-15
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
	g_EnemyCount=0'����������0
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
		OnErr("������������Ϊ0��")
	End If
	
	Close#FN_LOCAL
	i=0
	While i<g_EnemyCount
		ftLoadEnemyData(g_EnemyID(i),i)
		i=i+1
	Wend
End Sub
'===============================================================================
'��������ftChooseObject(bEnemy)
'˵����ѡ��һ��ս������
'���룺bEnemy:�Ƿ���ѡ����˶���
'�����
'���أ�ѡ��Ķ���ID
'��ע��
'�޸ļ�¼��
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
'��������ftLoadEnemyData(ID,EmyID)
'˵������ȡ����ս������
'���룺ID:����ս�����������ݼ����ļ��е�ID;EmyID:Ҫ���뵽�ĵ������ݱ���ID
'�����
'���أ�
'��ע��
'�޸ļ�¼��2011-02-15
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
	Get#FN_LOCAL,tmp'��ȡ����ͼƬ��ԴID
	g_EnemyPic(EmyID)=LoadRes(g_EmyPicFileName$,tmp)
	If g_EnemyPic(EmyID)=-1 Then
		OnErr(g_EmyPicFileName$+"�ļ������ڻ��𻵣�")
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
'��������ftSetFightBack(PicID)
'˵��������ս������ͼƬ
'���룺PicID:ս������ͼƬID
'�����
'���أ�
'��ע��
'�޸ļ�¼��
'===============================================================================
Sub ftSetFightBack(PicID)
	If g_FightBackPic Then
		FreeRes(g_FightBackPic)
		g_FightBackPic=-NULL
	End If
	
	g_FightBackPic=LoadRes(g_FBPicFileName$,PicID)
	
	If g_FightBackPic=-1 Then
		OnErr(g_FBPicFileName$+"�ļ������ڻ��𻵣�")
	End If
End Sub

'===============================================================================
'��������ForWaitkey()
'˵�����ȴ��������ⰴ��(���Waitkey()����һ���͹���bug���޷���ֵ)
'���룺
'�����
'���أ�
'��ע��
'�޸ļ�¼��2011-02-14
'===============================================================================
Sub ForWaitkey()
	Msdelay(200)
	While Not Keypress(Key_Escape) And Not Keypress(Key_Enter) And Not Keypress(Key_Up) And Not Keypress(Key_Down) And Not Keypress(Key_Left) And Not Keypress(Key_Right) And Not Keypress(Key_Space)
	Wend
End Sub
'===============================================================================
'��������DrawAllNPC()
'˵������������NPC
'���룺
'�����
'���أ�
'��ע��
'�޸ļ�¼��2011-02-14
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
'��������NPCSport()
'˵����NPC�˶�����
'���룺
'�����
'���أ�
'��ע��
'�޸ļ�¼��2011-02-15
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
'��������
'˵����
'���룺
'�����
'���أ�
'��ע��
'�޸ļ�¼��
'===============================================================================

'===============================================================================
'��������GetKey()
'˵������ȡ��Ϸ���ư���
'���룺KEY_DELAY����(������ʱ�����󰴼���Ӧʱ�䣩
'�����	
'���أ���Ϸ���Ƽ�ֵ
'��ע��
'�޸ļ�¼��2011-02-15
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
'��������CanMoveTo(x,y)
'˵�������x,yλ�ÿ��ƶ�
'���룺x,y:Ҫ����λ��
'�����
'���أ�
'��ע��
'�޸ļ�¼��2011-02-14
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
'��������GetStringCount(Param$)
'˵������ȡ�ַ�����"|"�ָ���Ӵ�����
'���룺Param$:Ҫ�������ַ���
'�����
'���أ�
'��ע��
'�޸ļ�¼��2011-02-15
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
'��������GetStringItem$(Param$,Index)
'˵������ȡ�ַ�����"|"�ָ�ĵ�Index���Ӵ�
'���룺Param$:Ҫ�������ַ���;Index:Ҫ��ȡ���ִ�
'�����
'���أ�
'��ע��
'�޸ļ�¼��2011-02-15
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
'��������Choose(opt$,,x,y,Line,Row,Mode)
'˵������ѡ��������ѡ��һ����ظ����ID
'���룺opt$:ѡ������;x,y:ѡ���λ��;Line:һ�����ɵ��ַ�;Row:һ�����ɵ��ַ�;Mode:�Ƿ���˳�ѡ��
'�����
'���أ�-1:δѡ���˳�������Ϊѡ���ѡ�����
'��ע��
'�޸ļ�¼��2011-02-15
'===============================================================================
Function Choose(opt$,x,y,Line,Row,Mode)
	Dim Count
	Dim w,h
	Dim i
	Dim ShowSel,LastShowSel
	Dim Key
	Dim over
	
	Count=GetStringCount(opt$)'��ȡ�Ӵ�����
	
	w=Line*16+6
	h=Row*16+6
	
	'���ƾ��ο�
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
'��������ShowNum(Page,Num,x,y)
'˵������ʾ���ֵ�ҳ��
'���룺Page:Ҫ��ʾ����ҳ��;Num:Ҫ��ʾ������;x,y:Ҫ��ʾ����λ��
'�����
'���أ�
'��ע��
'�޸ļ�¼��
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
'��������ShowMsg(Text$)
'˵��������Ļ������ʾ��Ϣ
'���룺Text$:Ҫ��ʾ����Ϣ�ı�
'�����
'���أ�
'��ע��
'�޸ļ�¼��
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
'��������Say(x,y,Text$)
'˵������ʾ�Ի�
'���룺x,y:�Ի�����ʾλ��;Text$:Ҫ��ʾ���ı�
'�����
'���أ�
'��ע��
'�޸ļ�¼��
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
'������
'===============================================================================
Asm
	Jmp STACKEND
	STACKSTART:'��չջ��СΪ10KB
	.Block 10240,0
	STACKEND:
	LD int rb,STACKSTART
	LD int rs,STACKEND
	Cal int Add rs,-4
EndAsm
Main()


'===============================================================================
'Data��
'===============================================================================
