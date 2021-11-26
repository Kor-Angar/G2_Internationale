instance DIA_GROM_EXIT(C_INFO)
{
        npc = bau_981_grom;
        nr = 999;
        condition = dia_grom_exit_condition;
        information = dia_grom_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_grom_exit_condition()
{
        return TRUE;
};
func void dia_grom_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_GROM_HALLO(C_INFO)
{
        npc = bau_981_grom;
        nr = 3;
        condition = dia_grom_hallo_condition;
        information = dia_grom_hallo_info;
        description = "��� � �������?";
};
func int dia_grom_hallo_condition()
{
        return TRUE;
};
func void dia_grom_hallo_info()
{
        B_AI_Output(other,self,"DIA_Grom_HALLO_15_00");   //��� � �������?
        B_AI_Output(self,other,"DIA_Grom_HALLO_08_01");   //��, ���������� ��������. � ����� �����. ��� �� ������?
        Info_ClearChoices(dia_grom_hallo);
        Info_AddChoice(dia_grom_hallo,dia_grom_hallo_waszusehen_description,dia_grom_hallo_waszusehen); // "��� ����� �����������?"
        Info_AddChoice(dia_grom_hallo,dia_grom_hallo_was_description,dia_grom_hallo_was); // "��� �� ������� �����?"
};
func void dia_grom_hallo_waszusehen()
{
        B_AI_Output(other,self,"DIA_Grom_HALLO_waszusehen_15_00");        //�� ��� ���������� ����� �������� �������� �����?
        B_AI_Output(self,other,"DIA_Grom_HALLO_waszusehen_08_01");        //���������� - ��� ������ �������. ���� �� ���������� � ������� ���, �� ���������� �� ����� ������� ������.
        B_AI_Output(self,other,"DIA_Grom_HALLO_waszusehen_08_02");        //��� ����� ������ ����� �������, ��������� � � ����� ������ ������������ ����. ��� ��� ����� �� ���� ����, ���� �� ��������, ��� ���������� �����.
};
func void dia_grom_hallo_was()
{
        B_AI_Output(other,self,"DIA_Grom_HALLO_was_15_00");       //��� �� ����������� �����?
        B_AI_Output(self,other,"DIA_Grom_HALLO_was_08_01");       //��, ��� ������ ���������� ��������� � ��������?
        Info_AddChoice(dia_grom_hallo,DIALOG_BACK,dia_grom_hallo_back);
};
func void dia_grom_hallo_back()
{
        Info_ClearChoices(dia_grom_hallo);
};
instance DIA_GROM_ASKTEACHER(C_INFO)
{
        npc = bau_981_grom;
        nr = 10;
        condition = dia_grom_askteacher_condition;
        information = dia_grom_askteacher_info;
        description = "�� ������ ������� ���� ���������?";
};
func int dia_grom_askteacher_condition()
{
        if(Npc_KnowsInfo(other,dia_grom_hallo))
        {
                return TRUE;
        };
};
func void dia_grom_askteacher_info()
{
        B_AI_Output(other,self,"DIA_Grom_AskTeacher_15_00");      //�� ������ ������� ���� ���������?
        B_AI_Output(self,other,"DIA_Grom_AskTeacher_08_01");      //�������. �� ������� ������� ��� ��������� ���. � ������ �� ������.
        B_AI_Output(self,other,"DIA_Grom_AskTeacher_08_02");      //� ���� ������ ������, ������� ����� � ������ ������. � ����� � ����� ���� �����, ��� ��� ����.
        Log_CreateTopic(TOPIC_GROMASKTEACHER,LOG_MISSION);
        Log_SetTopicStatus(TOPIC_GROMASKTEACHER,LOG_RUNNING);
        b_logentry(TOPIC_GROMASKTEACHER,TOPIC_GROMASKTEACHER_description_93); // "������� ���� ������ ���� ����� ��� ����� ���� � ������� ��� ������� ������ ������� ����� � ������."
};
instance DIA_GROM_PAYTEACHER(C_INFO)
{
        npc = bau_981_grom;
        nr = 11;
        condition = dia_grom_payteacher_condition;
        information = dia_grom_payteacher_info;
        description = "��� ���, ��� �� ������.";
};
func int dia_grom_payteacher_condition()
{
        if(Npc_KnowsInfo(other,dia_grom_askteacher) && Npc_HasItems(other,itfo_milk) && Npc_HasItems(other,itfo_bread) && Npc_HasItems(other,itfo_bacon))
        {
                return TRUE;
        };
};
func void dia_grom_payteacher_info()
{
        b_giveinvitems(other,self,itfo_milk,1);
        b_giveinvitems(other,self,itfo_bread,1);
        b_giveinvitems(other,self,itfo_bacon,1);
        B_AI_Output(other,self,"DIA_Grom_PayTeacher_15_00");      //��� ���, ��� �� ������.
        B_AI_Output(self,other,"DIA_Grom_PayTeacher_08_01");      //����������. � ��� ������?
        GROM_TEACHANIMALTROPHY = TRUE;
        b_giveplayerxp(XP_AMBIENT);
};
instance DIA_GROM_TEACHHUNTING(C_INFO)
{
        npc = bau_981_grom;
        nr = 12;
        condition = dia_grom_teachhunting_condition;
        information = dia_grom_teachhunting_info;
        permanent = TRUE;
        description = "����� ���� ���������.";
};
func int dia_grom_teachhunting_condition()
{
        if(GROM_TEACHANIMALTROPHY == TRUE)
        {
                return TRUE;
        };
};
func void dia_grom_teachhunting_info()
{
        B_AI_Output(other,self,"DIA_Grom_TEACHHUNTING_15_00");    //����� ���� ���������.
        if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TEETH] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_HEART] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_MANDIBLES] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_SHADOWHORN] == FALSE))
        {
                B_AI_Output(self,other,"DIA_Grom_TEACHHUNTING_08_01");    //��� �� ������ ������?
                Info_AddChoice(dia_grom_teachhunting,DIALOG_BACK,dia_grom_teachhunting_back);
                if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE)
                {
                        Info_AddChoice(dia_grom_teachhunting,b_buildlearnstring("������ ����",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY)),dia_grom_teachhunting_fur);
                };
                if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TEETH] == FALSE)
                {
                        Info_AddChoice(dia_grom_teachhunting,b_buildlearnstring("�������� �����",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY)),dia_grom_teachhunting_teeth);
                };
                if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_HEART] == FALSE)
                {
                        Info_AddChoice(dia_grom_teachhunting,b_buildlearnstring("�������� ������",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY)),dia_grom_teachhunting_heart);
                };
                if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_MANDIBLES] == FALSE)
                {
                        Info_AddChoice(dia_grom_teachhunting,b_buildlearnstring("�������� ��������",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY)),dia_grom_teachhunting_mandibles);
                };
                if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_SHADOWHORN] == FALSE)
                {
                        Info_AddChoice(dia_grom_teachhunting,b_buildlearnstring("��� ���������",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY)),dia_grom_teachhunting_shadowhorn);
                };
        }
        else
        {
                B_AI_Output(self,other,"DIA_Grom_TEACHHUNTING_08_02");    //��� ������ ����� ����. �� � ��� ��� ��� ������.
        };
};
func void dia_grom_teachhunting_back()
{
        Info_ClearChoices(dia_grom_teachhunting);
};
func void dia_grom_teachhunting_fur()
{
        if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_FUR))
        {
                B_AI_Output(self,other,"DIA_Grom_TEACHHUNTING_Fur_08_00");        //������ ������ ����� ��� ���������, ����� �� ��� ����� � ���� �����. ������ �� � ���� �������, � �� ��������.
        };
        Info_ClearChoices(dia_grom_teachhunting);
};
func void dia_grom_teachhunting_teeth()
{
        if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_TEETH))
        {
                B_AI_Output(self,other,"DIA_Grom_TEACHHUNTING_Teeth_08_00");      //������� ��������� ����� �������� ���������, ����� �� ��������� ��, ����� ��� ���������� �� ������.
        };
        Info_ClearChoices(dia_grom_teachhunting);
};
func void dia_grom_teachhunting_heart()
{
        if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_HEART))
        {
                B_AI_Output(self,other,"DIA_Grom_TEACHHUNTING_Heart_08_00");      //�� ������ �������� ������ ���������, ������ �������� ������ � ��� ������� ������. �� ������ ��� ����� ����� ������ � ������ ������ �������� ��� ���������� �������.
        };
        Info_ClearChoices(dia_grom_teachhunting);
};
func void dia_grom_teachhunting_mandibles()
{
        if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_MANDIBLES))
        {
                B_AI_Output(self,other,"DIA_Grom_TEACHHUNTING_Mandibles_08_00");  //��������� �������� ��� �������� ������� ����� �������� ��� ������ ����� �������� �������������� ������. ��� ����� ������� ����� � ������ ���� ��������.
        };
        Info_ClearChoices(dia_grom_teachhunting);
};
func void dia_grom_teachhunting_shadowhorn()
{
        if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_SHADOWHORN))
        {
                B_AI_Output(self,other,"DIA_Grom_TEACHHUNTING_ShadowHorn_08_00"); //����� �������� ��� ���������, ������ �� ���� ���� ����� �����, �������� ��� ���� ��������� ������ �����.
        };
        Info_ClearChoices(dia_grom_teachhunting);
};
instance DIA_GROM_PICKPOCKET(C_INFO)
{
        npc = bau_981_grom;
        nr = 900;
        condition = dia_grom_pickpocket_condition;
        information = dia_grom_pickpocket_info;
        permanent = TRUE;
        description = PICKPOCKET_80;
};
func int dia_grom_pickpocket_condition()
{
        return c_beklauen(75,40);
};
func void dia_grom_pickpocket_info()
{
        Info_ClearChoices(dia_grom_pickpocket);
        Info_AddChoice(dia_grom_pickpocket,DIALOG_BACK,dia_grom_pickpocket_back);
        Info_AddChoice(dia_grom_pickpocket,DIALOG_PICKPOCKET,dia_grom_pickpocket_doit);
};
func void dia_grom_pickpocket_doit()
{
        b_beklauen();
        Info_ClearChoices(dia_grom_pickpocket);
};
func void dia_grom_pickpocket_back()
{
        Info_ClearChoices(dia_grom_pickpocket);
};
