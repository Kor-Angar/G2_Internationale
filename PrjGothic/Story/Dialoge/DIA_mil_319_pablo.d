instance DIA_PABLO_EXIT(C_INFO)
{
        npc = mil_319_pablo;
        nr = 999;
        condition = dia_pablo_exit_condition;
        information = dia_pablo_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_pablo_exit_condition()
{
        return TRUE;
};
func void dia_pablo_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_PABLO_PICKPOCKET(C_INFO)
{
        npc = mil_319_pablo;
        nr = 900;
        condition = dia_pablo_pickpocket_condition;
        information = dia_pablo_pickpocket_info;
        permanent = TRUE;
        description = "(������� ���� ���� ����� �������)";
};
func int dia_pablo_pickpocket_condition()
{
        if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itke_city_tower_01) >= 1) && (other.attribute[ATR_DEXTERITY] >= (20 - THEFTDIFF)))
        {
                return TRUE;
        };
};
func void dia_pablo_pickpocket_info()
{
        Info_ClearChoices(dia_pablo_pickpocket);
        Info_AddChoice(dia_pablo_pickpocket,DIALOG_BACK,dia_pablo_pickpocket_back);
        Info_AddChoice(dia_pablo_pickpocket,DIALOG_PICKPOCKET,dia_pablo_pickpocket_doit);
};
func void dia_pablo_pickpocket_doit()
{
        if(other.attribute[ATR_DEXTERITY] >= 20)
        {
                b_giveinvitems(self,other,itke_city_tower_01,1);
                b_givethiefxp();
                Info_ClearChoices(dia_pablo_pickpocket);
        }
        else
        {
                AI_StopProcessInfos(self);
                b_attack(self,other,AR_THEFT,1);
        };
};
func void dia_pablo_pickpocket_back()
{
        Info_ClearChoices(dia_pablo_pickpocket);
};
var int pablo_belogen;
instance DIA_PABLO_WANTED(C_INFO)
{
        npc = mil_319_pablo;
        nr = 1;
        condition = dia_pablo_wanted_condition;
        information = dia_pablo_wanted_info;
        important = TRUE;
};
func int dia_pablo_wanted_condition()
{
        if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
        {
                return TRUE;
        };
};
func void dia_pablo_wanted_info()
{
        B_AI_Output(self,other,"DIA_Pablo_WANTED_12_00"); //��, ��, ������� - ��� �������, � ���� ����.
        B_AI_Output(other,self,"DIA_Pablo_WANTED_15_01"); //��� ���� �����?
        B_AI_Output(self,other,"DIA_Pablo_WANTED_12_02"); //� ���-�� ��� ����� ���� ����... �� - �����!
        B_UseFakeHeroFace();
        B_AI_Output(self,other,"DIA_Pablo_WANTED_12_03"); //��� - �� ����� ���� ������ � ������ �� ��������, �� ������� ���������� ��������� ���� ����� - ������� ����� ����� �� ����.
        b_giveinvitems(self,other,itwr_poster_mis,1);
        B_AI_Output(self,other,"DIA_Pablo_WANTED_12_04"); //��-��������, ��� ����� ������ ����.
        Info_ClearChoices(dia_pablo_wanted);
        Info_AddChoice(dia_pablo_wanted,dia_pablo_wanted_nothing_description,dia_pablo_wanted_nothing); // "��� ����� ��� �� ����������."
        Info_AddChoice(dia_pablo_wanted,dia_pablo_wanted_irony_description,dia_pablo_wanted_irony); // "�� � ��� �� �� ���� ������� �� ���������."
};
func void dia_pablo_wanted_nothing()
{
        B_AI_Output(other,self,"DIA_Pablo_WANTED_NOTHING_15_00"); //���, �����, ��� �� ����������. �� ���� ��� � �������...
        B_AI_Output(self,other,"DIA_Pablo_WANTED_NOTHING_12_01"); //��� �������, ���������.
        B_AI_Output(self,other,"DIA_Pablo_Add_12_00");    //�� ���� ��� ��� �� ���� ���������� - � ���� � ���� ��������� �������� - ���������� ������ �� �� �������. ����� � ��� ���� ���������� �������.
        B_AI_Output(self,other,"DIA_Pablo_WANTED_NOTHING_12_03"); //� ������, ������� �������� � ����� ��������, ����� ����� �� ������������� - �������, � ���� ���������.
        PABLO_BELOGEN = TRUE;
        AI_StopProcessInfos(self);
};
func void dia_pablo_wanted_irony()
{
        B_AI_Output(other,self,"DIA_Pablo_WANTED_IRONY_15_00");   //��, � ��� �� �� ���� ������� �� ���������.
        B_AI_Output(self,other,"DIA_Pablo_WANTED_IRONY_12_01");   //����� ������... ��� ���� ������ ���� ����� �� ����?
        B_AI_Output(other,self,"DIA_Pablo_Add_15_01");    //������ �� ���. ��� ���� ����� � ��� �� ��������, ����� ���?
        B_AI_Output(self,other,"DIA_Pablo_WANTED_IRONY_12_03");   //��� - ��� ������.
        B_AI_Output(other,self,"DIA_Pablo_WANTED_IRONY_15_04");   //��, ����� �� ������� ����� �� ������.
        B_AI_Output(self,other,"DIA_Pablo_Add_12_02");    //���� � ���� �����-�� �������� - ��� � �������� � ������ �����. ��������, �� ������ ������. �� ������� ��� � ��������.
        AI_StopProcessInfos(self);
};
instance DIA_PABLO_BANDITEN(C_INFO)
{
        npc = mil_319_pablo;
        nr = 3;
        condition = dia_pablo_banditen_condition;
        information = dia_pablo_banditen_info;
        permanent = FALSE;
        description = "��� �� ������ �� ���� ��������?";
};
func int dia_pablo_banditen_condition()
{
        return TRUE;
};
func void dia_pablo_banditen_info()
{
        B_AI_Output(other,self,"DIA_Pablo_Add_15_03");    //��� �� ������ �� ���� ��������?
        B_AI_Output(self,other,"DIA_Pablo_Add_12_04");    //��� ��� ������ �� ���� �������� �������. �� ����� ����������� �� ��������� �����.
        B_AI_Output(self,other,"DIA_Pablo_Add_12_05");    //����� �� ��� �������� ���� ������ � �����, � ������ �������������� � �����, ���������.
        B_AI_Output(self,other,"DIA_Pablo_Add_12_06");    //�� ������ ����� ������� ���������� ������� ����� ������.
        B_AI_Output(self,other,"DIA_Pablo_Add_12_07");    //��� ������ �� ���� �� ��������� ���� ���� �� ���������� �� ��������� ������.
};
instance DIA_PABLO_HAKONBANDITS(C_INFO)
{
        npc = mil_319_pablo;
        nr = 3;
        condition = dia_pablo_hakonbandits_condition;
        information = dia_pablo_hakonbandits_info;
        permanent = FALSE;
        description = "��� �� ������ � ��������, ���������� �������� ������?";
};
func int dia_pablo_hakonbandits_condition()
{
        if(Npc_KnowsInfo(other,dia_hakon_miliz) && Npc_KnowsInfo(other,dia_pablo_banditen))
        {
                return TRUE;
        };
};
func void dia_pablo_hakonbandits_info()
{
        B_AI_Output(other,self,"DIA_Pablo_Add_15_20");    //��� �� ������ � ��������, ���������� �������� ������?
        B_AI_Output(self,other,"DIA_Pablo_Add_12_21");    //��, ��� ����... �� ��������� ���...
        B_AI_Output(self,other,"DIA_Pablo_Add_12_22");    //��������� � ����, ������ ��� ������������ �� ����������� ��������� �� ���������.
        B_AI_Output(self,other,"DIA_Pablo_Banditen_12_01");       //��� ����� ������� � ���� ���� � ������ �� ������������ ������.
        B_AI_Output(self,other,"DIA_Pablo_Banditen_12_02");       //���-��, ��� ���� ������� ��������� �� � ��������� �� ����. �� ��� �������� �������� ������ � ���� � ������.
        B_AI_Output(self,other,"DIA_Pablo_Banditen_12_03");       //��� ������ ������� ����� ������ ������ � ��� ������� ������.
        b_logentry(TOPIC_HAKONBANDITEN,TOPIC_HAKONBANDITEN_description_262); // "������� ���������� ������ ���������� ���-�� � ���� ���������� �� ������."
        if(PABLO_ANDREMELDEN == FALSE)
        {
                B_AI_Output(self,other,"DIA_Pablo_Add_12_23");    //�� ���� ��� ���-���...
                B_AI_Output(self,other,"DIA_Pablo_Banditen_12_04");       //����� ���������� ������� ������� � ��������.
                B_AI_Output(other,self,"DIA_Pablo_Banditen_15_05");       //��� ��������, ��� ��� ����� ����������� ������������ ���������� ������ � ����� � ��������� ��...
                B_AI_Output(self,other,"DIA_Pablo_Banditen_12_06");       //��, �� �����������, ��� � ��� ���� ���� ������� � ������. �� ��� ���� �� ������� ������� ���.
                B_AI_Output(self,other,"DIA_Pablo_Banditen_12_07");       //���� ���� ������� �������� ���-������ �� ���� ����, �����, ��� ���� ����� �������� ������� �� ������ ����� �������� ����������.
                b_logentry(TOPIC_HAKONBANDITEN,TOPIC_HAKONBANDITEN_description_263); // "��� ������� �������� ������� � ������� � ���-�� �� ��������� �������. ���� ����� �������� ������� �� ������ ����� ������."
        };
};
instance DIA_PABLO_MYBANDITS(C_INFO)
{
        npc = mil_319_pablo;
        nr = 4;
        condition = dia_pablo_mybandits_condition;
        information = dia_pablo_mybandits_info;
        permanent = FALSE;
        description = "� ������ ������ �������, � ������� ����� ������ � ���� ������������?";
};
func int dia_pablo_mybandits_condition()
{
        if(Npc_KnowsInfo(other,dia_pablo_banditen) && Npc_KnowsInfo(other,dia_pablo_wanted))
        {
                return TRUE;
        };
};
func void dia_pablo_mybandits_info()
{
        B_AI_Output(other,self,"DIA_Pablo_Add_15_08");    //� ������ ������ �������, � ������� ����� ������ � ���� ������������?
        if(PABLO_BELOGEN == TRUE)
        {
                B_AI_Output(self,other,"DIA_Pablo_Add_12_09");    //�-��! ��� ��� ��� �� ���� ���������� ���. � ������ �� ����� ��� �� �������, �?
                B_AI_Output(self,other,"DIA_Pablo_Add_12_10");    //(�������������) �� ��� ���� �����������?
                B_AI_Output(other,self,"DIA_Pablo_Add_15_11");    //� �� ���� - ������!
                B_AI_Output(self,other,"DIA_Pablo_Add_12_12");    //��, ��. �������. � ����, ����� �� ���-��� �����. ���� �� � �����, ��� �� ��� ���������� ���� ��������, �� �� ��� ������� �� ��������.
                B_AI_Output(self,other,"DIA_Pablo_Add_12_13");    //�� �� ��, ��� ����� �������� �� ���� ��������� ����� �����...
                PABLO_ANDREMELDEN = TRUE;
                B_AI_Output(self,other,"DIA_Pablo_Add_12_14");    //�� - ������� �� ���� ������...
        };
        B_AI_Output(self,other,"DIA_Pablo_Add_12_15");    //�� ����� �� ���������� �� �������� ���������.
        B_AI_Output(self,other,"DIA_Pablo_Add_12_16");    //�� ��� ���� �� ������ �� ����� �����.
        B_AI_Output(self,other,"DIA_Pablo_Add_12_17");    //� �����, ��� ���� ������ �����, ������� ������ � ����� ����� ����� �����.
        B_AI_Output(self,other,"DIA_Pablo_Add_12_18");    //�� ���� �� �������� ����������� ����, ������� ��� ���� ������������. ��� ���������� ����� ������� ������� �� ���� ������!
        B_AI_Output(other,self,"DIA_Pablo_Add_15_19");    //� ������� ���.
};
instance DIA_PABLO_PERM(C_INFO)
{
        npc = mil_319_pablo;
        nr = 1;
        condition = dia_pablo_perm_condition;
        information = dia_pablo_perm_info;
        permanent = TRUE;
        description = "��� ��������?";
};
func int dia_pablo_perm_condition()
{
        return TRUE;
};
func void dia_pablo_perm_info()
{
        B_AI_Output(other,self,"DIA_Pablo_Perm_15_00");   //��� ����������?
        if(KAPITEL == 3)
        {
                if(MIS_RESCUEBENNET != LOG_SUCCESS)
                {
                        if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
                        {
                                B_AI_Output(self,other,"DIA_Pablo_Perm_12_01");   //� ������ �������, ��� ���� ��������� ������ ��������.
                                B_AI_Output(self,other,"DIA_Pablo_Perm_12_02");   //������ ����� ��������� ����� ������ ����. ������ �� ��� ���������� ��� ��� � ��������.
                        }
                        else if(hero.guild == GIL_KDF)
                        {
                                B_AI_Output(self,other,"DIA_Pablo_Perm_12_03");   //� ������� �������� ��������� ��������������� �������� ������.
                                B_AI_Output(self,other,"DIA_Pablo_Perm_12_04");   //�� � ����, ��� ������� �������� ������������ ��������� ��� ����� ������.
                        }
                        else
                        {
                                B_AI_Output(self,other,"DIA_Pablo_Perm_12_05");   //��� �� ��� ����������? ���� �� ����������� ���������� ������ ������ ��������, ����� ���� ������ �� ����.
                        };
                }
                else
                {
                        B_AI_Output(self,other,"DIA_Pablo_Perm_12_06");   //��� �������� ����. ������ ��� �������� �������� ��� ���� � ������.
                        B_AI_Output(self,other,"DIA_Pablo_Perm_12_07");   //���� �� ���� �� ������� ����� ���������� ������, ����� ���� �� �������� �� ������ ������.
                };
        }
        else if(KAPITEL == 5)
        {
                B_AI_Output(self,other,"DIA_Pablo_Perm_12_08");   //� �� ����, ��� ����� � ����, ���� �������� ����� ������.
        }
        else if(hero.guild == GIL_KDF)
        {
                B_AI_Output(self,other,"DIA_Pablo_Perm_12_09");   //�� ������ ������������ �� ���, �� ������� ��� ���������, ����� ���� ����� �� ����������� � ������ ��� ��������.
        }
        else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
        {
                B_AI_Output(self,other,"DIA_Pablo_Perm_12_10");   //���������� ����� ���� ��� ��������. �� ���� �� �������� � ����� ��� ��.
        }
        else
        {
                B_AI_Output(self,other,"DIA_Pablo_Perm_12_11");   //���� ��� ��������. ������ ������� � ������ ���������� ��� ��������� ��������.
        };
};
