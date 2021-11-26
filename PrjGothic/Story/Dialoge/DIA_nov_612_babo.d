instance DIA_BABO_KAP1_EXIT(C_INFO)
{
        npc = nov_612_babo;
        nr = 999;
        condition = dia_babo_kap1_exit_condition;
        information = dia_babo_kap1_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_babo_kap1_exit_condition()
{
        if(KAPITEL == 1)
        {
                return TRUE;
        };
};
func void dia_babo_kap1_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_BABO_HELLO(C_INFO)
{
        npc = nov_612_babo;
        nr = 2;
        condition = dia_babo_hello_condition;
        information = dia_babo_hello_info;
        permanent = FALSE;
        important = TRUE;
};
func int dia_babo_hello_condition()
{
        if(Npc_IsInState(self,zs_talk) && (other.guild == GIL_NOV))
        {
                return TRUE;
        };
};
func void dia_babo_hello_info()
{
        B_AI_Output(self,other,"DIA_Babo_Hello_03_00");   //(���������) ������, �� ���� ������� �����, ��?
        B_AI_Output(other,self,"DIA_Babo_Hello_15_01");   //��. �� ����� �����?
        B_AI_Output(self,other,"DIA_Babo_Hello_03_02");   //������ ������. ���� ��� ������ ������ �����?
        B_AI_Output(other,self,"DIA_Babo_Hello_15_03");   //���� ���.
        B_AI_Output(self,other,"DIA_Babo_Hello_03_04");   //����� ������ ��� ����. ��, ���������� ������ ����� � �������, ����� ��������, ��� �� �������� �������� ����. �� ������ ���������?
        B_AI_Output(other,self,"DIA_Babo_Hello_15_05");   //��, ��� ��������� ������������ �������...
        B_AI_Output(self,other,"DIA_Babo_Hello_03_06");   //���� ������, � ���� ������� ���� ���-����. �� � ���� ���� �������...
        CreateInvItems(other,itmw_1h_nov_mace,1);
        AI_PrintScreen("������ ����� ��������",-1,YPOS_ITEMTAKEN,FONT_SCREENSMALL,2);
};
instance DIA_BABO_ANLIEGEN(C_INFO)
{
        npc = nov_612_babo;
        nr = 2;
        condition = dia_babo_anliegen_condition;
        information = dia_babo_anliegen_info;
        permanent = FALSE;
        description = "��� �� �������?";
};
func int dia_babo_anliegen_condition()
{
        if((other.guild == GIL_NOV) && Npc_KnowsInfo(other,dia_babo_hello))
        {
                return TRUE;
        };
};
func void dia_babo_anliegen_info()
{
        B_AI_Output(other,self,"DIA_Babo_Anliegen_15_00");        //��� �� �������?
        B_AI_Output(self,other,"DIA_Babo_Anliegen_03_01");        //��, ���� �� ���������, ������, ������ ����� � ���������.
        B_AI_Output(self,other,"DIA_Babo_Anliegen_03_02");        //���� �� ������� ������� ��� ���� ��� ��������� ������, ����� � ���������� ����.
        B_AI_Output(other,self,"DIA_Babo_Anliegen_15_03");        //� ��������, ��� ����� �������.
        Log_CreateTopic(TOPIC_BABOTRAIN,LOG_MISSION);
        Log_SetTopicStatus(TOPIC_BABOTRAIN,LOG_RUNNING);
        b_logentry(TOPIC_BABOTRAIN,TOPIC_BABOTRAIN_description_304); // "���� � ����� ������� �������� ������ ������� ��������������� � ���� �� ������ ���� ��������� ��������� � ��������� �������."
};
instance DIA_BABO_SERGIO(C_INFO)
{
        npc = nov_612_babo;
        nr = 2;
        condition = dia_babo_sergio_condition;
        information = dia_babo_sergio_info;
        permanent = FALSE;
        description = "� ��������� � ������.";
};
func int dia_babo_sergio_condition()
{
        if(Npc_KnowsInfo(other,dia_sergio_babo) && (other.guild == GIL_NOV))
        {
                return TRUE;
        };
};
func void dia_babo_sergio_info()
{
        B_AI_Output(other,self,"DIA_Babo_Sergio_15_00");  //� ��������� � ������. �� ����� ����������� ���� �� ��� ���� ������ ����, � ���� �����.
        B_AI_Output(self,other,"DIA_Babo_Sergio_03_01");  //�������! ����� ����� ��� ����!
        B_AI_Output(self,other,"DIA_Babo_Sergio_03_02");  //���� ������, � ����� ���� �������� ���� ��������� �������� ������� ���������.
        BABO_TEACHPLAYER = TRUE;
        BABO_TRAINING = TRUE;
        b_giveplayerxp(XP_AMBIENT * 2);
        Log_CreateTopic(TOPIC_KLOSTERTEACHER,LOG_NOTE);
        b_logentry(TOPIC_KLOSTERTEACHER,TOPIC_KLOSTERTEACHER_description_305); // "���� ����� ������� ���� ��������� ��������� � ��������� �������."
};
instance DIA_BABO_TEACH(C_INFO)
{
        npc = nov_612_babo;
        nr = 100;
        condition = dia_babo_teach_condition;
        information = dia_babo_teach_info;
        permanent = TRUE;
        description = "� ����� � ��������.";
};
var int dia_babo_teach_permanent;
var int babo_labercount;
func int dia_babo_teach_condition()
{
        if(((BABO_TEACHPLAYER == TRUE) && (DIA_BABO_TEACH_PERMANENT == FALSE)) || (other.guild == GIL_KDF))
        {
                return TRUE;
        };
};
var int babo_merk2h;
func void dia_babo_teach_info()
{
        BABO_MERK2H = other.hitchance[NPC_TALENT_2H];
        B_AI_Output(other,self,"DIA_Babo_Teach_15_00");   //� ����� � ��������.
        Info_ClearChoices(dia_babo_teach);
        Info_AddChoice(dia_babo_teach,DIALOG_BACK,dia_babo_teach_back);
        Info_AddChoice(dia_babo_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_babo_teach_2h_1);
        Info_AddChoice(dia_babo_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_babo_teach_2h_5);
};
func void dia_babo_teach_back()
{
        if(other.hitchance[NPC_TALENT_2H] >= 70)
        {
                B_AI_Output(self,other,"DIA_DIA_Babo_Teach_Back_03_00");  //�� ������ ������ � ��������� ������, ��� � ��� �� ������� ����.
                DIA_BABO_TEACH_PERMANENT = TRUE;
        };
        Info_ClearChoices(dia_babo_teach);
};
func void dia_babo_teach_2h_1()
{
        b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,70);
        if(other.hitchance[NPC_TALENT_2H] > BABO_MERK2H)
        {
                if(BABO_LABERCOUNT == 0)
                {
                        B_AI_Output(self,other,"DIA_DIA_Babo_Teach_03_00");       //�������� �� ������. ����� - ���� �����, � ���� ���� ������� ���� ����.
                };
                if(BABO_LABERCOUNT == 1)
                {
                        B_AI_Output(self,other,"DIA_DIA_Babo_Teach_03_01");       //����� ������ ������� �� ����������� ���������� - �� �������� ���!
                };
                if(BABO_LABERCOUNT == 2)
                {
                        B_AI_Output(self,other,"DIA_DIA_Babo_Teach_03_02");       //���� �� �� �� ��� - ������ ���� � ����� ���� �����.
                };
                if(BABO_LABERCOUNT == 3)
                {
                        B_AI_Output(self,other,"DIA_DIA_Babo_Teach_03_03");       //����� ������ ������ ����� � ���. ���� � ���� ��� ������� �����, ���� ����� - ���� ����� ������ ������� �������.
                };
                BABO_LABERCOUNT = BABO_LABERCOUNT + 1;
                if(BABO_LABERCOUNT >= 3)
                {
                        BABO_LABERCOUNT = 0;
                };
        };
        Info_ClearChoices(dia_babo_teach);
        Info_AddChoice(dia_babo_teach,DIALOG_BACK,dia_babo_teach_back);
        Info_AddChoice(dia_babo_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_babo_teach_2h_1);
        Info_AddChoice(dia_babo_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_babo_teach_2h_5);
};
func void dia_babo_teach_2h_5()
{
        b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,70);
        if(other.hitchance[NPC_TALENT_2H] > BABO_MERK2H)
        {
                if(BABO_LABERCOUNT == 0)
                {
                        B_AI_Output(self,other,"DIA_DIA_Babo_Teach_2H_5_03_00");  //����� ������ ��������� �� ������ ����� �������, �� ����� � ����� �������.
                };
                if(BABO_LABERCOUNT == 1)
                {
                        B_AI_Output(self,other,"DIA_DIA_Babo_Teach_2H_5_03_01");  //�� ������ ��������, �� ������ ������� �� ������ ���������.
                };
                if(BABO_LABERCOUNT == 2)
                {
                        B_AI_Output(self,other,"DIA_DIA_Babo_Teach_2H_5_03_02");  //�����, �� ������ ����������, ����� �� ������������� ���������� � �� ����� ��� ����� �������������� ����.
                };
                if(BABO_LABERCOUNT == 3)
                {
                        B_AI_Output(self,other,"DIA_DIA_Babo_Teach_2H_5_03_03");  //����� �� �������� ���, �� ������ �������.
                };
                BABO_LABERCOUNT = BABO_LABERCOUNT + 1;
                if(BABO_LABERCOUNT >= 3)
                {
                        BABO_LABERCOUNT = 0;
                };
        };
        Info_ClearChoices(dia_babo_teach);
        Info_AddChoice(dia_babo_teach,DIALOG_BACK,dia_babo_teach_back);
        Info_AddChoice(dia_babo_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_babo_teach_2h_1);
        Info_AddChoice(dia_babo_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_babo_teach_2h_5);
};
instance DIA_BABO_WURST(C_INFO)
{
        npc = nov_612_babo;
        nr = 2;
        condition = dia_babo_wurst_condition;
        information = dia_babo_wurst_info;
        permanent = FALSE;
        description = "���, ����� �������.";
};
func int dia_babo_wurst_condition()
{
        if((KAPITEL == 1) && (MIS_GORAXESSEN == LOG_RUNNING) && (Npc_HasItems(self,itfo_schafswurst) == 0) && (Npc_HasItems(other,itfo_schafswurst) >= 1))
        {
                return TRUE;
        };
};
func void dia_babo_wurst_info()
{
        var string novizetext;
        var string novizeleft;
        B_AI_Output(other,self,"DIA_Babo_Wurst_15_00");   //���, ����� �������.
        B_AI_Output(self,other,"DIA_Babo_Wurst_03_01");   //��, ������� �������, �������! ����� ����������� ���� - ��� ��� ��� ���� ��������!
        B_AI_Output(other,self,"DIA_Babo_Wurst_15_02");   //����� � ���� �� ������ ������� ��� ������.
        B_AI_Output(self,other,"DIA_Babo_Wurst_03_03");   //� ���� ��� ����� �� ���� �������� ������, ��� �����. ��, �� ��, ��� ������������� ��� ����. �� �� ������. ��� �� ����� ������ �����-�� �������?
        B_AI_Output(self,other,"DIA_Babo_Wurst_03_04");   //�� ��, � ��� ���� �� ��� ������ '�������� ������'.
        b_giveinvitems(other,self,itfo_schafswurst,1);
        WURST_GEGEBEN = WURST_GEGEBEN + 1;
        CreateInvItems(self,itfo_sausage,1);
        b_useitem(self,itfo_sausage);
        novizeleft = IntToString(13 - WURST_GEGEBEN);
        novizetext = ConcatStrings(novizeleft,PRINT_NOVIZENLEFT);
        AI_PrintScreen(novizetext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,3);
        Info_ClearChoices(dia_babo_wurst);
        if(Npc_HasItems(other,itfo_schafswurst) >= 1)
        {
                Info_AddChoice(dia_babo_wurst,dia_babo_wurst_ja_description,dia_babo_wurst_ja); // "������ ����� ��� ���� �������."
        };
        Info_AddChoice(dia_babo_wurst,dia_babo_wurst_nein_description,dia_babo_wurst_nein); // "��� � �� ������ �����."
};
func void dia_babo_wurst_ja()
{
        B_AI_Output(other,self,"DIA_Babo_Wurst_JA_15_00");        //������, ����� ��� ���� �������.
        B_AI_Output(self,other,"DIA_Babo_Wurst_JA_03_01");        //�������. ��� ���� ������.
        b_giveinvitems(other,self,itfo_schafswurst,1);
        b_giveinvitems(self,other,itsc_firebolt,1);
        Info_ClearChoices(dia_babo_wurst);
};
func void dia_babo_wurst_nein()
{
        B_AI_Output(other,self,"DIA_Babo_Wurst_NEIN_15_00");      //���, � �� ������ �����.
        B_AI_Output(self,other,"DIA_Babo_Wurst_NEIN_03_01");      //������, �� ���, ���� �� ��� �����, ��� ����� ���������� ��������� �� �����, �?
        Info_ClearChoices(dia_babo_wurst);
};
instance DIA_BABO_YOUANDAGON(C_INFO)
{
        npc = nov_612_babo;
        nr = 3;
        condition = dia_babo_youandagon_condition;
        information = dia_babo_youandagon_info;
        permanent = FALSE;
        description = "��� ��������� ����� ����� � ������?";
};
func int dia_babo_youandagon_condition()
{
        if(Npc_KnowsInfo(other,dia_opolos_monastery) && (other.guild == GIL_NOV))
        {
                return TRUE;
        };
};
func void dia_babo_youandagon_info()
{
        B_AI_Output(other,self,"DIA_Babo_YouAndAgon_15_00");      //��� ��������� ����� ����� � ������?
        B_AI_Output(self,other,"DIA_Babo_YouAndAgon_03_01");      //��, �� ��������� � ���, ��� ����� ��������� �� �������� ��������.
        B_AI_Output(self,other,"DIA_Babo_YouAndAgon_03_02");      //���� ������� �� ���, ��� ����� ������� �������� ����� ������ ������.
        B_AI_Output(self,other,"DIA_Babo_YouAndAgon_03_03");      //� ����� ��� ������ ������, �� ������� � ���� ����.
        B_AI_Output(self,other,"DIA_Babo_YouAndAgon_03_04");      //������ ���� ��������� ���������� ��������� ���� � ���������.
};
instance DIA_BABO_WHYDIDAGON(C_INFO)
{
        npc = nov_612_babo;
        nr = 4;
        condition = dia_babo_whydidagon_condition;
        information = dia_babo_whydidagon_info;
        permanent = FALSE;
        description = "����� ���� ������ ���?";
};
func int dia_babo_whydidagon_condition()
{
        if(Npc_KnowsInfo(other,dia_babo_youandagon) && (hero.guild == GIL_NOV))
        {
                return TRUE;
        };
};
func void dia_babo_whydidagon_info()
{
        B_AI_Output(other,self,"DIA_Babo_WhyDidAgon_15_00");      //����� ���� ������ ���?
        B_AI_Output(self,other,"DIA_Babo_WhyDidAgon_03_01");      //���� ����� ������ �������� ��� �� ����. � �����, �� ������ �� �������, ����� ���-�� ����������� ����� ���.
};
instance DIA_BABO_PLANTLORE(C_INFO)
{
        npc = nov_612_babo;
        nr = 5;
        condition = dia_babo_plantlore_condition;
        information = dia_babo_plantlore_info;
        permanent = FALSE;
        description = "������ �� ������ ������������ � ���������?";
};
func int dia_babo_plantlore_condition()
{
        if(Npc_KnowsInfo(other,dia_babo_youandagon) && (hero.guild == GIL_NOV))
        {
                return TRUE;
        };
};
func void dia_babo_plantlore_info()
{
        B_AI_Output(other,self,"DIA_Babo_PlantLore_15_00");       //������ �� ������ ������������ � ���������?
        B_AI_Output(self,other,"DIA_Babo_PlantLore_03_01");       //� ��� � ����� ���� �������, ��� �� ���������� ��������� �����, � � �������� ���-���� � �������.
        B_AI_Output(self,other,"DIA_Babo_PlantLore_03_02");       //� �� ��� ����� ����� �������� � ����.
        MIS_HELPBABO = LOG_RUNNING;
        Log_CreateTopic(TOPIC_BABOGAERTNER,LOG_MISSION);
        Log_SetTopicStatus(TOPIC_BABOGAERTNER,LOG_RUNNING);
        b_logentry(TOPIC_BABOGAERTNER,TOPIC_BABOGAERTNER_description_306); // "���� ��������� �� ����������� ����� ��� ��������� ����."
};
instance DIA_BABO_FEGEN(C_INFO)
{
        npc = nov_612_babo;
        nr = 2;
        condition = dia_babo_fegen_condition;
        information = dia_babo_fegen_info;
        permanent = FALSE;
        description = "� ������ ��������� ����� �����������.";
};
func int dia_babo_fegen_condition()
{
        if(MIS_PARLANFEGEN == LOG_RUNNING)
        {
                return TRUE;
        };
};
func void dia_babo_fegen_info()
{
        B_AI_Output(other,self,"DIA_Babo_Fegen_15_00");   //� ������ ��������� ����� �����������.
        B_AI_Output(self,other,"DIA_Babo_Fegen_03_01");   //�� ������� �� ���� ������� ����� ������. ������ ��� - � ������ ����. ���� �� �� ��� �� ���������� ������.
        B_AI_Output(self,other,"DIA_Babo_Fegen_03_02");   //�� ��� ����� ����� ������ � ����������� '����� �����'. ������, ��� �������, � ��� ���� ��������� �������� ����� � ���.
        B_AI_Output(self,other,"DIA_Babo_Fegen_03_03");   //� ������, �����������, � ���� �������� ��� ����������. ��� ��� ���� �� ��������� ��� ���� ������, � ������ ����.
        b_logentry(TOPIC_PARLANFEGEN,TOPIC_PARLANFEGEN_description_307); // "���� ������� ��� �������� ����� ����������� ���� � ������� ��� ������ � ����������� ����� �����."
};
instance DIA_BABO_WINDFAUST(C_INFO)
{
        npc = nov_612_babo;
        nr = 3;
        condition = dia_babo_windfaust_condition;
        information = dia_babo_windfaust_info;
        permanent = TRUE;
        description = "������ ������ � �����������... (������ ����� �����)";
};
var int dia_babo_windfaust_permanent;
func int dia_babo_windfaust_condition()
{
        if((MIS_PARLANFEGEN == LOG_RUNNING) && Npc_KnowsInfo(other,dia_babo_fegen) && (DIA_BABO_WINDFAUST_PERMANENT == FALSE))
        {
                return TRUE;
        };
};
func void dia_babo_windfaust_info()
{
        B_AI_Output(other,self,"DIA_Babo_Windfaust_15_00");       //������ ������...
        B_AI_Output(self,other,"DIA_Babo_Windfaust_03_01");       //� ���� ���� ������ '����� �����' ��� ����?
        if(b_giveinvitems(other,self,itsc_windfist,1))
        {
                B_AI_Output(other,self,"DIA_Babo_Windfaust_15_02");       //��� ������, ������� �� ����� ��������.
                B_AI_Output(self,other,"DIA_Babo_Windfaust_03_03");       //�������. ����� � ������ ���� ��������� �����.
                NOV_HELFER = NOV_HELFER + 1;
                DIA_BABO_WINDFAUST_PERMANENT = TRUE;
                b_giveplayerxp(XP_FEGER);
                AI_StopProcessInfos(self);
                Npc_ExchangeRoutine(self,"FEGEN");
                b_logentry(TOPIC_PARLANFEGEN,TOPIC_PARLANFEGEN_description_308); // "���� ������� ��� �������� ����� �����������."
        }
        else
        {
                B_AI_Output(other,self,"DIA_Babo_Windfaust_15_04");       //���, ���� ���.
                B_AI_Output(self,other,"DIA_Babo_Windfaust_03_05");       //������, � �������.
        };
        AI_StopProcessInfos(self);
};
instance DIA_BABO_LIFE(C_INFO)
{
        npc = nov_612_babo;
        nr = 10;
        condition = dia_babo_life_condition;
        information = dia_babo_life_info;
        permanent = TRUE;
        description = "��� ����� � ���������?";
};
func int dia_babo_life_condition()
{
        if(other.guild == GIL_NOV)
        {
                return TRUE;
        };
};
func void dia_babo_life_info()
{
        B_AI_Output(other,self,"DIA_Babo_Life_15_00");    //��� ����� � ���������?
        B_AI_Output(self,other,"DIA_Babo_Life_03_01");    //�� ���� ����������, �� � ������� �� �����, ��� ����� ����� ������� �������. ���� �� �� ��������� �������, ���� ����������.
        B_AI_Output(self,other,"DIA_Babo_Life_03_02");    //�������, ������ ���������� ����� ������� ������ ������ � ����������, ����� ������������� ����� ����������.
        B_AI_Output(self,other,"DIA_Babo_Life_03_03");    //�� � �����, ��� ������ ���������� � ��������� ������ - ��� ��������� ��������� ���� ������.
        if(Npc_KnowsInfo(other,dia_igaranz_choosen) == FALSE)
        {
                B_AI_Output(other,self,"DIA_Babo_Life_15_04");    //��� �� ��� ������� �� ���������, � ��� �� ���������?
                B_AI_Output(self,other,"DIA_Babo_Life_03_05");    //�������� � ������ ��������. �� ������ ����� �� ����.
        };
};
instance DIA_BABO_HOWISIT(C_INFO)
{
        npc = nov_612_babo;
        nr = 1;
        condition = dia_babo_howisit_condition;
        information = dia_babo_howisit_info;
        permanent = TRUE;
        description = "��� ��?";
};
func int dia_babo_howisit_condition()
{
        if((hero.guild == GIL_KDF) && (KAPITEL < 3))
        {
                return TRUE;
        };
};
var int babo_xpgiven;
func void dia_babo_howisit_info()
{
        B_AI_Output(other,self,"DIA_Babo_HowIsIt_15_00"); //��� ����?
        if(MIS_HELPBABO == LOG_SUCCESS)
        {
                B_AI_Output(self,other,"DIA_Babo_HowIsIt_03_01"); //(�����) � ��������� ����� �� ������ ��� ���������.
                B_AI_Output(self,other,"DIA_Babo_HowIsIt_03_02"); //��� �������� �������� � ����, � � �������, ��� ���� �������� ����, ������.
                if(BABO_XPGIVEN == FALSE)
                {
                        b_giveplayerxp(XP_AMBIENT);
                        BABO_XPGIVEN = TRUE;
                };
        }
        else
        {
                B_AI_Output(self,other,"DIA_Babo_HowIsIt_03_03"); //(���������) �... �... ������, ������.
                B_AI_Output(self,other,"DIA_Babo_HowIsIt_03_04"); //�, � ������� ������� � ������� �� ������������ �����.
        };
        AI_StopProcessInfos(self);
};
instance DIA_BABO_KAP2_EXIT(C_INFO)
{
        npc = nov_612_babo;
        nr = 999;
        condition = dia_babo_kap2_exit_condition;
        information = dia_babo_kap2_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_babo_kap2_exit_condition()
{
        if(KAPITEL == 2)
        {
                return TRUE;
        };
};
func void dia_babo_kap2_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_BABO_KAP3_EXIT(C_INFO)
{
        npc = nov_612_babo;
        nr = 999;
        condition = dia_babo_kap3_exit_condition;
        information = dia_babo_kap3_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_babo_kap3_exit_condition()
{
        if(KAPITEL == 3)
        {
                return TRUE;
        };
};
func void dia_babo_kap3_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_BABO_KAP3_HELLO(C_INFO)
{
        npc = nov_612_babo;
        nr = 31;
        condition = dia_babo_kap3_hello_condition;
        information = dia_babo_kap3_hello_info;
        permanent = FALSE;
        description = "��� �� ������� �����?";
};
func int dia_babo_kap3_hello_condition()
{
        if(KAPITEL >= 3)
        {
                return TRUE;
        };
};
func void dia_babo_kap3_hello_info()
{
        B_AI_Output(other,self,"DIA_Babo_Kap3_Hello_15_00");      //��� �� ������� �����?
        if(hero.guild == GIL_KDF)
        {
                B_AI_Output(self,other,"DIA_Babo_Kap3_Hello_03_01");      //(����������) � ������� ��������� �������, ������ ���, ���, ����� ���� ��������� �������� ��������.
        }
        else
        {
                B_AI_Output(self,other,"DIA_Babo_Kap3_Hello_03_02");      //� �� ������ �������� � �����. ���� �� ��� �������� ��� �� ������, ���� �������, ��� � ������ � �������.
        };
};
instance DIA_BABO_KAP3_KEEPTHEFAITH(C_INFO)
{
        npc = nov_612_babo;
        nr = 31;
        condition = dia_babo_kap3_keepthefaith_condition;
        information = dia_babo_kap3_keepthefaith_info;
        permanent = FALSE;
        description = "�� �� ������ ������ ����.";
};
func int dia_babo_kap3_keepthefaith_condition()
{
        if((KAPITEL >= 3) && Npc_KnowsInfo(other,dia_babo_kap3_hello) && (hero.guild == GIL_KDF))
        {
                return TRUE;
        };
};
func void dia_babo_kap3_keepthefaith_info()
{
        B_AI_Output(other,self,"DIA_Babo_Kap3_KeepTheFaith_15_00");       //�� �� ������ ������ ����.
        B_AI_Output(self,other,"DIA_Babo_Kap3_KeepTheFaith_03_01");       //(����������� ��������) ���... � ���� �������, ��� ������ �� ����������. �������!
        B_AI_Output(other,self,"DIA_Babo_Kap3_KeepTheFaith_15_02");       //�� ��� �������� ����� ������� ���������.
        B_AI_Output(self,other,"DIA_Babo_Kap3_KeepTheFaith_03_03");       //��, ������. � ���� ������ ������� ���. �������.
        b_giveplayerxp(XP_AMBIENT);
};
instance DIA_BABO_KAP3_UNHAPPY(C_INFO)
{
        npc = nov_612_babo;
        nr = 31;
        condition = dia_babo_kap3_unhappy_condition;
        information = dia_babo_kap3_unhappy_info;
        permanent = FALSE;
        description = "�� �� ��������� �������� �������.";
};
func int dia_babo_kap3_unhappy_condition()
{
        if((KAPITEL >= 3) && (hero.guild != GIL_KDF) && Npc_KnowsInfo(other,dia_babo_kap3_hello))
        {
                return TRUE;
        };
};
func void dia_babo_kap3_unhappy_info()
{
        B_AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_15_00");    //�� �� ��������� �������� �������.
        B_AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_03_01");    //(����������� ��������) ���... � ���� �������, �� ���� ��� � �������, ������.
        B_AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_03_02");    //������... ��, � �� ���� ����������.
        Info_ClearChoices(dia_babo_kap3_unhappy);
        Info_AddChoice(dia_babo_kap3_unhappy,dia_babo_kap3_unhappy_lament_description,dia_babo_kap3_unhappy_lament); // "����� �������� �������."
        Info_AddChoice(dia_babo_kap3_unhappy,dia_babo_kap3_unhappy_tellme_description,dia_babo_kap3_unhappy_tellme); // "�� ����� ���-�� �� ������ �������."
};
func void dia_babo_kap3_unhappy_lament()
{
        B_AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Lament_15_00");     //����� �������� �������.
        B_AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Lament_03_01");     //(���������) �... �... ����������, �� ������ �����.
        B_AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Lament_03_02");     //� �� ����, ����� ���� ����� ��������.
        B_AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Lament_15_03");     //� ������� ��� ����.
        Info_ClearChoices(dia_babo_kap3_unhappy);
};
func void dia_babo_kap3_unhappy_tellme()
{
        B_AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_TellMe_15_00");     //�� �����, ���-�� �� ������ �������.
        B_AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_01");     //� �� ������ �� ������� �����?
        B_AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_TellMe_15_02");     //� ����� �� ����, ��� ����� ����� �����������?
        B_AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_03");     //��, ������. � ���� �������� � ����� �� �����������. �� ����������� ����.
        B_AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_TellMe_15_04");     //�����, ����������.
        B_AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_05");     //������, ��� ����� ����� ����������, ����� ��� ������ ������.
        B_AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_06");     //�� �������� �������� �� �����, ���� � �� ���� ������ ��, ��� �� �������.
        MIS_BABOSDOCS = LOG_RUNNING;
        Log_CreateTopic(TOPIC_BABOSDOCS,LOG_MISSION);
        Log_SetTopicStatus(TOPIC_BABOSDOCS,LOG_RUNNING);
        b_logentry(TOPIC_BABOSDOCS,TOPIC_BABOSDOCS_description_309); // "������ ����������� ���������� ���� ������-�� �����������."
        Info_ClearChoices(dia_babo_kap3_unhappy);
        Info_AddChoice(dia_babo_kap3_unhappy,dia_babo_kap3_unhappy_privat_description,dia_babo_kap3_unhappy_privat); // "� ����� ��� ��� �� ����� ������� � ��� ������."
        Info_AddChoice(dia_babo_kap3_unhappy,dia_babo_kap3_unhappy_shoulddo_description,dia_babo_kap3_unhappy_shoulddo); // "��� �� ������ ������ ��� ����?"
        Info_AddChoice(dia_babo_kap3_unhappy,dia_babo_kap3_unhappy_documents_description,dia_babo_kap3_unhappy_documents); // "��� ��� ���� �� ������?"
        Info_AddChoice(dia_babo_kap3_unhappy,dia_babo_kap3_unhappy_canhelpyou_description,dia_babo_kap3_unhappy_canhelpyou); // "����� ���� � ���� ������ ����?"
};
func void dia_babo_kap3_unhappy_privat()
{
        B_AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Privat_15_00");     //� �����, ��� ��� �� ����� ������� � ��� ������.
        B_AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Privat_03_01");     //� �������, ���� �� ����� ��������. � ��� � ���� ���-������ ���������.
        B_AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Privat_15_02");     //� ����, �� ����������.
        Info_ClearChoices(dia_babo_kap3_unhappy);
};
func void dia_babo_kap3_unhappy_shoulddo()
{
        B_AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_ShouldDo_15_00");   //��� �� ������ ������ ��� ����?
        B_AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_ShouldDo_03_01");   //��� ��� ������ ��������. ��� ��� �� ���������� ������.
        B_AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_ShouldDo_03_02");   //��� ���� ������ �� �������, ��� �����, ���� ��� ����������.
};
func void dia_babo_kap3_unhappy_documents()
{
        B_AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Documents_15_00");  //��� ��� ���� �� ������?
        B_AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Documents_03_01");  //(����������) ��� ������ �� ��������. ��� ��� ������ ����.
        B_AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Documents_15_02");  //�� �����, ������.
        B_AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Documents_03_03");  //���... ���... ��������� ���������� ������. ������ ����������.
        B_AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Documents_15_04");  //� ������ �� ���� ����������.
};
func void dia_babo_kap3_unhappy_canhelpyou()
{
        B_AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_CanHelpYou_15_00"); //����� ����, � ���� ������ ����?
        B_AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_CanHelpYou_03_01"); //�� �������� ���?
        B_AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_CanHelpYou_15_02"); //��... ��������... ��� ������� ��...
        B_AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_CanHelpYou_03_03"); //(��������) ������� ��, � ������� ���� �� ���.
        B_AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_CanHelpYou_15_04"); //�������?
        B_AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_CanHelpYou_03_05"); //��, � ���� �� ��� ����� �����, �� � ��� �� ���� ���� ������ � �����������. � ���� ���� �������� ����������.
        Info_ClearChoices(dia_babo_kap3_unhappy);
        Info_AddChoice(dia_babo_kap3_unhappy,dia_babo_kap3_unhappy_no_description,dia_babo_kap3_unhappy_no); // "� ����� �� ���� ����������� � ����."
        Info_AddChoice(dia_babo_kap3_unhappy,dia_babo_kap3_unhappy_yes_description,dia_babo_kap3_unhappy_yes); // "� ��������."
};
func void dia_babo_kap3_unhappy_no()
{
        B_AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_No_15_00"); //� ����� �� ���� ����������� � ����.
        B_AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_No_03_01"); //����� � ���� ��� ������, ��� �������� ������������ ������.
        Info_ClearChoices(dia_babo_kap3_unhappy);
};
func void dia_babo_kap3_unhappy_yes()
{
        B_AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Yes_15_00");        //� ��������, ��� ����� �������.
        B_AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Yes_03_01");        //(���������) ������?! � ����, � ���� ���������. � ����!
        B_AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Yes_03_02");        //���� ����� ������ ��������, ��� ������ ������ ���� ����. ����� �� ��������� �� � ����, � ��� ����� � �������.
        B_AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Yes_15_03");        //����������. ��������� ��������. � � ���������� �� ���������.
        Info_ClearChoices(dia_babo_kap3_unhappy);
};
instance DIA_BABO_KAP3_HAVEYOURDOCS(C_INFO)
{
        npc = nov_612_babo;
        nr = 31;
        condition = dia_babo_kap3_haveyourdocs_condition;
        information = dia_babo_kap3_haveyourdocs_info;
        permanent = FALSE;
        description = "� ����� ���� �������.";
};
func int dia_babo_kap3_haveyourdocs_condition()
{
        if(((MIS_BABOSDOCS == LOG_RUNNING) && (Npc_HasItems(other,itwr_babosdocs_mis) >= 1)) || ((Npc_HasItems(other,itwr_babospinup_mis) >= 1) && (Npc_HasItems(other,itwr_babosletter_mis) >= 1)))
        {
                return TRUE;
        };
};
func void dia_babo_kap3_haveyourdocs_info()
{
        B_AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_15_00");       //� ����� ���� �������.
        B_AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_03_01");       //������? �������, �� ���� ����. � ���� �� ����, ��� ����������� ����.
        B_AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_15_02");       //��, ��, ������ ���������.
        B_AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_03_03");       //(������) ��� ������������� ���? �� ������? ������ ���.
        Info_ClearChoices(dia_babo_kap3_haveyourdocs);
        Info_AddChoice(dia_babo_kap3_haveyourdocs,dia_babo_kap3_haveyourdocs_keepthem_description,dia_babo_kap3_haveyourdocs_keepthem); // "� ������� �� ���� � ����."
        if(BABOSDOCSOPEN == TRUE)
        {
                Info_AddChoice(dia_babo_kap3_haveyourdocs,dia_babo_kap3_haveyourdocs_iwantmore_description,dia_babo_kap3_haveyourdocs_iwantmore); // "������ �������� ��� �������������� ���� �������."
        };
        Info_AddChoice(dia_babo_kap3_haveyourdocs,dia_babo_kap3_haveyourdocs_heretheyare_description,dia_babo_kap3_haveyourdocs_heretheyare); // "��� �����."
};
func void dia_babo_kap3_haveyourdocs_keepthem()
{
        B_AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_15_00");      //� ������� �� ���� � ���� .
        B_AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_03_01");      //(�����������) ���?! ��� ��� ��� ������? ��� �� �������?
        Info_ClearChoices(dia_babo_kap3_haveyourdocs);
        Info_AddChoice(dia_babo_kap3_haveyourdocs,dia_babo_kap3_haveyourdocs_keepthem_justjoke_description,dia_babo_kap3_haveyourdocs_keepthem_justjoke); // "������ ����."
        Info_AddChoice(dia_babo_kap3_haveyourdocs,dia_babo_kap3_haveyourdocs_keepthem_myconcern_description,dia_babo_kap3_haveyourdocs_keepthem_myconcern); // "��� ��� ����."
        if(IGARAZ_ISPARTNER == LOG_SUCCESS)
        {
                Info_AddChoice(dia_babo_kap3_haveyourdocs,dia_babo_kap3_haveyourdocs_keepthem_partner_description,dia_babo_kap3_haveyourdocs_keepthem_partner); // "������ � � ������ ��������."
        };
};
func void dia_babo_kap3_haveyourdocs_keepthem_justjoke()
{
        B_AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_15_00");     //������ ����.
        B_AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_03_01");     //(�����) ��-��, �� ��� ���-�� �� ������. ��� �� ���?
        B_AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_15_02");     //�����.
        if(Npc_HasItems(other,itwr_babosdocs_mis) >= 1)
        {
                b_giveinvitems(other,self,itwr_babosdocs_mis,1);
        }
        else
        {
                b_giveinvitems(other,self,itwr_babospinup_mis,1);
                b_giveinvitems(other,self,itwr_babosletter_mis,1);
        };
        b_usefakescroll();
        B_AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_03_03");     //� �� ����� ������� ����, �� � ������ ����� ���������.
        B_AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_15_04");     //��� ������. ����������� ������ ���������.
        MIS_BABOSDOCS = LOG_SUCCESS;
        b_giveplayerxp(XP_BABOSDOCS);
        Info_ClearChoices(dia_babo_kap3_haveyourdocs);
};
func void dia_babo_kap3_haveyourdocs_keepthem_myconcern()
{
        B_AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern_15_00");    //��� ��� ����.
        B_AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern_03_01");    //��� ������ ����������� ���. �� �� ������ ����� �������� �� ����.
        B_AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern_15_02");    //��� ��������.
        Info_ClearChoices(dia_babo_kap3_haveyourdocs);
};
func void dia_babo_kap3_haveyourdocs_keepthem_partner()
{
        B_AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_15_00");      //������ � � ������ ��������.
        B_AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_03_01");      //(�����������) ���? �� �� ������ ��������� �� ���� ���.
        B_AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_15_02");      //� � �����, ��� ����. � �������� � ���� ��� ������, ����� ��� ���� ��������� ���, ��� ����.
        B_AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_15_03");      //� ������ ���������� ���������� ����� � ��������.
        B_AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_15_04");      //� �� ���� ��������� ������ ����������.
        B_AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_03_05");      //�� ������. ���������� ������ ������. ����� �������� ����.
        Info_ClearChoices(dia_babo_kap3_haveyourdocs);
        Info_AddChoice(dia_babo_kap3_haveyourdocs,DIALOG_ENDE,dia_babo_kap3_haveyourdocs_end);
        Info_AddChoice(dia_babo_kap3_haveyourdocs,dia_babo_kap3_haveyourdocs_keepthem_partner_keepcalm_description,dia_babo_kap3_haveyourdocs_keepthem_partner_keepcalm); // "�������� ����."
        Info_AddChoice(dia_babo_kap3_haveyourdocs,dia_babo_kap3_haveyourdocs_keepthem_partner_nothingtodo_description,dia_babo_kap3_haveyourdocs_keepthem_partner_nothingtodo); // "���� ��� ����� ��������?"
};
func void dia_babo_kap3_haveyourdocs_end()
{
        AI_StopProcessInfos(self);
};
func void dia_babo_kap3_haveyourdocs_keepthem_partner_keepcalm()
{
        B_AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_KeepCalm_15_00");     //�������� ����.
        B_AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_KeepCalm_03_01");     //� ���� ������ ��� ������.
        AI_StopProcessInfos(self);
};
func void dia_babo_kap3_haveyourdocs_keepthem_partner_nothingtodo()
{
        B_AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_NothingToDo_15_00");   //���� ���, ����� ��������?
        B_AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_NothingToDo_03_01");   //� ��� �������, ��, ������ ���, �� ��������� �� ����.
        AI_StopProcessInfos(self);
};
func void dia_babo_kap3_haveyourdocs_iwantmore()
{
        B_AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_15_00");     //������, �������� ��� ��������������, ���� �������.
        B_AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_03_01");     //�� �� ����� ���������. ���� �� ������?
        B_AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_15_02");     //� ��� � ���� ����?
        B_AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_03_03");     //� ���� ���� ���� 121 ������� ������ - ��� ���, ��� � ���� ����.
        Info_ClearChoices(dia_babo_kap3_haveyourdocs);
        Info_AddChoice(dia_babo_kap3_haveyourdocs,dia_babo_kap3_haveyourdocs_iwantmore_notenough_description,dia_babo_kap3_haveyourdocs_iwantmore_notenough); // "����� ������������."
        Info_AddChoice(dia_babo_kap3_haveyourdocs,dia_babo_kap3_haveyourdocs_iwantmore_thatsenough_description,dia_babo_kap3_haveyourdocs_iwantmore_thatsenough); // "������������."
};
func void dia_babo_kap3_haveyourdocs_iwantmore_notenough()
{
        B_AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_NotEnough_15_00");   //����� ������������.
        B_AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_NotEnough_03_01");   //�� � ���� ��� ������ �����. ���� �� � ���� �� ���� ������, ���� �� ���� �� ���� � ���������.
        Info_ClearChoices(dia_babo_kap3_haveyourdocs);
};
func void dia_babo_kap3_haveyourdocs_iwantmore_thatsenough()
{
        B_AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_ThatsEnough_15_00"); //������������.
        B_AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_ThatsEnough_03_01"); //��� ������, � ������.
        CreateInvItems(self,itsc_mediumheal,1);
        CreateInvItems(self,itmi_gold,121);
        b_giveinvitems(self,other,itsc_mediumheal,1);
        b_giveinvitems(self,other,itmi_gold,121);
        MIS_BABOSDOCS = LOG_SUCCESS;
        b_giveplayerxp(XP_BABOSDOCS);
        Info_ClearChoices(dia_babo_kap3_haveyourdocs);
};
func void dia_babo_kap3_haveyourdocs_heretheyare()
{
        B_AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_15_00");   //���, �����.
        if(Npc_HasItems(other,itwr_babosdocs_mis) >= 1)
        {
                b_giveinvitems(other,self,itwr_babosdocs_mis,1);
        }
        else
        {
                b_giveinvitems(other,self,itwr_babospinup_mis,1);
                b_giveinvitems(other,self,itwr_babosletter_mis,1);
        };
        b_usefakescroll();
        B_AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_01");   //��, ��� �� �����.
        B_AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_02");   //�� ����� ��?
        B_AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_15_03");   //��� ����� �����-�� ��������?
        B_AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_04");   //���, ����� ��� � ���� � �����.
        B_AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_05");   //������ � �������, ��� ����� ����� ����� ��������.
        CreateInvItems(self,itsc_mediumheal,1);
        b_giveinvitems(self,other,itsc_mediumheal,1);
        MIS_BABOSDOCS = LOG_SUCCESS;
        b_giveplayerxp(XP_BABOSDOCS);
        Info_ClearChoices(dia_babo_kap3_haveyourdocs);
};
instance DIA_BABO_KAP3_PERM(C_INFO)
{
        npc = nov_612_babo;
        nr = 39;
        condition = dia_babo_kap3_perm_condition;
        information = dia_babo_kap3_perm_info;
        permanent = TRUE;
        description = "�� ������� ����� �������?";
};
func int dia_babo_kap3_perm_condition()
{
        if(Npc_KnowsInfo(other,dia_babo_kap3_hello))
        {
                return TRUE;
        };
};
func void dia_babo_kap3_perm_info()
{
        B_AI_Output(other,self,"DIA_Babo_Kap3_Perm_15_00");       //�� ������� ����� �������?
        if(hero.guild == GIL_KDF)
        {
                B_AI_Output(self,other,"DIA_Babo_Kap3_Perm_03_01");       //(�������������) ��, �������. ��� ���� � �������� � ���� ������ ������� ��� ����.
                B_AI_Output(self,other,"DIA_Babo_Kap3_Perm_03_02");       //(���������) � �� ���� ���������� ����������, �� � ���� ����� ��� �������.
                B_AI_Output(other,self,"DIA_Babo_Kap3_Perm_15_03");       //������ ����������.
                B_AI_Output(self,other,"DIA_Babo_Kap3_Perm_03_04");       //(����������) �������.
        }
        else
        {
                B_AI_Output(self,other,"DIA_Babo_Kap3_Perm_03_05");       //��� ������, �� ��� ����� ������������ � ������, ����� ��� �� �� ��� �� ��������� �� �������.
                B_AI_Output(self,other,"DIA_Babo_Kap3_Perm_03_06");       //� �� ���� ����� ��������� �� ��������, ����� ��������� ���� ������ � �� ���� ����������.
        };
        AI_StopProcessInfos(self);
};
instance DIA_BABO_KAP4_EXIT(C_INFO)
{
        npc = nov_612_babo;
        nr = 999;
        condition = dia_babo_kap4_exit_condition;
        information = dia_babo_kap4_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_babo_kap4_exit_condition()
{
        if(KAPITEL == 4)
        {
                return TRUE;
        };
};
func void dia_babo_kap4_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_BABO_KAP5_EXIT(C_INFO)
{
        npc = nov_612_babo;
        nr = 999;
        condition = dia_babo_kap5_exit_condition;
        information = dia_babo_kap5_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_babo_kap5_exit_condition()
{
        if(KAPITEL == 5)
        {
                return TRUE;
        };
};
func void dia_babo_kap5_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_BABO_PICKPOCKET(C_INFO)
{
        npc = nov_612_babo;
        nr = 900;
        condition = dia_babo_pickpocket_condition;
        information = dia_babo_pickpocket_info;
        permanent = TRUE;
        description = PICKPOCKET_20;
};
func int dia_babo_pickpocket_condition()
{
        return c_beklauen(17,25);
};
func void dia_babo_pickpocket_info()
{
        Info_ClearChoices(dia_babo_pickpocket);
        Info_AddChoice(dia_babo_pickpocket,DIALOG_BACK,dia_babo_pickpocket_back);
        Info_AddChoice(dia_babo_pickpocket,DIALOG_PICKPOCKET,dia_babo_pickpocket_doit);
};
func void dia_babo_pickpocket_doit()
{
        b_beklauen();
        Info_ClearChoices(dia_babo_pickpocket);
};
func void dia_babo_pickpocket_back()
{
        Info_ClearChoices(dia_babo_pickpocket);
};
