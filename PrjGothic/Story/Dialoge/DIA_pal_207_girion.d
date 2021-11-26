instance DIA_GIRION_EXIT(C_INFO)
{
        npc = pal_207_girion;
        nr = 999;
        condition = dia_girion_exit_condition;
        information = dia_girion_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_girion_exit_condition()
{
        return TRUE;
};
func void dia_girion_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_GIRION_HALLO(C_INFO)
{
        npc = pal_207_girion;
        nr = 2;
        condition = dia_girion_hallo_condition;
        information = dia_girion_hallo_info;
        permanent = FALSE;
        important = TRUE;
};
func int dia_girion_hallo_condition()
{
        if(Npc_IsInState(self,zs_talk) && (MIS_SHIPISFREE == FALSE))
        {
                return TRUE;
        };
};
func void dia_girion_hallo_info()
{
        B_AI_Output(self,other,"DIA_Girion_Hallo_08_00"); //� ������, ������ ��� ��������� ������� � ������� ������. �� ������ ������ �� ���������� ����?
};
instance DIA_GIRION_CANTEACH(C_INFO)
{
        npc = pal_207_girion;
        nr = 5;
        condition = dia_girion_canteach_condition;
        information = dia_girion_canteach_info;
        permanent = TRUE;
        description = "�� ������ ������� ����?";
};
func int dia_girion_canteach_condition()
{
        if(GIRION_TEACH2H == FALSE)
        {
                return TRUE;
        };
};
func void dia_girion_canteach_info()
{
        B_AI_Output(other,self,"DIA_Girion_CanTeach_15_00");      //�� ������ ������� ����?
        if(hero.guild == GIL_PAL)
        {
                B_AI_Output(self,other,"DIA_Girion_CanTeach_08_01");      //��� ������, ��� �� ������ ��������� ������ ������������ �� ���� ������ ������. ��� � �������� ���������� ����� ������.
                B_AI_Output(self,other,"DIA_Girion_CanTeach_08_02");      //� ����� ����. �������� �� ���, ����� ������ �����.
                GIRION_TEACH2H = TRUE;
                b_logentry(TOPIC_CITYTEACHER,TOPIC_CITYTEACHER_description_331); // "������� ������ ����� ������� ���� ��������� �������� ��������� �������."
        }
        else
        {
                B_AI_Output(self,other,"DIA_Girion_CanTeach_08_03");      //���� �� ������ ��������� ����-������, ���� ����� �������� ������� �� �� ������ ������.
                B_AI_Output(self,other,"DIA_Girion_CanTeach_08_04");      //� ����, � �� �������.
        };
};
instance DIA_GIRION_TEACH(C_INFO)
{
        npc = pal_207_girion;
        nr = 100;
        condition = dia_girion_teach_condition;
        information = dia_girion_teach_info;
        permanent = TRUE;
        description = "� ����� � ��������.";
};
var int dia_girion_teach_permanent;
func int dia_girion_teach_condition()
{
        if((GIRION_TEACH2H == TRUE) && (DIA_GIRION_TEACH_PERMANENT == FALSE))
        {
                return TRUE;
        };
};
var int girion_merk2h;
func void dia_girion_teach_info()
{
        GIRION_MERK2H = other.hitchance[NPC_TALENT_2H];
        B_AI_Output(other,self,"DIA_Girion_Teach_15_00"); //� ����� � ��������.
        Info_ClearChoices(dia_girion_teach);
        Info_AddChoice(dia_girion_teach,DIALOG_BACK,dia_girion_teach_back);
        Info_AddChoice(dia_girion_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_girion_teach_2h_1);
        Info_AddChoice(dia_girion_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_girion_teach_2h_5);
};
func void dia_girion_teach_back()
{
        if(other.hitchance[NPC_TALENT_2H] >= 90)
        {
                B_AI_Output(self,other,"DIA_DIA_Girion_Teach_08_00");     //������-�� ������, ���� �������� ��� �� ���������, �� � ������ ������ �� ���� ������� ����.
                B_AI_Output(self,other,"DIA_DIA_Girion_Teach_08_01");     //���� �� ������ �������� ���� ���������� ��� ������, ���� ����� �������� ���������� ������� ����.
                B_AI_Output(other,self,"DIA_DIA_Girion_Teach_15_02");     //��� ��� ����� ������ ��������?
                B_AI_Output(self,other,"DIA_DIA_Girion_Teach_08_03");     //���� ����� - ������-������. ��, ��������� ������ ������� ����.
                DIA_GIRION_TEACH_PERMANENT = TRUE;
        };
        Info_ClearChoices(dia_girion_teach);
};
func void dia_girion_teach_2h_1()
{
        b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,90);
        if(other.hitchance[NPC_TALENT_2H] > GIRION_MERK2H)
        {
                if(GIRION_LABERCOUNT == 0)
                {
                        B_AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_1_08_00");        //�������� � ������. ��� - ���� �����, � ��� �� ����� ��� �����?
                };
                if(GIRION_LABERCOUNT == 1)
                {
                        B_AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_1_08_01");        //���� ��������� � ����� � ���. ������� ������ ����������.
                };
                if(GIRION_LABERCOUNT == 2)
                {
                        B_AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_1_08_02");        //������� �� ������� � ��� ����������������. ����������, ������� �� ����� �������.
                };
                if(GIRION_LABERCOUNT == 3)
                {
                        B_AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_1_08_03");        //������� ������ ����� � ���. �� ������� �� �������� ���, � ������� �� ����� ��������.
                };
                GIRION_LABERCOUNT = GIRION_LABERCOUNT + 1;
                if(GIRION_LABERCOUNT >= 3)
                {
                        GIRION_LABERCOUNT = 0;
                };
        };
        Info_ClearChoices(dia_girion_teach);
        Info_AddChoice(dia_girion_teach,DIALOG_BACK,dia_girion_teach_back);
        Info_AddChoice(dia_girion_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_girion_teach_2h_1);
        Info_AddChoice(dia_girion_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_girion_teach_2h_5);
};
func void dia_girion_teach_2h_5()
{
        b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,90);
        if(other.hitchance[NPC_TALENT_2H] > GIRION_MERK2H)
        {
                if(GIRION_LABERCOUNT == 0)
                {
                        B_AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_5_08_00");        //������� ��������� �� ������ �����, �� � �������.
                };
                if(GIRION_LABERCOUNT == 1)
                {
                        B_AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_5_08_01");        //�� ������ ��������, ����� ����� ���������.
                };
                if(GIRION_LABERCOUNT == 2)
                {
                        B_AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_5_08_02");        //�����, ���� �� ���������� ������, �� ������������� ������ ���������� � �� ����� ��� ����� �������������� ����.
                };
                if(GIRION_LABERCOUNT == 3)
                {
                        B_AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_5_08_03");        //����������� - ��� ������ ������.
                };
                GIRION_LABERCOUNT = GIRION_LABERCOUNT + 1;
                if(GIRION_LABERCOUNT >= 3)
                {
                        GIRION_LABERCOUNT = 0;
                };
        };
        Info_ClearChoices(dia_girion_teach);
        Info_AddChoice(dia_girion_teach,DIALOG_BACK,dia_girion_teach_back);
        Info_AddChoice(dia_girion_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_girion_teach_2h_1);
        Info_AddChoice(dia_girion_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_girion_teach_2h_5);
};
instance DIA_GIRION_CATCHPLAYERSTOLENSHIP(C_INFO)
{
        npc = pal_207_girion;
        nr = 5;
        condition = dia_girion_catchplayerstolenship_condition;
        information = dia_girion_catchplayerstolenship_info;
        important = TRUE;
};
func int dia_girion_catchplayerstolenship_condition()
{
        if((KAPITEL >= 5) && (MIS_SHIPISFREE == TRUE) && (Npc_GetDistToWP(self,"NW_CITY_WAY_TO_SHIP_25") < 1000))
        {
                return TRUE;
        };
};
func void dia_girion_catchplayerstolenship_info()
{
        B_AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_08_00"); //��! �� ������ ������� ���, ��� �� ������� �����?
        Info_ClearChoices(dia_girion_catchplayerstolenship);
        Info_AddChoice(dia_girion_catchplayerstolenship,dia_girion_catchplayerstolenship_no_description,dia_girion_catchplayerstolenship_no); // "� �� ���� � ��� �� ��������."
        Info_AddChoice(dia_girion_catchplayerstolenship,dia_girion_catchplayerstolenship_weg_description,dia_girion_catchplayerstolenship_weg); // "����� � ���� ������ ��� ��� �������� ����� ����."
        Info_AddChoice(dia_girion_catchplayerstolenship,dia_girion_catchplayerstolenship_ship_description,dia_girion_catchplayerstolenship_ship); // "��� ����� ���� �������."
};
func void dia_girion_catchplayerstolenship_no()
{
        B_AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_no_15_00");      //� �� ����, � ��� �� ��������.
        B_AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_no_08_01");      //� ������ � ���, ��� �� ������ � ����������� �������. ��� ���� ����� ������.
        if(hero.guild == GIL_KDF)
        {
                B_AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_no_08_02");      //���� �������� �� ��, ��� �� ���, � �� ������� ����.
        };
};
var int girion_wantstokillsc;
func void dia_girion_catchplayerstolenship_weg()
{
        B_AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_weg_15_00");     //����� � ���� ������, ��� ��� �������� ����� ����.
        B_AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_weg_08_01");     //��������, ���� ������� �������� ������ �������, �� �� ���� ���� ��� ������ �� ����������, ��� ��������� ����.
        if(hero.guild == GIL_PAL)
        {
                B_AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_weg_08_02");     //���� ���� �� ���� �� ���, ��� �� ���� ���� ����� �������� ������������� ������. ����, ��������� ���������.
        };
        AI_StopProcessInfos(self);
        b_attack(self,other,AR_NONE,1);
        GIRION_WANTSTOKILLSC = TRUE;
};
func void b_girionstayonship()
{
        B_AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_09");    //����� �� �������� � ���� �����, �� ������� ���� ������� ������� ���, �������?
};
func void dia_girion_catchplayerstolenship_ship()
{
        B_AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_00");    //��� ����� ���� �������. ������� � ������� ���.
        if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
        {
                B_AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_01");    //�� �� ������ ������� ���. ��� ��������� ��� ����...
        }
        else
        {
                B_AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_02");    //��� �� ������?! ��, ������� �������...
        };
        B_AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_03");    //���� � ������ �������� ������������, ����� ������������� ����������� ������. � ��� ���. ��� ������ ������. ������ ������ - ���� ������ ����.
        B_AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_04");    //��������� ���� ������ ���� ����� �� ������� ���������� ������. � ������� ���� � ������ ����� ����� �����.
        B_AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_05");    //���� ������������� �� ���, ���� ��� �������� ����������� � �����. �������.
        B_AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_06");    //�-�-�. ������, � ���� ��� ������.
        B_AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_07");    //���������.
        B_AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_08");    //�����, ������. � ������������ � ����, �� ��� ����� �������.
        b_girionstayonship();
        b_giveplayerxp(XP_CREWMEMBER_SUCCESS);
        B_AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_10");    //� �������� ���.
        B_AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_11");    //����� ����� ��, ��� ������. � � ������� ���� �����.
        AI_StopProcessInfos(self);
        Npc_ExchangeRoutine(self,"Ship");
        CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
        GIRION_ISONBOARD = LOG_SUCCESS;
};
instance DIA_GIRION_VERRAT(C_INFO)
{
        npc = pal_207_girion;
        nr = 2;
        condition = dia_girion_verrat_condition;
        information = dia_girion_verrat_info;
        important = TRUE;
        permanent = TRUE;
};
func int dia_girion_verrat_condition()
{
        if(GIRION_WANTSTOKILLSC == TRUE)
        {
                return TRUE;
        };
};
func void dia_girion_verrat_info()
{
        B_AI_Output(self,other,"DIA_Girion_Verrat_08_00");        //���������!
        AI_StopProcessInfos(self);
        b_attack(self,other,AR_NONE,1);
};
instance DIA_GIRION_ONSHIP(C_INFO)
{
        npc = pal_207_girion;
        nr = 2;
        condition = dia_girion_onship_condition;
        information = dia_girion_onship_info;
        important = TRUE;
        permanent = TRUE;
};
func int dia_girion_onship_condition()
{
        if(Npc_IsInState(self,zs_talk) && (GIRION_ISONBOARD == LOG_SUCCESS))
        {
                return TRUE;
        };
};
func void dia_girion_onship_info()
{
        b_girionstayonship();
        AI_StopProcessInfos(self);
};
instance DIA_GIRION_PICKPOCKET(C_INFO)
{
        npc = pal_207_girion;
        nr = 900;
        condition = dia_girion_pickpocket_condition;
        information = dia_girion_pickpocket_info;
        permanent = TRUE;
        description = PICKPOCKET_80;
};
func int dia_girion_pickpocket_condition()
{
        return c_beklauen(73,280);
};
func void dia_girion_pickpocket_info()
{
        Info_ClearChoices(dia_girion_pickpocket);
        Info_AddChoice(dia_girion_pickpocket,DIALOG_BACK,dia_girion_pickpocket_back);
        Info_AddChoice(dia_girion_pickpocket,DIALOG_PICKPOCKET,dia_girion_pickpocket_doit);
};
func void dia_girion_pickpocket_doit()
{
        b_beklauen();
        Info_ClearChoices(dia_girion_pickpocket);
};
func void dia_girion_pickpocket_back()
{
        Info_ClearChoices(dia_girion_pickpocket);
};
