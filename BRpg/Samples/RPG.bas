'===============================================================================
'							Bb-Rpgģ��
'							By����
'===============================================================================
'===============================================================================
'����
'===============================================================================
Const Hei=&H000000'��ɫ����-��
Const Bai=&Hffffff'��ɫ����-��
Const Hui1=&H555555'��ɫ����-���
Const Hui2=&Haaaaaa'��ɫ����-ǳ��
Const Face_Down = 0'npc����-��
Const Face_Left = 1'npc����-��
Const Face_Right = 2'npc����-��
Const Face_Up = 3'npc����-��
Const Npc_Wid = 32'npc��ͼƬƴ��-��
Const Npc_Hgt = 48'npc��ͼƬƴ��-��
Const Tile_Wid = 32'��ͼ��ͼƬƴ��-��
Const Tile_Hgt = 32'��ͼ��ͼƬƴ��-��
Const Npc_Stay=0'npcվ������
Const Npc_Round=1'npcѲ��
Const True=1'yes
Const False=0'no
Const Respath="����˵\"
Const Picsay_Id=27
Const Say_X=21'say�����Ի���x����
Const Say_Y=97'say�����Ի���y����
Const Saycap_X=0'say����ͷ��x����
Const Saycap_Y=0'say����ͷ��y����
Const Lcd_Jx=0'���ݹ���x����
Const Lcd_Jy=0'���ݹ���y����
Const Lcd_Wid=240'ģ������Ļ��
Const Lcd_Hgt=160'ģ������Ļ��
Const Actcasex=3'������
Const Actcasey=3'������

'===============================================================================
'ȫ�ֱ���
'===============================================================================
'�Ż���
Dim g_sj1,g_sj2,g_sj3,g_sj4
'��ұ���
Dim G_Actname$(3)
Dim G_Acthp(3),G_Actmp(3)'��ɫ����
Dim G_Acthpmax(3),G_Actmpmax(3)
Dim G_Actdj(3)'��ɫ�ȼ�
Dim G_Actjq,G_Actpicid
Dim G_Actgj(3),G_Actfy(3),G_Actmj(3),G_Actfs(3),G_Actmf(3,100)
Dim G_Actgjkg(3),G_Actjy(3),G_Actjymax(3),G_Actxy(3)'��Ե
Dim G_Sld(3)'���Ե�
Dim g_actzbtd(3),g_actzbsc(3),g_actzbsc(3),g_actzbjc
Dim G_Actfightpic(3),G_Actwps,G_Actwp(100)
Dim G_Maplayer0(80,80)'��ͼ����(˫���ͼ)
Dim G_Maplayer1(80,80)'��ͼ����(˫���ͼ)
Dim G_Mapw,G_Maph'��ͼ��,��
Dim G_Npcx(21),G_Npcy(21)'npc����
Dim G_Npcid(21)	'npc��Դid
Dim G_Npcpic(21)'npcͼƬ
Dim G_Event_Num(31)'Ϊ�˼��ټ�����
Dim G_Event(50)'31*50-1 һ�������ֽ��31��2���Ʊ���
Dim G_Npcface(21)'npc������
Dim G_Npcorstay(21)'�Ƿ������npc�����˶�
'ͼ�����
Dim G_Page_Map'���ڴ洢��ͼͼ��
Dim G_Page_Sundry'���ڴ洢����ͼ��
Dim G_Page_Sundry2'���ڴ洢����ͼ��
Dim G_Lib$'���ڴ洢ͼƬ��Դ·��
Dim G_XYBoxpic'�����������
Dim G_Sayboxpic
Dim G_Maptitlepic'��ͼͼƬ��Դ
Dim G_Pline'mapͼƬ��Դ��/Title_Wid
Dim G_Mappiconoff'�����ж��Ƿ����������mapͼƬ��Դ
Dim G_Npctaxis(21)'����ð�ݷ����򳡾��е�npc������
Dim G_Npcdaihao'�����е�npc����
Dim G_Npccount'�����е�npc����
Dim G_Npcstep(21)'npc����Ų�
Dim G_Npcw(21),G_Npch(21)'npcͼƬ���
Dim G_Npcmode(21)
Dim G_Message'���ڴ��ݳ���ʱ����Ϣ
Dim G_Mapx,G_Mapy'���ݵ�ͼ��ʾ��ʼλ��
Dim G_Npcrundelay'npc�Զ��ж���ʱ
Dim G_Npcrunstart'��ʼ��ʱ��
Dim G_Actrundelay'����������ʱ
Dim G_Fightbackpic
Dim G_Res$'ͼƬ��Դ��׺
Dim G_Boxpic'����
Dim G_Numberpic'����
Dim G_Djname$(100),G_Djleixing(100)'��������
Dim G_Dj1(100),G_Dj2(100),G_Dj3(100)
Dim G_Djpicid(100)
Dim G_Djms$(100)
Dim G_Mfname$(100)'ħ������
Dim G_Mffw(100),G_Mfleixing(100)
Dim G_Mfdhid(100)
Dim G_Mf1(100),G_Mf2(100),G_Mfms$(100)
Dim G_Drpicid(100),G_Drhp(100),G_Drmp(100)
Dim G_Drfy(100),G_Drgj(100),G_Drmj(100)'�������ݴ洢�������ڿ��ٷ���
Dim G_Drmfid(100)'����ħ��id
Dim G_Dhs(100),G_Dhe(100)'������ʼ֡ ��������֡
Dim G_Dhbx(100),G_Dhby(100)
Dim G_Actcount'��ɫ��Ŀ
Dim G_Mhpboxpic,G_Gameoverpic'
Dim G_Ftmenupic,G_Jtpic'ս���˵�
Dim G_Ftid(3)'�����ڵ��������е�id
Dim G_Fthp(3),G_Ftmp(3),G_Ftmj(3),G_Ftmf(3)'��������
Dim G_Ftpic(3)'����ͼƬ����
Dim G_Ftfy(3),G_Ftgj(3)
Dim G_Ftcount'ս�����˸���
Dim G_Ftgrow(3)'�����жϵ�������
Dim G_Ftgjkg(3)
Dim G_Ftx,G_Fty'ս��ƫ����
Dim G_Actftx,G_Actfty
Dim G_Ftpx,G_Actpx,G_Actpy
Dim G_Cactdjs,G_Cactdj(100)
Dim G_Cho(3),G_Chox(3),G_Choxx(3),G_Fightmode
Dim G_Actwpsl(100)
Dim G_Fightover'0ս��1��������2��ɫ����3����
Dim G_Tmap'�Ƿ��Զ�������ͼ����������������
Dim G_Jp'��Ϸ������ת
Dim G_DelayKey'������ʱ���󰴼���Ӧʱ��
Dim G_Delaykeyx'�����ӳ����󰴼���Ӧʱ��
'===============================================================================
'�ӳ�ʽ����
'===============================================================================
Declare Sub Forwaitkey()'�ȴ��������ⰴ��(���waitkey����һ���͹���bug���޷���ֵ)
Declare Function Show(Page,Filen$,Loadn,X,Y)'�൱��ֱ�Ӵ���Դ������ʾͼƬ,���̳����ʱ,PageΪ��ʾ����ҳ��,X,YҪ��ʾ����λ��
Declare Sub Showgut(Picid)'��ʾ��Ϸ��
Declare Sub Printnext(Text$,Chang,X,Y)'��ָ��λ���ٷſ��ڴ�ӡ�ַ���
Declare Function If2(N)'�ж��¼�
Declare Function Setevent(N)'�����¼�
Declare Function Clrevent(N)'�¼���0
Declare Function Show(Page,Filen$,Loadn,X,Y)'�൱��ֱ�Ӵ���Դ������ʾͼƬ,���̳����ʱ,PageΪ��ʾ����ҳ��,X,YҪ��ʾ����λ��
Declare Sub Say(Picid,Say$)'�Ի�����
Declare Function Showmap(X,Y)'��ʾָ������ĵ�ͼ
Declare Sub Drawmap(X,Y)'����ͼ���ֵĻ���g_Page_Mapҳ����ȥ
Declare Function Maopaopaixu()'ð�ݷ�����npc������
Declare Sub Createnpc(Picid,X,Y,Chushiface,Step,Orstay)'����һ��npc����
Declare Sub Drawnpc(Pic,Page,X,Y,Face,Stepx)'��һ��npc����ָ��ҳ���ָ��λ��
Declare Sub Getkey()'��ȡ��Ϸ���ư���
Declare Sub Drivemap()'���ݵ�ͼ
Declare Sub Ggactorxy(X,Y)'���Ľ�ɫ�ڵ�ͼ��λ�õ�x��Y��
Declare Sub Checkmap(X,Y,Mode)'����ͼ����Ϊ��ֵ���Ǹ�ֵ
Declare Sub Npcsport()'npc�˶�
Declare Sub Checknpc(X,Y)'���x��Y���Ƿ���npc����
Declare Sub Checkyiru(X,Y)'���x��Y���ĵ�ͼ���Ƿ��������
Declare Sub Dnpcsport(D)'����npc�ƶ�����
Declare Sub Createbox(X,Y,Mode,Onoff)'����һ������
Declare Sub Setmap1(X,Y,Mode,Cost)'�����ϲ��ͼ
Declare Sub Setmap0(X,Y,Mode)'�����²��ͼ
Declare Sub Fastshow(Page,Res$,Picid,X,Y,W,H,Dx,Dy)'������ʾָ��ͼƬ
Declare Sub Setfightback(Picid)'����ս������ͼƬ
Declare Sub Shownumber(Page,Num,X,Y)'��ʾ���ֵ�ָ��λ��
Declare Sub Loaddrpic()'�������ͼƬ��Դ
Declare Sub Showanyfight()'ˢ������ս������
Declare Sub Playmf(Id,X,Y)'����ħ��
Declare Sub Gameinit()'��ʼ��������Ϸʱ
Declare Sub Getdr()'�������������������
Declare Sub Actfightxy(Id,Drid)'��ɫ������������
Declare Sub Drfightxy(Id,Actid)'���˹�����������
Declare Sub Showmf(Mfid,Mfmode,Ftid,Mode,Bx,By)'����ħ������
Declare Sub Mfbox(Actid)'ħ������
Declare Sub Msgbox(Text$)'��Ϣ����
Declare Sub Djbox()'���ߺ���
Declare Sub Copyactdj()'���ƽ�ɫ���߷���
Declare Sub Delotherdj(Leixing)'ɾ��������ָ����������������е���
Declare Sub Fight(Orge$,Mode)'ս������
Declare Sub Freedrpic()'�ͷŵ���ͼƬ��Դ
Declare Sub Fightmenu(Actid)'ս���˵�
Declare Sub Fight_Dc()'ս���ײ����
Declare Sub Actback()'ս����������
Declare Sub Fight_Xchoose(Choose,Actid)'ս���ײ�ѡ����
Declare Sub Fight_Dxchoose(Mode)'ս������ѡ����
Declare Sub Fight_Choose()'ս��ѡ����
Declare Sub Runaway()'���ܺ���
Declare Sub Yesno(A$,B$)'ѡ����
Declare Sub Hcopyactdj()'�ؿ���ɫ����
Declare Sub Fight_Wpchoosebox(Actid)'ս����Ʒѡ����
Declare Sub Delactwp(Wpid,Sl)'ɾ����ɫ��Ʒ
Declare Sub Checkactwp(Wpid)'����ɫ��Ʒ
Declare Sub Fight_Mfchoose(Actid)'ս��ħ������
Declare Sub Fight_Choosecl()'ս��ѡ����
Declare Sub Fight_Gjcl(Actid)'��ɫս����������
Declare Sub Fight_Mfcl(Actid)'��ɫս��ħ������
Declare Sub Fight_Actmfdz(Actid)'��ɫ�ŷ���������
Declare Sub Checkactover()'����ɫ�Ƿ�ȫ������
Declare Sub Checkftover()'�������Ƿ�ȫ������
Declare Sub Checkftgrow()'�������������
Declare Sub Showftnumber(Num1,Num2,Num3,Ftid,Fwmode,Mode)'��ʾս������
Declare Sub Checkft()'�������Ƿ���������������ĵ���
Declare Sub Checkactmax()'����ɫhp Mp�Ƿ񳬹����ֵ
Declare Sub Playpydh()'����ƮҶ����
Declare Sub Playgcdh()'���Ź�������
Declare Sub Showgamename()'��ʾ��Ϸ����
Declare Sub Gamestart()'��Ϸ��ʼ����
Declare Sub Mainmenu()'���˵�
Declare Sub Printstr(Text$,X,Y,Mode,Hang)'��ָ����ʽ��ӡ�ַ���
Declare Sub Newgamedh()'����Ϸ��ʼ����
Declare Sub Csnewgame()'��ʼ������Ϸ
Declare Sub Script(Jp)'��Ϸ�ű�
Declare Sub Loadmap(Mapname$,Picid)'��ȡ��ͼ
Declare Sub Startmenu()'���˵�����
Declare Sub Showload()'��ʾloadͼƬ
Declare Sub Fightover()'ս����������
Declare Sub Drmf(Ftid,Cs)'����ħ������
Declare Sub Gamefight(A$,B$,Jq,Jy,Mode)'ս������
Declare Sub Sjcl()'��������
Declare Sub Npczxact(Npcid)'npcת���ɫ
Declare Sub Showactxymap()'��ʾ��ɫ��Χ��ͼ
Declare Sub Savegame(Path$)'�洢��Ϸ
Declare Sub Readgame(Path$)'��ȡ��Ϸ
Declare Sub Choose3x1(A$,B$,C$)'3ѡ1
Declare Sub Zhizuoqunzu()'����Ⱥ��
Declare Sub Shezhiyouxi()'������Ϸ
Declare Sub Drptgj(Ftid,Cs)'������ͨ��������
Declare Sub Escmenu()'�˳��˵�
Declare Sub Ztbox(Actid)'״̬����
Declare Sub Zbbox(Actid)'װ������
Declare Sub Wpbox(Id)'��Ʒ���ӵ���ǿ�����ڵ����̷�
Declare Sub Fsbox(Actid,Id)'ħ�����ӵ���ǿ��
Declare Sub Sysbox()'ϵͳ����
Declare Sub Delallnpc(Mode)'ɾ������npc��������
Declare Sub Escmenucl()'esc�˵�����
Declare Sub Ztboxcl()'״̬�˵�����
Declare Sub Zbboxcl()'װ���˵�����
Declare Sub Wpboxcl()'��Ʒ�˵�����
Declare Sub Sysboxcl()'ϵͳ�˵�����
Declare Sub Createactor(Picid,Face,Step,X,Y)'��������
Declare Sub ChooseAct()'�����н�ɫ��ѡ��һ��������
Declare Sub AddActdJ(djid,s)'���ӽ�ɫ����
Declare Sub ReadBox()'��ȡ����
Declare Sub Savebox()'�������
Declare Sub Getkey2()'Ϊʹ��ӡ�ַ������ӳٵ�����
Declare Sub Main()'��������
'===============================================================================
'��������Main()
'˵����	��������
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
'===============================================================================
Sub Main()
	Gamestart()
End Sub

'===============================================================================
'��������Script(Jp)
'˵����	�ű�����
'���룺Jp���𳡾���ת
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
'===============================================================================
Sub Script(Jp)
	Dim Lin,Over,Npcid(20),lin
	Createactor(g_actPicid,g_npcFace(0),g_npcStep(0),g_npcx(0),g_npcY(0))'������ɫ
	if JP=0 then
		goto JP0
	else if JP=1 then
		goto JP1
	else if jp=2 then
		goto jp2
	end if
JP0:
	Fillpage(-1,0,0,240,160,0)
	Say(0,"��ҹ12��")
	Say(2,"�νܣ���ҵ�öడ�������ڻ�û��д�ꡣ")
	Say(3,"�νܣ�����ȥ�Ŵ����Ǿ�û����ҵ�ˡ�")
	Say(0,"����һ�ᡣ��������������������������")
	Say(3,"�νܣ�������������˯���ˡ���")
	Say(9,"İ���ˣ��ֵ����ѡ�")
	Say(3,"�νܣ�������ȥѧ���𣿣��Ժ��С�������")
	Say(8,"İ���ˣ��ֵ����ѣ���˯�����ǿ�ջ�ſڣ��һᱻ�ϰ���ģ���˵��ʹ��ҡ���νܣ�")
	Say(4,"�νܣ���ʲô������������˭��ô���Ҽҡ�")
	Say(12,"İ���ˣ������˸ò����Ƿ��Ӱɡ���")
	Say(11,"İ���ˣ�Ŷ��ԭ����־�����Ұ��������˶�˵���ӷ��������ҧ�˵ģ���ñ���������")
	Say(2,"�νܣ���������ô˯���˴���ϣ������İ�����ôû�������ѵ������ǹŴ���")
	Say(12,"İ���ˣ������͵ķ��Ӱ�����")
	Say(13,"İ���ˣ���˵�������������׼ȷ��˵�������ִ��������˲��Ĳ��ᡣ�Ŵ�����ȥ�ˣ��⵱Ȼ���ִ�����")
	Say(6,"�νܣ�����һ��һľ�����ǹŴ��ķ���찡���������Ŵ��������������ڿ��Բ���д��ҵ�ˣ�")
	Say(16,"İ���ˣ��鷳��λ���Ŵ��ˡ���ȥ��ȥ�����ǻ�ҪӪҵ���㵲ס���ǿ�ջ�ſ��ˡ�")
	Say(6,"�νܣ�Ŷ���������ߣ�˳������һ�£�������ʲô������")
	Say(16,"İ���ˣ�̫ƽ��2010�ꡣ���ⶼ��֪������������ˣ���")
	Say(2,"�νܣ�����Ϥ����ݣ�����ò����ѧ����ѧ��ʷ��û�����ݡ���������������������ʷ֪ʶ�۳ҹŴ��ǲ������ˡ���")
	Say(0,"����������ߣ���Ȼ���ǻ������������ˡ�")
	Say(11,"İ���ˣ�С�ֵܣ��㿴�����ϰ嶼�����ˣ��㻹���߰ɣ�")
	Say(6,"�νܣ��ðɣ�������ߡ�")
	Say(6,"�νܣ��Ĵ�ȥתת��ʶ���»�����")
	GgActorxy(6,4)
JP1:
	Showload()
	g_jp=1
	loadmap("������",22)
	Setmap1(0,3,0,1)'���������¼�:1����
	Setmap1(0,4,0,2)'���������¼�:2����
	Setmap1(6,3,0,3)'���������¼�:3�Ƶ�
	Setmap1(7,3,0,4)'���������¼�:4�Ƶ�
	Setmap1(19,5,0,5)'���������¼�:5��ɽ
	Createnpc(13,15,5,Face_down,0,NPC_Round)'����NPC:1
	Createnpc(12,6,13,Face_down,0,NPC_Round)'����NPC:2
	Createnpc(15,2,14,Face_down,0,NPC_Stay)'����NPC:3˵����
	Createnpc(17,1,14,Face_right,0,NPC_Stay)'����NPC:4
	Createnpc(18,3,14,Face_left,0,NPC_Stay)'����NPC:5
JP1GO:
	drivemap()'����NPC���¼�ͼ�����ֹ�����ñ�����ȡCreatenpc�ķ���ֵ
	'��G_message���ڸ÷���ֵ��ִ�иÿ��ڵĲ���
	'ͼ���¼��Ǹ���Setmap1���Ĳ������ж����ĸ�ͼ���
	'�����÷���ֵ
	'������д����ΪNPCֻ��һ��ͼ���¼�ֻ��2��
	'�Լ��ܼ��������ķ���ֵ
	if g_message=1 then
		Say(0,"̫�����ˣ�����")
		Say(0,"�������ź�ɽ�󺰴�е���")
		Say(2,"������ô�ˣ���ô����캰�����ˡ�")
		Say(6,"�����ź�ɽ���еģ��ѵ�˵��ɽ��ʲô���£���ȥ������")
		SetEvent(0)
		goto jp1go
	else if g_Message=2 then
		Npczxact(2)
		Say(0,"��˵�и�˵�����˵�Ĳ�����ȥ������")
		goto jp1go
	else if g_message<0 and g_message>-3 then
		Say(6,"��������תת�ɣ�")
		goto jp1go
	else if g_message=-5 then
		if if2(0) then
			'goto jp2
		else
		Say(6,"��������תת�ɣ�")			
		end if
		goto jp1go
	else
		say(6,"ȥ������ʲô��")
		goto jp1go
	end if
JP2:
	ShowLoad()
	G_JP=2
	Loadmap("���",21)
JP2GO:
	Drivemap()
TheGameisEnd:
	End
End Sub


'===============================================================================
'��������ChooseAct()
'˵���������н�ɫ��ѡ��һ��������
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
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
'��������Savebox()
'˵����	ϵͳ�˵�����
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
'===============================================================================
Sub Savebox()
	Dim Lin,Path$
Startsavegame:
	Fastshow(-1,Respath+"Sys"+G_Res$,11,0,0,240,160,0,0)
	Lin=Choose3x1("����֮Ե1","����֮Ե2","����֮Ե3")
	If Lin<>-1 Then
		Path$=Respath+"Save\����˵"+Lin+".Sav"
		Savegame(Path$)
		Msgbox("�洢�ɹ���")
	End If
	Savebox=Lin
End Sub
'===============================================================================
'��������Sysboxcl()
'˵����	ϵͳ�˵�����
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
'===============================================================================
Sub Sysboxcl()
	Dim Lin
	Lin=Sysbox()
	If Lin=0 Then'�洢��Ϸ
		Savebox()
	Else If Lin=1 Then'��ȡ��Ϸ
		Readbox()
	Else If Lin=2 Then'�˳���Ϸ
		Delallnpc(1)
		Startmenu()
	End If
End Sub



'===============================================================================
'��������Fsboxcl()
'˵����	
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
'===============================================================================
Sub Fsboxcl()
	Dim Lin,I,Cs,Mfid,Mffw,Mflx
	'����ӵ����ѡ��
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
	
	'����������ѡ��
	
	If Mflx=1 Then'ս���෨��
		msgbox("ս���в���ʹ�ã�")
		goto StartFs
	End If
	'Ч������
End Sub


'===============================================================================
'��������Wpboxcl()
'˵����	��Ʒ�˵�����
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
'===============================================================================
Sub Wpboxcl()
	Dim Lin,I,Cs,wpid,wplx
	Msdelay(100)
Startwp:
	Lin=Djbox()
	if lin<>-1 then
		'��ȡ��Ʒ��Ϣ
		wpid=g_actwp(lin)
		wplx=g_djleixing(wpid)
		'Ч������
		if wplx=1 then
			cs=ChooseAct()
			if cs=-1 then goto Startwp
			Say(20,"����ʹ����Ʒ������")
			Say(20,"�ߵ���ǰ�����ս����")
			delactwp(wpid,1)
		end if
	end if
End Sub

'===============================================================================
'��������Zbboxcl()
'˵����	װ���˵�����
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
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
'��������Ztboxcl()
'˵����	״̬�˵�����
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
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
'��������Escmenucl()
'˵����	Esc���˵�����
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
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
'��������Delallnpc(Mode)
'˵����	ɾ������npc
'���룺0���������� 1��������
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
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
'��������Sysbox()
'˵����	ϵͳ����
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
'===============================================================================
Sub Sysbox()
	Dim Lin
	Fastshow(-1,Respath+"Sys"+G_Res$,22,0,0,240,160,0,0)
	Lin=Choose3x1("�洢��Ϸ","��ȡ��Ϸ","�˳���Ϸ")
	Sysbox=Lin
End Sub

'===============================================================================
'��������Fsbox(Actid,Id)
'˵����	ħ�����ӵ���ǿ��
'���룺Id�����ͷָ��˳��id
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
'===============================================================================
Sub Fsbox(Actid,Id)
	Dim Over,Key
	Dim I,I2
	Dim Bpic,H1pic,H2pic,Jtpic
	Font(Font_16song)
	Color(0,0,0)
	If G_Actfs(Actid)=0 Then
		Msgbox("�㻹û��ѧ�ᷨ��!")
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
'��������Wpbox(Id)
'˵���� ���̺��̷�����Ʒ����	
'���룺Id�����ͷָ���˳��id
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
'===============================================================================
Sub Wpbox(Id)
	Dim Over,Key
	Dim I,I2
	Dim Bpic,H1pic,H2pic,Jtpic
	If G_Actwps=0 Then
		Msgbox("�㻹û���κ���Ʒ!")
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
'��������Zbbox(Actid)
'˵����	װ������
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
'===============================================================================
Sub Zbbox(Actid)
	Fastshow(-1,Respath+"Sys"+G_Res$,22,0,0,240,160,0,0)
	Font(Font_16song)
	Color(0,0,0)
	Pixlocate(60,20)
	Print "������"+G_Actname$(Actid)
	Pixlocate(60,40)
	Print "ͷ����"
	Pixlocate(60,60)
	Print "����"
	Pixlocate(60,80)
	Print "�ֳ֣�"
	Pixlocate(60,100)
	Print "�Ŵ���"
	forwaitkey()
End Sub



'===============================================================================
'��������Ztbox(Actid)
'˵����	״̬����
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
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
			Print "������"+G_Actname$(Actid)
			Pixlocate(60,36)
			Print "�ȼ���"+G_Actdj(Actid)
			Pixlocate(60,52)
			Print "������"+G_Acthp(Actid)+"/"+G_Acthpmax(Actid)
			Pixlocate(60,68)
			Print "������"+G_Actmp(Actid)+"/"+G_Actmpmax(Actid)
			Pixlocate(60,84)
			Print "������"+G_Actgj(Actid)
			Pixlocate(60,100)
			Print "������"+G_Actfy(Actid)
			Pixlocate(60,116)
			Print "����"+G_Actmj(Actid)
			Pixlocate(60,132)
			Print "��Ե��"+G_Actxy(Actid)
		Else If Key=Key_Down Then
			Showpic(-1,Pic,0,0,240,160,0,0,1)
			Pixlocate(60,20)
			Print "���ߣ�"+"��"
			Pixlocate(60,36)
			Print "���飺"+G_Actjy(Actid)+"/"+G_Actjymax(Actid)
		Else If Key=27 Or Key=13 Then
			Over=1
		End If
	Wend
End Sub

'===============================================================================
'��������Escmenu()
'˵����	�˳��˵�
'���룺
'�����	
'���أ�	ѡ�����
'��ע��
'�޸ļ�¼��
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
'��������Drptgj(Ftid,Cs)
'˵����	
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
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
'��������Shezhiyouxi()
'˵����	������Ϸ
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
'===============================================================================
Sub Shezhiyouxi()
	Fastshow(-1,Respath+"Sys"+G_Res$,28,0,0,240,160,0,0)
	Msdelay(200)
	Forwaitkey()
	Msdelay(200)
End Sub


'===============================================================================
'��������Zhizuoqunzu()
'˵����	����Ⱥ��
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
'===============================================================================
Sub Zhizuoqunzu()
	Dim I,Text$(12)
	Font(Font_16song)
	Color(&Hffffff,0,0)
	Text$(0)="��Ϸ���"
	Text$(1)="����"
	Text$(2)="��Ϸ������"
	Text$(3)="�ɽ�������֮˫"
	Text$(4)="����˵"
	Text$(5)="��ϷͼƬ"
	Text$(6)="��������"
	Text$(7)="��л"
	Text$(8)="������Ե����"
	Text$(9)="����"
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
'��������Readbox()
'˵����	��ȡ����
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
'===============================================================================
Sub Readbox()
	Dim Lin,Path$
Startreadgame:
	Msdelay(200)
	Fastshow(-1,Respath+"Sys"+G_Res$,11,0,0,240,160,0,0)
	Lin=Choose3x1("ǰ��֮Ե1","ǰ��֮Ե2","ǰ��֮Ե3")
	If Lin<>-1 Then
		Path$=Respath+"Save\����˵"+Lin+".Sav"
		Open Path$ For Binary As#1
		If Lof(1)=0 Then
			Msgbox("��δ�ڸ�λ�洢��Ϸ��")
			Close#1
			Goto Startreadgame
		End If
		Close#1
		Readgame(Respath+"Save\����˵"+Lin+".Sav")
		Delallnpc(1)
		Script(G_Jp)'����ű�
	End If
	Readbox=Lin
End Sub

'===============================================================================
'��������Choose3x1(A$,B$,C$)
'˵����	
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
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
'��������Readgame(Path$)
'˵����	��ȡ��Ϸ
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
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
	While I<3'��ɫ���Դ洢
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
'��������Savegame(Path$)
'˵����	�洢��Ϸ
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
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
	Puts=G_Jp+20'��Ϸ�����洢
	Put#1,Puts
	I=0
	While I<50
		Put#1,G_Event(I)
		I=I+1
	Wend
	I=0
	While I<3'��ɫ���Դ洢
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
'��������Createactor(Picid,Face,Step,X,Y)
'˵����	��������
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
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
'��������Showactxymap()
'˵����	��ʾ��ɫ��Χ��ͼ
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
'===============================================================================
Sub Showactxymap()
	Showmap(G_Npcx(0)-3,G_Npcy(0)-2)
End Sub

'===============================================================================
'��������Npczxact(Npcid)
'˵����	Npc�Զ�ת���ɫ
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
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
'��������Sjcl()
'˵����	��������
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
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
			Msgbox(G_Actname$(I)+"�����ˣ�")
			Fastshow(-1,Respath+"Sys"+G_Res$,31,0,0,240,160,0,0)
			Forwaitkey()
			If G_Actjy(I)>G_Actjymax(I) Then Goto Sjks
		End If
		I=I+1
	Wend
End Sub


'===============================================================================
'��������Addactdj(Djid,S)
'˵�������ӽ�ɫ����	
'���룺DjidҪ���ӵĵ���id S��������
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
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
'��������Gamefight(A$,B$,Jq,Jy,Mode)
'˵����	
'���룺A$ս������ B$ս��ʤ������ Modeģʽ 0��ͨս�� 1����ս��
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
'===============================================================================
Sub Gamefight(A$,B$,Jq,Jy,Mode)
	Dim Ins,I
	
	Fight(A$,Mode)
	
	If G_Fightover=1 Then
		Msgbox("ս��ʤ����")
		Ins=Len(B$)/3
		I=0
		While I<Ins
			Addactdj(Val(Mid$(B$,I*3,2)),Val(Mid$(B$,I*3+2,1)))
			Msgbox("���"+G_Djname$(Val(Mid$(B$,I*3,2)))+"*"+Val(Mid$(B$,I*3+2,1)))
			I=I+1
		Wend
		If Jq<>0 Then
			G_Actjq=G_Actjq+Jq
			Msgbox("��ý�Ǯ��"+Jq)
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
'��������Startmenu()
'˵����	��ʼ�˵�����
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
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
'��������Showload()
'˵����	��ʾ��Ϸ��ȡ��
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
'===============================================================================
Sub Showload()
	Fastshow(-1,Respath+"Sys"+G_Res$,26,0,0,240,160,0,0)
End Sub

'===============================================================================
'��������Csnewgame()
'˵����	��ʼ������Ϸ
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
'===============================================================================
Sub Csnewgame()
	'��ʼ�����Ʋ�Ȼ������
	G_Actname$(0)=""
	G_Actname$(1)=""
	G_Actname$(2)=""
	'��ʼ����ɫ����
	G_Actcount=1
	G_Actname$(0)="����"
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
	'��ͼ�������
	G_Tmap=0'���ò��Զ�������ͼ����
	G_Jp=0'��Ϸ��������
	G_Npccount=1'��ʼ��npc����
	g_actpicid=27
	g_npcx(0)=8
	g_npcy(0)=6
	g_npcface(0)=Face_up
	g_npcstep(0)=0
End Sub



'===============================================================================
'��������Printstr(Str$,X,Y,Mode,Hang)
'˵����	��ָ��ģʽ��ӡ�ַ���
'���룺Mode 0Ϊ���԰���enter���Լӿ��ӡ�ٶ� 1Ϊ���ɰ���enter���Լӿ��ӡ�ٶ�
'hang 0Ϊ�����ӡ 1Ϊ�����ӡ,��ʹ��ȫ���ַ���������,����ӡ16*16�ַ�
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
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
'��������Newgamedh()
'˵����	����Ϸ��ʼ����
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
'===============================================================================
Sub Newgamedh()
	Dim Text$
	Playpydh()
	Font(Font_16song)
	Color(&Hffffff,0,0)
	Fillpage(-1,0,0,240,160,0)
	Text$="�����Ѿ�������������ǧ��"
	Printstr(Text$,(Lcd_Wid-Len(Text$)*8)/2,(Lcd_Hgt-16)/2,0,0)
	Forwaitkey()
	Fillpage(-1,0,0,240,160,0)
	Text$="�ѵ����޷�������"
	Printstr(Text$,(Lcd_Wid-Len(Text$)*8)/2,(Lcd_Hgt-16)/2,0,0)
	Forwaitkey()
	Fillpage(-1,0,0,240,160,0)
	Text$="û�о�ͷ��"
	Printstr(Text$,(Lcd_Wid-Len(Text$)*8)/2,(Lcd_Hgt-16)/2,0,0)
	Forwaitkey()
	Fillpage(-1,0,0,240,160,0)
	Text$="��Ӧ�����"
	Printstr(Text$,(Lcd_Wid-Len(Text$)*8)/2,(Lcd_Hgt-16)/2,1,0)
	Forwaitkey()
	Fillpage(-1,0,0,240,160,0)
	Text$="��������ǵ�������������"
	Printstr(Text$,(Lcd_Wid-Len(Text$)*8)/2,(Lcd_Hgt-16)/2,0,0)
	Forwaitkey()
	Fillpage(-1,0,0,240,160,0)
	Text$="���Ǳ���һ��"
	Printstr(Text$,(Lcd_Wid-Len(Text$)*8)/2,(Lcd_Hgt-16)/2,0,0)
	Forwaitkey()
	Fillpage(-1,0,0,240,160,0)
	Text$="ΪʲôҪΪ����������һ��Ϊ��"
	Printstr(Text$,(Lcd_Wid-Len(Text$)*8)/2,(Lcd_Hgt-16)/2,0,0)
	Forwaitkey()
	Fillpage(-1,0,0,240,160,0)
	Text$="������ֹ���Ķ���ȥ�أ�"
	Printstr(Text$,(Lcd_Wid-Len(Text$)*8)/2,(Lcd_Hgt-16)/2,0,0)
	Forwaitkey()
	Fillpage(-1,0,0,240,160,0)
	Text$="�����֪����"
	Printstr(Text$,(Lcd_Wid-Len(Text$)*8)/2,(Lcd_Hgt-16)/2,0,0)
	Forwaitkey()
	Fillpage(-1,0,0,240,160,0)
	Text$="û��"
	Printstr(Text$,(Lcd_Wid-Len(Text$)*8)/2,(Lcd_Hgt-16)/2,0,0)
	Forwaitkey()
	Fillpage(-1,0,0,240,160,0)
	Text$="�Ҳ���������û��û�˵ľ�����"
	Printstr(Text$,(Lcd_Wid-Len(Text$)*8)/2,(Lcd_Hgt-16)/2,0,0)
	Text$="ȥ"
	Printstr(Text$,(Lcd_Wid-Len(Text$)*8)/2,((Lcd_Hgt-16)/2)+16,0,0)
	Forwaitkey()
	Fillpage(-1,0,0,240,160,0)
	Text$="�Ǻã����������������"
	Printstr(Text$,(Lcd_Wid-Len(Text$)*8)/2,(Lcd_Hgt-16)/2,0,0)
	Forwaitkey()
	Playpydh()
End Sub


'===============================================================================
'��������Mainmenu()
'˵����	���˵�
'���룺
'�����	
'���أ���������ѡ��	-1Ϊ��ѡ�� �������˳���
'��ע��
'�޸ļ�¼��
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
			Over=1'�����˵�
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
'��������Gamestart()
'˵����	��Ϸ��ʼ����
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
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
'��������Showgamename()
'˵����	��ʾ��Ϸ����
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
'===============================================================================
Sub Showgamename()
	Fastshow(-1,Respath+"Sys"+G_Res$,8,0,0,240,160,0,0)
	Msdelay(100)
End Sub


'===============================================================================
'��������Playgcdh()
'˵����	���Ź�������
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
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
'��������Playpydh()
'˵����	����ƮҶ����
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
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
'��������Fightover()
'˵����	ս��ʧ��
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
'===============================================================================
Sub Fightover()
	Dim I,Text$(12)
	Font(Font_16song)
	Color(&Hffffff,0,0)
	Text$(0)="���������羰��"
	Text$(1)="������ȥ������"
	Text$(2)="�������������"
	Text$(3)="ǧ����"
	Text$(4)="�������չ³Ǳ�"
	Text$(5)="�Ǿ�һ��������"
	Text$(6)="��Ȼδ�չ��޼�"
	Text$(7)="Ǽ������˪����"
	Text$(8)="�˲���"
	Text$(9)="�����׷�������"
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
'��������Drmf(Ftid,Mfid,Cs,Fw)
'˵����	����ħ������
'���룺Ftid����id Mfidħ��id Cs�������� Fw������Χ,Mode�Լ����ǶԵ�
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
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
		
		'��������
		If Mflx=1 Then'�����෨��
			Dw=0
			If Mffw=0 Then
				Ftnum(Cs)=G_Mf1(Mfid)+G_Ftmj(Ftid)
			End If
		End If
		
		
		Showmf(Mfdh,Mffw,Dw,Cs,Bx,By)
		Showftnumber(Ftnum(0),Ftnum(1),Ftnum(2),Cs,Mffw,Dw)
		
		'��������
		If Mflx=1 Then'�����෨��
			If Mffw=0 Then
				G_Acthp(Cs)=G_Acthp(Cs)-Ftnum(Cs)
			End If
		End If
		G_Ftx=0
		G_Fty=0
		G_Ftgjkg(Ftid)=0
End Sub

'===============================================================================
'��������Drai()
'˵���������Զ�����
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
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
'��������Checkactmax()
'˵����	����ɫhp Mp�Ƿ񳬹�����������������Ϊ����
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
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
'��������Ftwpcl(Actid)
'˵����	ս����Ʒ����
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
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
	If Wplx=2 Then'ҩ����Ʒ����
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
	
	'ͨ�ò���
	Checkft()
Endwp:
End Sub


'===============================================================================
'��������Showftnumber(Num1,Num2,Num3,Ftid,Fwmode,Mode)
'˵����	��ʾս��ʱ������
'���룺FtidҪ��ʾ����id Fwmode��ʾ��ʽ 0���� 1ȫ�� Mode 0���� 1�з�
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
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
'��������Checkft()
'˵����	�������Ƿ���������������ĵ���
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
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
'��������Checkactover()
'˵����	����ɫ�Ƿ�ȫ������
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
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
'��������Checkftover()
'˵����	�������Ƿ�ȫ������
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
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
'��������Checkftgrow()
'˵����	������״̬��hpΪ0�ĵ������
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
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
'��������Fight_Actmfdz(Actid)
'˵����	��ɫ�ŷ�����
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
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
'��������Fight_Mfcl(Actid)
'˵����	ս���ҷ�ħ������
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
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
	
	If Mflx=1 Then'�����෨������
		If Mffw=0 Then
			Showmf(Mfdh,0,Ftid,1,Bx,By)
			Ftnum=G_Mf1(Mfid)+Rnd(G_Actmj(Actid))
			G_Fthp(Ftid)=G_Fthp(Ftid)-Ftnum
			Showftnumber(Ftnum,Ftnum,Ftnum,Ftid,0,1)
		Else If Mffw=1 Then
		End If
		
		
	Else If Mflx=3 Then'ҩƷ�෨������
		If Mffw=0 Then
		Else If Mffw=1 Then
		End If
	End If
	
	'ͳһ����
	Checkft()
	Showanyfight()
	Flippage(G_Page_Sundry)
	Msdelay(100)
Endmf:
End Sub

'===============================================================================
'��������Fight_Gjcl(Actid)
'˵����	ս���ҷ���ͨ��������
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
'===============================================================================
Sub Fight_Gjcl(Actid)
	Dim Ftnum
	Dim I,Drx,Dry
	I=0
	While G_Ftgrow(G_Chox(Actid))=0'�����������������Զ�������������
		G_Chox(Actid)=I
		I=I+1
		If I=G_Ftcount Then I=0
	Wend
	Drx=20+G_Chox(Actid)*Getpicwid(G_Ftpic(G_Chox(Actid)))/2+5
	Dry=65-G_Chox(Actid)*15-10
	Actfightxy(Actid,G_Chox(Actid))
	If G_Actgj(Actid)>G_Ftfy(G_Chox(Actid)) Then'�Ʒ�
		Ftnum=G_Actgj(Actid)-G_Ftfy(G_Chox(Actid))+Rnd(G_Actmj(Actid))
	Else
		Ftnum=0
	End If
	Bitbltpage(G_Page_Sundry2,G_Page_Sundry)
	I=0
	Showftnumber(Ftnum,Ftnum,Ftnum,G_Chox(Actid),0,1)
	
	'������Ĵ���
	G_Fthp(G_Chox(Actid))=G_Fthp(G_Chox(Actid))-Ftnum
	Checkft()
	Showanyfight()'ˢ������ս������
	Flippage(G_Page_Sundry)
End Sub

'===============================================================================
'��������Fight_Choosecl()
'˵����	ս��ѡ����
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
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
'��������Fight_Mfchoose(Actid)
'˵����	ִ��ѡ�з�����Ĳ���
'���룺
'�����	
'���أ�-1û��ѡ�� ����ħ������	
'��ע��
'�޸ļ�¼��
'===============================================================================
Sub Fight_Mfchoose(Actid)
	Dim Lin,Lin2
	Lin=Mfbox(Actid)
	Msdelay(200)
	If Lin=-1 Then Goto Endmfchoose
	Lin2=G_Actmf(Actid,Lin)
	If G_Actmp(Actid)<=G_Mf2(Lin2) Then
		Msgbox("��ķ���ֵ����!")
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
'��������Checkactwp(Wpid)
'˵����	����ɫ�Ƿ���ָ����Ʒ
'���룺
'�����	
'���أ�	1�� 0��
'��ע��
'�޸ļ�¼��
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
'��������Delactwp(Wpid,Sl)
'˵����	ɾ��ָ����Ʒid����Ʒ
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
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
'��������Yesno(A$,B$)
'˵����	��ѡһ
'���룺
'�����-1û��ѡ 0ѡa$ 1ѡ B
'���أ�	
'��ע��
'�޸ļ�¼��
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
'��������Fight_Choose()
'˵����	����ս���˵�ѡ��
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
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
'��������Fight_Wpchoosebox(Actid)
'˵����	ս��ʱ����Ʒ����ѡ�����
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
'===============================================================================
Sub Fight_Wpchoosebox(Actid)
	Dim Lin,Lin2
	Lin=Yesno("ҩƷ","����")
	If Lin=-1 Then Goto Endfwp
	Copyactdj()
	If Lin=0 Then
		Delotherdj(2)'ɾ������ҩƷ������е���
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
'��������Hcopyactdj()
'˵����	��ԭ��ɫ����
'���룺
'�����	
'���أ�	
'��ע��

'�޸ļ�¼��
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
'��������Fight_Xchoose(Choose,Actid)
'˵����	ս���ײ�ѡ����
'���룺
'�����	
'���أ�ѡ����� -1ʱΪû��ѡ��	
'��ע��
'�޸ļ�¼��
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
'��������Fight_Dxchoose(Mode)
'˵����	ս������ѡ��
'���룺Mode 0Ϊѡ�񼺷� 1Ϊ�з�
'�����	
'���أ�	-1û��ѡ�� ����ѡ�еĴ���
'��ע��
'�޸ļ�¼��
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
'��������Fight_Dc()
'˵����	ս���ײ����
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
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
'��������Runaway()
'˵����	����
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
'===============================================================================
Sub Runaway()
	Dim Ftnum
	If G_Fightmode=0 Then
		If G_Actmj(0)>G_Ftmj(0) Then
			Ftnum=Rnd(100)
			If Ftnum<G_Actmj(0) Then
				Msgbox("���ܳɹ�!")
				Runaway=1
			Else
				Msgbox("����ʧ��!")
				Runaway=0
			End If
		End If
	Else If G_Fightmode=1 Then
		Msgbox("������Ч!")
		Runaway=0
	End If
End Sub
'===============================================================================
'��������Fightmenu(Actid)
'˵����	ս���˵�
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
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
	Shownumber(G_Page_Sundry,G_Acthp(Actid),W+23,Lcd_Hgt-H+22)'��ʾ��ǰhp
	Shownumber(G_Page_Sundry,G_Acthpmax(Actid),W+58,Lcd_Hgt-H+22)'��ʾ���hp
	Shownumber(G_Page_Sundry,G_Actmp(Actid),W+23,Lcd_Hgt-H+33)'��ʾ��ǰmp
	Shownumber(G_Page_Sundry,G_Actmpmax(Actid),W+58,Lcd_Hgt-H+33)'��ʾ���mp
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
			If Keypress(52) Then'ս��ʤ��
				G_Fightover=1
			Else If Keypress(53) Then'ս��ʧ��
				G_Fightover=2
			Else If Keypress(54) Then'���ܳɹ�
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
'��������Fight(Orge$,Mode)
'˵����	
'���룺Orge$ΪҪ��ս�Ĺ�������,ModeΪģʽ0����ս��1ս������������
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
'===============================================================================
Sub Fight(Orge$,Mode)
	Dim I,Ins
	G_Fightover=0'��ʼ��ս���������
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
'��������Freedrpic()
'˵����	�ͷŵ���ͼƬ��Դ
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
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
'��������Delotherdj(Leixing)
'˵����	ɾ��������ָ����������������е���
'���룺Leixing ָ���ĵ�������
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
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
		Ix=0'��ʼ�������±�
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
'��������Copyactdj()
'˵����	���ƽ�ɫ���߷���
'���룺
'�����G_Cactdjs G_Cactdj(100)	
'���أ�	
'��ע��
'�޸ļ�¼��
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
'��������Djbox()
'˵����	���ߺ���
'���룺
'�����	
'���أ���ѡ�е���Ʒ����	
'��ע��
'�޸ļ�¼��
'===============================================================================
Sub Djbox()
	Dim Over,Key
	Dim I,I2
	Dim Bpic,H1pic,H2pic,Jtpic
	If G_Actwps=0 Then
		Msgbox("�㻹û���κ���Ʒ!")
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
			Print"����:"+G_Actwpsl(I)
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
'��������Mfbox(Actid)
'˵����	ħ������
'���룺
'�����	
'���أ�����һ��ѡ�е�ħ������ -1 Ϊû��ѡ��
'��ע��
'�޸ļ�¼��
'===============================================================================S
Sub Mfbox(Actid)
	Dim Over,Key
	Dim I,I2
	Dim Bpic,H1pic,H2pic,Jtpic
	Font(Font_16song)
	Color(0,0,0)
	If G_Actfs(Actid)=0 Then
		Msgbox("�㻹û��ѧ�ᷨ��!")
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
'��������Showmf(Mfid,Mfmode,Ftid,Mode,Bx,By)
'˵������ָ����ɫ����ħ������	
'���룺Mfmode 0���� 1ȫ�� Mode 0���� 1�з� Bx Byƫ����
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
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
	Showanyfight()'���Ż���bitbltpage��������ػ�ȫ��
	Playmf(Mfid,Wx+Bx,Wy+By)
	Showanyfight()
	Flippage(G_Page_Sundry)
End Sub


'===============================================================================
'��������Drfightxy(Id,Actid)
'˵����	����ս��ƫ�ƿ���
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
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
'��������Actfightxy(Id,Drid)
'˵����	��ɫս��ƫ�ƿ���
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
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
'��������Loaddrpic()
'˵����	��������Ŀǰ��ս������ͼƬ��Դ
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
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
'��������Showanyfight()
'˵����	ˢ��ս�������е����ж���
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
'===============================================================================
Sub Showanyfight()
	Dim I,Drx,Dry,Drpx,Actx,Acty,Actpx,Actpy,W,H
	Showpic(G_Page_Sundry,G_Fightbackpic,0,0,Lcd_Wid,Lcd_Hgt,0,0,1)'ˢ��ս������
	I=0
	While I<G_Ftcount'ˢ�µ��˶���
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
	While I<G_Actcount'ˢ�½�ɫ����
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
'��������Playmf(Id,X,Y)
'˵����	����ħ��
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
'===============================================================================
Sub Playmf(Id,X,Y)
	Dim Max,Start
	Dim Pic
	Max=G_Dhe(Id)-G_Dhs(Id)+G_Dhs(Id)
	Start=G_Dhs(Id)
	While Start<Max
		Showanyfight()'���Ż�����bitbltpage����sundryҳ��
		Show(G_Page_Sundry,Respath+"Mf"+G_Res$,Start,X,Y)
		Flippage(G_Page_Sundry)
		Msdelay(100)
		Start=Start+1
	Wend
End Sub


'===============================================================================
'��������Getdr()
'˵����	�������ж�ȡ������Ϣ
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
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
'��������Msgbox(Str$)
'˵����	��ӡ��Ϣ����Ļ��
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
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
'��������Actback()
'˵����	��������
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
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
'��������Shownumber(Page,Num,X,Y)
'˵����	��ʾ���ֵ�ָ��λ��
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
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
'��������Sub Setfightback(Picid)'����ս������ͼƬ
'˵����	
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
'===============================================================================
Sub Setfightback(Picid)'����ս������ͼƬ
	G_Fbpicid=Picid
End Sub

'===============================================================================
'��������Fastshow(Page,Res$,Picid,X,Y,W,H,Dx,Dy)
'˵����	������ʾͼƬ��ָ��λ��
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
'===============================================================================
Sub Fastshow(Page,Res$,Picid,X,Y,W,H,Dx,Dy)
	Dim Page,Res$,Picid,X,Y,W,H,Dx,Dy,Pic
	Pic=Loadres(Res$,Picid)
	Showpic(Page,Pic,X,Y,W,H,Dx,Dy,1)
	Freeres(Pic)
End Sub


'===============================================================================
'��������Gameinit()
'˵����	��Ϸ���ݳ�ʼ��
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
'===============================================================================
Sub Gameinit()
 Dim I,Chang,Path$,Lin,Pos
'�����ж�
Setlcd(Lcd_Wid,Lcd_Hgt)'����ģ������С
If Getenv!()=Env_Sim Then
	G_Res$=".Rlb"
	G_Actrundelay=100'��ɫ������ʱ
	G_DelayKey=50'������ʱ���󰴼���Ӧʱ��
	G_Delaykeyx=100'�����ӳ����󰴼���Ӧʱ��	
Else
	G_Actrundelay=0'��ɫ������ʱ
	G_DelayKey=50'������ʱ���󰴼���Ӧʱ��
	G_Delaykeyx=100'�����ӳ����󰴼���Ӧʱ��
	G_Res$=".Lib"
End If
Fastshow(-1,Respath+"Sys"+G_Res$,26,0,0,240,160,0,0)
'����ͼ��ҳ
G_Page_Map=Createpage()'���ڴ洢��ͼͼ��
G_Page_Sundry=Createpage()'���ڴ洢����ͼ��
G_Page_Sundry2=Createpage()'���ڴ洢����ͼ��
'�����ƴ�����Ҫ�õ���,һ�㲻Ҫ�޸�����
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
 G_Event_Num(30) = 1073741824'����������ƴ����޹�
 
 G_Npcrundelay=1000'npc�Զ�������ʱ
 
 '����ϵͳͼƬ��Դ
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
 Setbkmode(1)'��������͸��
 G_Npccount=0'����npc����Ϊ0
End Sub

'===============================================================================
'��������Setmap1(X,Y,Mode,Cost)
'˵����	�����ϲ��ͼ��������
'���룺X,Yλ��,Mode 1Ϊ�� 0Ϊ�� CostΪҪ���õ�ֵ
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
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
'��������Setmap0(X,Y,Mode)
'˵����	���õײ��ͼ��������
'���룺X,Yλ��,Mode 1Ϊ�� 0Ϊ��
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
'===============================================================================
Sub Setmap0(X,Y,Mode)
	If Mode=0 Then
		G_Maplayer0(X,Y)=-1*Abs(G_Maplayer0(X,Y))
	Else If Mode=1 Then
		G_Maplayer0(X,Y)=Abs(G_Maplayer0(X,Y))
	End If
End Sub

'===============================================================================
'������:Entercheck()
'˵�������������Χ�Ƿ���npc���򷵻ظ�npc����	
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
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
'�������� Createbox(X,Y)
'˵����	����һ������
'���룺X,Yλ��mode��ʽ Onoff����
'�����	
'���أ�����һ��npc���	
'��ע��
'�޸ļ�¼��
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
'��������Checkyiru(X,Y)
'˵����	���x��Y�Ƿ��������npc������
'���룺
'�����	
'���أ�	1ʱ������
'��ע��
'�޸ļ�¼��
'===============================================================================
Sub Checkyiru(X,Y)
	If Checknpc(X,Y)=0 And Checkmap(X,Y,0)=1 Then
		Checkyiru=1
	Else
		Checkyiru=0
	End If
End Sub
'===============================================================================
'��������Checknpc(X,Y)
'˵����	���x��Y��ͼλ�����Ƿ���npc����
'���룺X,YҪ���ĵ�ͼλ��
'�����	
'���أ�	1ʱΪ��npc����0Ϊ��
'��ע��
'�޸ļ�¼��
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
'��������Dnpcsport(D)
'˵����	����npc�˶�����
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
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
'��������Npcsport()
'˵����	����npc�˶�,������npc������
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
'===============================================================================
Sub Npcsport()
	Dim Lini,Px,Py
	g_sj2=0
	Lini=0
	Maopaopaixu()
	While g_sj2<G_Npccount
		g_sj4=G_Npctaxis(g_sj2)
		'drawnpc(G_Page_Map,G_Npcpic(Lini),G_Npcx(Lini),G_Npcy(Lini),G_Npcface(Lini),G_Npcstep(Lini))
		'��npc
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
'��������Checkmap(X,Y,Mode)
'˵����	����ͼ�������Ǹ�ֵ������ֵ
'���룺X,YҪ���ĵ�ͼ����,ModeΪ0����²��ͼ,ModeΪ1ʱ����ϲ��ͼ
'�����	
'���أ�	Ϊ0ʱΪ��ֵ,1ʱΪ��ֵ
'��ע��
'�޸ļ�¼��
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
'��������Ggactorxy(X,Y)
'˵����	���Ľ�ɫ�ڵ�ͼ��λ�õ�x��Y��
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
'===============================================================================
Sub Ggactorxy(X,Y)
G_Npcx(0)=X
G_Npcy(0)=Y
End Sub



'===============================================================================
'��������Drivemap()
'˵����	���Ǽ�ʻ��ͼ
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
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
'��������Getkey()
'˵����	��ȡ��Ϸ���ư���
'���룺g_delaykey(������ʱ�����󰴼���Ӧʱ�䣩
'�����	
'���أ���Ϸ���Ƽ�ֵ	
'��ע��
'�޸ļ�¼��
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
'��������Getkey2()
'˵����	��ȡ��Ϸ���ư���(Ϊʹ��ӡ�ַ������ӳٵ�����)
'���룺
'�����	
'���أ���Ϸ���Ƽ�ֵ	
'��ע��
'�޸ļ�¼��
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
'��������Drawnpc(Page,Pic,X,Y,Face,Stepx)
'˵����	����npc����ҳ��
'���룺PicͼƬ��Դ Pageҳ�� X,YҪ������λ�� W,HҪ��ʾ�������С,Face����,Stepx����
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
'===============================================================================
Sub Drawnpc(Page,Pic,X,Y,Face,Stepx)
	'showpic(Page,Pic,X*Tile_Wid,(Y-1)*Tile_Hgt,Npc_Wid,Npc_Hgt,Stepx*W,Facey*H,1)
	
End Sub



'===============================================================================
'��������Createnpc(Picid,X,Y,Chushiface,Step,Orstay)
'˵����	����������һ��npc����
'���룺Picid Npc�����ͼƬid
'x,YΪҪ��������λ��chushiface��ʼ��npc����step��ʼ��npc����
'�����	G_Npccount G_Npcorstay(G_Npccount) G_Npcpic(G_Npccount)
'���أ�	����һ��npc�������ڶ�ָ��npc�Ĳ���
'��ע��һ���ܴ���20��npc
'�޸ļ�¼��
'===============================================================================
Sub Createnpc(Picid,X,Y,Chushiface,Step,Orstay)
	G_Npccount=G_Npccount+1
	G_Npcpic(G_Npccount-1)=Loadres(Respath+"Npc"+G_Res$,Picid)
	G_Npcx(G_Npccount-1)=X
	G_Npcy(G_Npccount-1)=Y
	G_Npcstep(G_Npccount-1)=Step'��ʼ��npc����
	G_Npcface(G_Npccount-1)=Chushiface
	G_Npcorstay(G_Npccount-1)=Orstay
	G_Npcw(G_Npccount-1)=Npc_Wid
	G_Npch(G_Npccount-1)=Npc_Hgt
	G_Npcmode(G_Npccount-1)=1
	Createnpc=G_Npccount-1
End Sub


'===============================================================================
'��������Drawmap(Zx,Zy)
'˵��������ͼ���ֵĻ���g_Page_Sundryҳ����ȥ	
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
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
'��������Printnext(Text$,Chang,X,Y)
'˵����	��ӡ�ַ�����һ��������
'���룺ChangΪһ���м����ַ�
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
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
'��������Maopaopaixu()
'˵����	ð�ݷ�����npc������(Y��������)
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
'===============================================================================


Function Maopaopaixu()
	Dim I,Iy,Lin,Linx(21),Liny(21)
	I=0'ѭ��������ʼ��
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
'��������Loadmap(Mapname$,Picid)
'˵����	��ȡ��ͼ�������ͼͼƬ��Դ�����ͼ����
'���룺Id Ҫ��ȡ�ĵ�ͼid
'�����	G_Pline	Ϊ����
'���أ�	
'��ע��
'�޸ļ�¼��
'===============================================================================
Sub Loadmap(Mapname$,Picid)
	Dim X,Y,Path$
	If G_Mappiconoff=True Then Freeres(G_Maptitlepic)'�ж��Ƿ����������ĵ�ͼͼƬ
'��Դ�������ͷ���Դn
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
'��������	Showmap(X,Y)
' ˵����	��ʾָ���ص�ĵ�ͼ
' ���룺	X,Y��ʾ��ͼ������ ��������npc
' ����� 	
' ���أ�	
' ��ע��	
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
'	��������Showgut(Picid)
'	˵����	��ʾ��Ϸ��
'	���룺Picid��Ϸ��ͼƬid
'	�����	
' ���أ�	
' ��ע��ͼƬ�Ŀ����Ϊ240,��Ϊ160
'				�޸ļ�¼��2008.1.26	Smokeboy
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
'��������Forwaitkey()
'˵����	�ȴ��������ⰴ��(���waitkey����һ���͹���bug���޷���ֵ)
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
'===============================================================================
Sub Forwaitkey()
	Msdelay(200)
    While Not Keypress(Key_Escape) And Not Keypress(Key_Enter) And Not Keypress(Key_Up) And Not Keypress(Key_Down) And Not Keypress(Key_Left) And Not Keypress(Key_Right) And Not Keypress(Key_Space)
    Wend
End Sub

'===============================================================================
'��������Say(Picid,Say$)
'˵����˵������	
'���룺Picidͷ��ͼƬid 0ʱΪ��ͷ��,Say$˵������
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
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
'��������Show(Page,Filen$,Loadn,X,Y)
'˵����	�൱��ֱ�Ӵ���Դ������ʾͼƬ,���̳����ʱ,PageΪ��ʾ����ҳ��
'���룺PageҪ��ʾ����ҳ��,Filen$ͼƬ��Դ�ļ�����,LoadnͼƬid,X,YҪ��ʾ����λ��
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
'===============================================================================
Function Show(Page,Filen$,Loadn,X,Y)
Pic=Loadres(Filen$,Loadn)
Wid=Getpicwid(Pic)
Hgt=Getpichgt(Pic)
Showpic(Page,Pic,X,Y,Wid,Hgt,0,0,1)
Freeres(Pic)
End Function

'===============================================================================
'��������If2(N)
'˵���� �¼��ж�
'���룺N
'����� 
'���أ� ���¼�ʱ����1  ���¼�ʱ����0
'��ע��
'      �޸ļ�¼��2007.12.10 Smokeboy
'===============================================================================
Function If2(N)
 Dim Shared If2_I,If2_O,If2_P
 If2_P = N Mod 31
 If2_I = G_Event((N - If2_P)/31)
 '----------------�����λ------------------------
 If2_O = 30
  While If2_O > If2_P
   If If2_I >= G_Event_Num(If2_O) Then If2_I = If2_I - G_Event_Num(If2_O)
   If2_O =If2_O - 1
  Wend
 If2_Q = If2_I '���������λ���ֵ
 '------------------------------------------------

 If If2_I >= G_Event_Num(If2_P) Then If2_I = If2_I - G_Event_Num(If2_P)  '�ó���λ��ֵ
 If2_I = If2_Q - If2_I
 If If2_I = G_Event_Num(If2_P) Then
  If2 = 1
 Else
  If2 = 0
 End If
End Function
'===============================================================================
'��������Setevent(N)
'˵���� �����¼� N Ϊ 1
'���룺 N��Ҫ���õ��¼���
'����� 
'���أ� 
'��ע��
'      �޸ļ�¼��2007.12.10 Smokeboy
'===============================================================================
Function Setevent(N)
 Dim Shared Setevent_N
 Setevent_N = (N - N Mod 31) / 31
 If If2(N) = 0 Then G_Event(Setevent_N) = G_Event(Setevent_N) + G_Event_Num(N Mod 31 )
End Function

'===============================================================================
'��������Clrevent(N)
'˵���� ����¼��� N  Ϊ 0
'���룺 N��Ҫ������¼���
'����� 
'���أ� 
'��ע��                '      �޸ļ�¼��2007.12.10 Smokeboy
'===============================================================================
Function Clrevent(N)
 Dim Shared Clrevent_N
 Clrevent_N = (N - N Mod 31) / 31
 If If2(N) = 1 Then G_Event(Clrevent_N) = G_Event(Clrevent_N) - G_Event_Num(N Mod 31 )
End Function

'===============================================================================
'������
'===============================================================================
Main()
'===============================================================================
'data��
'===============================================================================

'===============================================================================
'��������
'˵����	
'���룺
'�����	
'���أ�	
'��ע��
'�޸ļ�¼��
'===============================================================================
