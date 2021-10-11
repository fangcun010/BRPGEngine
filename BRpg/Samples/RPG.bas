'===============================================================================
'							Bb-Rpg模板
'							By方寸
'===============================================================================
'===============================================================================
'常量
'===============================================================================
Const Hei=&H000000'颜色常量-黑
Const Bai=&Hffffff'颜色常量-白
Const Hui1=&H555555'颜色常量-深灰
Const Hui2=&Haaaaaa'颜色常量-浅灰
Const Face_Down = 0'npc面向-下
Const Face_Left = 1'npc面向-左
Const Face_Right = 2'npc面向-右
Const Face_Up = 3'npc面向-上
Const Npc_Wid = 32'npc块图片拼接-长
Const Npc_Hgt = 48'npc块图片拼接-宽
Const Tile_Wid = 32'地图块图片拼接-长
Const Tile_Hgt = 32'地图块图片拼接-宽
Const Npc_Stay=0'npc站立不动
Const Npc_Round=1'npc巡逻
Const True=1'yes
Const False=0'no
Const Respath="异域传说\"
Const Picsay_Id=27
Const Say_X=21'say函数对话框x坐标
Const Say_Y=97'say函数对话框y坐标
Const Saycap_X=0'say函数头像x坐标
Const Saycap_Y=0'say函数头像y坐标
Const Lcd_Jx=0'兼容公用x坐标
Const Lcd_Jy=0'兼容公用y坐标
Const Lcd_Wid=240'模拟器屏幕宽
Const Lcd_Hgt=160'模拟器屏幕长
Const Actcasex=3'兼容用
Const Actcasey=3'兼容用

'===============================================================================
'全局变量
'===============================================================================
'优化用
Dim g_sj1,g_sj2,g_sj3,g_sj4
'玩家变量
Dim G_Actname$(3)
Dim G_Acthp(3),G_Actmp(3)'角色属性
Dim G_Acthpmax(3),G_Actmpmax(3)
Dim G_Actdj(3)'角色等级
Dim G_Actjq,G_Actpicid
Dim G_Actgj(3),G_Actfy(3),G_Actmj(3),G_Actfs(3),G_Actmf(3,100)
Dim G_Actgjkg(3),G_Actjy(3),G_Actjymax(3),G_Actxy(3)'福缘
Dim G_Sld(3)'属性点
Dim g_actzbtd(3),g_actzbsc(3),g_actzbsc(3),g_actzbjc
Dim G_Actfightpic(3),G_Actwps,G_Actwp(100)
Dim G_Maplayer0(80,80)'地图数据(双层地图)
Dim G_Maplayer1(80,80)'地图数据(双层地图)
Dim G_Mapw,G_Maph'地图长,宽
Dim G_Npcx(21),G_Npcy(21)'npc坐标
Dim G_Npcid(21)	'npc资源id
Dim G_Npcpic(21)'npc图片
Dim G_Event_Num(31)'为了减少计算量
Dim G_Event(50)'31*50-1 一个变量分解成31个2进制变量
Dim G_Npcface(21)'npc的面向
Dim G_Npcorstay(21)'是否允许该npc自由运动
'图像变量
Dim G_Page_Map'用于存储地图图像
Dim G_Page_Sundry'用于存储杂类图像
Dim G_Page_Sundry2'用于存储杂类图像
Dim G_Lib$'用于存储图片资源路径
Dim G_XYBoxpic'横纵坐标盒子
Dim G_Sayboxpic
Dim G_Maptitlepic'地图图片资源
Dim G_Pline'map图片资源宽/Title_Wid
Dim G_Mappiconoff'用于判断是否有已载入的map图片资源
Dim G_Npctaxis(21)'用于冒泡法排序场景中的npc及主角
Dim G_Npcdaihao'场景中的npc代号
Dim G_Npccount'场景中的npc总数
Dim G_Npcstep(21)'npc对象脚步
Dim G_Npcw(21),G_Npch(21)'npc图片宽高
Dim G_Npcmode(21)
Dim G_Message'用于传递场景时间消息
Dim G_Mapx,G_Mapy'传递地图显示起始位置
Dim G_Npcrundelay'npc自动行动延时
Dim G_Npcrunstart'起始延时用
Dim G_Actrundelay'主角行走延时
Dim G_Fightbackpic
Dim G_Res$'图片资源后缀
Dim G_Boxpic'宝箱
Dim G_Numberpic'数字
Dim G_Djname$(100),G_Djleixing(100)'道具数据
Dim G_Dj1(100),G_Dj2(100),G_Dj3(100)
Dim G_Djpicid(100)
Dim G_Djms$(100)
Dim G_Mfname$(100)'魔法数据
Dim G_Mffw(100),G_Mfleixing(100)
Dim G_Mfdhid(100)
Dim G_Mf1(100),G_Mf2(100),G_Mfms$(100)
Dim G_Drpicid(100),G_Drhp(100),G_Drmp(100)
Dim G_Drfy(100),G_Drgj(100),G_Drmj(100)'敌人数据存储数组用于快速访问
Dim G_Drmfid(100)'敌人魔法id
Dim G_Dhs(100),G_Dhe(100)'动画开始帧 动画结束帧
Dim G_Dhbx(100),G_Dhby(100)
Dim G_Actcount'角色数目
Dim G_Mhpboxpic,G_Gameoverpic'
Dim G_Ftmenupic,G_Jtpic'战斗菜单
Dim G_Ftid(3)'敌人在敌人数组中的id
Dim G_Fthp(3),G_Ftmp(3),G_Ftmj(3),G_Ftmf(3)'敌人数据
Dim G_Ftpic(3)'敌人图片数据
Dim G_Ftfy(3),G_Ftgj(3)
Dim G_Ftcount'战斗敌人个数
Dim G_Ftgrow(3)'用于判断敌人生死
Dim G_Ftgjkg(3)
Dim G_Ftx,G_Fty'战斗偏移量
Dim G_Actftx,G_Actfty
Dim G_Ftpx,G_Actpx,G_Actpy
Dim G_Cactdjs,G_Cactdj(100)
Dim G_Cho(3),G_Chox(3),G_Choxx(3),G_Fightmode
Dim G_Actwpsl(100)
Dim G_Fightover'0战斗1敌人死亡2角色死亡3逃跑
Dim G_Tmap'是否自动跳出地图控制以作其它处理
Dim G_Jp'游戏场景跳转
Dim G_DelayKey'按键延时扩大按键响应时间
Dim G_Delaykeyx'行走延迟扩大按键响应时间
'===============================================================================
'子程式声明
'===============================================================================
Declare Sub Forwaitkey()'等待几个特殊按键(解决waitkey函数一闪就过的bug但无返回值)
Declare Function Show(Page,Filen$,Loadn,X,Y)'相当于直接从资源库内显示图片,缩短程序耗时,Page为显示到的页面,X,Y要显示到的位置
Declare Sub Showgut(Picid)'显示游戏引
Declare Sub Printnext(Text$,Chang,X,Y)'在指定位置再放框内打印字符串
Declare Function If2(N)'判断事件
Declare Function Setevent(N)'设置事件
Declare Function Clrevent(N)'事件归0
Declare Function Show(Page,Filen$,Loadn,X,Y)'相当于直接从资源库内显示图片,缩短程序耗时,Page为显示到的页面,X,Y要显示到的位置
Declare Sub Say(Picid,Say$)'对话函数
Declare Function Showmap(X,Y)'显示指定区域的地图
Declare Sub Drawmap(X,Y)'将地图部分的画到g_Page_Map页面中去
Declare Function Maopaopaixu()'冒泡法排序npc及主角
Declare Sub Createnpc(Picid,X,Y,Chushiface,Step,Orstay)'创建一个npc对象
Declare Sub Drawnpc(Pic,Page,X,Y,Face,Stepx)'画一个npc对象到指定页面的指定位置
Declare Sub Getkey()'获取游戏控制按键
Declare Sub Drivemap()'操纵地图
Declare Sub Ggactorxy(X,Y)'更改角色在地图的位置到x，Y处
Declare Sub Checkmap(X,Y,Mode)'检测地图数据为正值还是负值
Declare Sub Npcsport()'npc运动
Declare Sub Checknpc(X,Y)'检测x，Y处是否有npc对象
Declare Sub Checkyiru(X,Y)'检测x，Y处的地图块是否可以移入
Declare Sub Dnpcsport(D)'单个npc移动处理
Declare Sub Createbox(X,Y,Mode,Onoff)'创建一个宝箱
Declare Sub Setmap1(X,Y,Mode,Cost)'设置上层地图
Declare Sub Setmap0(X,Y,Mode)'设置下层地图
Declare Sub Fastshow(Page,Res$,Picid,X,Y,W,H,Dx,Dy)'快速显示指定图片
Declare Sub Setfightback(Picid)'设置战斗背景图片
Declare Sub Shownumber(Page,Num,X,Y)'显示数字到指定位置
Declare Sub Loaddrpic()'载入敌人图片资源
Declare Sub Showanyfight()'刷新所有战斗对象
Declare Sub Playmf(Id,X,Y)'播放魔法
Declare Sub Gameinit()'初始化进入游戏时
Declare Sub Getdr()'从数组中载入敌人数据
Declare Sub Actfightxy(Id,Drid)'角色攻击动画处理
Declare Sub Drfightxy(Id,Actid)'敌人攻击动画处理
Declare Sub Showmf(Mfid,Mfmode,Ftid,Mode,Bx,By)'播放魔法动画
Declare Sub Mfbox(Actid)'魔法盒子
Declare Sub Msgbox(Text$)'消息盒子
Declare Sub Djbox()'道具盒子
Declare Sub Copyactdj()'复制角色道具非身穿
Declare Sub Delotherdj(Leixing)'删除除了所指道具类型以外的所有道具
Declare Sub Fight(Orge$,Mode)'战斗函数
Declare Sub Freedrpic()'释放敌人图片资源
Declare Sub Fightmenu(Actid)'战斗菜单
Declare Sub Fight_Dc()'战斗底层控制
Declare Sub Actback()'战斗艺术清屏
Declare Sub Fight_Xchoose(Choose,Actid)'战斗底层选择处理
Declare Sub Fight_Dxchoose(Mode)'战斗对象选择处理
Declare Sub Fight_Choose()'战斗选择处理
Declare Sub Runaway()'逃跑函数
Declare Sub Yesno(A$,B$)'选择函数
Declare Sub Hcopyactdj()'回拷角色道具
Declare Sub Fight_Wpchoosebox(Actid)'战斗物品选择处理
Declare Sub Delactwp(Wpid,Sl)'删除角色物品
Declare Sub Checkactwp(Wpid)'检测角色物品
Declare Sub Fight_Mfchoose(Actid)'战斗魔法处理
Declare Sub Fight_Choosecl()'战斗选择处理
Declare Sub Fight_Gjcl(Actid)'角色战斗攻击处理
Declare Sub Fight_Mfcl(Actid)'角色战斗魔法处理
Declare Sub Fight_Actmfdz(Actid)'角色放法动作处理
Declare Sub Checkactover()'检测角色是否全部死亡
Declare Sub Checkftover()'检测敌人是否全部死亡
Declare Sub Checkftgrow()'将死亡敌人清除
Declare Sub Showftnumber(Num1,Num2,Num3,Ftid,Fwmode,Mode)'显示战斗数字
Declare Sub Checkft()'检测敌人是否死亡并清除死亡的敌人
Declare Sub Checkactmax()'检测角色hp Mp是否超过最大值
Declare Sub Playpydh()'播放飘叶动画
Declare Sub Playgcdh()'播放过场动画
Declare Sub Showgamename()'显示游戏名称
Declare Sub Gamestart()'游戏开始处理
Declare Sub Mainmenu()'主菜单
Declare Sub Printstr(Text$,X,Y,Mode,Hang)'按指定方式打印字符串
Declare Sub Newgamedh()'新游戏开始动画
Declare Sub Csnewgame()'初始化新游戏
Declare Sub Script(Jp)'游戏脚本
Declare Sub Loadmap(Mapname$,Picid)'读取地图
Declare Sub Startmenu()'主菜单处理
Declare Sub Showload()'显示load图片
Declare Sub Fightover()'战斗结束处理
Declare Sub Drmf(Ftid,Cs)'敌人魔法处理
Declare Sub Gamefight(A$,B$,Jq,Jy,Mode)'战斗处理
Declare Sub Sjcl()'升级处理
Declare Sub Npczxact(Npcid)'npc转向角色
Declare Sub Showactxymap()'显示角色周围地图
Declare Sub Savegame(Path$)'存储游戏
Declare Sub Readgame(Path$)'读取游戏
Declare Sub Choose3x1(A$,B$,C$)'3选1
Declare Sub Zhizuoqunzu()'制作群组
Declare Sub Shezhiyouxi()'设置游戏
Declare Sub Drptgj(Ftid,Cs)'敌人普通攻击处理
Declare Sub Escmenu()'退出菜单
Declare Sub Ztbox(Actid)'状态盒子
Declare Sub Zbbox(Actid)'装备盒子
Declare Sub Wpbox(Id)'物品盒子的增强版用于当铺商贩
Declare Sub Fsbox(Actid,Id)'魔法盒子的增强般
Declare Sub Sysbox()'系统盒子
Declare Sub Delallnpc(Mode)'删除所有npc除了主角
Declare Sub Escmenucl()'esc菜单处理
Declare Sub Ztboxcl()'状态菜单处理
Declare Sub Zbboxcl()'装备菜单处理
Declare Sub Wpboxcl()'物品菜单处理
Declare Sub Sysboxcl()'系统菜单处理
Declare Sub Createactor(Picid,Face,Step,X,Y)'创建主角
Declare Sub ChooseAct()'在现有角色中选择一个并返回
Declare Sub AddActdJ(djid,s)'增加角色道具
Declare Sub ReadBox()'读取盒子
Declare Sub Savebox()'保存盒子
Declare Sub Getkey2()'为使打印字符串无延迟的折中
Declare Sub Main()'主调函数
'===============================================================================
'函数名：Main()
'说明：	主调函数
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Main()
	Gamestart()
End Sub

'===============================================================================
'函数名：Script(Jp)
'说明：	脚本函数
'输入：Jp负责场景跳转
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Script(Jp)
	Dim Lin,Over,Npcid(20),lin
	Createactor(g_actPicid,g_npcFace(0),g_npcStep(0),g_npcx(0),g_npcY(0))'创建角色
	if JP=0 then
		goto JP0
	else if JP=1 then
		goto JP1
	else if jp=2 then
		goto jp2
	end if
JP0:
	Fillpage(-1,0,0,240,160,0)
	Say(0,"午夜12点")
	Say(2,"任杰：作业好多啊，到现在还没有写完。")
	Say(3,"任杰：好想去古代，那就没有作业了。")
	Say(0,"过了一会。。。。。。。。。。。。。。")
	Say(3,"任杰：呼呼。。。（睡着了。）")
	Say(9,"陌生人：兄弟醒醒。")
	Say(3,"任杰：恩，该去学了吗？（迷糊中。。。）")
	Say(8,"陌生人：兄弟醒醒，你睡在我们客栈门口，我会被老板骂的！（说着使劲摇着任杰）")
	Say(4,"任杰：干什么啊？恩，你是谁怎么在我家。")
	Say(12,"陌生人：（这人该不会是疯子吧。）")
	Say(11,"陌生人：哦，原来大街就是你家啊！（别人都说疯子发起疯来会咬人的，最好别惹他。）")
	Say(2,"任杰：啊，我怎么睡在了大街上！这是哪啊？怎么没来过？难道这里是古代？")
	Say(12,"陌生人：（典型的疯子啊！）")
	Say(13,"陌生人：话说这里叫做三里镇。准确的说这里是现代。（这人病的不轻。古代都过去了，这当然是现代。）")
	Say(6,"任杰：看这一草一木，都是古代的风格，天啊！我来到古代啦，哈哈！终于可以不用写作业了！")
	Say(16,"陌生人：麻烦这位“古代人”，去别处去，我们还要营业，你挡住我们客栈门口了。")
	Say(6,"任杰：哦，我马上走！顺便问你一下，现在你什么朝代。")
	Say(16,"陌生人：太平历2010年。（这都不知道，这人真疯了！）")
	Say(2,"任杰：好熟悉的年份，不过貌似我学的中学历史中没这个年份。（哎，看来，打算用历史知识驰骋古代是不可能了。）")
	Say(0,"？：快打发他走，不然我们还做不做生意了。")
	Say(11,"陌生人：小兄弟，你看我们老板都发话了，你还是走吧！")
	Say(6,"任杰：好吧，我这就走。")
	Say(6,"任杰：四处去转转认识下新环境。")
	GgActorxy(6,4)
JP1:
	Showload()
	g_jp=1
	loadmap("三里镇",22)
	Setmap1(0,3,0,1)'设置行走事件:1出镇
	Setmap1(0,4,0,2)'设置行走事件:2出镇
	Setmap1(6,3,0,3)'设置行走事件:3酒店
	Setmap1(7,3,0,4)'设置行走事件:4酒店
	Setmap1(19,5,0,5)'设置行走事件:5后山
	Createnpc(13,15,5,Face_down,0,NPC_Round)'创建NPC:1
	Createnpc(12,6,13,Face_down,0,NPC_Round)'创建NPC:2
	Createnpc(15,2,14,Face_down,0,NPC_Stay)'创建NPC:3说书人
	Createnpc(17,1,14,Face_right,0,NPC_Stay)'创建NPC:4
	Createnpc(18,3,14,Face_left,0,NPC_Stay)'创建NPC:5
JP1GO:
	drivemap()'遇到NPC和事件图块会终止可以用变量获取Createnpc的返回值
	'若G_message等于该返回值就执行该块内的操作
	'图块事件是根据Setmap1最后的参数来判断是哪个图块的
	'或者用返回值
	'我这样写是因为NPC只有一个图块事件只有2个
	'自己能记下来它的返回值
	if g_message=1 then
		Say(0,"太可怕了，鬼啊！")
		Say(0,"此人望着后山大喊大叫道。")
		Say(2,"这人怎么了，怎么大白天喊见鬼了。")
		Say(6,"他看着后山喊叫的，难道说后山有什么怪事，快去看看！")
		SetEvent(0)
		goto jp1go
	else if g_Message=2 then
		Npczxact(2)
		Say(0,"听说有个说书的书说的不错，快去看看。")
		goto jp1go
	else if g_message<0 and g_message>-3 then
		Say(6,"在镇子里转转吧！")
		goto jp1go
	else if g_message=-5 then
		if if2(0) then
			'goto jp2
		else
		Say(6,"在镇子里转转吧！")			
		end if
		goto jp1go
	else
		say(6,"去里面做什么？")
		goto jp1go
	end if
JP2:
	ShowLoad()
	G_JP=2
	Loadmap("横道",21)
JP2GO:
	Drivemap()
TheGameisEnd:
	End
End Sub


'===============================================================================
'函数名：ChooseAct()
'说明：在现有角色中选择一个并返回
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub ChooseAct()
	Dim i
	i=0
	If G_Actcount=1 Then
		I=0
	Else If G_Actcount=2 Then
		I=Yesno(G_Actname$(0),G_Actname$(1))
	Else If G_Actcount=3 Then
		I=Choose3x1(G_Actname$(0),G_Actname$(1),G_Actname$(2))
	End If
	ChooseAct=i
End Sub




'===============================================================================
'函数名：Savebox()
'说明：	系统菜单处理
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Savebox()
	Dim Lin,Path$
Startsavegame:
	Fastshow(-1,Respath+"Sys"+G_Res$,11,0,0,240,160,0,0)
	Lin=Choose3x1("今世之缘1","今世之缘2","今世之缘3")
	If Lin<>-1 Then
		Path$=Respath+"Save\异域传说"+Lin+".Sav"
		Savegame(Path$)
		Msgbox("存储成功！")
	End If
	Savebox=Lin
End Sub
'===============================================================================
'函数名：Sysboxcl()
'说明：	系统菜单处理
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Sysboxcl()
	Dim Lin
	Lin=Sysbox()
	If Lin=0 Then'存储游戏
		Savebox()
	Else If Lin=1 Then'读取游戏
		Readbox()
	Else If Lin=2 Then'退出游戏
		Delallnpc(1)
		Startmenu()
	End If
End Sub



'===============================================================================
'函数名：Fsboxcl()
'说明：	
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Fsboxcl()
	Dim Lin,I,Cs,Mfid,Mffw,Mflx
	'法术拥有者选择
	If G_Actcount=1 Then
		I=0
	Else If G_Actcount=2 Then
		I=Yesno(G_Actname$(0),G_Actname$(1))
	Else If G_Actcount=3 Then
		I=Choose3x1(G_Actname$(0),G_Actname$(1),G_Actname$(2))
	End If
	Cs=I
	Lin=0
StartFS:
	Lin=Fsbox(Cs,Lin)
	
	Mfid=G_Actmf(Cs,Lin)
	Mffw=G_Mffw(Mfid)
	Mflx=G_Mfleixing(Mfid)
	
	'法术作用者选择
	
	If Mflx=1 Then'战斗类法术
		msgbox("战斗中才能使用！")
		goto StartFs
	End If
	'效果处理
End Sub


'===============================================================================
'函数名：Wpboxcl()
'说明：	物品菜单处理
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Wpboxcl()
	Dim Lin,I,Cs,wpid,wplx
	Msdelay(100)
Startwp:
	Lin=Djbox()
	if lin<>-1 then
		'获取物品信息
		wpid=g_actwp(lin)
		wplx=g_djleixing(wpid)
		'效果处理
		if wplx=1 then
			cs=ChooseAct()
			if cs=-1 then goto Startwp
			Say(20,"这是使用物品的例子")
			Say(20,"走到画前面测试战斗。")
			delactwp(wpid,1)
		end if
	end if
End Sub

'===============================================================================
'函数名：Zbboxcl()
'说明：	装备菜单处理
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Zbboxcl()
	Dim I
	If G_Actcount=1 Then
		I=0
	Else If G_Actcount=2 Then
		I=Yesno(G_Actname$(0),G_Actname$(1))
	Else If G_Actcount=3 Then
		I=Choose3x1(G_Actname$(0),G_Actname$(1),G_Actname$(2))
	End If
	Zbbox(I)
End Sub



'===============================================================================
'函数名：Ztboxcl()
'说明：	状态菜单处理
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Ztboxcl()
	Dim I
	If G_Actcount=1 Then
		I=0
	Else If G_Actcount=2 Then
		I=Yesno(G_Actname$(0),G_Actname$(1))
	Else If G_Actcount=3 Then
		I=Choose3x1(G_Actname$(0),G_Actname$(1),G_Actname$(2))
	End If
	Ztbox(I)
End Sub




'===============================================================================
'函数名：Escmenucl()
'说明：	Esc键菜单处理
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Escmenucl()
	Dim Lin
Startescmenu:
	Lin=Escmenu()
	If Lin=0 Then
		Ztboxcl()
		Msdelay(200)
		Goto Startescmenu
	Else If Lin=1 Then
		Zbboxcl()
		Msdelay(200)
		Goto Startescmenu
	Else If Lin=2 Then
		Wpboxcl()
		Msdelay(200)
		Goto Startescmenu
	Else If Lin=3 Then
		Fsboxcl()
		Msdelay(200)
		Goto Startescmenu
	Else If Lin=4 Then
		Sysboxcl()
		Msdelay(200)
		Goto Startescmenu
	End If
End Sub


'===============================================================================
'函数名：Delallnpc(Mode)
'说明：	删除所有npc
'输入：0不包括主角 1包括主角
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Delallnpc(Mode)
	Dim I
	If Mode=0 Then
		I=1
	Else If Mode=1 Then
		I=0
	End If
	While I<G_Npccount
		If G_Npcpic(I)>0 Then
			Freeres(G_Npcpic(I))
		End If
		I=I+1
	Wend
		If Mode=0 Then
		G_Npccount=1
	Else If Mode=1 Then
		G_Npccount=0
	End If
End Sub

'===============================================================================
'函数名：Sysbox()
'说明：	系统盒子
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Sysbox()
	Dim Lin
	Fastshow(-1,Respath+"Sys"+G_Res$,22,0,0,240,160,0,0)
	Lin=Choose3x1("存储游戏","读取游戏","退出游戏")
	Sysbox=Lin
End Sub

'===============================================================================
'函数名：Fsbox(Actid,Id)
'说明：	魔法盒子的增强版
'输入：Id定义箭头指向顺序id
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Fsbox(Actid,Id)
	Dim Over,Key
	Dim I,I2
	Dim Bpic,H1pic,H2pic,Jtpic
	Font(Font_16song)
	Color(0,0,0)
	If G_Actfs(Actid)=0 Then
		Msgbox("你还没有学会法术!")
		Fsbox=-1
		Goto Endfsbox
	End If
	Bpic=Loadres(Respath+"Sys"+G_Res$,11)
	H1pic=Loadres(Respath+"Sys"+G_Res$,27)
	H2pic=Loadres(Respath+"Sys"+G_Res$,3)
	Jtpic=Loadres(Respath+"Sys"+G_Res$,30)
	Showpic(-1,Bpic,0,0,240,160,0,0,1)
	Showpic(-1,H1pic,22,2,197,63,0,0,1)
	Showpic(-1,H2pic,22,70,197,90,0,0,1)
	I=0
	I2=0
	Key=0
	Over=0
	Ic=0
	Goto Fsboxlogo1
	While Over<>1
		Key=Getkey()	
		If Key<>0 Then
Fsboxlogo1:	If Key=Key_Up Then
				I=I-1
			Else If Key=Key_Down Then
				I=I+1
			Else If Key=13 Then
				Fsbox=I
				Over=1
			Else If Key=27 Then
				Fsbox=-1
				Over=1
			End If
			If I>=G_Actfs(Actid) Then I=I-1
			If I<0 Then I=0
			If G_Actfs(Actid)>1 And Key=Key_Down Then
				I2=1
			Else
				I2=0
			End If
			Showpic(-1,H1pic,22,2,197,63,0,0,1)
			Showpic(-1,H2pic,22,70,197,90,0,0,1)
			Showpic(-1,Jtpic,160,10+I2*20,37,22,0,0,1)
			Font(Font_16song)
			Color(0,0,0)
			If I2=0 Then
				Pixlocate(30,13)
				Print G_Mfname$(G_Actmf(Actid,I))
				If G_Actfs(Actid)>1 Then
					Pixlocate(30,33)
					Print G_Mfname$(G_Actmf(Actid,I+1))
				End If
			Else If I2=1 Then
					Pixlocate(30,13)
					Print G_Mfname$(G_Actmf(Actid,I-1))
				If G_Actfs(Actid)>1 Then
					Pixlocate(30,33)
					Print G_Mfname$(G_Actmf(Actid,I))
				End If
			End If
			Printnext(G_Mfms$(G_Actmf(Actid,I)),20,30,80)
			Key=0
		End If
	Wend
	Freeres(Bpic)
	Freeres(H1pic)
	Freeres(H2pic)
	Freeres(Jtpic)
Endfsbox:

End Sub



'===============================================================================
'函数名：Wpbox(Id)
'说明： 当铺和商贩的物品盒子	
'输入：Id定义箭头指向的顺序id
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Wpbox(Id)
	Dim Over,Key
	Dim I,I2
	Dim Bpic,H1pic,H2pic,Jtpic
	If G_Actwps=0 Then
		Msgbox("你还没有任何物品!")
		Wpbox=-1
		Goto Endwpbox
	End If
	Bpic=Loadres(Respath+"Sys"+G_Res$,11)
	H1pic=Loadres(Respath+"Sys"+G_Res$,27)
	H2pic=Loadres(Respath+"Sys"+G_Res$,3)
	Jtpic=Loadres(Respath+"Sys"+G_Res$,30)
	Showpic(-1,Bpic,0,0,240,160,0,0,1)
	Showpic(-1,H1pic,22,2,197,63,0,0,1)
	Showpic(-1,H2pic,22,70,197,90,0,0,1)
	I=0
	I2=0
	Key=0
	Over=0
	Ic=0
	Goto Wpboxlogo1
	While Over<>1
		Key=Getkey()
		If Key<>0 Then
Wpboxlogo1:	If Key=Key_Up Then
				I=I-1
			Else If Key=Key_Down Then
				I=I+1
			Else If Key=13 Then
				Wpbox=I
				Over=1
			Else If Key=27 Then
				Wpbox=-1
				Over=1
			End If
			If I>=G_Actwps Then I=I-1
			If I<0 Then I=0
			If G_Actwps>1 And Key=Key_Down Then
				I2=1
			Else
				I2=0
			End If
			Showpic(-1,H1pic,22,2,197,63,0,0,1)
			Showpic(-1,H2pic,22,70,197,90,0,0,1)
			Showpic(-1,Jtpic,160,10+I2*20,37,22,0,0,1)
			Fastshow(-1,Respath+"Wp"+G_Res$,G_Djpicid(G_Actwp(I)),28,120,32,32,0,0)
			Font(Font_16song)
			Color(0,0,0)
			If I2=0 Then
				Pixlocate(30,13)
				Print G_Djname$(G_Actwp(I))
				If G_Actwps>1 Then
					Pixlocate(30,33)
					Print G_Djname$(G_Actwp(I+1))
				End If
			Else If I2=1 Then
					Pixlocate(30,13)
					Print G_Djname$(G_Actwp(I-1))
				If G_Actwps>1 Then
					Pixlocate(30,33)
					Print G_Djname$(G_Actwp(I))
				End If
			End If
			Printnext(G_Djms$(G_Actwp(I)),20,30,80)
			Key=0
		End If
	Wend
	Freeres(Bpic)
	Freeres(H1pic)
	Freeres(H2pic)
	Freeres(Jtpic)
Endwpbox:
End Sub

'===============================================================================
'函数名：Zbbox(Actid)
'说明：	装备盒子
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Zbbox(Actid)
	Fastshow(-1,Respath+"Sys"+G_Res$,22,0,0,240,160,0,0)
	Font(Font_16song)
	Color(0,0,0)
	Pixlocate(60,20)
	Print "姓名："+G_Actname$(Actid)
	Pixlocate(60,40)
	Print "头戴："
	Pixlocate(60,60)
	Print "身穿："
	Pixlocate(60,80)
	Print "手持："
	Pixlocate(60,100)
	Print "脚穿："
	forwaitkey()
End Sub



'===============================================================================
'函数名：Ztbox(Actid)
'说明：	状态盒子
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Ztbox(Actid)
	Dim Over,Pic
	Pic=Loadres(Respath+"Sys"+G_Res$,22)
	Font(Font_16song)
	Color(0,0,0)
	Over=0
	Msdelay(200)
	Goto Zt1
	While Over<>1
		Key=Getkey()
		If Key=Key_Up Then
Zt1:
			Showpic(-1,Pic,0,0,240,160,0,0,1)
			Pixlocate(60,20)
			Print "姓名："+G_Actname$(Actid)
			Pixlocate(60,36)
			Print "等级："+G_Actdj(Actid)
			Pixlocate(60,52)
			Print "生命："+G_Acthp(Actid)+"/"+G_Acthpmax(Actid)
			Pixlocate(60,68)
			Print "法术："+G_Actmp(Actid)+"/"+G_Actmpmax(Actid)
			Pixlocate(60,84)
			Print "攻击："+G_Actgj(Actid)
			Pixlocate(60,100)
			Print "防御："+G_Actfy(Actid)
			Pixlocate(60,116)
			Print "身法："+G_Actmj(Actid)
			Pixlocate(60,132)
			Print "福缘："+G_Actxy(Actid)
		Else If Key=Key_Down Then
			Showpic(-1,Pic,0,0,240,160,0,0,1)
			Pixlocate(60,20)
			Print "免疫："+"无"
			Pixlocate(60,36)
			Print "经验："+G_Actjy(Actid)+"/"+G_Actjymax(Actid)
		Else If Key=27 Or Key=13 Then
			Over=1
		End If
	Wend
End Sub

'===============================================================================
'函数名：Escmenu()
'说明：	退出菜单
'输入：
'输出：	
'返回：	选择代号
'备注：
'修改记录：
'===============================================================================
Sub Escmenu()
	Dim Key,Pic,Pic2,I
	Pic=Loadres(Respath+"Sys"+G_Res$,29)
	Pic2=Loadres(Respath+"Sys"+G_Res$,2)
	Key=0
	I=0
	Showpic(G_Page_Sundry,Pic2,0,0,176,22,0,0,1)
	Shownumber(G_Page_Sundry,G_Actjq,50,3)
	While Key<>13
		Showpic(G_Page_Sundry,Pic,0,25,38,100,0,0,1)
		Showpic(G_Page_Sundry,Pic,0,31+I*18,38,18,38,6+I*18,1)
		Flippage(G_Page_Sundry)
		Msdelay(100)
		Key=Getkey()
		If Key=Key_Up Then
			I=I-1
		Else If Key=Key_Down Then
			I=I+1
		Else If Key=27 Then
			I=-1
			Goto Endescmenu
		End If
		If I=-1 Then I=4
		If I=5 Then I=0
	Wend
Endescmenu:
	Escmenu=I
	Freeres(Pic)
End Sub


'===============================================================================
'函数名：Drptgj(Ftid,Cs)
'说明：	
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Drptgj(Ftid,Cs)
	Drfightxy(Ftid,Cs)
	Ftnum=G_Ftgj(Ftid)-G_Actfy(Cs)-Rnd(G_Actmj(Cs))
	If Ftnum<0 Then
		Ftnum=0
	End If
	Showftnumber(Ftnum,Ftnum,Ftnum,Cs,0,0)
	G_Acthp(Cs)=G_Acthp(Cs)-Ftnum
End Sub

'===============================================================================
'函数名：Shezhiyouxi()
'说明：	设置游戏
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Shezhiyouxi()
	Fastshow(-1,Respath+"Sys"+G_Res$,28,0,0,240,160,0,0)
	Msdelay(200)
	Forwaitkey()
	Msdelay(200)
End Sub


'===============================================================================
'函数名：Zhizuoqunzu()
'说明：	制作群组
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Zhizuoqunzu()
	Dim I,Text$(12)
	Font(Font_16song)
	Color(&Hffffff,0,0)
	Text$(0)="游戏设计"
	Text$(1)="方寸"
	Text$(2)="游戏开场白"
	Text$(3)="仙剑奇侠传之双"
	Text$(4)="剑传说"
	Text$(5)="游戏图片"
	Text$(6)="来自网络"
	Text$(7)="鸣谢"
	Text$(8)="参与测试的诸多"
	Text$(9)="网友"
	Fastshow(-1,Respath+"Sys"+G_Res$,17,0,0,240,160,0,0)
	Msdelay(200)
	I=0
	While I<10
	Printstr(Text$(I),240-I*20-40,20,0,1)
		I=I+1
	Wend
	Msdelay(200)
	Forwaitkey()
	Msdelay(200)
End Sub


'===============================================================================
'函数名：Readbox()
'说明：	读取盒子
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Readbox()
	Dim Lin,Path$
Startreadgame:
	Msdelay(200)
	Fastshow(-1,Respath+"Sys"+G_Res$,11,0,0,240,160,0,0)
	Lin=Choose3x1("前世之缘1","前世之缘2","前世之缘3")
	If Lin<>-1 Then
		Path$=Respath+"Save\异域传说"+Lin+".Sav"
		Open Path$ For Binary As#1
		If Lof(1)=0 Then
			Msgbox("尚未在该位存储游戏！")
			Close#1
			Goto Startreadgame
		End If
		Close#1
		Readgame(Respath+"Save\异域传说"+Lin+".Sav")
		Delallnpc(1)
		Script(G_Jp)'进入脚本
	End If
	Readbox=Lin
End Sub

'===============================================================================
'函数名：Choose3x1(A$,B$,C$)
'说明：	
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Choose3x1(A$,B$,C$)
	Dim W,H,X,Y,I,Over
	Dim Key,Pic
	Font(Font_16song)
	Color(0,0,0)
	W=Len(A$)*8+2+37
	H=68
	X=(Lcd_Wid-W)/2
	Y=(Lcd_Hgt-H)/2
	Fillpage(-1,X,Y,W,H,0)
	Fillpage(-1,X+1,Y+1,W-2,H-2,&Hffffff)
	Pixlocate(X+1+37,Y+1)
	Print A$
	Pixlocate(X+1+37,Y+1+22)
	Print B$
	Pixlocate(X+1+37,Y+1+44)
	Print C$
	Over=1
	I=0
	Pic=Loadres(Respath+"Sys"+G_Res$,14)
	Key=0
	Goto Choosekeystart
	While Over<>0
		Key=Getkey()
		If Key<>0 Then
Choosekeystart:
			If Key=Key_Up Then
				I=I-1
			Else If Key=Key_Down Then
				I=I+1
			Else If Key=13 Then
				Choose3x1=I
				Over=0
			Else If Key=27 Then
				Choose3x1=-1
				Over=0
			End If
			If I=-1 Then I=2
			If I=3 Then I=0
			Fillpage(-1,X+1,Y+1,37,66,&Hffffff)
			Showpic(-1,Pic,X+1,Y+1+I*22,37,22,0,0,1)
		End If
		Msdelay(100)
	Wend
End Sub

'===============================================================================
'函数名：Readgame(Path$)
'说明：	读取游戏
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Readgame(Path$)
	Dim Srand,I,I2,Puts
	Open Path$ For Binary As#1
	I=0
	While I<200
		Get#1,Puts
		I=I+1
	Wend
	Get#1,Puts
	G_Jp=Puts-20
	I=0
	While I<50
		Get#1,G_Event(I)
		I=I+1
	Wend
	I=0
	While I<3'角色属性存储
		Get#1,G_Actname$(I)
		Get#1,Puts
		G_Actdj(I)=Puts-20
		Get#1,Puts
		G_Acthp(I)=Puts-20
		Get#1,Puts
		G_Acthpmax(I)=Puts-20
		Get#1,Puts
		G_Actmp(I)=Puts-20
		Get#1,Puts
		G_Actmpmax(I)=Puts-20
		Get#1,Puts
		G_Actgj(I)=Puts-20
		Get#1,Puts
		G_Actfy(I)=Puts-20
		Get#1,Puts
		G_Actmj(I)=Puts-20
		Get#1,Puts
		G_Actxy(I)=Puts-20
		Get#1,Puts
		G_Actjy(I)=Puts-20
		Get#1,Puts
		G_Actjymax(I)=Puts-20
		Get#1,Puts
		G_Actfs(I)=Puts-20
		Get#1,Puts
		G_Actjy(I)=Puts-20
		Get#1,Puts
		G_Actjymax(I)=Puts-20
		I2=0
		While I2<G_Actfs(I)
			Get#1,Puts
			G_Actmf(I,I2)=Puts-20
			I2=I2+1
		Wend
		I=I+1
	Wend
	Get#1,Puts
	G_Actwps=Puts-20
	i=0
	While I<G_Actwps
		Get#1,Puts
		G_Actwp(I)=Puts-20
		get#1,puts
		g_actwpsl(i)=puts-20
		I=I+1
	Wend
	Get#1,Puts
	G_Actpicid=Puts-20
	Get#1,Puts
	G_Npcx(0)=Puts-20
	Get#1,Puts
	G_Npcy(0)=Puts-20
	Get#1,Puts
	G_Npcface(0)=Puts-20
	Get#1,Puts
	G_Npcstep(0)=Puts-20
	Get#1,Puts
	G_Actjq=Puts-20	
	get#1,puts
	g_actcount=puts-20
	Close#1
	
End Sub
'===============================================================================
'函数名：Savegame(Path$)
'说明：	存储游戏
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Savegame(Path$)
	Dim Srand,I,I2,Puts,Puts$
	Open Path$ For Binary As#1
	I=0
	While I<200
		Puts=Rnd(5000)
		Put#1,Puts
		I=I+1
	Wend
	Puts=G_Jp+20'游戏场景存储
	Put#1,Puts
	I=0
	While I<50
		Put#1,G_Event(I)
		I=I+1
	Wend
	I=0
	While I<3'角色属性存储
		Put#1,G_Actname$(I)
		Puts=G_Actdj(I)+20
		Put#1,Puts
		Puts=G_Acthp(I)+20
		Put#1,Puts
		Puts=G_Acthpmax(I)+20
		Put#1,Puts
		Puts=G_Actmp(I)+20
		Put#1,Puts
		Puts=G_Actmpmax(I)+20
		Put#1,Puts
		Puts=G_Actgj(I)+20
		Put#1,Puts
		Puts=G_Actfy(I)+20
		Put#1,Puts
		Puts=G_Actmj(I)+20
		Put#1,Puts
		Puts=G_Actxy(I)+20
		Put#1,Puts
		Puts=G_Actjy(I)+20
		Put#1,Puts
		Puts=G_Actjymax(I)+20
		Put#1,Puts
		Puts=G_Actfs(I)+20
		Put#1,Puts
		Puts=G_Actjy(I)+20
		Put#1,Puts
		Puts=G_Actjymax(I)+20
		Put#1,Puts
		I2=0
		While I2<G_Actfs(I)
			Puts=G_Actmf(I,I2)
			Put#1,Puts
			I2=I2+1
		Wend
		I=I+1
	Wend
	I=0
	Puts=G_Actwps+20
	Put#1,Puts
	While I<G_Actwps
		Puts=G_Actwp(I)+20
		Put#1,Puts
		puts=g_actwpsl(i)+20
		put#1,puts
		I=I+1
	Wend
	Puts=G_Actpicid+20
	Put#1,Puts
	Puts=G_Npcx(0)+20
	Put#1,Puts
	Puts=G_Npcy(0)+20
	Put#1,Puts
	Puts=G_Npcface(0)+20
	Put#1,Puts
	Puts=G_Npcstep(0)+20
	Put#1,Puts
	Puts=G_Actjq+20
	Put#1,Puts
	puts=g_actcount+20
	put#1,puts
	Close#1
	
End Sub

'===============================================================================
'函数名：Createactor(Picid,Face,Step,X,Y)
'说明：	创建主角
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Createactor(Picid,Face,Step,X,Y)
	G_Npcpic(0)=Loadres(Respath+"Npc"+G_Res$,Picid)
	G_Npcx(0)=X
	G_Npcy(0)=Y
	G_Npcw(0)=Npc_Wid
	G_Npch(0)=Npc_Hgt
	G_Npcstep(0)=Step
	G_Npcorstay(0)=Npc_Stay
	G_Npcface(0)=Face
	G_Npcmode(0)=1
	G_Actpicid=Picid
	G_Npccount=1
End Sub


'===============================================================================
'函数名：Showactxymap()
'说明：	显示角色周围地图
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Showactxymap()
	Showmap(G_Npcx(0)-3,G_Npcy(0)-2)
End Sub

'===============================================================================
'函数名：Npczxact(Npcid)
'说明：	Npc自动转向角色
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Npczxact(Npcid)
	G_Npcface(Npcid)=3-G_Npcface(0)
	G_Npcstep(Npcid)=0
	G_Npcorstay(Npcid)=Npc_Stay
	Showactxymap()
	Flippage(G_Page_Sundry)
	G_Npcorstay(Npcid)=Npc_Round
End Sub



'===============================================================================
'函数名：Sjcl()
'说明：	升级处理
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Sjcl()
	Dim I
	I=0
	While I<G_Actcount
		If G_Actjy(I)>G_Actjymax(I) Then
			Sjks:
			G_Actjy(I)=G_Actjy(I)-G_Actjymax(I)
			G_Actdj(I)=G_Actdj(I)+1
			G_Acthpmax(I)=G_Acthpmax(I)+20:G_Acthp(I)=G_Acthpmax(I)
			G_Actmpmax(I)=G_Actmpmax(I)+20:G_Actmp(I)=G_Actmpmax(I)
			G_Actgj(I)=G_Actgj(I)+5
			G_Actfy(I)=G_Actfy(I)+5
			G_Actjymax(I)=G_Actjymax(I)+50+g_actjymax(i)/2
			Msgbox(G_Actname$(I)+"升级了！")
			Fastshow(-1,Respath+"Sys"+G_Res$,31,0,0,240,160,0,0)
			Forwaitkey()
			If G_Actjy(I)>G_Actjymax(I) Then Goto Sjks
		End If
		I=I+1
	Wend
End Sub


'===============================================================================
'函数名：Addactdj(Djid,S)
'说明：增加角色道具	
'输入：Djid要怎加的道具id S增加数量
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Addactdj(Djid,S)
	Dim I
	I=0
	If I<G_Actwps Then
		While I<G_Actwps
			If G_Actwp(I)=Djid Then
				G_Actwpsl(I)=G_Actwpsl(I)+S
				Goto Endaddactdj
			End If
			I=I+1
			If I=G_Actwps Then
			G_Actwp(G_Actwps)=Djid
			G_Actwpsl(G_Actwps)=S
			G_Actwps=G_Actwps+1
	End If
		Wend
	Else If I=G_Actwps Then
			G_Actwp(G_Actwps)=Djid
			G_Actwpsl(G_Actwps)=S
			G_Actwps=G_Actwps+1
	End If
Endaddactdj:
End Sub


'===============================================================================
'函数名：Gamefight(A$,B$,Jq,Jy,Mode)
'说明：	
'输入：A$战斗对象 B$战斗胜利奖励 Mode模式 0普通战斗 1剧情战斗
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Gamefight(A$,B$,Jq,Jy,Mode)
	Dim Ins,I
	
	Fight(A$,Mode)
	
	If G_Fightover=1 Then
		Msgbox("战斗胜利！")
		Ins=Len(B$)/3
		I=0
		While I<Ins
			Addactdj(Val(Mid$(B$,I*3,2)),Val(Mid$(B$,I*3+2,1)))
			Msgbox("获得"+G_Djname$(Val(Mid$(B$,I*3,2)))+"*"+Val(Mid$(B$,I*3+2,1)))
			I=I+1
		Wend
		If Jq<>0 Then
			G_Actjq=G_Actjq+Jq
			Msgbox("获得金钱："+Jq)
		End If
		I=0
		While I<G_Actcount
			If G_Acthp(I)>0 Then
				G_Actjy(I)=G_Actjy(I)+Jy
			End If
			I=I+1
		Wend
		Sjcl()
	End If
	Gamefight=G_Fightover
End Sub
'===============================================================================
'函数名：Startmenu()
'说明：	开始菜单处理
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Startmenu()
	Dim Choose,Lin
Startstartmenu:
	Choose=Mainmenu()
	If Choose=-1 Then
		End
	Else If Choose=0 Then
		Newgamedh()
		Showload()
		Csnewgame()
		Script(G_Jp)
	Else If Choose=1 Then
		Lin=Readbox()
		If Lin=-1 Then
			Goto Startstartmenu
		End If
	Else If Choose=2 Then
		Shezhiyouxi()
		Goto Startstartmenu
	Else If Choose=3 Then
		Zhizuoqunzu()
		Goto Startstartmenu
	End If
End Sub


'===============================================================================
'函数名：Showload()
'说明：	显示游戏读取中
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Showload()
	Fastshow(-1,Respath+"Sys"+G_Res$,26,0,0,240,160,0,0)
End Sub

'===============================================================================
'函数名：Csnewgame()
'说明：	初始化新游戏
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Csnewgame()
	'初始化名称不然会死机
	G_Actname$(0)=""
	G_Actname$(1)=""
	G_Actname$(2)=""
	'初始化角色属性
	G_Actcount=1
	G_Actname$(0)="陈禹"
	G_Actwps=0
	G_Actfs(0)=0
	G_Acthp(0)=150
	G_Acthpmax(0)=150
	G_Actmp(0)=150
	G_Actmpmax(0)=150
	G_Actmj(0)=20
	G_Actgj(0)=23
	G_Actfy(0)=22
	G_Actjy(0)=0
	G_Actjymax(0)=15
	G_Actdj(0)=1
	G_Actjy(0)=0
	G_Actjymax(0)=15
	G_Actjq=0
	'地图驱动相关
	G_Tmap=0'设置不自动跳出地图控制
	G_Jp=0'游戏场景控制
	G_Npccount=1'初始化npc数量
	g_actpicid=27
	g_npcx(0)=8
	g_npcy(0)=6
	g_npcface(0)=Face_up
	g_npcstep(0)=0
End Sub



'===============================================================================
'函数名：Printstr(Str$,X,Y,Mode,Hang)
'说明：	按指定模式打印字符串
'输入：Mode 0为可以按下enter键以加快打印速度 1为不可按下enter键以加快打印速度
'hang 0为横向打印 1为竖向打印,请使用全角字符否则会出错,仅打印16*16字符
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Printstr(Text$,X,Y,Mode,Hang)
	Dim I
	I=0
	Font(Font_16song)
	While I<Len(Text$)
		If Hang=0 Then
			Pixlocate(X+I*8,Y)
		Else If Hang=1 Then
			Pixlocate(X,Y+I*8)
		End If
		Print Mid$(Text$,I,2)
		If Mode=0 Then
			If Getkey2()<>0 Then
			Else
				Msdelay(100)
			End If
		Else If Mode=1 Then
			Msdelay(100)
		End If
		I=I+2
	Wend
End Sub




'===============================================================================
'函数名：Newgamedh()
'说明：	新游戏开始动画
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Newgamedh()
	Dim Text$
	Playpydh()
	Font(Font_16song)
	Color(&Hffffff,0,0)
	Fillpage(-1,0,0,240,160,0)
	Text$="我们已经这样纠缠了数千年"
	Printstr(Text$,(Lcd_Wid-Len(Text$)*8)/2,(Lcd_Hgt-16)/2,0,0)
	Forwaitkey()
	Fillpage(-1,0,0,240,160,0)
	Text$="难道还无法结束吗？"
	Printstr(Text$,(Lcd_Wid-Len(Text$)*8)/2,(Lcd_Hgt-16)/2,0,0)
	Forwaitkey()
	Fillpage(-1,0,0,240,160,0)
	Text$="没有尽头的"
	Printstr(Text$,(Lcd_Wid-Len(Text$)*8)/2,(Lcd_Hgt-16)/2,0,0)
	Forwaitkey()
	Fillpage(-1,0,0,240,160,0)
	Text$="你应该清楚"
	Printstr(Text$,(Lcd_Wid-Len(Text$)*8)/2,(Lcd_Hgt-16)/2,1,0)
	Forwaitkey()
	Fillpage(-1,0,0,240,160,0)
	Text$="这就是我们的宿命。。。。"
	Printstr(Text$,(Lcd_Wid-Len(Text$)*8)/2,(Lcd_Hgt-16)/2,0,0)
	Forwaitkey()
	Fillpage(-1,0,0,240,160,0)
	Text$="我们本是一体"
	Printstr(Text$,(Lcd_Wid-Len(Text$)*8)/2,(Lcd_Hgt-16)/2,0,0)
	Forwaitkey()
	Fillpage(-1,0,0,240,160,0)
	Text$="为什么要为了这宿命而一分为二"
	Printstr(Text$,(Lcd_Wid-Len(Text$)*8)/2,(Lcd_Hgt-16)/2,0,0)
	Forwaitkey()
	Fillpage(-1,0,0,240,160,0)
	Text$="并且无止境的斗下去呢？"
	Printstr(Text$,(Lcd_Wid-Len(Text$)*8)/2,(Lcd_Hgt-16)/2,0,0)
	Forwaitkey()
	Fillpage(-1,0,0,240,160,0)
	Text$="你很想知道吗？"
	Printstr(Text$,(Lcd_Wid-Len(Text$)*8)/2,(Lcd_Hgt-16)/2,0,0)
	Forwaitkey()
	Fillpage(-1,0,0,240,160,0)
	Text$="没错"
	Printstr(Text$,(Lcd_Wid-Len(Text$)*8)/2,(Lcd_Hgt-16)/2,0,0)
	Forwaitkey()
	Fillpage(-1,0,0,240,160,0)
	Text$="我不想再这样没完没了的纠缠下"
	Printstr(Text$,(Lcd_Wid-Len(Text$)*8)/2,(Lcd_Hgt-16)/2,0,0)
	Text$="去"
	Printstr(Text$,(Lcd_Wid-Len(Text$)*8)/2,((Lcd_Hgt-16)/2)+16,0,0)
	Forwaitkey()
	Fillpage(-1,0,0,240,160,0)
	Text$="那好，你跟我来。。。。"
	Printstr(Text$,(Lcd_Wid-Len(Text$)*8)/2,(Lcd_Hgt-16)/2,0,0)
	Forwaitkey()
	Playpydh()
End Sub


'===============================================================================
'函数名：Mainmenu()
'说明：	主菜单
'输入：
'输出：	
'返回：返回所做选择	-1为无选择 即按下退出键
'备注：
'修改记录：
'===============================================================================
Sub Mainmenu()
	Dim Pic(2)
	Dim I,Over,Key
	Pic(0)=Loadres(Respath+"Sys"+G_Res$,20)
	Pic(1)=Loadres(Respath+"Sys"+G_Res$,21)
	Over=0
	I=0
	While Over<>1
		Key=Getkey()
		If Key=Key_Up Then
			I=I-1
			If I=-1 Then I=3
		Else If Key=Key_Down Then
			I=I+1
			If I=4 Then I=00
		Else If Key=13 Then
			Over=1'跳出菜单
		Else If Key=27 Then
			I=-1
			Goto Endmainmenu
		End If
		Showpic(G_Page_Sundry,Pic(1),0,0,240,160,0,0,1)
		Showpic(G_Page_Sundry,Pic(0),0,I*35,160,35,0,I*35,1)
		Flippage(G_Page_Sundry)
		Msdelay(100)
	Wend
Endmainmenu:
	Mainmenu=I
End Sub


'===============================================================================
'函数名：Gamestart()
'说明：	游戏开始动画
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Gamestart()
	Gameinit()
	Playgcdh()
	Msdelay(200)
	Showgamename()
	Forwaitkey()
	Msdelay(200)
	Startmenu()
End Sub


'===============================================================================
'函数名：Showgamename()
'说明：	显示游戏名称
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Showgamename()
	Fastshow(-1,Respath+"Sys"+G_Res$,8,0,0,240,160,0,0)
	Msdelay(100)
End Sub


'===============================================================================
'函数名：Playgcdh()
'说明：	播放过场动画
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Playgcdh()
	Dim I,Pic
	Pic=Loadres(Respath+"Sys"+G_Res$,7)
	I=1
	While I<=76
		Fastshow(G_Page_Sundry,Respath+"Gcdh"+G_Res$,I,0,0,240,160,0,0)
		Showpic(G_Page_Sundry,Pic,140,130,90,18,0,0,1)
		Flippage(G_Page_Sundry)
		I=I+1
		Msdelay(100)
		If Keypress(27) Then
			msdelay(200)
			Goto Endplaygcdh	
		end if
	Wend
Endplaygcdh:
End Sub


'===============================================================================
'函数名：Playpydh()
'说明：	播放飘叶动画
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Playpydh()
	Dim I,Pic
	I=1
	While I<=36
		Fillpage(G_Page_Sundry,0,0,240,160,0)
		Fastshow(G_Page_Sundry,Respath+"Pydh"+G_Res$,I,0,0,240,160,0,0)
		Flippage(G_Page_Sundry)
		I=I+1
		Msdelay(50)
	Wend
End Sub


'===============================================================================
'函数名：Fightover()
'说明：	战斗失败
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Fightover()
	Dim I,Text$(12)
	Font(Font_16song)
	Color(&Hffffff,0,0)
	Text$(0)="塞下秋来风景异"
	Text$(1)="衡阳雁去无留意"
	Text$(2)="四面边声连角起"
	Text$(3)="千嶂里"
	Text$(4)="长烟落日孤城闭"
	Text$(5)="浊酒一杯家万里"
	Text$(6)="燕然未勒归无计"
	Text$(7)="羌管悠悠霜满地"
	Text$(8)="人不寐"
	Text$(9)="将军白发征夫泪"
	Fastshow(-1,Respath+"Sys"+G_Res$,17,0,0,240,160,0,0)
	Msdelay(200)
	I=0
	While I<10
	Printstr(Text$(I),240-I*20-40,20,0,1)
		I=I+1
	Wend
	Msdelay(200)
	Forwaitkey()
End Sub


'===============================================================================
'函数名：Drmf(Ftid,Mfid,Cs,Fw)
'说明：	敌人魔法攻击
'输入：Ftid敌人id Mfid魔法id Cs攻击对象 Fw攻击范围,Mode对己还是对敌
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Drmf(Ftid,Cs)
		Dim Drx,Dry,Mfid,Mffw,Mfdh,Mflx,Bx,By,Dw,Ftnum(3)
		Drx=20+I*Getpicwid(G_Ftpic(Ftid))/2
		Dry=65-I*15
		Mfid=G_Ftmf(Ftid)
		Mffw=G_Mffw(Mfid)
		Mflx=G_Mfleixing(Mfid)
		Mfdh=G_Mfdhid(Mfid)
		Bx=G_Dhbx(Mfdh)
		By=G_Dhby(Mfdh)
		G_Ftgjkg(Ftid)=1
		G_Ftx=-5
		G_Fty=-5
		Showanyfight()
		Flippage(G_Page_Sundry)
		Msdelay(300)
		
		'法术处理
		If Mflx=1 Then'攻击类法术
			Dw=0
			If Mffw=0 Then
				Ftnum(Cs)=G_Mf1(Mfid)+G_Ftmj(Ftid)
			End If
		End If
		
		
		Showmf(Mfdh,Mffw,Dw,Cs,Bx,By)
		Showftnumber(Ftnum(0),Ftnum(1),Ftnum(2),Cs,Mffw,Dw)
		
		'法术处理
		If Mflx=1 Then'攻击类法术
			If Mffw=0 Then
				G_Acthp(Cs)=G_Acthp(Cs)-Ftnum(Cs)
			End If
		End If
		G_Ftx=0
		G_Fty=0
		G_Ftgjkg(Ftid)=0
End Sub

'===============================================================================
'函数名：Drai()
'说明：敌人自动攻击
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Drai()
	Dim I,Srand,Cs,Lin
	I=0
	While I<G_Ftcount
		Srand=Rnd(5)
		Cs=Rnd(G_Actcount)
		If G_Ftgrow(I)=1 Then
			If G_Acthp(Cs)<=0 Then
				Cs=0
				While G_Acthp(Cs)<=0
					Cs=Cs+1
					If Cs=G_Actcount Then
						Goto Endcs
					End If
				Wend
			End If
			If Srand<4 Then
				Drptgj(I,Cs)
			Else
				Drmf(I,Cs)
			End If
		End If
		I=I+1
	Wend
Endcs:
		Showanyfight()
		Flippage(G_Page_Sundry)
		Lin=Checkactover()
		If Lin=1 Then
			G_Fightover=2
		End If
End Sub

'===============================================================================
'函数名：Checkactmax()
'说明：	检测角色hp Mp是否超过上限若超过则设置为上限
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Checkactmax()
	Dim I
	I=0
	While I<G_Actcount
		If G_Acthp(I)>G_Acthpmax(I) Then G_Acthp(I)=G_Acthpmax(I)
		If G_Actmp(I)>G_Actmpmax(I) Then G_Actmp(I)=G_Actmpmax(I)
		I=I+1
	Wend
End Sub


'===============================================================================
'函数名：Ftwpcl(Actid)
'说明：	战斗物品处理
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Ftwpcl(Actid)
	Dim Wplx,Wpid,Dhid,Cs,Bx,By,Dj1,Dj2,Lin
	Wpid=G_Chox(Actid)
	Wplx=G_Djleixing(Wpid)
	Dhid=G_Dj3(Wpid)
	Bx=G_Dhbx(Dhid)
	By=G_Dhby(Dhid)
	Cs=G_Choxx(Actid)
	Dj1=G_Dj1(Wpid)
	Dj2=G_Dj2(Wpid)
	
	Msdelay(1000)
	Lin=Checkactwp(Wpid)
	If Lin=0 Then Goto Endwp
	If Wplx=2 Then'药类物品处理
		Showmf(Dhid,0,Cs,0,Bx,By)
		If Dj1>0 Then
			Showftnumber(Dj1,Dj1,Dj1,Cs,0,0)
			G_Acthp(Cs)=G_Acthp(Cs)+Dj1
		End If
		If Dj2>0 Then
			Showanyfight()
			Showftnumber(Dj2,Dj2,Dj2,Cs,0,0)
			G_Actmp(Cs)=G_Actmp(Cs)+Dj2
		End If
		Checkactmax()
	End If
	
	'通用部分
	Checkft()
Endwp:
End Sub


'===============================================================================
'函数名：Showftnumber(Num1,Num2,Num3,Ftid,Fwmode,Mode)
'说明：	显示战斗时的数字
'输入：Ftid要显示到的id Fwmode显示方式 0单个 1全部 Mode 0己方 1敌方
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Showftnumber(Num1,Num2,Num3,Ftid,Fwmode,Mode)
	Dim I,Wx,Wy,Ftnum(3)
	Dim Drx,Dry,Actx,Acty,M
	
	Drx=20+Ftid*Getpicwid(G_Ftpic(Ftid))/2+Getpicwid(G_Ftpic(Ftid))/4
	Dry=65-Ftid*15
	Actx=110+Ftid*Getpicwid(G_Actfightpic(Ftid))/4
	Acty=90-Ftid*15
	Ftnum(0)=Num1
	Ftnum(1)=Num2
	Ftnum(2)=Num3
	If Fwmode=0 Then
		If Mode=0 Then
			Wx=Actx
			Wy=Acty
		Else If Mode=1 Then
			Wx=Drx
			Wy=Dry
		End If
		M=0
		Bitbltpage(G_Page_Sundry2,G_Page_Sundry)
		
		While M<5
			Bitbltpage(G_Page_Sundry,G_Page_Sundry2)
			Shownumber(G_Page_Sundry,Ftnum(Ftid),Wx,Wy-M*2)
			Flippage(G_Page_Sundry)
			M=M+1
			Msdelay(100)
		Wend
	Else If Fwmode=1 Then
		Ftid=0
		If Mode=0 Then
			Bitbltpage(G_Page_Sundry2,G_Page_Sundry)
			While M<5
				I=0
				While I<G_Ftcount
					If G_Acthp(I)>0 Then
						Wx=20+Ftid*Getpicwid(G_Ftpic(Ftid))/2+5
						Wy=65-Ftid*15-10
						Bitbltpage(G_Page_Sundry,G_Page_Sundry2)
						Shownumber(G_Page_Sundry,Ftnum(Ftid),Wx,Wy-M*2)
					End If
					Ftid=Ftid+1
					I=I+1
				Wend
				Flippage(G_Page_Sundry)
				M=M+1
				Msdelay(100)
			Wend
		Else If Mode=1 Then
			Bitbltpage(G_Page_Sundry2,G_Page_Sundry)
			While M<5
				I=0
				While I<G_Ftcount
					If G_Ftgrow(I)=1 Then
						Wx=110+Ftid*Getpicwid(G_Actfightpic(Ftid))/4
						Wy=90-Ftid*15
						Bitbltpage(G_Page_Sundry,G_Page_Sundry2)
						Shownumber(G_Page_Sundry,Ftnum(Ftid),Wx,Wy-M*2)
					End If
					Ftid=Ftid+1
					I=I+1
				Wend
				Flippage(G_Page_Sundry)
				M=M+1
				Msdelay(100)
			Wend
		End If
	End If
End Sub

'===============================================================================
'函数名：Checkft()
'说明：	检测敌人是否死亡并清除死亡的敌人
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Checkft()
	Dim Lin
	Checkftgrow()
	Lin=Checkftover()
	If Lin=1 Then
		G_Fightover=1
	End If
End Sub



'===============================================================================
'函数名：Checkactover()
'说明：	检测角色是否全部死亡
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Checkactover()
	Dim I
	I=0
	While I<G_Actcount
		If G_Acthp(I)>0 Then
			Checkactover=0
			Goto Endcheckactover
		End If
		I=I+1
	Wend
	Checkactover=1
Endcheckactover:
End Sub


'===============================================================================
'函数名：Checkftover()
'说明：	检测敌人是否全部死亡
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Checkftover()
	Dim I
	I=0
	While I<G_Ftcount
		If G_Ftgrow(I)=1 Then
			Checkftover=0
			Goto Endcheckover
		End If
		I=I+1
	Wend
	Checkftover=1
Endcheckover:
End Sub


'===============================================================================
'函数名：Checkftgrow()
'说明：	检测敌人状态将hp为0的敌人清除
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Checkftgrow()
	Dim I
	I=0
	While I<G_Ftcount
		If G_Fthp(I)<=0 Then
			G_Ftgrow(I)=0
		End If
		I=I+1
	Wend
End Sub

'===============================================================================
'函数名：Fight_Actmfdz(Actid)
'说明：	角色放法动作
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Fight_Actmfdz(Actid)
	Dim M
	M=0
	G_Actpx=1
	G_Actpy=1
	G_Actgjkg(Actid)=1
	While M<2
		Showanyfight()
		G_Actpx=G_Actpx+1
		M=M+1
		Flippage(G_Page_Sundry)
		Msdelay(200)
	Wend
	Showanyfight()
	Flippage(G_Page_Sundry)
	G_Actgjkg(Actid)=0
End Sub

'===============================================================================
'函数名：Fight_Mfcl(Actid)
'说明：	战斗我方魔法处理
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Fight_Mfcl(Actid)
	Dim Ftnum,Mflx,Mffw,Ftid,Mfid
	Dim Drx,Dry,Actx,Acty
	Dim Bx,By
	Mffw=G_Mffw(G_Chox(Actid))
	Mflx=G_Mfleixing(G_Chox(Actid))
	Mfdh=G_Mfdhid(G_Chox(Actid))
	Ftid=G_Choxx(Actid)
	Mfid=G_Chox(Actid)
	Bx=G_Dhbx(Mfdh)
	By=G_Dhby(Mfdh)
	Drx=20+Ftid*Getpicwid(G_Ftpic(Ftid))/2+5
	Dry=65-Ftid*15-10
	Actx=110+Actid*Getpicwid(G_Actfightpic(Actid))/4
	Acty=90-Actid*15
	Fight_Actmfdz(Actid)
	
	If G_Actmp(Actid)<G_Mf2(Mfid) Then Goto Endmf
	
	If Mflx=1 Then'攻击类法术处理
		If Mffw=0 Then
			Showmf(Mfdh,0,Ftid,1,Bx,By)
			Ftnum=G_Mf1(Mfid)+Rnd(G_Actmj(Actid))
			G_Fthp(Ftid)=G_Fthp(Ftid)-Ftnum
			Showftnumber(Ftnum,Ftnum,Ftnum,Ftid,0,1)
		Else If Mffw=1 Then
		End If
		
		
	Else If Mflx=3 Then'药品类法术处理
		If Mffw=0 Then
		Else If Mffw=1 Then
		End If
	End If
	
	'统一处理
	Checkft()
	Showanyfight()
	Flippage(G_Page_Sundry)
	Msdelay(100)
Endmf:
End Sub

'===============================================================================
'函数名：Fight_Gjcl(Actid)
'说明：	战斗我方普通攻击处理
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Fight_Gjcl(Actid)
	Dim Ftnum
	Dim I,Drx,Dry
	I=0
	While G_Ftgrow(G_Chox(Actid))=0'攻击对象若已死亡自动更换攻击对象
		G_Chox(Actid)=I
		I=I+1
		If I=G_Ftcount Then I=0
	Wend
	Drx=20+G_Chox(Actid)*Getpicwid(G_Ftpic(G_Chox(Actid)))/2+5
	Dry=65-G_Chox(Actid)*15-10
	Actfightxy(Actid,G_Chox(Actid))
	If G_Actgj(Actid)>G_Ftfy(G_Chox(Actid)) Then'破防
		Ftnum=G_Actgj(Actid)-G_Ftfy(G_Chox(Actid))+Rnd(G_Actmj(Actid))
	Else
		Ftnum=0
	End If
	Bitbltpage(G_Page_Sundry2,G_Page_Sundry)
	I=0
	Showftnumber(Ftnum,Ftnum,Ftnum,G_Chox(Actid),0,1)
	
	'攻击后的处理
	G_Fthp(G_Chox(Actid))=G_Fthp(G_Chox(Actid))-Ftnum
	Checkft()
	Showanyfight()'刷新所有战斗对象
	Flippage(G_Page_Sundry)
End Sub

'===============================================================================
'函数名：Fight_Choosecl()
'说明：	战斗选择处理
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Fight_Choosecl()
	Dim I,Lin
	I=0
	While I<G_Actcount
		If G_Acthp(I)>0 Then
			If G_Acthp(I)>0 Then
				If G_Cho(I)=0 Then
					Fight_Gjcl(I)
				Else If G_Cho(I)=1 Then
					Fight_Mfcl(I)
				Else If G_Cho(I)=2 Then
					Lin=Runaway()
					If Lin=1 Then
						G_Fightover=3
						Goto Endchoosecl
					End If
				Else If G_Cho(I)=3 Then
					Ftwpcl(I)
				End If
			End If
		End If
		I=I+1
		If G_Fightover>0 Then Goto Endchoosecl
	Wend
Endchoosecl:
End Sub


'===============================================================================
'函数名：Fight_Mfchoose(Actid)
'说明：	执行选中法术后的操作
'输入：
'输出：	
'返回：-1没有选中 其它魔法代号	
'备注：
'修改记录：
'===============================================================================
Sub Fight_Mfchoose(Actid)
	Dim Lin,Lin2
	Lin=Mfbox(Actid)
	Msdelay(200)
	If Lin=-1 Then Goto Endmfchoose
	Lin2=G_Actmf(Actid,Lin)
	If G_Actmp(Actid)<=G_Mf2(Lin2) Then
		Msgbox("你的法力值不够!")
		Lin=-1
		Goto Endmfchoose
	End If
	If G_Mffw(Lin2)=0 Then
		If G_Mfleixing(Lin2)=1 Then
			Lin=Fight_Dxchoose(1)
		Else
			Lin=Fight_Dxchoose(0)
		End If
		If Lin=-1 Then Goto Endmfchoose
		G_Choxx(Actid)=Lin
	End If
	Lin=Lin2
Endmfchoose:
	Fight_Mfchoose=Lin
End Sub

'===============================================================================
'函数名：Checkactwp(Wpid)
'说明：	检测角色是否有指定物品
'输入：
'输出：	
'返回：	1有 0无
'备注：
'修改记录：
'===============================================================================
Sub Checkactwp(Wpid)
	Dim I
	I=0
	While I<G_Actwps
		If G_Actwp(I)=Wpid Then
			Checkactwp=1
			Goto Endcheckactwp
		End If
		I=I+1
	Wend
	Checkactwp=0
Endcheckactwp:
End Sub


'===============================================================================
'函数名：Delactwp(Wpid,Sl)
'说明：	删除指定物品id的物品
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Delactwp(Wpid,Sl)
	Dim I
	I=0
	While G_Actwp(I)<>Wpid
		I=I+1
	Wend
	G_Actwpsl(I)=G_Actwpsl(I)-Sl
	If G_Actwpsl(I)<=0 Then
		While I<G_Actwps-1
			G_Actwp(I)=G_Actwp(I+1)
			I=I+1
		Wend
		G_Actwps=G_Actwps-1
	End If
End Sub
'===============================================================================
'函数名：Yesno(A$,B$)
'说明：	二选一
'输入：
'输出：-1没有选 0选a$ 1选 B
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Yesno(A$,B$)
	Dim W,H,X,Y,I,Over
	Dim Key,Pic
	Font(Font_16song)
	Color(0,0,0)
	If Len(A$)>Len(B$) Then
		W=Len(A$)*8+2+37
	Else
		W=Len(B$)*8+2+37
	End If
	H=46
	X=(Lcd_Wid-W)/2
	Y=(Lcd_Hgt-H)/2
	Fillpage(-1,X,Y,W,H,0)
	Fillpage(-1,X+1,Y+1,W-2,H-2,&Hffffff)
	Pixlocate(X+1+37,Y+1)
	Print A$
	Pixlocate(X+1+37,Y+1+22)
	Print B$
	Over=1
	I=0
	Pic=Loadres(Respath+"Sys"+G_Res$,14)
	Goto Yesnokeystart
	While Over<>0
		Key=0
		Key=Getkey()
		If Key<>0 Then
Yesnokeystart:
			If Key=Key_Up Then
				I=I-1
			Else If Key=Key_Down Then
				I=I+1
			Else If Key=13 Then
				Yesno=I
				Over=0
			Else If Key=27 Then
				Yesno=-1
				Over=0
			End If
			If I=-1 Then I=0
			If I=2 Then I=1
			Fillpage(-1,X+1,Y+1,37,44,&Hffffff)
			Showpic(-1,Pic,X+1,Y+1+I*22,37,22,0,0,1)
		End If
	Wend
End Sub


'===============================================================================
'函数名：Fight_Choose()
'说明：	处理战斗菜单选择
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Fight_Choose()
	Dim I,Lin
	I=0
	While I<G_Actcount
		If G_Acthp(I)>0 Then
Cschoose:	G_Cho(I)=Fightmenu(I)
			Lin=Fight_Xchoose(G_Cho(I),I)
			If Lin=-1 Then Goto Cschoose
			G_Chox(I)=Lin
		End If
		I=I+1
	Wend
End Sub

'===============================================================================
'函数名：Fight_Wpchoosebox(Actid)
'说明：	战斗时的物品内容选择盒子
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Fight_Wpchoosebox(Actid)
	Dim Lin,Lin2
	Lin=Yesno("药品","暗器")
	If Lin=-1 Then Goto Endfwp
	Copyactdj()
	If Lin=0 Then
		Delotherdj(2)'删除除了药品外的所有道具
	Else If Lin=1 Then
	End If
	Msdelay(200)
	Lin=Djbox()
	If Lin=-1 Then Goto Hclogo
	Lin2=G_Actwp(Lin)
	Msdelay(200)
	Lin=Fight_Dxchoose(0)
	If Lin=-1 Then Goto Hclogo
	G_Choxx(Actid)=Lin
	Lin=Lin2
Hclogo:
	Hcopyactdj()
Endfwp:
	Fight_Wpchoosebox=Lin
End Sub

'===============================================================================
'函数名：Hcopyactdj()
'说明：	还原角色道具
'输入：
'输出：	
'返回：	
'备注：

'修改记录：
'===============================================================================
Sub Hcopyactdj()
	Dim I
	While I<G_Cactdjs
		G_Actwp(I)=G_Cactdj(I)
		I=I+1
	Wend
	G_Actwps=G_Cactdjs
End Sub

'===============================================================================
'函数名：Fight_Xchoose(Choose,Actid)
'说明：	战斗底层选择处理
'输入：
'输出：	
'返回：选择代号 -1时为没有选择	
'备注：
'修改记录：
'===============================================================================
Sub Fight_Xchoose(Choose,Actid)
	Dim Mainchoose,Lin
	If Choose=0 Then
		Lin=Fight_Dxchoose(1)
	Else If Choose=1 Then
		Lin=Fight_Mfchoose(Actid)
	Else If Choose=2 Then
		Lin=1
	Else If Choose=3 Then
		Lin=Fight_Wpchoosebox(Actid)
	End If
	Fight_Xchoose=Lin
End Sub

'===============================================================================
'函数名：Fight_Dxchoose(Mode)
'说明：	战斗对象选择
'输入：Mode 0为选择己方 1为敌方
'输出：	
'返回：	-1没有选择 其它选中的代号
'备注：
'修改记录：
'===============================================================================
Sub Fight_Dxchoose(Mode)
	Dim Mainchoose,I
	Dim Drx,Dry,Actx,Acty
	Dim Over
	Drx=20
	Dry=65
	Actx=110
	Acty=90
	I=0
	If Mode=1 Then
		While G_Ftgrow(I)=0
			I=I+1
			If I=G_Ftcount Then I=0
		Wend
	End If
	Over=0
	Showanyfight()
	Bitbltpage(G_Page_Sundry2,G_Page_Sundry)
	While Over<>1
		Key=Getkey()
		If Key=Key_Left Then
			I=I-1
			If Mode=1 Then
				If I=-1 Then I=G_Ftcount-1
				While G_Ftgrow(I)=0
					I=I-1
					If I=-1 Then I=G_Ftcount-1
				Wend
			End If
		Else If Key=Key_Right Then
			I=I+1
			If Mode=1 Then
				If I=G_Ftcount Then I=0
				While G_Ftgrow(I)=0
					I=I+1
					If I=G_Ftcount Then I=0
				Wend
			End If
		Else If Key=13 Then
			Fight_Dxchoose=I
			Over=1
		Else If Key=27 Then
			Fight_Dxchoose=-1
			Over=1
		End If
		If Mode=0 Then
			If I=G_Actcount Then
				I=0
			Else If I=-1 Then
				I=G_Actcount-1
			End If
			Wx=Actx+I*Getpicwid(G_Actfightpic(I))/4+10
			Wy=Acty-I*15-15
		Else If Mode=1 Then
				Wx=Drx+I*Getpicwid(G_Ftpic(I))/2+Getpicwid(G_Ftpic(I))/4
				Wy=Dry-I*15-15
		End If
		Bitbltpage(G_Page_Sundry,G_Page_Sundry2)
		Showpic(G_Page_Sundry,G_Jtpic,Wx,Wy,11,13,0,0,1)
		Flippage(G_Page_Sundry)
		Msdelay(100)
	Wend
End Sub
'===============================================================================
'函数名：Fight_Dc()
'说明：	战斗底层控制
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Fight_Dc()
	Loaddrpic()
	Actback()
	While G_Fightover=0
		Fight_Choose()
		Fight_Choosecl()
		If G_Fightover>0 Then Goto Enddc
		Drai()
	Wend
Enddc:
	Freedrpic()
	Forwaitkey()
		If G_Fightmode=0 Then
			If G_Fightover=2 Then
				Fightover()
				Msdelay(200)
				Startmenu()
			End If
		End If
End Sub

'===============================================================================
'函数名：Runaway()
'说明：	逃跑
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Runaway()
	Dim Ftnum
	If G_Fightmode=0 Then
		If G_Actmj(0)>G_Ftmj(0) Then
			Ftnum=Rnd(100)
			If Ftnum<G_Actmj(0) Then
				Msgbox("逃跑成功!")
				Runaway=1
			Else
				Msgbox("逃跑失败!")
				Runaway=0
			End If
		End If
	Else If G_Fightmode=1 Then
		Msgbox("逃跑无效!")
		Runaway=0
	End If
End Sub
'===============================================================================
'函数名：Fightmenu(Actid)
'说明：	战斗菜单
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Fightmenu(Actid)
	Dim W,H,Mainchoose
	Dim Key,Actid,Actx,Acty
	Actx=110+Actid*Getpicwid(G_Actfightpic(Actid))/4+10
	Acty=(90-Actid*15)-15
	Mainchoose=0
	Showanyfight()
	W=Getpicwid(G_Ftmenupic)
	H=Getpichgt(G_Ftmenupic)/4
	Showpic(G_Page_Sundry,G_Jtpic,Actx,Acty,11,13,0,0,1)
	Showpic(G_Page_Sundry,G_Mhpboxpic,W+5,Lcd_Hgt-H+20,80,32,0,0,1)
	Shownumber(G_Page_Sundry,G_Acthp(Actid),W+23,Lcd_Hgt-H+22)'显示当前hp
	Shownumber(G_Page_Sundry,G_Acthpmax(Actid),W+58,Lcd_Hgt-H+22)'显示最大hp
	Shownumber(G_Page_Sundry,G_Actmp(Actid),W+23,Lcd_Hgt-H+33)'显示当前mp
	Shownumber(G_Page_Sundry,G_Actmpmax(Actid),W+58,Lcd_Hgt-H+33)'显示最大mp
	Key=0
	While Key<>13
		Key=Getkey()
		If Key=Key_Up Then
			Mainchoose=1
		Else If Key=Key_Down Then
			Mainchoose=3
		Else If Key=Key_Left Then
			Mainchoose=0
		Else If Key=Key_Right Then
			Mainchoose=2
		End If
		If G_Res$=".Rlb" Then
			If Keypress(52) Then'战斗胜利
				G_Fightover=1
			Else If Keypress(53) Then'战斗失败
				G_Fightover=2
			Else If Keypress(54) Then'逃跑成功
				G_Fightover=3
			End If
		End If
		Showpic(G_Page_Sundry,G_Ftmenupic,2,Lcd_Hgt-H-2,W,H,0,H*Mainchoose,1)
		Flippage(G_Page_Sundry)
	Wend
	Msdelay(200)
	Fightmenu=Mainchoose
End Sub


'===============================================================================
'函数名：Fight(Orge$,Mode)
'说明：	
'输入：Orge$为要作战的怪物名称,Mode为模式0正常战斗1战斗到主角死亡
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Fight(Orge$,Mode)
	Dim I,Ins
	G_Fightover=0'初始化战斗结果参数
	Ins=Len(Orge$)/2
	I=0
	While I<Ins
		G_Ftid(I)=Val(Mid$(Orge$,I*2,2))
		I=I+1
	Wend
	G_Fightmode=Mode
	I=0
	G_Ftcount=3
	Getdr()
	If Ins=1 Then
		G_Ftcount=2
		G_Ftgrow(0)=0
		G_Ftgrow(2)=0
		G_Ftid(1)=G_Ftid(0)
	Else If Ins=2 Then
		G_Ftcount=2
	Else If Ins=3 Then
		G_Ftcount=3
	End If
	Fight_Dc()
End Sub

'===============================================================================
'函数名：Freedrpic()
'说明：	释放敌人图片资源
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Freedrpic()
	Dim I
	I=0
	While I<G_Ftcount
		Freeres(G_Ftpic(I))
		I=I+1
	Wend
End Sub


'===============================================================================
'函数名：Delotherdj(Leixing)
'说明：	删除除了所指道具类型以外的所有道具
'输入：Leixing 指定的道具类型
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Delotherdj(Leixing)
	Dim I,Ix,Lin
	I=0
	While I<G_Actwps
		If G_Djleixing(G_Actwp(I))<>Leixing Then
			G_Actwp(I)=-1
		End If
		I=I+1
	Wend
	I=0
	While I<G_Actwps-1
		Ix=0'初始化数组下标
		While Ix<G_Actwps-1
			If G_Actwp(Ix)<G_Actwp(Ix+1) Then
				Lin=G_Actwp(Ix+1)
				G_Actwp(Ix+1)=G_Actwp(Ix)
				G_Actwp(Ix)=Lin
			End If
			Ix=Ix+1
		Wend
		I=I+1
	Wend
	I=0
	While G_Actwp(I)<>-1 And I<G_Actwps
		I=I+1
	Wend
	G_Actwps=I
End Sub

'===============================================================================
'函数名：Copyactdj()
'说明：	复制角色道具非身穿
'输入：
'输出：G_Cactdjs G_Cactdj(100)	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Copyactdj()
	Dim I
	G_Cactdjs=G_Actwps
	I=0
	While I<G_Actwps
		G_Cactdj(I)=G_Actwp(I)
		I=I+1
	Wend
End Sub

'===============================================================================
'函数名：Djbox()
'说明：	道具盒子
'输入：
'输出：	
'返回：被选中的物品代号	
'备注：
'修改记录：
'===============================================================================
Sub Djbox()
	Dim Over,Key
	Dim I,I2
	Dim Bpic,H1pic,H2pic,Jtpic
	If G_Actwps=0 Then
		Msgbox("你还没有任何物品!")
		Djbox=-1
		Goto Enddjbox
	End If
	Bpic=Loadres(Respath+"Sys"+G_Res$,11)
	H1pic=Loadres(Respath+"Sys"+G_Res$,27)
	H2pic=Loadres(Respath+"Sys"+G_Res$,3)
	Jtpic=Loadres(Respath+"Sys"+G_Res$,30)
	Showpic(-1,Bpic,0,0,240,160,0,0,1)
	Showpic(-1,H1pic,22,2,197,63,0,0,1)
	Showpic(-1,H2pic,22,70,197,90,0,0,1)
	I=0
	I2=0
	Key=0
	Over=0
	Ic=0
	Goto Djboxlogo1
	While Over<>1
		Key=Getkey()
		If Key<>0 Then
Djboxlogo1:	If Key=Key_Up Then
				I=I-1
			Else If Key=Key_Down Then
				I=I+1
			Else If Key=13 Then
				Djbox=I
				Over=1
			Else If Key=27 Then
				Djbox=-1
				Over=1
			End If
			If I>=G_Actwps Then I=I-1
			If I<0 Then I=0
			If G_Actwps>1 And Key=Key_Down Then
				I2=1
			Else
				I2=0
			End If
			Showpic(-1,H1pic,22,2,197,63,0,0,1)
			Showpic(-1,H2pic,22,70,197,90,0,0,1)
			Showpic(-1,Jtpic,160,10+I2*20,37,22,0,0,1)
			Fastshow(-1,Respath+"Wp"+G_Res$,G_Djpicid(G_Actwp(I)),28,120,32,32,0,0)
			Font(Font_16song)
			Color(0,0,0)
			If I2=0 Then
				Pixlocate(30,13)
				Print G_Djname$(G_Actwp(I))
				If G_Actwps>1 Then
					Pixlocate(30,33)
					Print G_Djname$(G_Actwp(I+1))
				End If
			Else If I2=1 Then
					Pixlocate(30,13)
					Print G_Djname$(G_Actwp(I-1))
				If G_Actwps>1 Then
					Pixlocate(30,33)
					Print G_Djname$(G_Actwp(I))
				End If
			End If
			Printnext(G_Djms$(G_Actwp(I)),20,30,80)
			Pixlocate(60,120)
			Print"数量:"+G_Actwpsl(I)
			Key=0
		End If
	Wend
	Freeres(Bpic)
	Freeres(H1pic)
	Freeres(H2pic)
	Freeres(Jtpic)
Enddjbox:
End Sub

'===============================================================================
'函数名：Mfbox(Actid)
'说明：	魔法盒子
'输入：
'输出：	
'返回：返回一个选中的魔法代号 -1 为没有选中
'备注：
'修改记录：
'===============================================================================S
Sub Mfbox(Actid)
	Dim Over,Key
	Dim I,I2
	Dim Bpic,H1pic,H2pic,Jtpic
	Font(Font_16song)
	Color(0,0,0)
	If G_Actfs(Actid)=0 Then
		Msgbox("你还没有学会法术!")
		Mfbox=-1
		Goto Endmfbox
	End If
	Bpic=Loadres(Respath+"Sys"+G_Res$,11)
	H1pic=Loadres(Respath+"Sys"+G_Res$,27)
	H2pic=Loadres(Respath+"Sys"+G_Res$,3)
	Jtpic=Loadres(Respath+"Sys"+G_Res$,30)
	Showpic(-1,Bpic,0,0,240,160,0,0,1)
	Showpic(-1,H1pic,22,2,197,63,0,0,1)
	Showpic(-1,H2pic,22,70,197,90,0,0,1)
	I=0
	I2=0
	Key=0
	Over=0
	Ic=0
	Goto Mfboxlogo1
	While Over<>1
		Key=Getkey()	
		If Key<>0 Then
Mfboxlogo1:	If Key=Key_Up Then
				I=I-1
			Else If Key=Key_Down Then
				I=I+1
			Else If Key=13 Then
				Mfbox=I
				Over=1
			Else If Key=27 Then
				Mfbox=-1
				Over=1
			End If
			If I>=G_Actfs(Actid) Then I=I-1
			If I<0 Then I=0
			If G_Actfs(Actid)>1 And Key=Key_Down Then
				I2=1
			Else
				I2=0
			End If
			Showpic(-1,H1pic,22,2,197,63,0,0,1)
			Showpic(-1,H2pic,22,70,197,90,0,0,1)
			Showpic(-1,Jtpic,160,10+I2*20,37,22,0,0,1)
			Font(Font_16song)
			Color(0,0,0)
			If I2=0 Then
				Pixlocate(30,13)
				Print G_Mfname$(G_Actmf(Actid,I))
				If G_Actfs(Actid)>1 Then
					Pixlocate(30,33)
					Print G_Mfname$(G_Actmf(Actid,I+1))
				End If
			Else If I2=1 Then
					Pixlocate(30,13)
					Print G_Mfname$(G_Actmf(Actid,I-1))
				If G_Actfs(Actid)>1 Then
					Pixlocate(30,33)
					Print G_Mfname$(G_Actmf(Actid,I))
				End If
			End If
			Printnext(G_Mfms$(G_Actmf(Actid,I)),20,30,80)
			Key=0
		End If
	Wend
	Freeres(Bpic)
	Freeres(H1pic)
	Freeres(H2pic)
	Freeres(Jtpic)
Endmfbox:
End Sub


'===============================================================================
'函数名：Showmf(Mfid,Mfmode,Ftid,Mode,Bx,By)
'说明：由指定角色播放魔法动画	
'输入：Mfmode 0单体 1全体 Mode 0己方 1敌方 Bx By偏移量
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Showmf(Mfid,Mfmode,Ftid,Mode,Bx,By)
	Dim M,Drx,Dry,Actx,Acty
	Dim Wx,Wy
	Drx=20+Ftid*Getpicwid(G_Ftpic(Ftid))/2
	Dry=65-Ftid*15
	Actx=110+Ftid*Getpicwid(G_Actfightpic(Ftid))/4
	Acty=90-Ftid*15
	If Mode=0 Then
		If Mfmode=0 Then
			Wx=Actx
			Wy=Acty
		Else If Mfmode=1 Then
			Wx=90
			Wy=60
		End If
	Else If Mode=1 Then
		If Mfmode=0 Then
			Wx=Drx
			Wy=Dry
		Else If Mfmode=1 Then
			Wx=0
			Wy=0
		End If
	End If
	Showanyfight()'可优化用bitbltpage代替避免重画全部
	Playmf(Mfid,Wx+Bx,Wy+By)
	Showanyfight()
	Flippage(G_Page_Sundry)
End Sub


'===============================================================================
'函数名：Drfightxy(Id,Actid)
'说明：	敌人战斗偏移控制
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Drfightxy(Id,Actid)
	Dim M,Drx,Dry,Actx,Acty
	Dim Wx,Wy
	Drx=20+Id*Getpicwid(G_Ftpic(Id))/2
	Dry=65-Id*15
	Actx=110+Actid*Getpicwid(G_Actfightpic(Actid))/4
	Acty=90-Actid*15
	Wx=(Actx-Drx)/3
	Wy=(Acty-Dry)/3
	G_Ftgjkg(Id)=1
	G_Actgjkg(Actid)=1
	M=0
	G_Actpx=0
	G_Actpy=0
	While M<3
		G_Ftx=G_Ftx-Wx
		G_Fty=G_Fty-Wy
		If M>0 Then
			G_Ftpx=1
			If M=2 Then
				G_Actftx=G_Actftx-5
				G_Actfty=G_Actfty-5
			End If
		End If
		Showanyfight()
		Flippage(G_Page_Sundry)
		M=M+1
		Msdelay(150)
	Wend
	G_Actgjkg(Actid)=0
	G_Ftgjkg(Id)=0
	G_Ftx=0:G_Fty=0
	G_Ftpx=0
	G_Actftx=0:G_Actfty=0
	Showanyfight()
	Flippage(G_Page_Sundry)
End Sub
'===============================================================================
'函数名：Actfightxy(Id,Drid)
'说明：	角色战斗偏移控制
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Actfightxy(Id,Drid)
	Dim M,Drx,Dry,Actx,Acty
	Dim Wx,Wy
	Drx=20+Drid*Getpicwid(G_Ftpic(Drid))/2
	Dry=65-Drid*15
	Actx=110+Id*Getpicwid(G_Actfightpic(Id))/4
	Acty=90-Id*15
	Wx=(Actx-Drx)/4
	Wy=(Acty-Dry)/4
	G_Actgjkg(Id)=1
	G_Ftgjkg(Drid)=1
	M=0
	G_Actpx=0
	G_Actpy=0
	While M<4
		G_Actftx=G_Actftx+Wx
		G_Actfty=G_Actfty+Wy
		G_Actpx=G_Actpx+1
		If M=3 Then
			G_Ftx=G_Ftx+5
			G_Fty=G_Fty+5
			G_Actpx=0
			G_Actpy=1
		End If
		Showanyfight()
		Flippage(G_Page_Sundry)
		M=M+1
		Msdelay(150)
	Wend
	G_Actgjkg(Id)=0
	G_Ftgjkg(Drid)=0
	G_Ftx=0:G_Fty=0
	G_Actftx=0:G_Actfty=0
	G_Actpx=0:Actpy=0
	Showanyfight()
	Flippage(G_Page_Sundry)
End Sub

'===============================================================================
'函数名：Loaddrpic()
'说明：	载入所有目前的战斗敌人图片资源
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Loaddrpic()
	Dim I
	I=0
	While I<G_Ftcount
		G_Ftpic(I)=Loadres(Respath+"Dr"+G_Res$,G_Drpicid(G_Ftid(I)))
		I=I+1
	Wend
End Sub

'===============================================================================
'函数名：Showanyfight()
'说明：	刷新战斗场景中的所有对象
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Showanyfight()
	Dim I,Drx,Dry,Drpx,Actx,Acty,Actpx,Actpy,W,H
	Showpic(G_Page_Sundry,G_Fightbackpic,0,0,Lcd_Wid,Lcd_Hgt,0,0,1)'刷新战斗背景
	I=0
	While I<G_Ftcount'刷新敌人对象
		If G_Ftgrow(I)=1 Then
			W=Getpicwid(G_Ftpic(I))/2
			H=Getpichgt(G_Ftpic(I))
			Drx=20+I*W
			Dry=65-I*15
			Drpx=0
			If G_Ftgjkg(I)=1 Then
				Dry=Dry-G_Fty
				Drx=Drx-G_Ftx
				Drpx=G_Ftpx*W
			End If
			Showpic(G_Page_Sundry,G_Ftpic(I),Drx,Dry,W,H,Drpx,0,1)
		End If
		I=I+1
	Wend
	I=0
	While I<G_Actcount'刷新角色对象
		W=Getpicwid(G_Actfightpic(I))/4
		H=Getpichgt(G_Actfightpic(I))/3
		Actx=110+I*W
		Acty=90-I*15
		Actpx=0
		Actpy=0
		If G_Acthp(I)<=G_Acthpmax(I)/10 Then
			Actpx=2*W
			Actpy=2*H
			If G_Acthp(I)<=0 Then
				Actpx=3*W
				Actpy=2*H
			End If
		End If
		If G_Actgjkg(I)=1 Then
			Actx=Actx-G_Actftx
			Acty=Acty-G_Actfty
			Actpx=G_Actpx*W
			Actpy=G_Actpy*H
		End If
		Showpic(G_Page_Sundry,G_Actfightpic(I),Actx,Acty,W,H,Actpx,Actpy,1)
		I=I+1
	Wend
End Sub

'===============================================================================
'函数名：Playmf(Id,X,Y)
'说明：	播放魔法
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Playmf(Id,X,Y)
	Dim Max,Start
	Dim Pic
	Max=G_Dhe(Id)-G_Dhs(Id)+G_Dhs(Id)
	Start=G_Dhs(Id)
	While Start<Max
		Showanyfight()'可优化可用bitbltpage复制sundry页面
		Show(G_Page_Sundry,Respath+"Mf"+G_Res$,Start,X,Y)
		Flippage(G_Page_Sundry)
		Msdelay(100)
		Start=Start+1
	Wend
End Sub


'===============================================================================
'函数名：Getdr()
'说明：	从数组中读取敌人信息
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Getdr()
	Dim I
	I=0
	While I<G_Ftcount
		G_Ftgrow(I)=1
		G_Fthp(I)=G_Drhp(G_Ftid(I))
		G_Ftmp(I)=G_Drmp(G_Ftid(I))
		G_Ftgj(I)=G_Drgj(G_Ftid(I))
		G_Ftfy(I)=G_Drfy(G_Ftid(I))
		G_Ftmf(I)=G_Drmfid(G_Ftid(I))
		G_Ftmj(I)=G_Drmj(G_Ftid(I))
		I=I+1
	Wend
End Sub

'===============================================================================
'函数名：Msgbox(Str$)
'说明：	打印消息到屏幕上
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Msgbox(Text$)
	Dim Pic
	Pic=Loadres(Respath+"Sys"+G_Res$,5)
	Showpic(-1,Pic,(Lcd_Wid-Getpicwid(Pic))/2,(Lcd_Hgt-Getpichgt(Pic))/2,Getpicwid(Pic),Getpichgt(Pic),0,0,1)
	Font(Font_16song)
	Color(0,&Hffffff,0)
	Pixlocate((Lcd_Wid-Len(Text$)*8)/2,(Lcd_Hgt-16)/2)
	Print Text$
	Freeres(Pic)
	Forwaitkey()
End Sub
'===============================================================================
'函数名：Actback()
'说明：	艺术清屏
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Actback()
	Dim X,Y,Tx,Ty,I
	Dim Over
	Y=0
	Ty=0
	I=0
	Over=0
	While Over<>1
		Fillpage(G_Page_Sundry,0,0,Lcd_Wid,Lcd_Hgt,0)
		Showpic(G_Page_Sundry, G_Fightbackpic,0,0,I,40,0,0,1)
		Showpic(G_Page_Sundry, G_Fightbackpic,240-I,40,I,40,240-I,40,1)
		Showpic(G_Page_Sundry, G_Fightbackpic,0,80,I,40,0,80,1)
		Showpic(G_Page_Sundry, G_Fightbackpic,240-I,120,I,40,240-I,120,1)
		I=I+5
		If I>240 Then Over=1
		Flippage(G_Page_Sundry)
	Wend
End Sub


'===============================================================================
'函数名：Shownumber(Page,Num,X,Y)
'说明：	显示数字到指定位置
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================

Sub Shownumber(Page,Num,X,Y)
 Dim Num$,N,I,L
 Num$=Str$(Num)
 I=0
 L=Len(Num$)
 While I<L
  N=Val(Mid$(Num$,I,1))
  Showpic(Page,G_Numberpic,X+I*8,Y,8,16,0,N*16,1)
  I=I+1 
 Wend
End Sub

'===============================================================================
'函数名：Sub Setfightback(Picid)'设置战斗背景图片
'说明：	
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Setfightback(Picid)'设置战斗背景图片
	G_Fbpicid=Picid
End Sub

'===============================================================================
'函数名：Fastshow(Page,Res$,Picid,X,Y,W,H,Dx,Dy)
'说明：	快速显示图片到指定位置
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Fastshow(Page,Res$,Picid,X,Y,W,H,Dx,Dy)
	Dim Page,Res$,Picid,X,Y,W,H,Dx,Dy,Pic
	Pic=Loadres(Res$,Picid)
	Showpic(Page,Pic,X,Y,W,H,Dx,Dy,1)
	Freeres(Pic)
End Sub


'===============================================================================
'函数名：Gameinit()
'说明：	游戏数据初始化
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Gameinit()
 Dim I,Chang,Path$,Lin,Pos
'环境判断
Setlcd(Lcd_Wid,Lcd_Hgt)'设置模拟器大小
If Getenv!()=Env_Sim Then
	G_Res$=".Rlb"
	G_Actrundelay=100'角色驱动延时
	G_DelayKey=50'按键延时扩大按键响应时间
	G_Delaykeyx=100'行走延迟扩大按键响应时间	
Else
	G_Actrundelay=0'角色驱动延时
	G_DelayKey=50'按键延时扩大按键响应时间
	G_Delaykeyx=100'行走延迟扩大按键响应时间
	G_Res$=".Lib"
End If
Fastshow(-1,Respath+"Sys"+G_Res$,26,0,0,240,160,0,0)
'创建图形页
G_Page_Map=Createpage()'用于存储地图图像
G_Page_Sundry=Createpage()'用于存储杂类图像
G_Page_Sundry2=Createpage()'用于存储杂类图像
'二进制处理需要用到的,一般不要修改这里
 G_Event_Num(0) = 1
 G_Event_Num(1) = 2
 G_Event_Num(2) = 4
 G_Event_Num(3) = 8
 G_Event_Num(4) = 16
 G_Event_Num(5) = 32
 G_Event_Num(6) = 64
 G_Event_Num(7) = 128
 G_Event_Num(8) = 256
 G_Event_Num(9) = 512
 G_Event_Num(10) = 1024
 G_Event_Num(11) = 2048
 G_Event_Num(12) = 4096
 G_Event_Num(13) = 8192
 G_Event_Num(14) = 16384
 G_Event_Num(15) = 32768
 G_Event_Num(16) = 65536
 G_Event_Num(17) = 131072
 G_Event_Num(18) = 262144
 G_Event_Num(19) = 524288
 G_Event_Num(20) = 1048576
 G_Event_Num(21) = 2097152
 G_Event_Num(22) = 4194304
 G_Event_Num(23) = 8388608
 G_Event_Num(24) = 16777216
 G_Event_Num(25) = 33554432
 G_Event_Num(26) = 67108864
 G_Event_Num(27) = 134217728
 G_Event_Num(28) = 268435456
 G_Event_Num(29) = 536870912
 G_Event_Num(30) = 1073741824'以下与二进制处理无关
 
 G_Npcrundelay=1000'npc自动驱动延时
 
 '载入系统图片资源
 G_Sayboxpic=Loadres(Respath+"Sys"+G_Res$,27)
 G_Boxpic=Loadres(Respath+"Sys"+G_Res$,1)
 G_Numberpic=Loadres(Respath+"Sys"+G_Res$,6)
 G_Fightbackpic=Loadres(Respath+"Fb"+G_Res$,2)
 I=0
 While I<3
 	G_Actfightpic(I)=Loadres(Respath+"Dr"+G_Res$,I+1)
 	I=I+1
 Wend
 G_XYBoxpic=Loadres(Respath+"Sys"+G_Res$,15)
 G_Mhpboxpic=Loadres(Respath+"Sys"+G_Res$,10)
 G_Gameoverpic=Loadres(Respath+"Sys"+G_Res$,12)
 G_Ftmenupic=Loadres(Respath+"Sys"+G_Res$,16)
 G_Jtpic=Loadres(Respath+"Sys"+G_Res$,9)
 Randomize(Gettick())
 Path$=Respath+"Dj.Dat"
 Open Path$ For Binary As#1
 	Get#1,Chang
 	I=0
 	While I<Chang
 		Lin=I*4+4
 		Seek#1,Lin
 		Get#1,Pos
 		Seek#1,Pos
 		Get#1,G_Djpicid(I)
 		Get#1,G_Djname$(I)
 		Get#1,G_Djleixing(I)
 		Get#1,G_Dj1(I)
 		Get#1,G_Dj2(I)
 		Get#1,G_Dj3(I)
 		Get#1,G_Djms$(I)
 		I=I+1
 	Wend
 Close#1
 Path$=Respath+"Mf.Dat"
 Open Path$ For Binary As#1
 Get#1,Chang
 I=0
 While I<Chang
 	Lin=I*4+4
 	Seek#1,Lin
 	Get#1,Pos
 	Seek#1,Pos
 	Get#1,G_Mfname$(I)
 	Get#1,G_Mffw(I)
 	Get#1,G_Mfleixing(I)
 	Get#1,G_Mf1(I)
 	Get#1,G_Mf2(I)
 	Get#1,G_Mfdhid(I)
 	Get#1,G_Mfms$(I)
 	I=I+1
 Wend
 Close#1
 Path$=Respath+"Dr.Dat"
 Open Path$ For Binary As#1
 Get#1,Chang
 I=0
 While I<Chang
 	Lin=I*4+4
 	Seek#1,Lin
 	Get#1,Pos
 	Seek#1,Pos
 	Get#1,G_Drpicid(I)
 	Get#1,G_Drhp(I)
 	Get#1,G_Drmp(I)
 	Get#1,G_Drgj(I)
 	Get#1,G_Drfy(I)
 	Get#1,G_Drmj(I)
 	Get#1,G_Drmfid(I)
 	I=I+1
 Wend
 Close#1
 Path$=Respath+"Dh.Dat"
 Open Path$ For Binary As#1
 Get#1,Chang
 I=0
 While I<Chang
 	Lin=I*4+4
 	Seek#1,Lin
 	Get#1,Pos
 	Seek#1,Pos
 	Get#1,G_Dhs(I)
 	Get#1,G_Dhe(I)
 	Get#1,G_Dhbx(I)
 	Get#1,G_Dhby(I)
 	I=I+1
 Wend
 Setbkmode(1)'设置字体透明
 G_Npccount=0'设置npc个数为0
End Sub

'===============================================================================
'函数名：Setmap1(X,Y,Mode,Cost)
'说明：	设置上层地图属性正负
'输入：X,Y位置,Mode 1为正 0为负 Cost为要设置的值
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Setmap1(X,Y,Mode,Cost)
		G_Maplayer1(X,Y)=Cost
	If Mode=0 Then
		G_Maplayer1(X,Y)=-1*Abs(G_Maplayer1(X,Y))
	Else If Mode=1 Then
		G_Maplayer1(X,Y)=Abs(G_Maplayer1(X,Y))
	End If
	Setmap1=G_Maplayer1(X,Y)
End Sub

'===============================================================================
'函数名：Setmap0(X,Y,Mode)
'说明：	设置底层地图属性正负
'输入：X,Y位置,Mode 1为正 0为负
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Setmap0(X,Y,Mode)
	If Mode=0 Then
		G_Maplayer0(X,Y)=-1*Abs(G_Maplayer0(X,Y))
	Else If Mode=1 Then
		G_Maplayer0(X,Y)=Abs(G_Maplayer0(X,Y))
	End If
End Sub

'===============================================================================
'函数名:Entercheck()
'说明：检测主角周围是否有npc有则返回该npc代号	
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Entercheck()
	Dim Ax,Ay
	Dim I
	Ax=G_Npcx(0)
	Ay=G_Npcy(0)
	If G_Npcface(0)=Face_Up Then
		Ay=Ay-1
	Else If G_Npcface(0)=Face_Down Then
		Ay=Ay+1
	Else If G_Npcface(0)=Face_Left Then
		Ax=Ax-1
	Else If G_Npcface(0)=Face_Right Then
		Ax=Ax+1
	End If
	I=0
	While I<G_Npccount
		If G_Npcx(I)=Ax And G_Npcy(I)=Ay Then
			Entercheck=I
			Goto Enterchecklogo
		End If
		I=I+1
	Wend
	Entercheck=0
Enterchecklogo:
End Sub

'===============================================================================
'函数名： Createbox(X,Y)
'说明：	创建一个宝箱
'输入：X,Y位置mode样式 Onoff开关
'输出：	
'返回：返回一个npc编号	
'备注：
'修改记录：
'===============================================================================
Sub Createbox(X,Y,Mode,Onoff)
	G_Npcpic(G_Npccount)=Loadres(Respath+"Sys"+G_Res$,1)
	G_Npcx(G_Npccount)=X
	G_Npcy(G_Npccount)=Y
	G_Npcw(G_Npccount)=Tile_Wid
	G_Npch(G_Npccount)=Tile_Hgt
	G_Npcmode(G_Npccount)=2
	G_Npcorstay(G_Npccount)=Npc_Stay
	G_Npcstep(G_Npccount)=Mode
	G_Npcface(G_Npccount)=Onoff
	Setmap0(G_Npcx(G_Npccount),G_Npcy(G_Npccount),0)
	Createbox=G_Npccount
	G_Npccount=G_Npccount+1
End Sub

'===============================================================================
'函数名：Checkyiru(X,Y)
'说明：	检测x，Y是否可以移入npc和主角
'输入：
'输出：	
'返回：	1时可移入
'备注：
'修改记录：
'===============================================================================
Sub Checkyiru(X,Y)
	If Checknpc(X,Y)=0 And Checkmap(X,Y,0)=1 Then
		Checkyiru=1
	Else
		Checkyiru=0
	End If
End Sub
'===============================================================================
'函数名：Checknpc(X,Y)
'说明：	检测x，Y地图位置上是否有npc对象
'输入：X,Y要检测的地图位置
'输出：	
'返回：	1时为有npc对像，0为无
'备注：
'修改记录：
'===============================================================================
Sub Checknpc(X,Y)
	Dim I
	I=0
	While I<G_Npccount
		If G_Npcx(I)=X And G_Npcy(I)=Y And G_Npcmode(I)=1 Then
			Checknpc=1
			Goto Checknpclogo
		End If
		I=I+1
	Wend
	Checknpc=0
Checknpclogo:
End Sub


'===============================================================================
'函数名：Dnpcsport(D)
'说明：	单个npc运动处理
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Dnpcsport(D)
	Dim Face,Ax,Ay,Linx,Liny
	g_sj4=d
	Vasm("IN [vint_g_sj1],15")
	If g_sj1-G_Npcrunstart>G_Npcrundelay Then
		Ax=G_Npcx(g_sj4)
		Ay=G_Npcy(g_sj4)
		If G_Npcorstay(g_sj4)=Npc_Round Then
			Face=Rnd(4)
			If Face=Face_Up Then
					Ay=Ay-1
			Else If Face=Face_Down Then
					Ay=Ay+1
			Else If Face=Face_Left Then				
					Ax=Ax-1
			Else If Face=Face_Right Then
					Ax=Ax+1
			End If
			If Checkyiru(Ax,Ay)=1 And G_Maplayer1(Ax,Ay)>=0 Then
				If G_Npcface(g_sj4)<>Face Then
					G_Npcface(g_sj4)=Face
					G_Npcstep(g_sj4)=-1
				Else
					G_Npcx(g_sj4)=Ax
					G_Npcy(g_sj4)=Ay
				End If
			End If
			G_Npcstep(g_sj4)=G_Npcstep(g_sj4)+1
			If G_Npcstep(g_sj4)=4 Then G_Npcstep(g_sj4)=0
		End If
	End If
End Sub


'===============================================================================
'函数名：Npcsport()
'说明：	产生npc运动,并画出npc，主角
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Npcsport()
	Dim Lini,Px,Py
	g_sj2=0
	Lini=0
	Maopaopaixu()
	While g_sj2<G_Npccount
		g_sj4=G_Npctaxis(g_sj2)
		'drawnpc(G_Page_Map,G_Npcpic(Lini),G_Npcx(Lini),G_Npcy(Lini),G_Npcface(Lini),G_Npcstep(Lini))
		'画npc
		If G_Npcx(g_sj4)<G_Npcx(0)+5 And G_Npcx(g_sj4)>G_Npcx(0)-5 And G_Npcy(g_sj4)<G_Npcy(0)+3 And G_Npcy(g_sj4)>G_Npcy(0)-4 Then
		If G_Npcmode(g_sj4)=1 Then
			Showpic(G_Page_Sundry,G_Npcpic(g_sj4),(G_Npcx(g_sj4)-G_Mapx)*Tile_Wid,(G_Npcy(g_sj4)-G_Mapy-1)*Tile_Hgt+10,G_Npcw(g_sj4),G_Npch(g_sj4),G_Npcstep(g_sj4)*G_Npcw(g_sj4),G_Npcface(g_sj4)*G_Npch(g_sj4),1)
			If G_Maplayer1(G_Npcx(g_sj4),G_Npcy(g_sj4)-1)>0 And G_Maplayer0(G_Npcx(g_sj4),G_Npcy(g_sj4)-1)>0 Then
				Px = (G_Maplayer1(G_Npcx(g_sj4),(G_Npcy(g_sj4))-1) Mod G_Pline) * Tile_Wid
				Py = (G_Maplayer1(G_Npcx(g_sj4),(G_Npcy(g_sj4))-1) / G_Pline) * Tile_Hgt
				Showpic(G_Page_Sundry,G_Maptitlepic,(G_Npcx(g_sj4)-G_Mapx)*Tile_Wid,(G_Npcy(g_sj4)-1-G_Mapy)*Tile_Hgt,Tile_Wid,Tile_Hgt,Px,Py,1)
			End If
		Else If G_Npcmode(g_sj4)>1 Then
			Showpic(G_Page_Sundry,G_Npcpic(g_sj4),(G_Npcx(g_sj4)-G_Mapx)*Tile_Wid,(G_Npcy(g_sj4)-G_Mapy)*Tile_Hgt,32,32,G_Npcstep(g_sj4)*G_Npcw(g_sj4),G_Npcface(g_sj4)*G_Npch(g_sj4),1)
		End If
		If G_Maplayer1(G_Npcx(g_sj4),G_Npcy(g_sj4))>0 Then
			Px = (G_Maplayer1(G_Npcx(g_sj4),G_Npcy(g_sj4)) Mod G_Pline) * Tile_Wid
			Py = (G_Maplayer1(G_Npcx(g_sj4),G_Npcy(g_sj4)) / G_Pline) * Tile_Hgt
			Showpic(G_Page_Sundry,G_Maptitlepic,(G_Npcx(g_sj4)-G_Mapx)*Tile_Wid,(G_Npcy(g_sj4)-G_Mapy)*Tile_Hgt,Tile_Wid,Tile_Hgt,Px,Py,1)
		End If
		End If
		Dnpcsport(g_sj4)
		g_sj2=g_sj2+1
	Wend
	vasm("in [vint_g_sj3],15")
	If	g_sj3-G_Npcrunstart> G_Npcrundelay Then
			vasm("in [vint_g_npcrunstart],15")
	End If
End Sub


'===============================================================================
'函数名：Checkmap(X,Y,Mode)
'说明：	检测地图块数据是负值还是正值
'输入：X,Y要检测的地图数据,Mode为0检测下层地图,Mode为1时检测上层地图
'输出：	
'返回：	为0时为负值,1时为正值
'备注：
'修改记录：
'===============================================================================
Sub Checkmap(X,Y,Mode)
	If Mode=0 Then
		If G_Maplayer0(X,Y)>0 Then
			Checkmap=1
		Else
			Checkmap=0
		End If
	Else If Mode=1 Then
		If G_Maplayer1(X,Y)>0 Then
			Checkmap=1
		Else
			Checkmap=0
		End If
	End If
End Sub


'===============================================================================
'函数名：Ggactorxy(X,Y)
'说明：	更改角色在地图的位置到x，Y处
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Ggactorxy(X,Y)
G_Npcx(0)=X
G_Npcy(0)=Y
End Sub



'===============================================================================
'函数名：Drivemap()
'说明：	主角驾驶地图
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Drivemap()
	Dim shared Drivemap_Ax,Drivemap_Ay,Drivemap_Lin,Drivemap_Tick,Drivemap_over
	Drivemap_Over=0
	G_Message=0
	While Drivemap_Over=0
		Drivemap_Ax=G_Npcx(0)
		Drivemap_Ay=G_Npcy(0)
		Drivemap_Tick=Gettick()
		While Gettick()-Drivemap_Tick<g_delaykeyx
				If Keypress(Key_Up) Then
						G_Npcface(0)=Face_Up
						Drivemap_Ay=Drivemap_Ay-1
						G_Npcstep(0)=G_Npcstep(0)+1
					If G_Npcstep(0)=4 Then G_Npcstep(0)=0
					If Checkyiru(Drivemap_Ax,Drivemap_Ay)=1 Then
						G_Npcx(0)=Drivemap_Ax
						G_Npcy(0)=Drivemap_Ay
					End If
					If G_Maplayer1(G_Npcx(0),G_Npcy(0))<0 Then
						Drivemap_Over=1
						G_Message=G_Maplayer1(G_Npcx(0),G_Npcy(0))
					End If
					If G_Tmap=1 Then
						Drivemap_Over=1
					End If
					goto escapekey
				Else If Keypress(Key_Down) Then
					G_Npcface(0)=Face_Down
					Drivemap_Ay=Drivemap_Ay+1
					G_Npcstep(0)=G_Npcstep(0)+1
					If G_Npcstep(0)=4 Then G_Npcstep(0)=0
					If Checkyiru(Drivemap_Ax,Drivemap_Ay)=1 Then
						G_Npcx(0)=Drivemap_Ax
						G_Npcy(0)=Drivemap_Ay
					End If
					If G_Maplayer1(G_Npcx(0),G_Npcy(0))<0 Then
						Drivemap_Over=1
						G_Message=G_Maplayer1(G_Npcx(0),G_Npcy(0))
					End If
					If G_Tmap=1 Then
						Drivemap_Over=1
					End If
					goto escapekey
				Else If Keypress(Key_Left) Then
						G_Npcface(0)=Face_Left
						Drivemap_Ax=Drivemap_Ax-1
						G_Npcstep(0)=G_Npcstep(0)+1
					If G_Npcstep(0)=4 Then G_Npcstep(0)=0
					If Checkyiru(Drivemap_Ax,Drivemap_Ay)=1 Then
						G_Npcx(0)=Drivemap_Ax
						G_Npcy(0)=Drivemap_Ay
					End If
					If G_Maplayer1(G_Npcx(0),G_Npcy(0))<0 Then
						Drivemap_Over=1
						G_Message=G_Maplayer1(G_Npcx(0),G_Npcy(0))
					End If
					If G_Tmap=1 Then
						Drivemap_Over=1
					End If
					goto escapekey
				Else If Keypress(Key_Right) Then
						G_Npcface(0)=Face_Right
						Drivemap_Ax=Drivemap_Ax+1
						G_Npcstep(0)=G_Npcstep(0)+1
					If G_Npcstep(0)=4 Then G_Npcstep(0)=0
					If Checkyiru(Drivemap_Ax,Drivemap_Ay)=1 Then
						G_Npcx(0)=Drivemap_Ax
						G_Npcy(0)=Drivemap_Ay
					End If
					If G_Maplayer1(G_Npcx(0),G_Npcy(0))<0 Then
						Drivemap_Over=1
						G_Message=G_Maplayer1(G_Npcx(0),G_Npcy(0))
					End If
					If G_Tmap=1 Then
						Drivemap_Over=1
					End If
					goto escapekey
				Else If Keypress(Key_Enter) Then
					Drivemap_Lin=Entercheck()
					If Drivemap_Lin<>0 Then
						G_Message=Drivemap_Lin
						Drivemap_Over=1
					End If
					goto escapekey
				Else If Keypress(27) Then
					Escmenucl()
					Drivemap_nf=0
					goto escapekey
				End If
		Wend
escapekey:
		Showmap(G_Npcx(0)-3,G_Npcy(0)-2)
		Msdelay(G_Actrundelay)
	Wend
End Sub

'===============================================================================
'函数名：Getkey()
'说明：	获取游戏控制按键
'输入：g_delaykey(按键延时，扩大按键响应时间）
'输出：	
'返回：游戏控制键值	
'备注：
'修改记录：
'===============================================================================
Sub Getkey()
	Dim Shared GetKey_Tick,Getkey_over
	GetKey_Tick=Gettick()
	getkey_over=1
	While GetTick()-Getkey_Tick<g_DelayKey
		if Getkey_over=1 then
			If Keypress(Key_Up) Then
				Getkey=Key_Up
				getkey_over=0
			Else If Keypress(Key_Down) Then
				Getkey=Key_Down
				getkey_over=0
			Else If Keypress(Key_Left) Then
				Getkey=Key_Left
				getkey_over=0
			Else If Keypress(Key_Right) Then
				Getkey=Key_Right
				getkey_over=0
			Else If Keypress(Key_Enter) Then
				Getkey=13
				getkey_over=0
			Else If Keypress(32) Then
				Getkey=32
				getkey_over=0
			Else If Keypress(Key_Escape) Then
				Getkey=27
				getkey_over=0
			Else
				Getkey=0
			End If
		end if
	Wend
End Sub

'===============================================================================
'函数名：Getkey2()
'说明：	获取游戏控制按键(为使打印字符串无延迟的折中)
'输入：
'输出：	
'返回：游戏控制键值	
'备注：
'修改记录：
'===============================================================================

Sub GetKey2()
	If Keypress(Key_Up) Then
		Getkey2=Key_Up
	Else If Keypress(Key_Down) Then
		Getkey2=Key_Down
	Else If Keypress(Key_Left) Then
		Getkey2=Key_Left
	Else If Keypress(Key_Right) Then
		Getkey2=Key_Right
	Else If Keypress(Key_Enter) Then
		Getkey2=13
	Else If Keypress(32) Then
		Getkey2=32
	Else If Keypress(Key_Escape) Then
		Getkey2=27
	Else
		Getkey2=0
	End If
End Sub
'===============================================================================
'函数名：Drawnpc(Page,Pic,X,Y,Face,Stepx)
'说明：	画出npc对象到页面
'输入：Pic图片资源 Page页面 X,Y要画到的位置 W,H要显示的区域大小,Face面向,Stepx步数
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Drawnpc(Page,Pic,X,Y,Face,Stepx)
	'showpic(Page,Pic,X*Tile_Wid,(Y-1)*Tile_Hgt,Npc_Wid,Npc_Hgt,Stepx*W,Facey*H,1)
	
End Sub



'===============================================================================
'函数名：Createnpc(Picid,X,Y,Chushiface,Step,Orstay)
'说明：	创建并返回一个npc代号
'输入：Picid Npc对象的图片id
'x,Y为要创建到的位置chushiface初始化npc面向step初始化npc步数
'输出：	G_Npccount G_Npcorstay(G_Npccount) G_Npcpic(G_Npccount)
'返回：	返回一个npc代号用于对指定npc的操作
'备注：一共能创建20个npc
'修改记录：
'===============================================================================
Sub Createnpc(Picid,X,Y,Chushiface,Step,Orstay)
	G_Npccount=G_Npccount+1
	G_Npcpic(G_Npccount-1)=Loadres(Respath+"Npc"+G_Res$,Picid)
	G_Npcx(G_Npccount-1)=X
	G_Npcy(G_Npccount-1)=Y
	G_Npcstep(G_Npccount-1)=Step'初始化npc步数
	G_Npcface(G_Npccount-1)=Chushiface
	G_Npcorstay(G_Npccount-1)=Orstay
	G_Npcw(G_Npccount-1)=Npc_Wid
	G_Npch(G_Npccount-1)=Npc_Hgt
	G_Npcmode(G_Npccount-1)=1
	Createnpc=G_Npccount-1
End Sub


'===============================================================================
'函数名：Drawmap(Zx,Zy)
'说明：将地图部分的画到g_Page_Sundry页面中去	
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Drawmap(Zx,Zy)
	Dim X,Y,Px,Py
	Dim Maph,Mapw
	Mapw=Zx+8
	Maph=Zy+5
	Y=0
	Fillpage(G_Page_Sundry,0,0,240,160,&Hffffff)
	While Zy<Maph
		X=0
		Zx=Mapw-8
		While Zx<Mapw
			If G_Maplayer0(Zx,Zy)<>0 Then
				Px = (Abs(G_Maplayer0(Zx,Zy)) Mod G_Pline) * Tile_Wid
				Py = (Abs(G_Maplayer0(Zx,Zy)) / G_Pline) * Tile_Hgt
				Showpic(G_Page_Sundry,G_Maptitlepic,X*Tile_Wid,Y*Tile_Hgt,Tile_Wid,Tile_Hgt,Px,Py,1)
			End If
			If G_Maplayer1(Zx,Zy)>0 Then
				Px = (G_Maplayer1(Zx,Zy) Mod G_Pline) * Tile_Wid
				Py = (G_Maplayer1(Zx,Zy) / G_Pline) * Tile_Hgt
				Showpic(G_Page_Sundry,G_Maptitlepic,X*Tile_Wid,Y*Tile_Hgt,Tile_Wid,Tile_Hgt,Px,Py,1)
			End If
			X=X+1
			Zx=Zx+1
		Wend
		Y=Y+1
		Zy=Zy+1
	Wend
End Sub


'===============================================================================
'函数名：Printnext(Text$,Chang,X,Y)
'说明：	打印字符串在一个方框内
'输入：Chang为一行有几个字符
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Printnext(Text$,Chang,X,Y)
	Dim I,Ins
	Ins=Len(Text$)/Chang+1
	Font(Font_16song)
	Color(0,&Hffffff,0)
	I=0
	While I<Ins
		Pixlocate(X,Y+I*16)
		Print Mid$(Text$,I*Chang,Chang)
		I=I+1
	Wend
End Sub

'===============================================================================
'函数名：Maopaopaixu()
'说明：	冒泡法排序npc及主角(Y坐标排序)
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================


Function Maopaopaixu()
	Dim I,Iy,Lin,Linx(21),Liny(21)
	I=0'循环变量初始化
	While I<G_Npccount
		G_Npctaxis(I)=I
		I=I+1
	Wend 
	I=0
	While I<G_Npccount-1
		Iy=0
		While Iy<G_Npccount-1
			If G_Npcy(G_Npctaxis(Iy))>G_Npcy(G_Npctaxis(Iy+1)) Then
				Lin=G_Npctaxis(Iy+1)
				G_Npctaxis(Iy+1)=G_Npctaxis(Iy)
				G_Npctaxis(Iy)=Lin
			End If
			Iy=Iy+1
		Wend
		I=I+1
	Wend
End Function


'===============================================================================
'函数名：Loadmap(Mapname$,Picid)
'说明：	读取地图并载入地图图片资源计算地图行数
'输入：Id 要读取的地图id
'输出：	G_Pline	为列数
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Loadmap(Mapname$,Picid)
	Dim X,Y,Path$
	If G_Mappiconoff=True Then Freeres(G_Maptitlepic)'判断是否存在已载入的地图图片
'资源若有则释放资源n
	Path$=Respath+"Map\"+Mapname$+".Map"
	Open Path$ For Binary As#1
	Get#1,G_Mapw
	Get#1,G_Maph
	Y=0
	While Y<G_Maph
		X=0
		While X<G_Mapw
			Get#1,G_Maplayer0(X,Y)
			Get#1,G_Maplayer1(X,Y)
			X=X+1
		Wend
		Y=Y+1
	Wend
	Close#1
	G_Maptitlepic=Loadres(Respath+"Map"+G_Res$,Picid)
	G_Pline=Getpicwid(G_Maptitlepic)/Tile_Wid
	G_Mappiconoff=True
End Sub


'===============================================================================
'函数名：	Showmap(X,Y)
' 说明：	显示指定地点的地图
' 输入：	X,Y显示地图的区域 包括主角npc
' 输出： 	
' 返回：	
' 备注：	
'
'===============================================================================
Function Showmap(X,Y)
	G_Mapx=X
	G_Mapy=Y
	Drawmap(X,Y)
	If G_Npccount>0 Then
		Npcsport()
	End If
	ShowPic(G_Page_Sundry,G_XYBoxpic,0,0,80,32,0,0,1)
	ShowNumber(G_Page_Sundry,g_NPCX(0),52,2)
	ShowNumber(G_Page_Sundry,g_NPCY(0),52,14)
	Flippage(G_Page_Sundry)
End Sub

'===============================================================================
'	函数名：Showgut(Picid)
'	说明：	显示游戏引
'	输入：Picid游戏引图片id
'	输出：	
' 返回：	
' 备注：图片的宽必须为240,高为160
'				修改记录：2008.1.26	Smokeboy
'===============================================================================
Function Showgut(Picid)
	Dim Showgut_Pic
	Dim Showgut_Pic_Hgt
	Dim Showgut_I
	Showgut_Pic = Loadres(Respath+"Zm"+G_Res$ , Picid)
	Showgut_Pic_Hgt = Getpichgt(Showgut_Pic)
	Showgut_Pic_Hgt = Showgut_Pic_Hgt
	Showgut_I = 0
	Fillpage(G_Page_Sudry,Lcd_Jx+0,Lcd_Jy+0,Lcd_Wid,Lcd_Hgt,Bai)
	While Showgut_I < Showgut_Pic_Hgt
		Showpic(-1,Showgut_Pic,Lcd_Jx+0,Lcd_Jy+0,Lcd_Wid,Lcd_Hgt,0,Showgut_I,1)
		Msdelay(280)
		Showgut_I = Showgut_I + 4
		If Keypress(Key_Escape) Then Showgut_I = Showgut_Pic_Hgt
	Wend
	Freeres(Showgut_Pic)
End Function

'===============================================================================
'函数名：Forwaitkey()
'说明：	等待几个特殊按键(解决waitkey函数一闪就过的bug但无返回值)
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Forwaitkey()
	Msdelay(200)
    While Not Keypress(Key_Escape) And Not Keypress(Key_Enter) And Not Keypress(Key_Up) And Not Keypress(Key_Down) And Not Keypress(Key_Left) And Not Keypress(Key_Right) And Not Keypress(Key_Space)
    Wend
End Sub

'===============================================================================
'函数名：Say(Picid,Say$)
'说明：说话函数	
'输入：Picid头像图片id 0时为无头像,Say$说话内容
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Sub Say(Picid,Say$)
	Dim Ix,Iy,I,S,Pic
	Ix=Say_X+10
	Iy=Say_Y+5
	Font(Font_16song)
	Color(0,0,0)
	If Picid<>0 Then
		Pic=Loadres(Respath+"Tx"+G_Res$,Picid)
		Showpic(-1,Pic,21,Say_Y-Getpichgt(Pic),Getpicwid(Pic),Getpichgt(Pic),0,0,1)
		Freeres(Pic)
	End If
	Showpic(-1,G_Sayboxpic,Say_X,Say_Y,197,63,0,0,1)
	I=0
	S=0
	While I*22<Len(Say$)
		If S=3 Then
			S=0
			Forwaitkey()
			Showpic(-1,G_Sayboxpic,Say_X,Say_Y,197,63,0,0,1)
		End If
		Printstr(Mid$(Say$,I*22,22),Ix,Iy+S*16,0,0)
		I=I+1
		S=S+1
	Wend
	Say_Over:
	Forwaitkey()
	Msdelay(200)
	Flippage(G_Page_Sundry)
End Sub


'===============================================================================
'函数名：Show(Page,Filen$,Loadn,X,Y)
'说明：	相当于直接从资源库内显示图片,缩短程序耗时,Page为显示到的页面
'输入：Page要显示到的页面,Filen$图片资源文件名称,Loadn图片id,X,Y要显示到的位置
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
Function Show(Page,Filen$,Loadn,X,Y)
Pic=Loadres(Filen$,Loadn)
Wid=Getpicwid(Pic)
Hgt=Getpichgt(Pic)
Showpic(Page,Pic,X,Y,Wid,Hgt,0,0,1)
Freeres(Pic)
End Function

'===============================================================================
'函数名：If2(N)
'说明： 事件判断
'输入：N
'输出： 
'返回： 有事件时返回1  无事件时返回0
'备注：
'      修改记录：2007.12.10 Smokeboy
'===============================================================================
Function If2(N)
 Dim Shared If2_I,If2_O,If2_P
 If2_P = N Mod 31
 If2_I = G_Event((N - If2_P)/31)
 '----------------处理高位------------------------
 If2_O = 30
  While If2_O > If2_P
   If If2_I >= G_Event_Num(If2_O) Then If2_I = If2_I - G_Event_Num(If2_O)
   If2_O =If2_O - 1
  Wend
 If2_Q = If2_I '保留处理高位后的值
 '------------------------------------------------

 If If2_I >= G_Event_Num(If2_P) Then If2_I = If2_I - G_Event_Num(If2_P)  '得出低位的值
 If2_I = If2_Q - If2_I
 If If2_I = G_Event_Num(If2_P) Then
  If2 = 1
 Else
  If2 = 0
 End If
End Function
'===============================================================================
'函数名：Setevent(N)
'说明： 设置事件 N 为 1
'输入： N：要设置的事件号
'输出： 
'返回： 
'备注：
'      修改记录：2007.12.10 Smokeboy
'===============================================================================
Function Setevent(N)
 Dim Shared Setevent_N
 Setevent_N = (N - N Mod 31) / 31
 If If2(N) = 0 Then G_Event(Setevent_N) = G_Event(Setevent_N) + G_Event_Num(N Mod 31 )
End Function

'===============================================================================
'函数名：Clrevent(N)
'说明： 清除事件号 N  为 0
'输入： N：要清除的事件号
'输出： 
'返回： 
'备注：                '      修改记录：2007.12.10 Smokeboy
'===============================================================================
Function Clrevent(N)
 Dim Shared Clrevent_N
 Clrevent_N = (N - N Mod 31) / 31
 If If2(N) = 1 Then G_Event(Clrevent_N) = G_Event(Clrevent_N) - G_Event_Num(N Mod 31 )
End Function

'===============================================================================
'主程序
'===============================================================================
Main()
'===============================================================================
'data区
'===============================================================================

'===============================================================================
'函数名：
'说明：	
'输入：
'输出：	
'返回：	
'备注：
'修改记录：
'===============================================================================
