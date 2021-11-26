instance DIA_TALBIN_EXIT(C_INFO)
{
        npc = vlk_4130_talbin;
        nr = 999;
        condition = dia_talbin_exit_condition;
        information = dia_talbin_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_talbin_exit_condition()
{
        if(KAPITEL < 3)
        {
                return TRUE;
        };
};
func void dia_talbin_exit_info()
{
        AI_StopProcessInfos(self);
};
var int talbin_runs;
instance DIA_TALBIN_HALLO(C_INFO)
{
        npc = vlk_4130_talbin;
        nr = 5;
        condition = dia_talbin_hallo_condition;
        information = dia_talbin_hallo_info;
        important = TRUE;
};
func int dia_talbin_hallo_condition()
{
        if(KAPITEL <= 3)
        {
                return TRUE;
        };
};
func void dia_talbin_hallo_info()
{
        B_AI_Output(self,other,"DIA_Talbin_HALLO_07_00"); //����! �� ���� ������!
        B_AI_Output(other,self,"DIA_Talbin_HALLO_15_01"); //��! ��� �������!
        B_AI_Output(self,other,"DIA_Talbin_HALLO_07_02"); //��! ��� ���� ��������� �������, ��? ������� � ������ ���� �� ������ �� ���� ��������, ��� ��������� ������� �����.
        B_AI_Output(self,other,"DIA_Talbin_HALLO_07_03"); //�� ������ � ����, ��� �� �� ���� �� ���. �� ��������� ������� �����������!
};
instance DIA_TALBIN_WASMACHTIHR(C_INFO)
{
        npc = vlk_4130_talbin;
        nr = 6;
        condition = dia_talbin_wasmachtihr_condition;
        information = dia_talbin_wasmachtihr_info;
        description = "� �� ����� �� ��������, ������� �� �����, ���� ������ ��������� �����.";
};
func int dia_talbin_wasmachtihr_condition()
{
        if(TALBIN_RUNS == FALSE)
        {
                return TRUE;
        };
};
func void dia_talbin_wasmachtihr_info()
{
        B_AI_Output(other,self,"DIA_Talbin_WASMACHTIHR_15_00");   //� �� ����� �� ��������, ������� �� �����, ���� ������ ��������� �����.
        B_AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_07_01");   //��-��! �� - �� ������. �� ��� ��� ��� ������ - � �� ���� ��������� ����� ������!
        B_AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_07_02");   //������� � ������� ����� � ��������� ���, ��� ���� ����� �����.
        if(Npc_IsDead(engrom) == FALSE)
        {
                B_AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_07_03");   //��� ����, �������, ����� �������� �������.
        };
        B_AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_07_04");   //������ ����� � ����� ������. �������� �������.
        Info_ClearChoices(dia_talbin_wasmachtihr);
        Info_AddChoice(dia_talbin_wasmachtihr,DIALOG_BACK,dia_talbin_wasmachtihr_back);
        Info_AddChoice(dia_talbin_wasmachtihr,dia_talbin_wasmachtihr_gut_description,dia_talbin_wasmachtihr_gut); // "�� ��� ������� �� ��������� ���������� ���� �����."
        Info_AddChoice(dia_talbin_wasmachtihr,dia_talbin_wasmachtihr_strf_description,dia_talbin_wasmachtihr_strf); // "�� ������ ��������� ��-�� �������?"
};
func void dia_talbin_wasmachtihr_back()
{
        Info_ClearChoices(dia_talbin_wasmachtihr);
};
func void dia_talbin_wasmachtihr_strf()
{
        B_AI_Output(other,self,"DIA_Talbin_WASMACHTIHR_strf_15_00");      //�� ������ ��������� ��-�� �������?
        B_AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_strf_07_01");      //���, ���! � ���� �� ����? � ������ ����� ������������� �����.
        B_AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_strf_07_02");      //���-�� ������ ���, ��� ����� ������ ��������� ������ �� �������.
        B_AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_strf_07_03");      //������� ������, ���� �� ���������, ��� � ���� � ����.
        B_AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_strf_07_04");      //�� ������������, ��� ����� ���������� ����� ����� ����, ��� ��������� ��� ������� ����, - ��� ���� �������, ���� ������� ������� ������!
        B_AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_strf_07_05");      //� � �������� ���� ������� �������� ����.
        B_AI_Output(other,self,"DIA_Talbin_WASMACHTIHR_strf_15_06");      //� ���� ���� ��������!
};
func void dia_talbin_wasmachtihr_gut()
{
        B_AI_Output(other,self,"DIA_Talbin_WASMACHTIHR_gut_15_00");       //�� ��� �������, �� ��������� ���������� ���� �����.
        B_AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_gut_07_01");       //� ��! � �����, ��� �� �� ��� ����������. �������� �� ���� �������� �����, ����� � ���� �������� ������.
        B_AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_gut_07_02");       //������, ��� �� ������������ ������������ � ����. ���. ����, ��������, ��� ������ ����������.
};
instance DIA_TALBIN_SORRYFORENGROM(C_INFO)
{
        npc = vlk_4130_talbin;
        nr = 7;
        condition = dia_talbin_sorryforengrom_condition;
        information = dia_talbin_sorryforengrom_info;
        description = "������ ���� ���� �������?";
};
func int dia_talbin_sorryforengrom_condition()
{
        if(Npc_KnowsInfo(other,dia_talbin_wasmachtihr) && (Npc_IsDead(engrom) == FALSE) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (KAPITEL <= 3) && (TALBIN_RUNS == FALSE))
        {
                return TRUE;
        };
};
func void dia_talbin_sorryforengrom_info()
{
        B_AI_Output(other,self,"DIA_Talbin_SORRYFORENGROM_15_00");        //������ ���� ���� �������?
        B_AI_Output(self,other,"DIA_Talbin_SORRYFORENGROM_07_01");        //������ ��� �� ������ ����� �� ����, �� ������� ��������.
        B_AI_Output(self,other,"DIA_Talbin_SORRYFORENGROM_07_02");        //� ��� �� ������ � ��� ���������. �������� ������� �� ������� �� �����.
};
instance DIA_TALBIN_WASJAGDIHR(C_INFO)
{
        npc = vlk_4130_talbin;
        nr = 8;
        condition = dia_talbin_wasjagdihr_condition;
        information = dia_talbin_wasjagdihr_info;
        description = "� �� ���� �� ��������� � ����?";
};
func int dia_talbin_wasjagdihr_condition()
{
        if(Npc_KnowsInfo(other,dia_talbin_wasmachtihr) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (TALBIN_RUNS == FALSE))
        {
                return TRUE;
        };
};
func void dia_talbin_wasjagdihr_info()
{
        B_AI_Output(other,self,"DIA_Talbin_WASJAGDIHR_15_00");    //� �� ���� �� ��������� � ����?
        B_AI_Output(self,other,"DIA_Talbin_WASJAGDIHR_07_01");    //��� �� ������! ������ ������ ����� ����, � �� �������, �� ���� � �������. �� ��������, ������� ��!
        B_AI_Output(self,other,"DIA_Talbin_WASJAGDIHR_07_02");    //���� ������ ������� ��������, �� �� ���� ����� �������.
        B_AI_Output(self,other,"DIA_Talbin_WASJAGDIHR_07_03");    //������ ����� � ��������� �� �����������. � �� �������������, � �� ��� ��� ���� �� ������!
};
instance DIA_TALBIN_ENGROMANGRY(C_INFO)
{
        npc = vlk_4130_talbin;
        nr = 9;
        condition = dia_talbin_engromangry_condition;
        information = dia_talbin_engromangry_info;
        description = "��� �������, ���� �������� �����-�� �����������!";
};
func int dia_talbin_engromangry_condition()
{
        if(Npc_KnowsInfo(other,dia_engrom_whataboutleaving) && Npc_KnowsInfo(other,dia_talbin_sorryforengrom) && (Npc_IsDead(engrom) == FALSE) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (KAPITEL <= 3) && (TALBIN_RUNS == FALSE))
        {
                return TRUE;
        };
};
func void dia_talbin_engromangry_info()
{
        B_AI_Output(other,self,"DIA_Talbin_ENGROMANGRY_15_00");   //��� �������, ���� �������� �����-�� �����������!
        B_AI_Output(self,other,"DIA_Talbin_ENGROMANGRY_07_01");   //�����. �� ���������� ���, ��� �� ���� ���������. ������ � ����� �� ���� ������ ���.
        B_AI_Output(self,other,"DIA_Talbin_ENGROMANGRY_07_02");   //�� � ���-������ ��������!
};
instance DIA_TALBIN_ASKTEACHER(C_INFO)
{
        npc = vlk_4130_talbin;
        nr = 10;
        condition = dia_talbin_askteacher_condition;
        information = dia_talbin_askteacher_info;
        description = "�� ������ ������� ���� ���������?";
};
func int dia_talbin_askteacher_condition()
{
        if(Npc_KnowsInfo(other,dia_talbin_wasjagdihr) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (TALBIN_RUNS == FALSE))
        {
                return TRUE;
        };
};
func void dia_talbin_askteacher_info()
{
        B_AI_Output(other,self,"DIA_Talbin_AskTeacher_15_00");    //�� ������ ������� ���� ���������?
        B_AI_Output(self,other,"DIA_Talbin_AskTeacher_07_01");    //�������! ��� � ���� �������. ������. �� �� ���������!
        B_AI_Output(other,self,"DIA_Talbin_AskTeacher_15_02");    //��� �� ������ �� ���?
        B_AI_Output(self,other,"DIA_Talbin_AskTeacher_07_03");    //� ���� ������ ��� ������ ����� ���� ��������? ����� ����, ����� ����? ��, ����� ����. ����� �� ����� �� ���� �����...
        B_AI_Output(other,self,"DIA_Talbin_AskTeacher_15_04");    //� ��������, ��� ����� �������.
        Log_CreateTopic(TOPIC_TEACHER,LOG_NOTE);
        b_logentry(TOPIC_TEACHER,TOPIC_TEACHER_description_592); // "������ ����� ������� ���� �������� ������ ��������."
};
instance DIA_TALBIN_PAYTEACHER(C_INFO)
{
        npc = vlk_4130_talbin;
        nr = 11;
        condition = dia_talbin_payteacher_condition;
        information = dia_talbin_payteacher_info;
        permanent = TRUE;
        description = "��� ���� ���. �� ������� ���� ������?";
};
var int dia_talbin_payteacher_noperm;
func int dia_talbin_payteacher_condition()
{
        if(Npc_KnowsInfo(other,dia_talbin_askteacher) && (DIA_TALBIN_PAYTEACHER_NOPERM == FALSE) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (TALBIN_RUNS == FALSE))
        {
                return TRUE;
        };
};
func void dia_talbin_payteacher_info()
{
        if(b_giveinvitems(other,self,itfo_cheese,1))
        {
                B_AI_Output(other,self,"DIA_Talbin_PayTeacher_15_00");    //��� ���� ���. �� ������� ���� ������?
                B_AI_Output(self,other,"DIA_Talbin_PayTeacher_07_01");    //� ���� ������������� ���� ���? ��, ��������� � �� �� ������ ���������. �������. ��, � ��� ������... ��, ��, �������!
                TALBIN_TEACHANIMALTROPHY = TRUE;
                DIA_TALBIN_PAYTEACHER_NOPERM = TRUE;
        }
        else
        {
                B_AI_Output(other,self,"DIA_Talbin_PayTeacher_15_02");    //� ���� ������ ��� ����!
                B_AI_Output(self,other,"DIA_Talbin_PayTeacher_07_03");    //��� ���� �� ������� ������, ����� ���� �������. �����, �������, ����� ����������� ���!
        };
};
instance DIA_TALBIN_TEACHHUNTING(C_INFO)
{
        npc = vlk_4130_talbin;
        nr = 12;
        condition = dia_talbin_teachhunting_condition;
        information = dia_talbin_teachhunting_info;
        permanent = TRUE;
        description = "���� �� ������ ������� ����?";
};
func int dia_talbin_teachhunting_condition()
{
        if((TALBIN_TEACHANIMALTROPHY == TRUE) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (TALBIN_RUNS == FALSE))
        {
                return TRUE;
        };
};
func void dia_talbin_teachhunting_info()
{
        B_AI_Output(other,self,"DIA_Talbin_TEACHHUNTING_15_00");  //���� �� ������ ������� ����?
        if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CLAWS] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_SHADOWHORN] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_HEART] == FALSE))
        {
                B_AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_07_01");  //� ��� �� ������ �����?
                Info_AddChoice(dia_talbin_teachhunting,DIALOG_BACK,dia_talbin_teachhunting_back);
                if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CLAWS] == FALSE)
                {
                        Info_AddChoice(dia_talbin_teachhunting,b_buildlearnstring("�������� ������",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY)),dia_talbin_teachhunting_claws);
                };
                if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE)
                {
                        Info_AddChoice(dia_talbin_teachhunting,b_buildlearnstring("������ ����",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY)),dia_talbin_teachhunting_fur);
                };
                if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_SHADOWHORN] == FALSE)
                {
                        Info_AddChoice(dia_talbin_teachhunting,b_buildlearnstring("��� ���������",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY)),dia_talbin_teachhunting_shadowhorn);
                };
                if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_HEART] == FALSE)
                {
                        Info_AddChoice(dia_talbin_teachhunting,b_buildlearnstring("�������� ������",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY)),dia_talbin_teachhunting_heart);
                };
        }
        else
        {
                B_AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_07_02");  //� ��������� ����. �� ��� ������ ���, ���� � ���� �������. �� ��� ��, ������� �� ���!
        };
};
func void dia_talbin_teachhunting_back()
{
        Info_ClearChoices(dia_talbin_teachhunting);
};
func void dia_talbin_teachhunting_claws()
{
        if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_CLAWS))
        {
                B_AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_Claws_07_00");    //�������� ����� - ��� ������. ������ ������ �� ��������� � ���������� ��� � �����.
                B_AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_Claws_07_01");    //����� ������ ��� � ��������� ��������� ������.
        };
        Info_ClearChoices(dia_talbin_teachhunting);
};
func void dia_talbin_teachhunting_fur()
{
        if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_FUR))
        {
                B_AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_Fur_07_00");      //����� ����� ����� ����� � �������, ������ ������ ����� ����� ������...
                B_AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_Fur_07_01");      //...����� ������ �� ������ ���� � ���������� ����� � ���� �������.
        };
        Info_ClearChoices(dia_talbin_teachhunting);
};
func void dia_talbin_teachhunting_shadowhorn()
{
        if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_SHADOWHORN))
        {
                B_AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_ShadowHorn_07_00");       //���� ���������� ����� �������, � �� ��� ������ ������ � �����������.
        };
        Info_ClearChoices(dia_talbin_teachhunting);
};
func void dia_talbin_teachhunting_heart()
{
        if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_HEART))
        {
                B_AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_Heart_07_00");    //������ ���������� ������� ����� �����, � �� ����� ������ ������. ���� ���������, ����� ��������� ������� ���, �������� � ������ �������.
        };
        Info_ClearChoices(dia_talbin_teachhunting);
};
instance DIA_TALBIN_KAP3_EXIT(C_INFO)
{
        npc = vlk_4130_talbin;
        nr = 999;
        condition = dia_talbin_kap3_exit_condition;
        information = dia_talbin_kap3_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_talbin_kap3_exit_condition()
{
        if(KAPITEL == 3)
        {
                return TRUE;
        };
};
func void dia_talbin_kap3_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_TALBIN_KAP4_EXIT(C_INFO)
{
        npc = vlk_4130_talbin;
        nr = 999;
        condition = dia_talbin_kap4_exit_condition;
        information = dia_talbin_kap4_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_talbin_kap4_exit_condition()
{
        if(KAPITEL == 4)
        {
                return TRUE;
        };
};
func void dia_talbin_kap4_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_TALBIN_KAP4_WASNEUES(C_INFO)
{
        npc = vlk_4130_talbin;
        nr = 13;
        condition = dia_talbin_kap4_wasneues_condition;
        information = dia_talbin_kap4_wasneues_info;
        description = "����� ����� �� ��������?";
};
func int dia_talbin_kap4_wasneues_condition()
{
        if((KAPITEL >= 4) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (TALBIN_RUNS == FALSE))
        {
                return TRUE;
        };
};
func void dia_talbin_kap4_wasneues_info()
{
        B_AI_Output(other,self,"DIA_Talbin_KAP4_WASNEUES_15_00"); //����� ����� �� ��������?
        B_AI_Output(self,other,"DIA_Talbin_KAP4_WASNEUES_07_01"); //�������. ������� ����� ���� ����� �������� �����! ��� ����������� � ������������� ��������, � � ��� ��� ����� ������ � ���������� ���.
};
instance DIA_TALBIN_KAP4_WASWOLLTENDJG(C_INFO)
{
        npc = vlk_4130_talbin;
        nr = 14;
        condition = dia_talbin_kap4_waswolltendjg_condition;
        information = dia_talbin_kap4_waswolltendjg_info;
        description = "� ��� ���� '�������� ������' ���� ����� �����?";
};
func int dia_talbin_kap4_waswolltendjg_condition()
{
        if(Npc_KnowsInfo(other,dia_talbin_kap4_wasneues) && (KAPITEL >= 4) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (TALBIN_RUNS == FALSE))
        {
                return TRUE;
        };
};
func void dia_talbin_kap4_waswolltendjg_info()
{
        B_AI_Output(other,self,"DIA_Talbin_KAP4_WASWOLLTENDJG_15_00");    //� ��� ���� '�������� ������' ���� ����� �����?
        B_AI_Output(self,other,"DIA_Talbin_KAP4_WASWOLLTENDJG_07_01");    //��� ���������� ���� ������ �������� � ����������. � � ���-�� ��� ����� � ������� �����!
        B_AI_Output(self,other,"DIA_Talbin_KAP4_WASWOLLTENDJG_07_02");    //��� ������� ���-�� � ���, ��� ���������� ����� �������. ������ ���� ������, ������ ��� ������� �����, �� ��� �� ������� � ���� ������� �������!
        if(KAPITEL == 4)
        {
                b_logentry(TOPIC_DRAGONHUNTER,TOPIC_DRAGONHUNTER_description_593); // "��������� ��������� �� �������� ������������ �� ���������� ������� �������."
        };
};
instance DIA_TALBIN_WOENGROM(C_INFO)
{
        npc = vlk_4130_talbin;
        nr = 15;
        condition = dia_talbin_woengrom_condition;
        information = dia_talbin_woengrom_info;
        description = "�� ������ ����?";
};
func int dia_talbin_woengrom_condition()
{
        if(Npc_KnowsInfo(other,dia_talbin_wasmachtihr) && (KAPITEL >= 4) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (ENGROMISGONE == TRUE) && (TALBIN_RUNS == FALSE))
        {
                return TRUE;
        };
};
func void dia_talbin_woengrom_info()
{
        B_AI_Output(other,self,"DIA_Talbin_WOENGROM_15_00");      //�� ������ ����?
        B_AI_Output(self,other,"DIA_Talbin_WOENGROM_07_01");      //��. ��� �������� ������ ����. ����� �� ������, ��� ��� ���� ������� - ���-�� ����� ������� ������� � ���.
        B_AI_Output(self,other,"DIA_Talbin_WOENGROM_07_02");      //� ������ �� ������. � ������� ��� ����, ��� �� ������ ����� �� �����...
        B_AI_Output(self,other,"DIA_Talbin_WOENGROM_07_03");      //...� ����� �� ���������� �����. ������� �� ����, ���� �� ����������.
        B_AI_Output(self,other,"DIA_Talbin_WOENGROM_07_04");      //���� �� ���-������ ������� �������, ����� ���, ��� �� ��� ��� ������ ��� ����� �������.
        if(Npc_KnowsInfo(other,dia_engrom_whataboutleaving))
        {
                B_AI_Output(other,self,"DIA_Talbin_WOENGROM_15_05");      //�� � ���� ���� �����������, ��� �� �� ��������� ������� ������, ���� ���� ��� ��� � ������.
                B_AI_Output(self,other,"DIA_Talbin_WOENGROM_07_06");      //� �� ������: � ���� ����� �������.
        };
        MIS_TABIN_LOOKFORENGROM = LOG_RUNNING;
};
instance DIA_TALBIN_FOUNDENGROM(C_INFO)
{
        npc = vlk_4130_talbin;
        nr = 16;
        condition = dia_talbin_foundengrom_condition;
        information = dia_talbin_foundengrom_info;
        description = "� ����� ������ �������� �������.";
};
func int dia_talbin_foundengrom_condition()
{
        if(Npc_KnowsInfo(other,dia_talbin_woengrom) && ((NPCOBSESSEDBYDMT_ENGROM == TRUE) || Npc_HasItems(other,itat_talbinslurkerskin)) && (KAPITEL >= 4) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (TALBIN_RUNS == FALSE))
        {
                return TRUE;
        };
};
func void dia_talbin_foundengrom_info()
{
        B_AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_00");   //� ����� ������ �������� �������.
        B_AI_Output(self,other,"DIA_Talbin_FOUNDENGROM_07_01");   //��? ��� ��?
        if(Npc_IsDead(engrom))
        {
                B_AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_02");   //�� �����.
        }
        else
        {
                B_AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_03");   //� �� �����, ��� �� �����-������ ��� �������.
        };
        if(b_giveinvitems(other,self,itat_talbinslurkerskin,1))
        {
                B_AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_04");   //���. � ����� ��� ��� ��� ����� �������.
        };
        if(hero.guild == GIL_KDF)
        {
                B_AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_05");   //������ �������� ��.
                B_AI_Output(self,other,"DIA_Talbin_FOUNDENGROM_07_06");   //������? ��� ��� �����?
                B_AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_07");   //����������� �����������. ��� ��� ��������� ������.
        };
        B_AI_Output(self,other,"DIA_Talbin_FOUNDENGROM_07_08");   //�, �����. ��� ����� ���������� ������, ���� ���� � ��� ���� ����� ���� ������. ������ ��� �������!
        AI_StopProcessInfos(self);
        Log_CreateTopic(TOPIC_TALBIN_RUNS,LOG_MISSION);
        Log_SetTopicStatus(TOPIC_TALBIN_RUNS,LOG_RUNNING);
        b_logentry(TOPIC_TALBIN_RUNS,TOPIC_TALBIN_RUNS_description_594); // "������ ������� �� ������ �������� ����� ����� ������ ��� ����� �� ��� �� ����� ������ ��� �������� ���. � ����� �� ���������� � �������."
        b_giveplayerxp(XP_AMBIENT);
        Npc_ExchangeRoutine(self,"FleePass");
        Wld_InsertNpc(snapper,"START");
        TALBIN_RUNS = TRUE;
};
instance DIA_TALBIN_WOHIN(C_INFO)
{
        npc = vlk_4130_talbin;
        nr = 17;
        condition = dia_talbin_wohin_condition;
        information = dia_talbin_wohin_info;
        permanent = TRUE;
        description = "���� �� ��������? ";
};
func int dia_talbin_wohin_condition()
{
        if(Npc_KnowsInfo(other,dia_talbin_foundengrom) && (TALBIN_FOLLOWSTHROUGHPASS == 0))
        {
                return TRUE;
        };
};
func void dia_talbin_wohin_info()
{
        B_AI_Output(other,self,"DIA_Talbin_WOHIN_15_00"); //���� �� ��������?
        if(Npc_GetDistToWP(self,"START") < 1000)
        {
                B_AI_Output(self,other,"DIA_Talbin_WOHIN_07_01"); //������ ���� �� �������. ����������!!
                Info_ClearChoices(dia_talbin_wohin);
                Info_AddChoice(dia_talbin_wohin,dia_talbin_wohin__description,dia_talbin_wohin_); // "� ���� ��� ������� �� ����."
                Info_AddChoice(dia_talbin_wohin,dia_talbin_wohin_durch_description,dia_talbin_wohin_durch); // "������ ��� ������."
                Info_AddChoice(dia_talbin_wohin,dia_talbin_wohin_ok_description,dia_talbin_wohin_ok); // "������."
        }
        else
        {
                B_AI_Output(self,other,"DIA_Talbin_WOHIN_07_02"); //� ������ ��������� ������, ����� ������!
                AI_StopProcessInfos(self);
        };
};
func void dia_talbin_wohin_ok()
{
        B_AI_Output(other,self,"DIA_Talbin_WOHIN_ok_15_00");      //������.
        B_AI_Output(self,other,"DIA_Talbin_WOHIN_ok_07_01");      //�������. � ������ ����� �� �����.
        AI_StopProcessInfos(self);
        Npc_ExchangeRoutine(self,"IntoPass");
        TALBIN_FOLLOWSTHROUGHPASS = LOG_RUNNING;
        self.flags = NPC_FLAG_IMMORTAL;
};
func void dia_talbin_wohin_durch()
{
        B_AI_Output(other,self,"DIA_Talbin_WOHIN_durch_15_00");   //������ ��� ������.
        B_AI_Output(self,other,"DIA_Talbin_WOHIN_durch_07_01");   //��� ��� �����. � �� �� �� ��� �� ����� �� ���� ����.
};
func void dia_talbin_wohin_()
{
        B_AI_Output(other,self,"DIA_Talbin_WOHIN_schwein_15_00"); //� ���� ��� ������� �� ����.
        B_AI_Output(self,other,"DIA_Talbin_WOHIN_schwein_07_01"); //�� ���������� ���� ����� �������?! �� ������ ������ � ��� �� ���!
        TALBIN_FOLLOWSTHROUGHPASS = LOG_OBSOLETE;
        AI_StopProcessInfos(self);
};
instance DIA_TALBIN_VERSCHWINDE(C_INFO)
{
        npc = vlk_4130_talbin;
        nr = 15;
        condition = dia_talbin_verschwinde_condition;
        information = dia_talbin_verschwinde_info;
        permanent = TRUE;
        description = "��.";
};
func int dia_talbin_verschwinde_condition()
{
        if(TALBIN_FOLLOWSTHROUGHPASS == LOG_OBSOLETE)
        {
                return TRUE;
        };
};
func void dia_talbin_verschwinde_info()
{
        B_AI_Output(other,self,"DIA_Talbin_VERSCHWINDE_15_00");   //��.
        B_AI_Output(self,other,"DIA_Talbin_VERSCHWINDE_07_01");   //����������. � ��������� � ��� ����, ������!
        AI_StopProcessInfos(self);
};
instance DIA_TALBIN_KAP5_EXIT(C_INFO)
{
        npc = vlk_4130_talbin;
        nr = 999;
        condition = dia_talbin_kap5_exit_condition;
        information = dia_talbin_kap5_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_talbin_kap5_exit_condition()
{
        if(KAPITEL == 5)
        {
                return TRUE;
        };
};
func void dia_talbin_kap5_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_TALBIN_KAP6_EXIT(C_INFO)
{
        npc = vlk_4130_talbin;
        nr = 999;
        condition = dia_talbin_kap6_exit_condition;
        information = dia_talbin_kap6_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_talbin_kap6_exit_condition()
{
        if(KAPITEL == 6)
        {
                return TRUE;
        };
};
func void dia_talbin_kap6_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_TALBIN_PICKPOCKET(C_INFO)
{
        npc = vlk_4130_talbin;
        nr = 900;
        condition = dia_talbin_pickpocket_condition;
        information = dia_talbin_pickpocket_info;
        permanent = TRUE;
        description = PICKPOCKET_40;
};
func int dia_talbin_pickpocket_condition()
{
        return c_beklauen(40,25);
};
func void dia_talbin_pickpocket_info()
{
        Info_ClearChoices(dia_talbin_pickpocket);
        Info_AddChoice(dia_talbin_pickpocket,DIALOG_BACK,dia_talbin_pickpocket_back);
        Info_AddChoice(dia_talbin_pickpocket,DIALOG_PICKPOCKET,dia_talbin_pickpocket_doit);
};
func void dia_talbin_pickpocket_doit()
{
        b_beklauen();
        Info_ClearChoices(dia_talbin_pickpocket);
};
func void dia_talbin_pickpocket_back()
{
        Info_ClearChoices(dia_talbin_pickpocket);
};
