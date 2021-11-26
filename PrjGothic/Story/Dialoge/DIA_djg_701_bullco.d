instance DIA_BULLCODJG_EXIT(C_INFO)
{
        npc = djg_701_bullco;
        nr = 999;
        condition = dia_bullcodjg_exit_condition;
        information = dia_bullcodjg_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_bullcodjg_exit_condition()
{
        return TRUE;
};
func void dia_bullcodjg_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_BULLCODJG_HALLO(C_INFO)
{
        npc = djg_701_bullco;
        nr = 5;
        condition = dia_bullcodjg_hallo_condition;
        information = dia_bullcodjg_hallo_info;
        description = "� ��� ����?";
};
func int dia_bullcodjg_hallo_condition()
{
        if(Npc_IsDead(djg_sylvio) == FALSE)
        {
                return TRUE;
        };
};
func void dia_bullcodjg_hallo_info()
{
        B_AI_Output(other,self,"DIA_BullcoDJG_HALLO_15_00");      //� ��� ����???
        B_AI_Output(self,other,"DIA_BullcoDJG_HALLO_06_01");      //����� ��� �������! �� �������, ������ ������� �������, ����� �� ��� ������ ����.
        B_AI_Output(self,other,"DIA_BullcoDJG_HALLO_06_02");      //����� ���� ��������� ������ ����, ��� ����� ���� �� ��������!
        AI_StopProcessInfos(self);
};
instance DIA_BULLCODJG_WARTEMAL(C_INFO)
{
        npc = djg_701_bullco;
        nr = 6;
        condition = dia_bullcodjg_wartemal_condition;
        information = dia_bullcodjg_wartemal_info;
        permanent = TRUE;
        description = "��� � �������?";
};
func int dia_bullcodjg_wartemal_condition()
{
        if(Npc_KnowsInfo(other,dia_bullcodjg_hallo) || Npc_KnowsInfo(other,dia_bullco_wasnun))
        {
                return TRUE;
        };
};
func void dia_bullcodjg_wartemal_info()
{
        B_AI_Output(other,self,"DIA_BullcoDJG_WARTEMAL_15_00");   //� ��� ��������� � �������?
        if(Npc_KnowsInfo(other,dia_bullco_wasnun))
        {
                B_AI_Output(self,other,"DIA_BullcoDJG_WARTEMAL_06_01");   //�� ����� � ���� �� ������.
        }
        else
        {
                B_AI_Output(self,other,"DIA_BullcoDJG_WARTEMAL_06_02");   //������ �� ������! � ��������! � ���� ��������� ������ ��� ����� �������.
        };
        AI_StopProcessInfos(self);
};
instance DIA_BULLCO_SYLVIODEAD(C_INFO)
{
        npc = djg_701_bullco;
        nr = 7;
        condition = dia_bullco_sylviodead_condition;
        information = dia_bullco_sylviodead_info;
        important = TRUE;
};
func int dia_bullco_sylviodead_condition()
{
        if(Npc_IsDead(djg_sylvio))
        {
                return TRUE;
        };
};
func void dia_bullco_sylviodead_info()
{
        B_AI_Output(self,other,"DIA_Bullco_SYLVIODEAD_06_00");    //����. ������� �����.
        AI_StopProcessInfos(self);
        Npc_ExchangeRoutine(self,"Start");
};
instance DIA_BULLCO_WASNUN(C_INFO)
{
        npc = djg_701_bullco;
        nr = 8;
        condition = dia_bullco_wasnun_condition;
        information = dia_bullco_wasnun_info;
        description = "��� �� ���������� ������ ������?";
};
func int dia_bullco_wasnun_condition()
{
        if(Npc_KnowsInfo(other,dia_bullco_sylviodead) && Npc_IsDead(djg_sylvio))
        {
                return TRUE;
        };
};
func void dia_bullco_wasnun_info()
{
        B_AI_Output(other,self,"DIA_Bullco_WASNUN_15_00");        //��� �� ������ ������ ������, ����� ������� �����?
        B_AI_Output(self,other,"DIA_Bullco_WASNUN_06_01");        //������� �� ����. �����, ����� ����� ������ ��������� �� ��������, ���� � ��� �� �����.
        Info_AddChoice(dia_bullco_wasnun,dia_bullco_wasnun_kopfab_description,dia_bullco_wasnun_kopfab); // "��� �� ������ �������� ���� ������."
        Info_AddChoice(dia_bullco_wasnun,dia_bullco_wasnun_woandere_description,dia_bullco_wasnun_woandere); // "�� ������ ��� ���������?"
};
func void dia_bullco_wasnun_woandere()
{
        B_AI_Output(other,self,"DIA_Bullco_WASNUN_woandere_15_00");       //�� ������, ��� ���������?
        B_AI_Output(self,other,"DIA_Bullco_WASNUN_woandere_06_01");       //�����, ��. �� ������� ����, � ����� ������ �� ��� � ���� ��� ���.
        Info_AddChoice(dia_bullco_wasnun,dia_bullco_wasnun_woandere_zuihnen_description,dia_bullco_wasnun_woandere_zuihnen); // "������ ���� � ������ ��������� �� ��������."
};
func void dia_bullco_wasnun_woandere_zuihnen()
{
        B_AI_Output(other,self,"DIA_Bullco_WASNUN_woandere_zuihnen_15_00");       //������ ���� � ������ ��������� �� ��������.
        B_AI_Output(self,other,"DIA_Bullco_WASNUN_woandere_zuihnen_06_01");       //��, � �� ���� �����.
        Info_ClearChoices(dia_bullco_wasnun);
        Info_AddChoice(dia_bullco_wasnun,dia_bullco_wasnun_woandere_zuihnen_alleine_description,dia_bullco_wasnun_woandere_zuihnen_alleine); // "��� ������."
        Info_AddChoice(dia_bullco_wasnun,dia_bullco_wasnun_woandere_zuihnen_lebenlassen_description,dia_bullco_wasnun_woandere_zuihnen_lebenlassen); // "������� ���� � ������� ���� � �����."
        Info_AddChoice(dia_bullco_wasnun,dia_bullco_wasnun_woandere_zuihnen_geld_description,dia_bullco_wasnun_woandere_zuihnen_geld); // "� ������� ���� 50 ������� �� ���."
};
func void dia_bullco_wasnun_woandere_zuihnen_lebenlassen()
{
        B_AI_Output(other,self,"DIA_Bullco_WASNUN_woandere_zuihnen_lebenlassen_15_00");   //�������, ���� � ������� ���� � �����.
        B_AI_Output(self,other,"DIA_Bullco_WASNUN_woandere_zuihnen_lebenlassen_06_01");   //������� �� ����!
        AI_StopProcessInfos(self);
};
func void dia_bullco_wasnun_woandere_zuihnen_geld()
{
        B_AI_Output(other,self,"DIA_Bullco_WASNUN_woandere_zuihnen_Geld_15_00");  //� ������� ���� 50 ������� �� ���.
        if(b_giveinvitems(other,self,itmi_gold,50))
        {
                B_AI_Output(self,other,"DIA_Bullco_WASNUN_woandere_zuihnen_Geld_06_01");  //������. ����� �� ����.
                B_AI_Output(self,other,"DIA_Bullco_WASNUN_woandere_zuihnen_Geld_06_02");  //��� �� ����. � ������ ���� ����, ��� � ��������� ��� ����� ������ ��������� �� ��������.
                AI_StopProcessInfos(self);
                Npc_ExchangeRoutine(self,"DJGVorposten");
        }
        else
        {
                B_AI_Output(self,other,"DIA_Bullco_WASNUN_woandere_zuihnen_Geld_06_03");  //� ���� ��� 50 �������, � � �� ������� �� ��� ����. ����������.
                AI_StopProcessInfos(self);
        };
};
func void dia_bullco_wasnun_woandere_zuihnen_alleine()
{
        B_AI_Output(other,self,"DIA_Bullco_WASNUN_woandere_zuihnen_alleine_15_00");       //��� ������. � ��� �� �����.
        B_AI_Output(self,other,"DIA_Bullco_WASNUN_woandere_zuihnen_alleine_06_01");       //������ �� ���������.
        AI_StopProcessInfos(self);
};
func void dia_bullco_wasnun_kopfab()
{
        B_AI_Output(other,self,"DIA_Bullco_WASNUN_kopfab_15_00"); //��� �� ������ �������� ���� ������.
        B_AI_Output(self,other,"DIA_Bullco_WASNUN_kopfab_06_01"); //������ ���� �����.
        Info_AddChoice(dia_bullco_wasnun,dia_bullco_wasnun_kopfab_angriff_description,dia_bullco_wasnun_kopfab_angriff); // "������� ������. �� ������� ����� ����� ����� � ������."
};
func void dia_bullco_wasnun_kopfab_angriff()
{
        B_AI_Output(other,self,"DIA_Bullco_WASNUN_kopfab_angriff_15_00"); //������� ������. �� ������� ����� ����� ����� � ������.
        B_AI_Output(self,other,"DIA_Bullco_WASNUN_kopfab_angriff_06_01"); //��� ���� � ����.
        AI_StopProcessInfos(self);
        b_attack(self,other,AR_NONE,1);
};
instance DIA_BULLCO_PICKPOCKET(C_INFO)
{
        npc = djg_701_bullco;
        nr = 900;
        condition = dia_bullco_pickpocket_condition;
        information = dia_bullco_pickpocket_info;
        permanent = TRUE;
        description = PICKPOCKET_40;
};
func int dia_bullco_pickpocket_condition()
{
        return c_beklauen(34,65);
};
func void dia_bullco_pickpocket_info()
{
        Info_ClearChoices(dia_bullco_pickpocket);
        Info_AddChoice(dia_bullco_pickpocket,DIALOG_BACK,dia_bullco_pickpocket_back);
        Info_AddChoice(dia_bullco_pickpocket,DIALOG_PICKPOCKET,dia_bullco_pickpocket_doit);
};
func void dia_bullco_pickpocket_doit()
{
        b_beklauen();
        Info_ClearChoices(dia_bullco_pickpocket);
};
func void dia_bullco_pickpocket_back()
{
        Info_ClearChoices(dia_bullco_pickpocket);
};
