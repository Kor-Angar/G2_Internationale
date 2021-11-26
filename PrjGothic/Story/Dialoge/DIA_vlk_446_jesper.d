instance DIA_JESPER_EXIT(C_INFO)
{
        npc = vlk_446_jesper;
        nr = 999;
        condition = dia_jesper_exit_condition;
        information = dia_jesper_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_jesper_exit_condition()
{
        return TRUE;
};
func void dia_jesper_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_JESPER_PICKPOCKET(C_INFO)
{
        npc = vlk_446_jesper;
        nr = 900;
        condition = dia_jesper_pickpocket_condition;
        information = dia_jesper_pickpocket_info;
        permanent = TRUE;
        description = PICKPOCKET_80;
};
func int dia_jesper_pickpocket_condition()
{
        return c_beklauen(80,180);
};
func void dia_jesper_pickpocket_info()
{
        Info_ClearChoices(dia_jesper_pickpocket);
        Info_AddChoice(dia_jesper_pickpocket,DIALOG_BACK,dia_jesper_pickpocket_back);
        Info_AddChoice(dia_jesper_pickpocket,DIALOG_PICKPOCKET,dia_jesper_pickpocket_doit);
};
func void dia_jesper_pickpocket_doit()
{
        b_beklauen();
        Info_ClearChoices(dia_jesper_pickpocket);
};
func void dia_jesper_pickpocket_back()
{
        Info_ClearChoices(dia_jesper_pickpocket);
};
instance DIA_JESPER_HALLO(C_INFO)
{
        npc = vlk_446_jesper;
        nr = 1;
        condition = dia_jesper_hallo_condition;
        information = dia_jesper_hallo_info;
        permanent = FALSE;
        important = TRUE;
};
func int dia_jesper_hallo_condition()
{
        return TRUE;
};
func void dia_jesper_hallo_info()
{
        B_AI_Output(self,other,"DIA_Jesper_Hallo_09_00"); //��, ��� �� ��� �������? ���� ��� �� �����!
        B_AI_Output(self,other,"DIA_Jesper_Hallo_09_01"); //��� ��� ����������, ��� �� ������� �����?
        Info_ClearChoices(dia_jesper_hallo);
        Info_AddChoice(dia_jesper_hallo,dia_jesper_hallo_kill_description,dia_jesper_hallo_kill); // "� ������ ����� ����."
        Info_AddChoice(dia_jesper_hallo,dia_jesper_hallo_nurso_description,dia_jesper_hallo_nurso); // "� ������ ������������ �����."
        if(ATTILA_KEY == TRUE)
        {
                Info_AddChoice(dia_jesper_hallo,dia_jesper_hallo_willkommen_description,dia_jesper_hallo_willkommen); // "������ ��� ��� ����..."
        }
        else
        {
                Info_AddChoice(dia_jesper_hallo,dia_jesper_hallo_umgelegt_description,dia_jesper_hallo_umgelegt); // "� ��������� ������..."
        };
        DG_GEFUNDEN = TRUE;
};
func void dia_jesper_hallo_kill()
{
        B_AI_Output(other,self,"DIA_Jesper_Hallo_Kill_15_00");    //� ������ ����� ����.
        B_AI_Output(self,other,"DIA_Jesper_Hallo_Kill_09_01");    //�������� ����. �� ��� �������, � ����� ����? ��, �����. ������ �� ����� ���� ������.
        AI_StopProcessInfos(self);
        Npc_ExchangeRoutine(self,"START");
        b_attack(self,other,AR_NONE,1);
};
func void dia_jesper_hallo_nurso()
{
        B_AI_Output(other,self,"DIA_Jesper_Hallo_NurSo_15_00");   //� ������ ������������ �����.
        B_AI_Output(self,other,"DIA_Jesper_Hallo_NurSo_09_01");   //����� �� ����� ������. ��� ������� ������, �������?
        B_AI_Output(self,other,"DIA_Jesper_Hallo_NurSo_09_02");   //��� ��� ������ ���� ������ �� ����� � ����� ���, ����� �� �����?
};
func void dia_jesper_hallo_willkommen()
{
        B_AI_Output(other,self,"DIA_Jesper_Hallo_Willkommen_15_00");      //������ ��� ��� ����. ��� ������ � �����. ��� ��� ��� ����� �� ����?
        B_AI_Output(self,other,"DIA_Jesper_Hallo_Willkommen_09_01");      //����� �� �� ������ ������ ���? �� ��������.
        B_AI_Output(self,other,"DIA_Jesper_Hallo_Willkommen_09_02");      //��� � ������. ���� ����.
        AI_StopProcessInfos(self);
        Npc_ExchangeRoutine(self,"START");
};
func void dia_jesper_hallo_umgelegt()
{
        B_AI_Output(other,self,"DIA_Jesper_Hallo_Umgelegt_15_00");        //� ��������� ������. ��� ��� ��� ���� �� �����������.
        B_AI_Output(self,other,"DIA_Jesper_Hallo_Umgelegt_09_01");        //(� ����������) �� ���� ������?! (������������) �, �����, �� ��� ����� ��� ��������� ����.
        B_AI_Output(self,other,"DIA_Jesper_Hallo_Umgelegt_09_02");        //�� � ���� ������������ ����. ���� �� �������� �� ����, � ���� ����.
        Info_ClearChoices(dia_jesper_hallo);
        Info_AddChoice(dia_jesper_hallo,dia_jesper_hallo_was_description,dia_jesper_hallo_was); // "��� �� ������� � ���� ������ ������� ����?"
        Info_AddChoice(dia_jesper_hallo,dia_jesper_hallo_anfuehrer_description,dia_jesper_hallo_anfuehrer); // "������ ���� � ������ �������."
};
func void dia_jesper_hallo_was()
{
        B_AI_Output(other,self,"DIA_Jesper_Hallo_Was_15_00");     //��� �� ������� � ���� ������ ������� ����?
        B_AI_Output(self,other,"DIA_Jesper_Hallo_Was_09_01");     //(�����) � ���� �����. ��� ���� ������ ������, � � ����� ����� �������� �����.
};
func void dia_jesper_hallo_anfuehrer()
{
        B_AI_Output(other,self,"DIA_Jesper_Hallo_Anfuehrer_15_00");       //������ ���� � ������ �������.
        B_AI_Output(self,other,"DIA_Jesper_Hallo_Anfuehrer_09_01");       //(������� ����) �� - � �������? � ������, ������ ������� ���������� � �����.
        B_AI_Output(self,other,"DIA_Jesper_Hallo_Anfuehrer_09_02");       //��� ������ - � �� ������� �������� ����.
        AI_StopProcessInfos(self);
        Npc_ExchangeRoutine(self,"START");
};
instance DIA_JESPER_BEZAHLEN(C_INFO)
{
        npc = vlk_446_jesper;
        nr = 1;
        condition = dia_jesper_bezahlen_condition;
        information = dia_jesper_bezahlen_info;
        permanent = TRUE;
        description = "�� ������ ������� ���� ����-������?";
};
func int dia_jesper_bezahlen_condition()
{
        if((JOIN_THIEFS == TRUE) && (JESPER_TEACHSNEAK == FALSE) && Npc_KnowsInfo(other,dia_cassia_lernen) && (Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == FALSE))
        {
                return TRUE;
        };
};
func void dia_jesper_bezahlen_info()
{
        B_AI_Output(other,self,"DIA_Jesper_Bezahlen_15_00");      //�� ������ ������� ���� ����-������?
        if(MIS_THIEFGUILD_SUCKED == FALSE)
        {
                B_AI_Output(self,other,"DIA_Jesper_Bezahlen_09_01");      //�������, � ������, ��� ����� �������� - ��� ���� ���������.
                JESPER_TEACHSNEAK = TRUE;
                Info_ClearChoices(dia_jesper_bezahlen);
        }
        else
        {
                B_AI_Output(self,other,"DIA_Jesper_Bezahlen_09_02");      //�� ������ ������, ��� ���������, �� ������� �� ������� �����? ��� ��������� ���� � 100 ������� �����.
                b_say_gold(self,other,JESPER_COST);
                Info_ClearChoices(dia_jesper_bezahlen);
                Info_AddChoice(dia_jesper_bezahlen,dia_jesper_bezahlen_spaeter_description,dia_jesper_bezahlen_spaeter); // "����� ���� ����� ...�����"
                Info_AddChoice(dia_jesper_bezahlen,dia_jesper_bezahlen_okay_description,dia_jesper_bezahlen_okay); // "������ � ���� ��������� �������� ��������� 100 �������."
        };
};
func void dia_jesper_bezahlen_spaeter()
{
        Info_ClearChoices(dia_jesper_bezahlen);
};
func void dia_jesper_bezahlen_okay()
{
        B_AI_Output(other,self,"DIA_Jesper_Bezahlen_Okay_15_00"); //������, � ���� ��������� ��������.
        if(b_giveinvitems(other,self,itmi_gold,100))
        {
                B_AI_Output(other,self,"DIA_Jesper_Bezahlen_Okay_15_01"); //��� ������.
                B_AI_Output(self,other,"DIA_Jesper_Bezahlen_Okay_09_02"); //�������, ����� ������ �����.
                JESPER_TEACHSNEAK = TRUE;
                Info_ClearChoices(dia_jesper_bezahlen);
        }
        else
        {
                B_AI_Output(self,other,"DIA_Jesper_Bezahlen_Okay_09_03"); //��� ������ �� �� ������� ������ ���������.
                Info_ClearChoices(dia_jesper_bezahlen);
        };
};
instance DIA_JESPER_SCHLEICHEN(C_INFO)
{
        npc = vlk_446_jesper;
        nr = 10;
        condition = dia_jesper_schleichen_condition;
        information = dia_jesper_schleichen_info;
        permanent = TRUE;
        description = "����� ���� ��������.";
};
var int dia_jesper_schleichen_permanent;
func int dia_jesper_schleichen_condition()
{
        if((JESPER_TEACHSNEAK == TRUE) && (DIA_JESPER_SCHLEICHEN_PERMANENT == FALSE))
        {
                return TRUE;
        };
};
func void dia_jesper_schleichen_info()
{
        B_AI_Output(other,self,"DIA_Jesper_Schleichen_15_00");    //����� ���� ��������.
        if(b_teachthieftalent(self,other,NPC_TALENT_SNEAK))
        {
                B_AI_Output(self,other,"DIA_Jesper_Schleichen_09_01");    //������ �������� ����� ����� ��� ������ ����. ��������, ���� �� ������ �� ������ ����.
                B_AI_Output(self,other,"DIA_Jesper_Schleichen_09_02");    //��� ������ ������, ��� �� ��� ������� ������. ����������� ����� ���� ����� ������ ����.
                B_AI_Output(self,other,"DIA_Jesper_Schleichen_09_03");    //������ ����� �� ���������, ����� �� ������� ����, � �� ������� �������� ����������������.
                DIA_JESPER_SCHLEICHEN_PERMANENT = TRUE;
        };
};
instance DIA_JESPER_KILLER(C_INFO)
{
        npc = vlk_446_jesper;
        nr = 2;
        condition = dia_jesper_killer_condition;
        information = dia_jesper_killer_info;
        permanent = FALSE;
        important = TRUE;
};
func int dia_jesper_killer_condition()
{
        if(Npc_IsDead(cassia) || Npc_IsDead(ramirez))
        {
                return TRUE;
        };
};
func void dia_jesper_killer_info()
{
        if(Npc_IsDead(cassia) && Npc_IsDead(ramirez))
        {
                B_AI_Output(self,other,"DIA_Jesper_Killer_09_00");        //�� ���� ���� ������. ����� �� ������ ���, ������?
                B_AI_Output(self,other,"DIA_Jesper_Killer_09_01");        //� �������� ���� � ������� �������.
        }
        else if(Npc_IsDead(cassia))
        {
                B_AI_Output(self,other,"DIA_Jesper_Killer_09_02");        //������! �� ���� ������! �� �� ���� ���� �� ����!
                AI_StopProcessInfos(self);
                b_attack(self,other,AR_NONE,1);
        }
        else if(Npc_IsDead(ramirez))
        {
                B_AI_Output(self,other,"DIA_Jesper_Killer_09_03");        //� ����� ������� � ��������� � ����� ��� ���� ������ ������, ��� �� ������ ���� �����������.
                B_AI_Output(self,other,"DIA_Jesper_Killer_09_04");        //� �� ���� � ���� ���, ������� ���! �� ������ ������ ����� ��������!
                AI_StopProcessInfos(self);
                b_attack(self,other,AR_NONE,1);
        };
};
instance DIA_JESPER_BOGEN(C_INFO)
{
        npc = vlk_446_jesper;
        nr = 10;
        condition = dia_jesper_bogen_condition;
        information = dia_jesper_bogen_info;
        permanent = FALSE;
        description = "�����, �� ������ �� ������ � ���� �������?";
};
func int dia_jesper_bogen_condition()
{
        if((Npc_HasItems(other,itrw_bow_l_03_mis) < 1) && (MIS_BOSPER_BOGEN == LOG_RUNNING) && (JOIN_THIEFS == TRUE))
        {
                return TRUE;
        };
};
func void dia_jesper_bogen_info()
{
        B_AI_Output(other,self,"DIA_Jesper_Bogen_15_00"); //�����, �� ������ �� ������ � ���� �������?
        B_AI_Output(self,other,"DIA_Jesper_Bogen_09_01"); //�� ������ � ���� ��� ����� ������������? ��, � �������� ��� � ���� �� ��������.
        B_AI_Output(self,other,"DIA_Jesper_Bogen_09_02"); //�� ��� ����� ���� ������. �� ������ ������� ���, ���� �� ������� ���� ������.
        B_AI_Output(self,other,"DIA_Jesper_Bogen_09_03"); //��, ��, ������� ��, ���� ������ ������. ���� �������� �������� �����. (����������) �������, � ���� ���� �������.
        Wld_InsertNpc(giant_rat,"NW_CITY_KANAL_ROOM_01_01");
        Wld_InsertNpc(giant_rat,"NW_CITY_KANAL_ROOM_01_02");
        Wld_InsertNpc(giant_rat,"NW_CITY_KANAL_ROOM_01_03");
};
instance DIA_JESPER_TUER(C_INFO)
{
        npc = vlk_446_jesper;
        nr = 10;
        condition = dia_jesper_tuer_condition;
        information = dia_jesper_tuer_info;
        permanent = FALSE;
        description = "� ��� �� ���� �������� ������?";
};
func int dia_jesper_tuer_condition()
{
        if((MIS_CASSIARING == LOG_SUCCESS) && (KAPITEL >= 3))
        {
                return TRUE;
        };
};
func void dia_jesper_tuer_info()
{
        B_AI_Output(other,self,"DIA_Jesper_Tuer_15_00");  //� ��� �� ���� �������� ������?
        B_AI_Output(self,other,"DIA_Jesper_Tuer_09_01");  //(����������) �� ��� ��������� ������ - ������ �������-������������ �������.
        B_AI_Output(self,other,"DIA_Jesper_Tuer_09_02");  //�� �������� ����� ���������� ������� ����� �� ����, ��� �� ��� ��� ������ �� ������� ������� ���.
        B_AI_Output(self,other,"DIA_Jesper_Tuer_09_03");  //� ���������, �� ���-�� ������� - � ��� �������� �� ������, ��� ��, ��������, � ����.
        B_AI_Output(self,other,"DIA_Jesper_Tuer_09_04");  //�� ���� �� ������ ���������� ������� ��� ������, ��� ���� �� ���� �������.
        b_giveinvitems(self,other,itke_fingers,1);
};
instance DIA_JESPER_TRUHE(C_INFO)
{
        npc = vlk_446_jesper;
        nr = 10;
        condition = dia_jesper_truhe_condition;
        information = dia_jesper_truhe_info;
        permanent = FALSE;
        description = "��� ������� ������� ������.";
};
func int dia_jesper_truhe_condition()
{
        if((Mob_HasItems("MOB_FINGERS",itmi_gold) < 300) || (Mob_HasItems("MOB_FINGERS",itmi_silvercup) < 5) || (Mob_HasItems("MOB_FINGERS",itmi_goldcup) < 1) || (Mob_HasItems("MOB_FINGERS",itam_strg_01) < 1) || (Mob_HasItems("MOB_FINGERS",itpo_perm_dex) < 1))
        {
                return TRUE;
        };
};
func void dia_jesper_truhe_info()
{
        B_AI_Output(other,self,"DIA_Jesper_Truhe_15_00"); //��� ������� ������� ������.
        B_AI_Output(self,other,"DIA_Jesper_Truhe_09_01"); //��� ����������! ������, � ��� �������� ����� ������-�����������.
        B_AI_Output(self,other,"DIA_Jesper_Truhe_09_02"); //����������!
        b_giveplayerxp(XP_JESPERTRUHE);
};
