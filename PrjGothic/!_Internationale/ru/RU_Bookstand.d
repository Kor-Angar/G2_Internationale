
func void use_bookstand_01_s1_ru()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(hero.guild == GIL_NOV)
		{
			KNOWS_FIRE_CONTEST = TRUE;
			Log_CreateTopic(TOPIC_FIRECONTEST,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_FIRECONTEST,LOG_RUNNING);
			b_logentry(TOPIC_FIRECONTEST,"������ �����������, � ���� ����� ��������� ����������� ��������� �����. ������ �� ���� ����� ������� ������ ������ ���� ��� �������. ���� � ������ ��� ���������, � ���� ������ � ���� ����.");
		};
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"��������� �����");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"���� ��������� ����� ����������� ���� ������� ������ ��������� ������, �� ����� �� �������, ��� �� ����������� ����� ������. ����, ������, �� ������ ��� ������� ����� ������� ����������� � ���� �� ���������� �� ����� �������, �� ������� ������ ��������� ����������� ����� ���������, � �� ���� ��� �� ����� �������� ��� � ����. �� ��������� ������ �� ������ ������ ��������� ������, �� ����� ����� ����������� ����� �����.");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"��� ��������� ������ ��������� ���� ������ ��������, ���� � �������� ����������. �������������, �� ������ ������ ��� ���������, ������ �� ������� ������ ��� ����� �� ����� ������� ������, ������ ��� ��� ����� ��������� ������� ������ ���� � �������������� � ���������� ����.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"������ ���� ������ � ��� ���� � ����.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"������ �����");
		Doc_Show(ndocid);
	};
};


//var int finaldragonequipment_once;

func void use_finaldragonequipment_s1_ru()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"... � �������, ��� ���� ����� ������� ���� �� ��������� �������. ������ ��������� ������, ��� �����, ��� �� ������ ���� ����� ��� �������������� �������. ��� �, ���� ��� ������ ��������� ��� ��������� ����� ������ ����, ����� ��� � �����. ��� �������� ������ ���������, ��� � ��� �������� ���������� �������, ����� ������������� � �����. ��� ������ ����� ������ ������ �������� ����� ����������, � ������ ��� ����, ��������� � ���� ������������, ����� ������� ������� � �������� �����.");
		Doc_PrintLines(ndocid,0,"");
		if(hero.guild == GIL_KDF)
		{
			PLAYERGETSAMULETTOFDEATH = TRUE;
			PLAYER_TALENT_RUNES[SPL_MASTEROFDISASTER] = TRUE;
			b_logentry(TOPIC_TALENTRUNES,"����������� ��� ���� '������ ����': 1 ������ ����, ������ �� �����");
			Doc_SetMargins(ndocid,-1,30,20,275,20,1);
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLines(ndocid,1,"... � �������� ����������� � ������ ������� ������ ����� ������ ������ ������ ������, ������� �� ������ �����. ������ ������ ��� ���������. � ����������, ��� ��� ���������� ���������� ������ ����������.");
			Doc_PrintLines(ndocid,1,"� ������� ��������� ���� ������ ��� ������� ���������. ���������� ��������� ����������� � ��� �� ��� ���, ���� �� ��������� ���������.");
			Doc_PrintLines(ndocid,1,"����� ������, ��������, ����� ������ ������ ���� � �������� �����. �� ������� ������ ��������� �� � ���� �� ����. � ����� ������ �� �����, � ����������.");
			Doc_Show(ndocid);
		}
		else if(hero.guild == GIL_PAL)
		{
			PAL_KNOWSABOUT_FINAL_BLESSING = TRUE;
			PLAYER_TALENT_RUNES[SPL_PALTELEPORTSECRET] = TRUE;
			PrintScreen(PRINT_LEARNPALTELEPORTSECRET,-1,-1,FONT_SCREEN,2);
			Log_CreateTopic(TOPIC_TALENTRUNES,LOG_NOTE);
			b_logentry(TOPIC_TALENTRUNES,"��� �������� ���� ���������� ������������� �����������. ��� ������ ���� ������������ � ������� ������� �����, ����� ������� ���� �� ������ �����.");
			b_logentry(TOPIC_TALENTRUNES,"����������� ��� ���� '��������� ��������': 1 ����� ������");
			Doc_SetMargins(ndocid,-1,30,20,275,20,1);
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLines(ndocid,1,"����� ������� ���������� �����, ���������� ������� ���� ������������. ��� ����� ��������� ������ ������ ������ � ��������� ��������� ������ ����. ��� ������ ���� ���� ����� ����������������� � �������.");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLines(ndocid,1,"������ � ������ ������, ��� ����� ������ - ������ ��, ��� �������� ��������� ������������ � ����� ������� ������� '��������� ����'. ��� ��������, ��� ��� ������ ���� ���������, ��� � �����, � ����� ������� �������������� ���� ����������� ������.");
			Doc_PrintLine(ndocid,1,"");
			Doc_Show(ndocid);
		}
		else
		{
			PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_04] = TRUE;
			PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_04] = TRUE;
			PrintScreen(PRINT_LEARNSMITH,-1,-1,FONT_SCREEN,2);
			Npc_SetTalentSkill(self,NPC_TALENT_SMITH,1);
			Log_CreateTopic(TOPIC_TALENTSMITH,LOG_NOTE);
			b_logentry(TOPIC_TALENTSMITH,"����� �������� ������, ����� �������� ������, ������ ����� ��� ����� ����� �����. � ������ �������� ������� �� � ���� ���������� �����, � ����� ������� ����� �� ����������. ������ ������ �������� ������� ������ ����������, ��������� ������ ������ ��������.");
			b_logentry(TOPIC_TALENTSMITH,"���� � ������� 4 ����� ���� � 5 ������ ��������� �����, � ����� �������� ������ ������ '������ ��������'.");
			b_logentry(TOPIC_TALENTSMITH,"���� � ������� 5 ������ ���� � 5 ������ ��������� �����, � ����� �������� ������� ������ ������ '������ ��������'.");
			PLAYERGETSFINALDJGARMOR = TRUE;
			Doc_SetMargins(ndocid,-1,30,20,275,20,1);
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLines(ndocid,1,"������ ���������� ��������.");
			Doc_PrintLines(ndocid,1,"����� ������� ������� �� ����� ������� ����������� ��������, ������� ����� ������� �����, ������� � ������ �� ������� �������.");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLines(ndocid,1,"����� ���������� ���, ��������� ���������� ��������, ���� ��� ������ ���� ������� � ��������� �����. 5 ���� ����� ����� ������� ����� ��������������� ������� � ���������.");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLines(ndocid,1,"����������: '�������' �������� ������������� ��������� �������� '�������'.");
			Doc_Show(ndocid);
		};
		if(FINALDRAGONEQUIPMENT_ONCE == FALSE)
		{
			b_giveplayerxp(XP_FINALDRAGONEQUIPMENT);
			FINALDRAGONEQUIPMENT_ONCE = TRUE;
		};
	};
};


//var int alchemy_1_permanent;
//var int alchemy_2_permanent;
//var int alchemy_3_permanent;

func void use_bookstandalchemy1_s1_ru()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"����� ���������� ����");
		Doc_PrintLine(ndocid,0,"� �����������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"�������� ����");
		Doc_PrintLine(ndocid,0,"2 �������� �������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"�������� ����");
		Doc_PrintLine(ndocid,0,"2 �������� �����");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"������� ����");
		Doc_PrintLine(ndocid,0,"2 �������� �����");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"��� ������ �� ������������ ����� ���������� ��������.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"����� ������� ����� �������� ����� ��� �����, ����������� ���������� ����, ��������� ������ ���������� � ��������:");
		Doc_PrintLine(ndocid,1,"������� �����");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"����� ������� �����, ����������� ������������ ����������� �� ���� ��� ���, ���������� ������������ ��������:");
		Doc_PrintLines(ndocid,1,"������� ������");
		Doc_Show(ndocid);
		if(ALCHEMY_1_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_AMBIENT);
			ALCHEMY_1_PERMANENT = TRUE;
		};
	};
};

func void use_bookstandalchemy2_s1_ru()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"�������� �����");
		Doc_PrintLine(ndocid,0,"� �����������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"�������� ��������");
		Doc_PrintLine(ndocid,0,"2 �������� �����");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"�������� ��������");
		Doc_PrintLine(ndocid,0,"2 �������� ��������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"�������� �������");
		Doc_PrintLine(ndocid,0,"2 �������� �����");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"��� ������ �� ������������ ����� ���������� ��������.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"����� ������� ����� �������� ����� ��� �����, ����������� ���������� ����, ��������� ������ ���������� � ��������:");
		Doc_PrintLine(ndocid,1,"������� �����");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"����� ������� �����, ������� ������������ �������� �� ���� ��� ���, ���������� ������������ ��������:");
		Doc_PrintLines(ndocid,1,"������� ������");
		Doc_Show(ndocid);
		if(ALCHEMY_2_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_AMBIENT);
			ALCHEMY_2_PERMANENT = TRUE;
		};
	};
};

func void use_bookstandalchemy3_s1_ru()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"�����, ������ ������������ ���������");
		Doc_PrintLine(ndocid,0,"� �����������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"������� ��������");
		Doc_PrintLine(ndocid,0,"1 ���������� �����");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"����� ��������");
		Doc_PrintLines(ndocid,0,"1 �������-����� - ��� ����� ����� ��������� �� ������� ������, � ������� �����.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"������� ����");
		Doc_PrintLine(ndocid,0,"1 �������� ������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"������� �����");
		Doc_PrintLine(ndocid,0,"1 �������� ������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"������� ����");
		Doc_PrintLine(ndocid,0,"1 �������� ������");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"���������� ���� �������� - ������ ������������ ���������. ��� ������� �������� �����. � �����, ����� �������, ��� ������ � ����, ��� �����, ��� ���������� � �������� ��� �������� ������ ����� ���� ���������� �����, ����� ����������� ������� ��� �����. ��� ��� ������� �������� ������.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"����� �������� ������ ����������� �����, �������� ������, ��� ��� ���� �� ��������� �������� ������. ������� �������� � ������� �������� ��� ������������� ���� ������.");
		Doc_PrintLine(ndocid,1,"");
		Doc_Show(ndocid);
		if(ALCHEMY_3_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_AMBIENT);
			ALCHEMY_3_PERMANENT = TRUE;
		};
	};
};


//var int animals_1_permanent;
//var int animals_2_permanent;
//var int animals_3_permanent;

func void use_bookstandanimals1_s1_ru()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Brown_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Brown_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"����� � ������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"� ������� ����� ��� ��������� ����� �������� ������, ������������� ����� � ��������� �������� ��������.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"������� ������� ����� ��� � ������� ������ � ��� �������� ��.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"������� �����");
		Doc_PrintLines(ndocid,0,"���� - ������ ������ ������ � ��������. ���� �� ������, ��� ������ �� � ����� ������, �� ������, ���������, ����������, �������� ���� � ������� ����� ������� ������� ������.");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"������ ����");
		Doc_PrintLines(ndocid,1,"����������� � ������� �������� ������ �������, � ��� ������ ����� ���� - ����, ������ � ����������, ��������.");
		Doc_PrintLines(ndocid,1,"����� ������� �������� ����� ����� ������� ����� � �������� ���� � ��������.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"������� ������");
		Doc_PrintLines(ndocid,1,"��� ��������� ��������� �� ���� ����� ������, ���������, �������� � ����������.");
		Doc_Show(ndocid);
		if(ANIMALS_1_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_AMBIENT);
			ANIMALS_1_PERMANENT = TRUE;
		};
	};
};

func void use_bookstandanimals2_s1_ru()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Brown_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Brown_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"����� � ������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"� ������� ����� ��� ��������� ����� �������� ������, ������������� ����� � ��������� �������� ��������.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"�������� ����");
		Doc_PrintLines(ndocid,0,"����� ����������� ���� �������� ��������, ���������� �������� ����� ��������.");
		Doc_PrintLines(ndocid,0,"� ��� ����� �������� ������ � ����.");
		Doc_PrintLines(ndocid,0,"��� ���� ������ ������������ �������� ���������� ��� ��������� �������.");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"������� ������� � �������� ������� ��� ������ ��������. ��������� ���������");
		Doc_PrintLines(ndocid,1,"�������� �������, ��� ��� ��� �������� ������, ���������� ���������� ����.");
		Doc_PrintLines(ndocid,1,"������, �� ������� ������������ ���������, ��� ��� ������������ �������� ���������� ���������� ������������� � ���.");
		Doc_PrintLines(ndocid,1,"������� ��������� ����� ������ ���������. �� ��� ����� ������������� �������.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1," ");
		Doc_Show(ndocid);
		if(ANIMALS_2_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_AMBIENT);
			ANIMALS_2_PERMANENT = TRUE;
		};
	};
};

func void use_bookstandanimals3_s1_ru()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Brown_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Brown_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"����� � ������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"� ������� ����� ��� ��������� ����� �������� ������, ������������� ����� � ��������� �������� ��������.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"�������� ����");
		Doc_PrintLines(ndocid,0,"���� ����� - ����, ���������� �����, ������� ����� ����� ������ � �������� ���������� ����� �� ���� �����.");
		Doc_PrintLines(ndocid,0,"������ ��, ��� �������� ������� �� ����, ����� ��������� �� ���� �������� � �������� �� ������ �����.");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"��������");
		Doc_PrintLines(ndocid,1,"�������� - ��� ������� �����, �������������� ��������� � ������� ��� �������� ����.");
		Doc_PrintLines(ndocid,1,"���� �������� �������� ����� ����, � ������� ��� �� ������������ ������ ��������� ��� �����, ���� ������ �� �� �������� �� ���������� �� �����.");
		Doc_PrintLines(ndocid,1,"��� ��������� ��������� ������ ���������� �������. �� ����� ���������� ���, �������");
		Doc_PrintLines(ndocid,1,"������ ����� ��������� �������� ���.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_Show(ndocid);
		if(ANIMALS_3_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_AMBIENT);
			ANIMALS_3_PERMANENT = TRUE;
		};
	};
};


func void use_bookstanddementor_s1_ru()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Dementor_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Dementor_R.tga",0);
		Doc_Show(ndocid);
	};
};


//var int history_1_permanent;
//var int history_2_permanent;
//var int history_3_permanent;

func void use_bookstandhistory1_s1_ru()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_RED_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_RED_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"���� �����");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"������ ������ - ��� ������� ���������, �� ������� ����, ����� ���� �������� ������. ���������� ���������� ����� ������ ��� ��������.");
		Doc_PrintLines(ndocid,0,"����� ����� ������� ����� �� ���������� ��� ������ ������, ���������� ������, � ����� ������� ����������� �������������� �����.");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"�������, ������ ������� ����� ����� ������������ ������������. ���� �� ������� �������� ���, �� ���� ������� ������������ ��������� ����������.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"");
		Doc_Show(ndocid);
		if(HISTORY_1_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_AMBIENT);
			HISTORY_1_PERMANENT = TRUE;
		};
	};
};

func void use_bookstandhistory2_s1_ru()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_RED_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_RED_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"�������� ����� ������� ��������� �� ������� � ��������� ����������� �������.");
		Doc_PrintLines(ndocid,0,"���� ������ ��������, ������ �����, ����� ������� ��������. � ��� ����� ������ �����, ����� ��� ��� ���� ������� ���������� �������� � ������� ������� ��� ���� ���������� �����������.");
		Doc_PrintLines(ndocid,0,"����� �������, ��� ������ ����� �������� ��������, ��� ���������� ������� ��� ������ �������� ���������� ����.");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"���������� �� �������� ��������� ��������� ����, ��� ��������� �� ����������� ����� ���������� ������� � ����, � ����� �������� ����.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"��� ������ ��������� ����� ������� ����� ����������� ���������, ������� ����� � ������ ���������� ����� ������ ��������.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"� ������ ������� ��������� ������� ��������� ������, ������������� ������ ����. ��� �������� ��� ������������ � ������� ����� � �������, � ����� ������ �������� ����.");
		Doc_Show(ndocid);
		if(HISTORY_2_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_AMBIENT);
			HISTORY_2_PERMANENT = TRUE;
		};
	};
};

func void use_bookstandhistory3_s1_ru()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_RED_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_RED_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"����� �� �������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"����� ���� ����� ������, ���������� ������ ������� ����������� ���� - ���� ��� ���������, ����� ��� ����� ���������.");
		Doc_PrintLines(ndocid,0,"����� ������������ ������ ���������� �������� ���������.");
		Doc_PrintLines(ndocid,0,"���������� ��������� �������� �� ������, � ����� ����������� � ��� ������ �������.");
		Doc_PrintLines(ndocid,0,"��������� ����� �������� ���������. ����� ���� ��� ������� ������ ����� ��������� ��������� �������� - ����.");
		Doc_PrintLines(ndocid,0," ");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"���� ���-���� ������ ������� ��� ����� ���, ���������� ������ �������� �� �����. ����� �������� �������� ������, �������� ������ ��������� ������� �����.");
		Doc_PrintLines(ndocid,1,"�� ���� ������ �������� ��������� ������, ����������� ������������ �����. �� ��� ������� �������� ��� ���� �������������, � � �� ����������� ������ ��������� ��������� � �������������� �������.");
		Doc_PrintLines(ndocid,1,"���, ��� ���� ������� ������������ ��� ��� ���������� ��������, ������ �������� �� ���� �������.");
		Doc_Show(ndocid);
		if(HISTORY_3_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_AMBIENT);
			HISTORY_3_PERMANENT = TRUE;
		};
	};
};


func void use_bookstand_rune_01_s1_ru()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"�������� 1");
		Doc_PrintLine(ndocid,0,"������ �����");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"�������� 2");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1," ");
		Doc_Show(ndocid);
	};
};

func void use_bookstand_rune_02_s1_ru()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"�������� 1");
		Doc_PrintLine(ndocid,0,"���� � �����������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"�������� 2");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1," ");
		Doc_Show(ndocid);
	};
};

func void use_bookstand_innos_01_s1_ru()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"�������� 1");
		Doc_PrintLine(ndocid,0,"������ ������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"�������� 2");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1," ");
		Doc_Show(ndocid);
	};
};

func void use_bookstand_innos_02_s1_ru()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"�������� 1");
		Doc_PrintLine(ndocid,0,"�������� ������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"�������� 2");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1," ");
		Doc_Show(ndocid);
	};
};

func void use_bookstand_kreise_01_s1_ru()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"������ ����");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"���� ������� ����� � ����������� ��� �� ��������.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"����:");
		Doc_PrintLine(ndocid,0,"- ������� ������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"�������� ������:");
		Doc_PrintLine(ndocid,0,"- ����");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"����� ������:");
		Doc_PrintLine(ndocid,0,"- ������ ��������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"����� ������� �������:");
		Doc_PrintLine(ndocid,0,"- ����� �������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"������� ������ �������:");
		Doc_PrintLine(ndocid,0,"- �������� �����");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES2);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES3);
		Doc_Show(ndocid);
	};
};

func void use_bookstand_kreise_02_s1_ru()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"������ ����");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"���� ������� ����� � ����������� ��� �� ��������.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"�������� ���:");
		Doc_PrintLine(ndocid,0,"- �����");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"������� ������:");
		Doc_PrintLine(ndocid,0,"- ������� �����");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"����� �����:");
		Doc_PrintLine(ndocid,0,"- ����� �����");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"����� �����:");
		Doc_PrintLine(ndocid,0,"- �����");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"���:");
		Doc_PrintLine(ndocid,0,"- �������� �����");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES2);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES3);
		Doc_Show(ndocid);
	};
};

func void use_bookstand_kreise_03_s1_ru()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"������ ����");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"���� �������� ����� � ����������� ��� �� ��������.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"������� ������� �������:");
		Doc_PrintLine(ndocid,0,"- �������� ��������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"����� �������� ����:");
		Doc_PrintLine(ndocid,0,"- �����");
		Doc_PrintLine(ndocid,0,"- ����");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"����� �������:");
		Doc_PrintLine(ndocid,0,"- ����� �������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"�����:");
		Doc_PrintLine(ndocid,0,"- ������ ���������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"������� ����:");
		Doc_PrintLine(ndocid,0,"- ������� �����");
		Doc_PrintLine(ndocid,0,"- ���������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"������� ������:");
		Doc_PrintLine(ndocid,0,"- ������ ��������");
		Doc_PrintLine(ndocid,0,"- ����");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES2);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES3);
		Doc_Show(ndocid);
	};
};

func void use_bookstand_kreise_04_s1_ru()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"��������� ����");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"���� ���������� ����� � ����������� ��� �� ��������.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"������� �������� ���:");
		Doc_PrintLine(ndocid,0,"- ����");
		Doc_PrintLine(ndocid,0,"- �����");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"������:");
		Doc_PrintLine(ndocid,0,"- ������ ��������");
		Doc_PrintLine(ndocid,0,"- ������� �����");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"����� ������:");
		Doc_PrintLine(ndocid,0,"- ������ ��������� ������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"����������� ������:");
		Doc_PrintLine(ndocid,0,"- ������ ����");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES2);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES3);
		Doc_Show(ndocid);
	};
};

func void use_bookstand_kreise_05_s1_ru()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"����� ����");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"���� ������ ����� � ����������� ��� �� ��������.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"������� �����:");
		Doc_PrintLine(ndocid,0,"- ������� �����");
		Doc_PrintLine(ndocid,0,"- ���������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"������� �������� ����:");
		Doc_PrintLine(ndocid,0,"- ����");
		Doc_PrintLine(ndocid,0,"- �������� ����");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"����� ������:");
		Doc_PrintLine(ndocid,0,"- ������ ������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"������� ������� �������:");
		Doc_PrintLine(ndocid,0,"- �������� ������");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES2);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES3);
		Doc_Show(ndocid);
	};
};

func void use_bookstand_kreise_06_s1_ru()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"������ ����");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"���� ������� ����� � ����������� ��� �� ��������.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"�������� �����:");
		Doc_PrintLine(ndocid,0,"- �����");
		Doc_PrintLine(ndocid,0,"- ����");
		Doc_PrintLine(ndocid,0,"- �������� ����");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"������� ������:");
		Doc_PrintLine(ndocid,0,"- �����");
		Doc_PrintLine(ndocid,0,"- ������ ���������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"����� ������:");
		Doc_PrintLine(ndocid,0,"- ����� �������");
		Doc_PrintLine(ndocid,0,"- ������ ���������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"����� ����:");
		Doc_PrintLine(ndocid,0,"- ����� �������");
		Doc_PrintLine(ndocid,0,"- ������ ���������");
		Doc_PrintLine(ndocid,0,"- ������ ��������� ������");
		Doc_PrintLine(ndocid,0,"- ������ ������");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"���������� �������:");
		Doc_PrintLine(ndocid,1,"- ����� �������");
		Doc_PrintLine(ndocid,1,"- ���� ������");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES2);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,PRINT_BOOKSTANDRUNES3);
		Doc_Show(ndocid);
	};
};

func void use_bookstand_rules_01_s1_ru()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"�������� 1");
		Doc_PrintLine(ndocid,0,"�������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"�������� 2");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1," ");
		Doc_Show(ndocid);
	};
};


func void bookstand_milten_03_s1_ru()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Brown_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Brown_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"������.");
		Doc_PrintLines(ndocid,0,"��������� ���� ������ ����� ������� ������� ������������ ������ �������.");
		Doc_PrintLines(ndocid,0,"����� ����� �� ��������� �����, ������� ���-��� ���������.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"��������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"�� ������, ��� � ��������� ����� ������� ���� ����� ������. ��, �������, ��� �� ���� ������� ��������. � ����� ��� ������ ����� �� ������������.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"��������");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"����� ����� �� ������ �������� ��� ������, � ��� �������, � ����, ��� �� ���������. �� ������ ������������ ����� ����, ���� ��� �� ������� ������.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"��������");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"��������, ��� ������� �������� ����������. ���������� ������ � ���, ��� ����������, ���� ����� ...");
		Doc_Show(ndocid);
	};
};

func void bookstand_milten_02_s1_ru()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"� �������� ���� ���������� ����� ������� ����������. ��� �� ��� ��������, ��� ������� � �������� ������������ ����� � ������?");
		Doc_PrintLines(ndocid,0,"��, �� ���� �������, ��� � ��� �����������. �� ����� ����, ��� ����� ������� �������� ������.");
		Doc_PrintLines(ndocid,0,"���� ���������� �� ������� ���������� �������.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"��������� ���� �����. ��� ����� � ����� ����� - �� ��������, ���� �� ������.");
		Doc_PrintLines(ndocid,1,"�� �����, ��� ��� ���������� ������ ������.");
		Doc_PrintLines(ndocid,1,"��, � � ��������� ��������� ����� ��� ����� ������������ �������� �������.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"������");
		Doc_Show(ndocid);
	};
};

func void bookstand_milten_01_s1_ru()
{
	var C_NPC her;
	var int document;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		document = Doc_CreateMap();
		Doc_SetPages(document,1);
		Doc_SetPage(document,0,"Map_OldWorld.tga",TRUE);
		Doc_SetLevel(document,"OldWorld\OldWorld.zen");
		Doc_SetLevelCoords(document,-78500,47500,54000,-53000);
		Doc_Show(document);
	};
};

func void bookstand_engor_01_s1_ru()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Red_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Red_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"�� ����� ���-��� - ������ ���������. ������ �����������:");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"3 ����� ������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"8 ������ ������ �������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"4 ����� � ��������� ���������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"5 ������ (�������) ���� � ����");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"2 ����� � �������");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"3 ����� � �������������");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"16 ������ � ������� (���� ��� ����� ���)");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"1 ���� � ������� ��������");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"4 ����� � �������� �������");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"56 ����� � �����");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"1 ���� � ���-�� ������ (��� �� ��� �� ����, ��� ������)");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"�����");
		Doc_Show(ndocid);
	};
};

