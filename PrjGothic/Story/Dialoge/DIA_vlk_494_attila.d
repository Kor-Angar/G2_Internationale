instance DIA_ATTILA_EXIT(C_INFO)
{
        npc = vlk_494_attila;
        nr = 999;
        condition = dia_attila_exit_condition;
        information = dia_attila_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_attila_exit_condition()
{
        return TRUE;
};
func void dia_attila_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_ATTILA_PICKPOCKET(C_INFO)
{
        npc = vlk_494_attila;
        nr = 900;
        condition = dia_attila_pickpocket_condition;
        information = dia_attila_pickpocket_info;
        permanent = TRUE;
        description = PICKPOCKET_60;
};
func int dia_attila_pickpocket_condition()
{
        return c_beklauen(55,100);
};
func void dia_attila_pickpocket_info()
{
        Info_ClearChoices(dia_attila_pickpocket);
        Info_AddChoice(dia_attila_pickpocket,DIALOG_BACK,dia_attila_pickpocket_back);
        Info_AddChoice(dia_attila_pickpocket,DIALOG_PICKPOCKET,dia_attila_pickpocket_doit);
};
func void dia_attila_pickpocket_doit()
{
        b_beklauen();
        Info_ClearChoices(dia_attila_pickpocket);
};
func void dia_attila_pickpocket_back()
{
        Info_ClearChoices(dia_attila_pickpocket);
};
instance DIA_ATTILA_HALLO(C_INFO)
{
        npc = vlk_494_attila;
        nr = 1;
        condition = dia_attila_hallo_condition;
        information = dia_attila_hallo_info;
        permanent = FALSE;
        important = TRUE;
};
func int dia_attila_hallo_condition()
{
        if(MIS_THIEFGUILD_SUCKED == TRUE)
        {
                return TRUE;
        };
};
func void dia_attila_hallo_info()
{
        B_AI_Output(self,other,"DIA_Attila_Hallo_09_00"); //(��������) ��, �������. � ���� ����, ���������.
        Info_ClearChoices(dia_attila_hallo);
        Info_AddChoice(dia_attila_hallo,dia_attila_hallo_was_description,dia_attila_hallo_was); // "��� ���� ����� �� ����?"
        Info_AddChoice(dia_attila_hallo,dia_attila_hallo_wer_description,dia_attila_hallo_wer); // "��� ��?"
        b_giveplayerxp(XP_ATTILA_METHIM);
};
func void dia_attila_hallo_wer()
{
        B_AI_Output(other,self,"DIA_Attila_Hallo_Wer_15_00");     //��� ��?
        B_AI_Output(self,other,"DIA_Attila_Hallo_Wer_09_01");     //���� ����� ������... �� ����� ��� ��� �����? ���� ����� ������ �� ������.
        B_AI_Output(self,other,"DIA_Attila_Hallo_Wer_09_02");     //�� ��� ������ �����, ���������. (���� �������)
        KNOWS_ATTILA_WER = TRUE;
        Info_ClearChoices(dia_attila_hallo);
        if(KNOWS_ATTILA_WAS == FALSE)
        {
                Info_AddChoice(dia_attila_hallo,dia_attila_hallo_was_description,dia_attila_hallo_was); // "��� ���� ����� �� ����?"
        };
        Info_AddChoice(dia_attila_hallo,dia_attila_hallo_theater_description,dia_attila_hallo_theater); // "� ���� ���� ���� ����?"
};
func void dia_attila_hallo_was()
{
        B_AI_Output(other,self,"DIA_Attila_Hallo_Was_15_00");     //��� ���� ����� �� ����?
        B_AI_Output(self,other,"DIA_Attila_Hallo_Was_09_01");     //� �����, ����� ��������� ���� ��������� �����. � ����� �����, � ��������� ����� ����.
        KNOWS_ATTILA_WAS = TRUE;
        Info_ClearChoices(dia_attila_hallo);
        if(KNOWS_ATTILA_WER == FALSE)
        {
                Info_AddChoice(dia_attila_hallo,dia_attila_hallo_wer_description,dia_attila_hallo_wer); // "��� ��?"
        };
        Info_AddChoice(dia_attila_hallo,dia_attila_hallo_auftrag_description,dia_attila_hallo_auftrag); // "��� ������ ���� �� ���?"
        Info_AddChoice(dia_attila_hallo,dia_attila_hallo_theater_description,dia_attila_hallo_theater); // "� ���� ���� ���� ����?"
};
func void dia_attila_hallo_theater()
{
        B_AI_Output(other,self,"DIA_Attila_Hallo_Theater_15_00"); //� ���� ���� ���� ����?
        B_AI_Output(self,other,"DIA_Attila_Hallo_Theater_09_01"); //�� �� ������ ������� � ���������. ������ ��� ����������� �������� � �������������.
        Info_ClearChoices(dia_attila_hallo);
        Info_AddChoice(dia_attila_hallo,dia_attila_hallo_ende_description,dia_attila_hallo_ende); // "� ������� �����. �����"
        Info_AddChoice(dia_attila_hallo,dia_attila_hallo_auftrag_description,dia_attila_hallo_auftrag); // "��� ������ ���� �� ���?"
        Info_AddChoice(dia_attila_hallo,dia_attila_hallo_warum_description,dia_attila_hallo_warum); // "������ �� ������ ����� ����?"
};
func void dia_attila_hallo_ende()
{
        B_AI_Output(other,self,"DIA_Attila_Hallo_Ende_15_00");    //�, �������, �����...
        B_AI_Output(self,other,"DIA_Attila_Hallo_Ende_09_01");    //�����... � �� ���� ��������� ���� �����. �������. ������ ����� �������.
        AI_DrawWeapon(self);
        Info_ClearChoices(dia_attila_hallo);
        Info_AddChoice(dia_attila_hallo,dia_attila_hallo_auftrag_description,dia_attila_hallo_auftrag); // "��� ������ ���� �� ���?"
        Info_AddChoice(dia_attila_hallo,dia_attila_hallo_warum_description,dia_attila_hallo_warum); // "������ �� ������ ����� ����?"
};
func void dia_attila_hallo_auftrag()
{
        B_AI_Output(other,self,"DIA_Attila_Hallo_Auftrag_15_00"); //��� ������ ���� �� ���?
        B_AI_Output(self,other,"DIA_Attila_Hallo_Auftrag_09_01"); //��� ������� ��������� �������� � ����, ��� � �.
        B_AI_Output(self,other,"DIA_Attila_Hallo_Auftrag_09_02"); //� �������� ����� ��������� ��������, ��� � �� ���� ����� ���������� �� �� ���, �� �� ����������.
        Info_ClearChoices(dia_attila_hallo);
        Info_AddChoice(dia_attila_hallo,dia_attila_hallo_warum_description,dia_attila_hallo_warum); // "������ �� ������ ����� ����?"
};
func void dia_attila_hallo_warum()
{
        B_AI_Output(other,self,"DIA_Attila_Hallo_Warum_15_00");   //������ �� ������ ����� ����?
        if(BETRAYAL_HALVOR == TRUE)
        {
                B_AI_Output(self,other,"DIA_Attila_Hallo_Warum_09_01");   //�� ���� �������. ������ �� ����� � ������. ��� �� ������.
        };
        if(RENGARU_INKNAST == TRUE)
        {
                B_AI_Output(self,other,"DIA_Attila_Hallo_Warum_09_02");   //�� ������ ������� ���������. �� ����� ���� ������ �������, �� ���� �� ��������� ������ �����.
        };
        if(NAGUR_AUSGELIEFERT == TRUE)
        {
                B_AI_Output(self,other,"DIA_Attila_Hallo_Warum_09_03");   //����� ����� �� ������� �� ����� ����. ���-���� �������, ��� ��� ��������������� ������.
        };
        B_AI_Output(self,other,"DIA_Attila_Hallo_Warum_09_04");   //��� ������� ���������� ����. ����� �� ���� ���� ��������� ��� ���� ������, ��� ������� ����.
        Info_ClearChoices(dia_attila_hallo);
        Info_AddChoice(dia_attila_hallo,dia_attila_hallo_gold_description,dia_attila_hallo_gold); // "� ���� ���� ���� ������ - ����� ������."
        Info_AddChoice(dia_attila_hallo,dia_attila_hallo_attacke_description,dia_attila_hallo_attacke); // "��� ��� ���� �� ������ ���� ������."
};
func void dia_attila_hallo_gold()
{
        B_AI_Output(other,self,"DIA_Attila_Hallo_Gold_15_00");    //� ���� ���� ���� ������ - ����� ������.
        B_AI_Output(self,other,"DIA_Attila_Hallo_Gold_09_01");    //������. � �� �� ���� ���� ������. ������������ ����, ������� �� ��������� - ���� �����. � ��������� �� �� ����� ������.
        AI_StopProcessInfos(self);
        b_attack(self,other,AR_NONE,1);
};
func void dia_attila_hallo_attacke()
{
        B_AI_Output(other,self,"DIA_Attila_Hallo_Attacke_15_00"); //��� ��� ���� �� ������ ���� ������.
        if(Npc_HasEquippedWeapon(other) == TRUE)
        {
                B_AI_Output(self,other,"DIA_Attila_Hallo_Attacke_09_01"); //������, ����������� � ����� ��������� �����.
                AI_StopProcessInfos(self);
                b_attack(self,other,AR_NONE,1);
        }
        else
        {
                B_AI_Output(self,other,"DIA_Attila_Hallo_Attacke_09_02"); //�� � ���� ��� �������� ������ �� �����. � ���� �������� ����� ���� �������, ���������. ������ ��� ������.
                AI_StopProcessInfos(self);
                b_attack(self,other,AR_NONE,2);
        };
};
instance DIA_ATTILA_WILLKOMMEN(C_INFO)
{
        npc = vlk_494_attila;
        nr = 1;
        condition = dia_attila_willkommen_condition;
        information = dia_attila_willkommen_info;
        permanent = FALSE;
        important = TRUE;
};
func int dia_attila_willkommen_condition()
{
        if(Npc_IsInState(self,zs_talk) && (MIS_THIEFGUILD_SUCKED == FALSE))
        {
                return TRUE;
        };
};
func void dia_attila_willkommen_info()
{
        B_AI_Output(self,other,"DIA_Attila_Willkommen_09_00");    //��, �������. � ���� ����, ���������.
        b_giveplayerxp(XP_ATTILA_FRIEND);
        B_AI_Output(other,self,"DIA_Attila_Willkommen_15_01");    //��� �� � ��� ���� ����� �� ����?
        B_AI_Output(self,other,"DIA_Attila_Willkommen_09_02");    //��� �������. ����� ���� ��, ��� �� �����. �� ��������� �������� - ���� ���� �� ��� �� ���� �� ����.
        B_AI_Output(self,other,"DIA_Attila_Willkommen_09_03");    //��������� ����������� ���������� ��� ���� ����������. � ��� ���� ���� ����. ��� ��������� ���.
        B_AI_Output(other,self,"DIA_Attila_Willkommen_15_04");    //��, ������ ����� ��� ��� ���.
        B_AI_Output(self,other,"DIA_Attila_Willkommen_09_05");    //� ���� ���� ��� ���� �������. � ��� ��������� � ����� �����, ���������. (���� �������)
        b_giveinvitems(self,other,itke_thiefguildkey_mis,1);
        ATTILA_KEY = TRUE;
        AI_StopProcessInfos(self);
        Npc_ExchangeRoutine(self,"AFTER");
};
instance DIA_ATTILA_NACHSCHLUESSEL(C_INFO)
{
        npc = vlk_494_attila;
        nr = 1;
        condition = dia_attila_nachschluessel_condition;
        information = dia_attila_nachschluessel_info;
        permanent = TRUE;
        important = TRUE;
};
func int dia_attila_nachschluessel_condition()
{
        if(Npc_KnowsInfo(other,dia_attila_wer) && Npc_IsInState(self,zs_talk))
        {
                return TRUE;
        };
};
func void dia_attila_nachschluessel_info()
{
        B_AI_Output(self,other,"DIA_Attila_NachSchluessel_09_00");        //��� ������ ��������� - ����.
        B_AI_Output(self,other,"DIA_Attila_NachSchluessel_09_01");        //�� ��� �����, �����, ���� ���� ����� �����������...
        AI_StopProcessInfos(self);
};
instance DIA_ATTILA_WER(C_INFO)
{
        npc = vlk_494_attila;
        nr = 1;
        condition = dia_attila_wer_condition;
        information = dia_attila_wer_info;
        permanent = FALSE;
        description = "��� ��?";
};
func int dia_attila_wer_condition()
{
        if(Npc_KnowsInfo(other,dia_attila_willkommen))
        {
                return TRUE;
        };
};
func void dia_attila_wer_info()
{
        B_AI_Output(other,self,"DIA_Attila_Hallo_Wer_15_00");     //��� ��?
        B_AI_Output(self,other,"DIA_Attila_Hallo_Wer_09_01");     //���� ����� ������... �� ����� ��� ��� �����? ���� ����� ������ �� ������.
        B_AI_Output(self,other,"DIA_Attila_Hallo_Wer_09_02");     //�� ��� ������ �����, ���������. (���� �������)
        AI_StopProcessInfos(self);
};
