instance DIA_KURGAN_EXIT(C_INFO)
{
        npc = djg_708_kurgan;
        nr = 999;
        condition = dia_kurgan_exit_condition;
        information = dia_kurgan_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_kurgan_exit_condition()
{
        return TRUE;
};
func void dia_kurgan_exit_info()
{
        AI_StopProcessInfos(self);
        Npc_SetRefuseTalk(biff,400);
};
instance DIA_KURGAN_HELLO(C_INFO)
{
        npc = djg_708_kurgan;
        condition = dia_kurgan_hello_condition;
        information = dia_kurgan_hello_info;
        important = TRUE;
};
func int dia_kurgan_hello_condition()
{
        return TRUE;
};
func void dia_kurgan_hello_info()
{
        B_AI_Output(self,other,"DIA_Kurgan_HELLO_01_00"); //��, ��! ������, ���� �����!
        B_AI_Output(other,self,"DIA_Kurgan_HELLO_15_01"); //��� �� ���� ������ �������?
        B_AI_Output(self,other,"DIA_Kurgan_HELLO_01_02"); //� ���� �������, ��� ���������� ����� ����� �� ����� ������ ��������� �� ����� ��������. ��� ����� ������ ����� ������ � ���������.
        B_AI_Output(self,other,"DIA_Kurgan_HELLO_01_03"); //�� ������ ��� � ��������. ��� ������ ��������� ��������������.
        b_logentry(TOPIC_DRAGONHUNTER,TOPIC_DRAGONHUNTER_description_135); // "� ����� � ������ �������� ��� ����������� ������ ��������� �� ��������. ��� ����� ������ ��������� �� ����� ��� �� ���������� ������� ����������� �� ��������."
};
instance DIA_KURGAN_ELSE(C_INFO)
{
        npc = djg_708_kurgan;
        condition = dia_kurgan_else_condition;
        information = dia_kurgan_else_info;
        description = "�� ������ ������� ��� ���-������, ���� � ��� �� ����?";
};
func int dia_kurgan_else_condition()
{
        return TRUE;
};
func void dia_kurgan_else_info()
{
        B_AI_Output(other,self,"DIA_Kurgan_ELSE_15_00");  //�� ������ ������� ��� ���-������, ���� � ��� �� ����?
        B_AI_Output(self,other,"DIA_Kurgan_ELSE_01_01");  //� ���� ���� ���� ������ �����, ������ ���������.
        B_AI_Output(self,other,"DIA_Kurgan_ELSE_01_02");  //��� ����� �� ����� �����, ������� ������ � �������, ��� ������ ����������� ���� ������ ����� �������.
        B_AI_Output(self,other,"DIA_Kurgan_ELSE_01_03");  //����������� �����, ��� ������ ��� ��������� ������.
};
instance DIA_KURGAN_LEADER(C_INFO)
{
        npc = djg_708_kurgan;
        condition = dia_kurgan_leader_condition;
        information = dia_kurgan_leader_info;
        description = "�� ��� �����, �� ��������?";
};
func int dia_kurgan_leader_condition()
{
        return TRUE;
};
func void dia_kurgan_leader_info()
{
        B_AI_Output(other,self,"DIA_Kurgan_Leader_15_00");        //�� ��� �����, �� ��������?
        B_AI_Output(self,other,"DIA_Kurgan_Leader_01_01");        //� ���, ����� �� ��������? ������� ���. ��� ����� �� ����� ����������� �������, ��������� �������.
        B_AI_Output(self,other,"DIA_Kurgan_Leader_01_02");        //����� ������� ��������� ����� ���� ��� ��������, �� �������� ��� � ��� ������, ��� �� ������ �� ����.
        B_AI_Output(self,other,"DIA_Kurgan_Leader_01_03");        //��������� ��������� ������. � � ����� ������ �� �������� ��������.
        B_AI_Output(self,other,"DIA_Kurgan_Leader_01_04");        //�������, ������� ������ ���� ����� � �������� ������-������ ����.
};
instance DIA_KURGAN_KILLDRAGON(C_INFO)
{
        npc = djg_708_kurgan;
        condition = dia_kurgan_killdragon_condition;
        information = dia_kurgan_killdragon_info;
        description = "��� �� ������ ����� ��������?";
};
func int dia_kurgan_killdragon_condition()
{
        if(Npc_KnowsInfo(other,dia_kurgan_leader))
        {
                return TRUE;
        };
};
var int kurgan_killdragon_day;
func void dia_kurgan_killdragon_info()
{
        B_AI_Output(other,self,"DIA_Kurgan_KillDragon_15_00");    //(���������) ��� �� ������ ����� ��������?
        B_AI_Output(self,other,"DIA_Kurgan_KillDragon_01_01");    //���� ��, ����� ����������. � �� ���� ������, ��� ����� �������� �������?
        B_AI_Output(self,other,"DIA_Kurgan_KillDragon_01_02");    //�� �������, �� ����� �������� ������ �� �����, ����� �� ������ ������ ��� ������?
        B_AI_Output(self,other,"DIA_Kurgan_KillDragon_01_03");    //����� ���� ������� ����������� ������������ � ����������� ��������.
        B_AI_Output(other,self,"DIA_Kurgan_KillDragon_15_04");    //�������. � ��� �� ����������� ���������� � ���������?
        B_AI_Output(self,other,"DIA_Kurgan_KillDragon_01_05");    //������� �� ������ ��������, ��� ��� ����������.
        B_AI_Output(self,other,"DIA_Kurgan_KillDragon_01_06");    //������ ����� ����� ����� �������� � ������ ������� ��������� ��.
        KURGAN_KILLDRAGON_DAY = Wld_GetDay();
        Info_AddChoice(dia_kurgan_killdragon,dia_kurgan_killdragon_weg_description,dia_kurgan_killdragon_weg); // "� ��������� ��� ����� ����."
        Info_AddChoice(dia_kurgan_killdragon,dia_kurgan_killdragon_orks_description,dia_kurgan_killdragon_orks); // "��� �� ����������� ������ ���� �����?"
        Info_AddChoice(dia_kurgan_killdragon,dia_kurgan_killdragon_spott_description,dia_kurgan_killdragon_spott); // "��� ������� �� �� �������� ����� ���� ������ ����."
};
func void dia_kurgan_killdragon_spott()
{
        B_AI_Output(other,self,"DIA_Kurgan_KillDragon_spott_15_00");      //��� �������, �� �� �������� ����� ���� ������ ����.
        B_AI_Output(self,other,"DIA_Kurgan_KillDragon_spott_01_01");      //���? �� ������ ���������� �� ����� ����� ����������?
        AI_StopProcessInfos(self);
        b_attack(self,other,AR_NONE,1);
};
func void dia_kurgan_killdragon_orks()
{
        B_AI_Output(other,self,"DIA_Kurgan_KillDragon_orks_15_00");       //��� �� ����������� ������ ���� �����?
        B_AI_Output(self,other,"DIA_Kurgan_KillDragon_orks_01_01");       //�� ���������� ���� ������ �����.
};
func void dia_kurgan_killdragon_weg()
{
        B_AI_Output(other,self,"DIA_Kurgan_KillDragon_weg_15_00");        //��� �� ����� �������� ����������, ��� �� ������ ������ ���, ��, � ���������, ��� ����� ����.
        B_AI_Output(self,other,"DIA_Kurgan_KillDragon_weg_01_01");        //����������� �����, ����� ������. � ��������� ������ �� �������� �������� ���� ��� ����.
        AI_StopProcessInfos(self);
};
instance DIA_KURGAN_SEENDRAGON(C_INFO)
{
        npc = djg_708_kurgan;
        condition = dia_kurgan_seendragon_condition;
        information = dia_kurgan_seendragon_info;
        permanent = TRUE;
        description = "�� ��� �� ����� �������?";
};
func int dia_kurgan_seendragon_condition()
{
        if(KURGAN_KILLDRAGON_DAY <= (Wld_GetDay() - 2))
        {
                return TRUE;
        };
};
func void dia_kurgan_seendragon_info()
{
        B_AI_Output(other,self,"DIA_Kurgan_SEENDRAGON_15_00");    //�� ��� �� ����� �������?
        B_AI_Output(self,other,"DIA_Kurgan_SEENDRAGON_01_01");    //���� ���. �� ��� ����� �� ����� ���������� �����.
};
instance DIA_KURGAN_ALLDRAGONSDEAD(C_INFO)
{
        npc = djg_708_kurgan;
        nr = 5;
        condition = dia_kurgan_alldragonsdead_condition;
        information = dia_kurgan_alldragonsdead_info;
        permanent = FALSE;
        description = "������� ������.";
};
func int dia_kurgan_alldragonsdead_condition()
{
        if(MIS_ALLDRAGONSDEAD == TRUE)
        {
                return TRUE;
        };
};
func void dia_kurgan_alldragonsdead_info()
{
        B_AI_Output(other,self,"DIA_Kurgan_AllDragonsDead_15_00");        //������� ������.
        B_AI_Output(self,other,"DIA_Kurgan_AllDragonsDead_01_01");        //��! � ���, ���������, ���� ��? ��������?
        B_AI_Output(other,self,"DIA_Kurgan_AllDragonsDead_15_02");        //�.
        B_AI_Output(self,other,"DIA_Kurgan_AllDragonsDead_01_03");        //(�������) ��. �� ���� ��� � ��� �� ������. ������ ����� ����.
};
instance DIA_KURGAN_PICKPOCKET(C_INFO)
{
        npc = djg_708_kurgan;
        nr = 900;
        condition = dia_kurgan_pickpocket_condition;
        information = dia_kurgan_pickpocket_info;
        permanent = TRUE;
        description = PICKPOCKET_40;
};
func int dia_kurgan_pickpocket_condition()
{
        return c_beklauen(34,120);
};
func void dia_kurgan_pickpocket_info()
{
        Info_ClearChoices(dia_kurgan_pickpocket);
        Info_AddChoice(dia_kurgan_pickpocket,DIALOG_BACK,dia_kurgan_pickpocket_back);
        Info_AddChoice(dia_kurgan_pickpocket,DIALOG_PICKPOCKET,dia_kurgan_pickpocket_doit);
};
func void dia_kurgan_pickpocket_doit()
{
        b_beklauen();
        Info_ClearChoices(dia_kurgan_pickpocket);
};
func void dia_kurgan_pickpocket_back()
{
        Info_ClearChoices(dia_kurgan_pickpocket);
};
