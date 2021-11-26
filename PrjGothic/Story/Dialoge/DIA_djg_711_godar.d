instance DIA_GODAR_EXIT(C_INFO)
{
        npc = djg_711_godar;
        nr = 999;
        condition = dia_godar_exit_condition;
        information = dia_godar_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_godar_exit_condition()
{
        return TRUE;
};
func void dia_godar_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_GODAR_HELLO(C_INFO)
{
        npc = djg_711_godar;
        nr = 4;
        condition = dia_godar_hello_condition;
        information = dia_godar_hello_info;
        permanent = FALSE;
        important = TRUE;
};
func int dia_godar_hello_condition()
{
        if(Npc_IsInState(self,zs_talk))
        {
                return TRUE;
        };
};
func void dia_godar_hello_info()
{
        B_AI_Output(self,other,"DIA_Godar_Hello_13_00");  //�-�? ���?
};
instance DIA_GODAR_COMEFROM(C_INFO)
{
        npc = djg_711_godar;
        nr = 4;
        condition = dia_godar_comefrom_condition;
        information = dia_godar_comefrom_info;
        permanent = FALSE;
        description = "������ ��?";
};
func int dia_godar_comefrom_condition()
{
        return TRUE;
};
func void dia_godar_comefrom_info()
{
        B_AI_Output(other,self,"DIA_Godar_ComeFrom_15_00");       //������ ��?
        B_AI_Output(self,other,"DIA_Godar_ComeFrom_13_01");       //�� ������... �-�, �� ������.
        Info_ClearChoices(dia_godar_comefrom);
        Info_AddChoice(dia_godar_comefrom,dia_godar_comefrom_bandits_description,dia_godar_comefrom_bandits); // "�� �������!"
        Info_AddChoice(dia_godar_comefrom,dia_godar_comefrom_notcity_description,dia_godar_comefrom_notcity); // "� ���-�� �� ����� ���� � ������."
        Info_AddChoice(dia_godar_comefrom,dia_godar_comefrom_understand_description,dia_godar_comefrom_understand); // "�������. �� �� ������."
};
func void dia_godar_comefrom_bandits()
{
        B_AI_Output(other,self,"DIA_Godar_ComeFrom_Bandits_15_00");       //�� �������!
        B_AI_Output(self,other,"DIA_Godar_ComeFrom_Bandits_13_01");       //������������! ���� ���� �� ������� ���� �� �����!
        Info_ClearChoices(dia_godar_comefrom);
        Info_AddChoice(dia_godar_comefrom,dia_godar_comefrom_bandits_keepcalm_description,dia_godar_comefrom_bandits_keepcalm); // "����������. � �� ���� ������� ���."
        Info_AddChoice(dia_godar_comefrom,dia_godar_comefrom_bandits_nofear_description,dia_godar_comefrom_bandits_nofear); // "���� �� �������� ����."
};
func void dia_godar_comefrom_bandits_keepcalm()
{
        B_AI_Output(other,self,"DIA_Godar_ComeFrom_Bandits_KeepCalm_15_00");      //����������. � �� ���� ������� ���.
        B_AI_Output(self,other,"DIA_Godar_ComeFrom_Bandits_KeepCalm_13_01");      //�������. ��� ��� ����� �� ������. � �� �� ������� ���� ������!
        Info_ClearChoices(dia_godar_comefrom);
};
func void dia_godar_comefrom_bandits_nofear()
{
        B_AI_Output(other,self,"DIA_Godar_ComeFrom_Bandits_NoFear_15_00");        //���� �� �������� ����.
        B_AI_Output(self,other,"DIA_Godar_ComeFrom_Bandits_NoFear_13_01");        //��, ��� �� ��� ���������.
        AI_StopProcessInfos(self);
        b_attack(self,other,AR_NONE,1);
};
func void dia_godar_comefrom_notcity()
{
        B_AI_Output(other,self,"DIA_Godar_ComeFrom_NotCity_15_00");       //� ���-�� �� ����� ���� � ������.
        B_AI_Output(self,other,"DIA_Godar_ComeFrom_NotCity_13_01");       //�� ������ �����, ������� ���� ��� �� � ���� ����. �����?
        Info_ClearChoices(dia_godar_comefrom);
        Info_AddChoice(dia_godar_comefrom,dia_godar_comefrom_notcity_cutthroat_description,dia_godar_comefrom_notcity_cutthroat); // "���."
        Info_AddChoice(dia_godar_comefrom,dia_godar_comefrom_notcity_forget_description,dia_godar_comefrom_notcity_forget); // "�����. �� ������ �� ������."
};
func void dia_godar_comefrom_notcity_forget()
{
        B_AI_Output(other,self,"DIA_Godar_ComeFrom_NotCity_Forget_15_00");        //�����. �� ������ �� ������.
        B_AI_Output(self,other,"DIA_Godar_ComeFrom_NotCity_Forget_13_01");        //������.
        Info_ClearChoices(dia_godar_comefrom);
};
func void dia_godar_comefrom_notcity_cutthroat()
{
        B_AI_Output(other,self,"DIA_Godar_ComeFrom_NotCity_CutThroat_15_00");     //���.
        B_AI_Output(self,other,"DIA_Godar_ComeFrom_NotCity_CutThroat_13_01");     //����� ��� �������� ��������� ��� � �������...
        AI_StopProcessInfos(self);
        b_attack(self,other,AR_NONE,1);
};
func void dia_godar_comefrom_understand()
{
        B_AI_Output(other,self,"DIA_Godar_ComeFrom_Understand_15_00");    //�������. �� �� ������.
        B_AI_Output(self,other,"DIA_Godar_ComeFrom_Understand_13_01");    //������! �� ��� ���������!
        B_AI_Output(self,other,"DIA_Godar_ComeFrom_Understand_13_02");    //���, ������!
        CreateInvItems(self,itfo_beer,1);
        b_giveinvitems(self,other,itfo_beer,1);
        b_useitem(other,itfo_beer);
        Info_ClearChoices(dia_godar_comefrom);
};
instance DIA_GODAR_PLAN(C_INFO)
{
        npc = djg_711_godar;
        nr = 5;
        condition = dia_godar_plan_condition;
        information = dia_godar_plan_info;
        permanent = FALSE;
        description = "��� �� ������� �����?";
};
func int dia_godar_plan_condition()
{
        return TRUE;
};
func void dia_godar_plan_info()
{
        B_AI_Output(other,self,"DIA_Godar_Plan_15_00");   //��� �� ������� �����?
        B_AI_Output(self,other,"DIA_Godar_Plan_13_01");   //�� �������� �� ����� �� ��������. ��... �� ������� ���� ������� � ������ ����.
        B_AI_Output(self,other,"DIA_Godar_Plan_13_02");   //��, ������ ����������, ��� ������� �� ��������. ��� ����� ������.
        B_AI_Output(self,other,"DIA_Godar_Plan_13_03");   //� �������� ���� ���� ������, ������?
        B_AI_Output(other,self,"DIA_Godar_Plan_15_04");   //�������.
};
instance DIA_GODAR_DRAGONLORE(C_INFO)
{
        npc = djg_711_godar;
        nr = 5;
        condition = dia_godar_dragonlore_condition;
        information = dia_godar_dragonlore_info;
        permanent = FALSE;
        description = "��� �� ������ � ��������?";
};
func int dia_godar_dragonlore_condition()
{
        if(Npc_KnowsInfo(other,dia_godar_plan))
        {
                return TRUE;
        };
};
func void dia_godar_dragonlore_info()
{
        B_AI_Output(other,self,"DIA_Godar_DragonLore_15_00");     //��� �� ������ � ��������?
        B_AI_Output(self,other,"DIA_Godar_DragonLore_13_01");     //� ���� � ��� ������ �� ������� ������.
        B_AI_Output(self,other,"DIA_Godar_DragonLore_13_02");     //���������, ������������, ������, �������� ������� � ��� �����.
};
instance DIA_GODAR_DESTINATION(C_INFO)
{
        npc = djg_711_godar;
        nr = 5;
        condition = dia_godar_destination_condition;
        information = dia_godar_destination_info;
        permanent = FALSE;
        description = "� ���� �� ����������� ���� ������?";
};
func int dia_godar_destination_condition()
{
        if(Npc_KnowsInfo(other,dia_godar_plan))
        {
                return TRUE;
        };
};
func void dia_godar_destination_info()
{
        B_AI_Output(other,self,"DIA_Godar_Destination_15_00");    //� ���� �� ����������� ���� ������?
        B_AI_Output(self,other,"DIA_Godar_Destination_13_01");    //������� �� ����. �� ��� ��� ������ ��� ����.
        if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
        {
                B_AI_Output(other,self,"DIA_Godar_Destination_15_02");    //�� ����� �� ����� � �����.
                B_AI_Output(self,other,"DIA_Godar_Destination_13_03");    //���� ���� ������ �� ��������. ��� ��. ������ �� � ���������.
                B_AI_Output(self,other,"DIA_Godar_Destination_13_04");    //� �� ���� ������� � ������. � ��� ��� ���, � ��� ����� �������.
        };
};
instance DIA_GODAR_ORKS(C_INFO)
{
        npc = djg_711_godar;
        nr = 5;
        condition = dia_godar_orks_condition;
        information = dia_godar_orks_info;
        permanent = FALSE;
        description = "��� ������ �����?";
};
func int dia_godar_orks_condition()
{
        if(Npc_KnowsInfo(other,dia_godar_destination))
        {
                return TRUE;
        };
};
func void dia_godar_orks_info()
{
        B_AI_Output(other,self,"DIA_Godar_Orks_15_00");   //��� ������ �����?
        B_AI_Output(self,other,"DIA_Godar_Orks_13_01");   //��� ������� ���� �����.
        B_AI_Output(self,other,"DIA_Godar_Orks_13_02");   //�������� ���������� ���� - ������ �������. ���� �� ������ ��������� � ������, �� ����� ������ ������� ���� ������.
        B_AI_Output(self,other,"DIA_Godar_Orks_13_03");   //������ �� ��������� ����.
        B_AI_Output(other,self,"DIA_Godar_Orks_15_04");   //��, �������������.
};
instance DIA_GODAR_PRISON(C_INFO)
{
        npc = djg_711_godar;
        nr = 5;
        condition = dia_godar_prison_condition;
        information = dia_godar_prison_info;
        permanent = FALSE;
        description = "�� ��� �� �����?";
};
func int dia_godar_prison_condition()
{
        if(Npc_KnowsInfo(other,dia_godar_destination) && ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL)))
        {
                return TRUE;
        };
};
func void dia_godar_prison_info()
{
        B_AI_Output(other,self,"DIA_Godar_Prison_15_00"); //�� ��� �� �����?
        if(hero.guild == GIL_KDF)
        {
                B_AI_Output(self,other,"DIA_Godar_Prison_13_01"); //��� � ���� � ������! ��!
                B_AI_Output(self,other,"DIA_Godar_Prison_13_02"); //��, ����, ������ � ����������. ���, ������. ������ �� ����.
        }
        else
        {
                B_AI_Output(self,other,"DIA_Godar_Prison_13_03"); //��� ������ ������� ���� �� �������������. �� ���� ������ ������!
                B_AI_Output(self,other,"DIA_Godar_Prison_13_04"); //��� ���� 10 ��� �� ���!
                B_AI_Output(other,self,"DIA_Godar_Prison_15_05"); //��� ���?
                B_AI_Output(self,other,"DIA_Godar_Prison_13_06"); //��... ������� ��, � ���������...
                B_AI_Output(other,self,"DIA_Godar_Prison_15_07"); //�?
                B_AI_Output(self,other,"DIA_Godar_Prison_13_08"); //� ��� �� ������. ���� ������ ��� ������������� � ������ ���� ���. ������!
                Info_ClearChoices(dia_godar_prison);
                Info_AddChoice(dia_godar_prison,dia_godar_prison_court_description,dia_godar_prison_court); // "�������� �����."
                Info_AddChoice(dia_godar_prison,dia_godar_prison_pissoff_description,dia_godar_prison_pissoff); // "���� �� ��������� ����������."
        };
};
func void dia_godar_prison_court()
{
        B_AI_Output(other,self,"DIA_Godar_Prison_Court_15_00");   //�������� �������.
        B_AI_Output(self,other,"DIA_Godar_Prison_Court_13_01");   //�� ��������� ����? ��� �������� ������ ������� �� �����, ��� ��� ������.
        B_AI_Output(self,other,"DIA_Godar_Prison_Court_13_02");   //��, �� ������� ����, �� ��� �� �������.
        Info_ClearChoices(dia_godar_prison);
        GODARLIKESYOU = TRUE;
};
func void dia_godar_prison_pissoff()
{
        B_AI_Output(other,self,"DIA_Godar_Prison_Pissoff_15_00"); //���� �� ��������� ����������.
        B_AI_Output(self,other,"DIA_Godar_Prison_Pissoff_13_01"); //(�������) �������, �� ������� �� ��� � ������, ��� ����?
        B_AI_Output(self,other,"DIA_Godar_Prison_Pissoff_13_02"); //������ � ������ ����, ��� ����� ����� � ��������� � ������!
        AI_StopProcessInfos(self);
        b_attack(self,other,AR_NONE,1);
};
instance DIA_GODAR_HUNTING(C_INFO)
{
        npc = djg_711_godar;
        nr = 5;
        condition = dia_godar_hunting_condition;
        information = dia_godar_hunting_info;
        permanent = FALSE;
        description = "�� ������ ������� ���� ���������?";
};
func int dia_godar_hunting_condition()
{
        if(Npc_KnowsInfo(other,dia_godar_prison) && ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDF)))
        {
                return TRUE;
        };
};
func void dia_godar_hunting_info()
{
        B_AI_Output(other,self,"DIA_Godar_Hunting_15_00");        //�� ������ ������� ���� ���������?
        if(GODARLIKESYOU == FALSE)
        {
                B_AI_Output(self,other,"DIA_Godar_Hunting_13_01");        //�� ������? �� �� ���!
                AI_StopProcessInfos(self);
        }
        else
        {
                B_AI_Output(self,other,"DIA_Godar_Hunting_13_03");        //�������� - ��� �� ������ ����. �� ����� ������ ��������� �� ����� ��� �����. ��� �������� ������.
                B_AI_Output(self,other,"DIA_Godar_Hunting_13_04");        //��������� �� ����, ����� �� ��������� �� ����� �������!
                GODAR_TEACHANIMALTROPHY = TRUE;
        };
};
instance DIA_GODAR_DRAGONSTUFF(C_INFO)
{
        npc = djg_711_godar;
        nr = 5;
        condition = dia_godar_dragonstuff_condition;
        information = dia_godar_dragonstuff_info;
        permanent = TRUE;
        description = "�������� ���, ��� ��������� �������.";
};
var int godar_teachdragonstuff;
func int dia_godar_dragonstuff_condition()
{
        if((GODAR_TEACHANIMALTROPHY == TRUE) && ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL)) && ((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRAGONSCALE] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRAGONBLOOD] == FALSE)) && (GODAR_TEACHDRAGONSTUFF == FALSE))
        {
                return TRUE;
        };
};
func void dia_godar_dragonstuff_info()
{
        B_AI_Output(other,self,"DIA_Godar_Dragonstuff_15_00");    //�������� ���, ��� ��������� �������.
        B_AI_Output(self,other,"DIA_Godar_Dragonstuff_13_01");    //����� �� ������� ��� ��������� ����, ��?
        B_AI_Output(self,other,"DIA_Godar_Dragonstuff_13_02");    //�����, ������, �� �� ��������� ���� � 1000 �������.
        Info_ClearChoices(dia_godar_dragonstuff);
        Info_AddChoice(dia_godar_dragonstuff,dia_godar_dragonstuff_nein_description,dia_godar_dragonstuff_nein); // "��� ��� �� ����� ���������."
        Info_AddChoice(dia_godar_dragonstuff,dia_godar_dragonstuff_fair_description,dia_godar_dragonstuff_fair); // "��� ������."
};
func void dia_godar_dragonstuff_fair()
{
        B_AI_Output(other,self,"DIA_Godar_Dragonstuff_fair_15_00");       //��� ������.
        if(b_giveinvitems(other,self,itmi_gold,1000))
        {
                GODAR_TEACHDRAGONSTUFF = TRUE;
        }
        else
        {
                B_AI_Output(self,other,"DIA_Godar_Dragonstuff_fair_13_01");       //��� ����� �� �����. ������� ��������� ������.
        };
        Info_ClearChoices(dia_godar_dragonstuff);
};
func void dia_godar_dragonstuff_nein()
{
        B_AI_Output(other,self,"DIA_Godar_Dragonstuff_nein_15_00");       //��� ��� �� ����� ���������.
        B_AI_Output(self,other,"DIA_Godar_Dragonstuff_nein_13_01");       //��� ������.
        Info_ClearChoices(dia_godar_dragonstuff);
};
instance DIA_GODAR_TEACH(C_INFO)
{
        npc = djg_711_godar;
        nr = 5;
        condition = dia_godar_teach_condition;
        information = dia_godar_teach_info;
        permanent = TRUE;
        description = "����� ���� ���������.";
};
func int dia_godar_teach_condition()
{
        if((GODAR_TEACHANIMALTROPHY == TRUE) && ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL)))
        {
                return TRUE;
        };
};
func void dia_godar_teach_info()
{
        B_AI_Output(other,self,"DIA_Godar_Teach_15_00");  //����� ���� ���������.
        if((Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TEETH] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSTING] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWING] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRAGONSCALE] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRAGONBLOOD] == FALSE))
        {
                Info_AddChoice(dia_godar_teach,DIALOG_BACK,dia_godar_teach_back);
                if(Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == FALSE)
                {
                        Info_AddChoice(dia_godar_teach,b_buildlearnstring("��������",b_getlearncosttalent(other,NPC_TALENT_SNEAK)),dia_godar_teach_thief_sneak);
                };
                if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TEETH] == FALSE)
                {
                        Info_AddChoice(dia_godar_teach,b_buildlearnstring("�������� �����",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY)),dia_godar_teach_trophys_teeth);
                };
                if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSTING] == FALSE)
                {
                        Info_AddChoice(dia_godar_teach,b_buildlearnstring("���� �������� ����",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY)),dia_godar_teach_trophys_bfsting);
                };
                if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWING] == FALSE)
                {
                        Info_AddChoice(dia_godar_teach,b_buildlearnstring("������ �������� ����",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY)),dia_godar_teach_trophys_bfwing);
                };
                if(GODAR_TEACHDRAGONSTUFF == TRUE)
                {
                        if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRAGONSCALE] == FALSE)
                        {
                                Info_AddChoice(dia_godar_teach,b_buildlearnstring("�������� ����� ��������",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY)),dia_godar_teach_trophys_dragonscale);
                        };
                        if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRAGONBLOOD] == FALSE)
                        {
                                Info_AddChoice(dia_godar_teach,b_buildlearnstring("���� ����� �������",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY)),dia_godar_teach_trophys_dragonblood);
                        };
                };
        }
        else
        {
                b_say(self,other,"$NOLEARNYOUREBETTER");
        };
};
func void dia_godar_teach_back()
{
        Info_ClearChoices(dia_godar_teach);
};
func void dia_godar_teach_trophys_teeth()
{
        if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_TEETH))
        {
                B_AI_Output(self,other,"DIA_Godar_TEACHHUNTING_Teeth_13_00");     //���� ����� ����� �������� ��� ������ �������� ����.
        };
        Info_ClearChoices(dia_godar_teach);
};
func void dia_godar_teach_trophys_bfsting()
{
        if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_BFSTING))
        {
                B_AI_Output(self,other,"DIA_Godar_TEACHHUNTING_BFSting_13_00");   //����� ������ ���� �������� ����, ����� ������� �������� ��� �� �� ����.
        };
        Info_ClearChoices(dia_godar_teach);
};
func void dia_godar_teach_trophys_bfwing()
{
        if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_BFWING))
        {
                B_AI_Output(self,other,"DIA_Godar_TEACHHUNTING_BFWing_13_00");    //������ �������� ��� ����� ������. ����� ���� ����� ����������, ����� ��������� ��.
        };
        Info_ClearChoices(dia_godar_teach);
};
func void dia_godar_teach_thief_sneak()
{
        if(b_teachthieftalent(self,other,NPC_TALENT_SNEAK))
        {
                B_AI_Output(self,other,"DIA_Godar_TEACHHUNTING_Sneak_13_00");     //����� �������� ��������, ����� ����� ������������ ������ �����. ������� ������� ������ ������� ����� ����.
        };
        Info_ClearChoices(dia_godar_teach);
};
func void dia_godar_teach_trophys_dragonscale()
{
        if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_DRAGONSCALE))
        {
                B_AI_Output(self,other,"DIA_Godar_TEACHHUNTING_DragonScale_13_00");       //����� �������� ����� �������, ����� ����� ����� ���. �� �� ����������.
        };
        Info_ClearChoices(dia_godar_teach);
};
func void dia_godar_teach_trophys_dragonblood()
{
        if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_DRAGONBLOOD))
        {
                B_AI_Output(self,other,"DIA_Godar_TEACHHUNTING_DragonBlood_13_00");       //����� ������ ����� �� ������ �������. ��� ����� ����� ������� ��� �����.
        };
        Info_ClearChoices(dia_godar_teach);
};
instance DIA_GODAR_ALLDRAGONSDEAD(C_INFO)
{
        npc = djg_711_godar;
        nr = 5;
        condition = dia_godar_alldragonsdead_condition;
        information = dia_godar_alldragonsdead_info;
        permanent = FALSE;
        description = "� ���� ���� ��������.";
};
func int dia_godar_alldragonsdead_condition()
{
        if(MIS_ALLDRAGONSDEAD == TRUE)
        {
                return TRUE;
        };
};
func void dia_godar_alldragonsdead_info()
{
        B_AI_Output(other,self,"DIA_Godar_AllDragonsDead_15_00"); //� ���� ���� ��������.
        B_AI_Output(self,other,"DIA_Godar_AllDragonsDead_13_01"); //�� � �����. �����, � ������, �� ��� ����� ������, ��� ����������.
};
instance DIA_GODAR_PICKPOCKET(C_INFO)
{
        npc = djg_711_godar;
        nr = 900;
        condition = dia_godar_pickpocket_condition;
        information = dia_godar_pickpocket_info;
        permanent = TRUE;
        description = PICKPOCKET_20;
};
func int dia_godar_pickpocket_condition()
{
        return c_beklauen(16,160);
};
func void dia_godar_pickpocket_info()
{
        Info_ClearChoices(dia_godar_pickpocket);
        Info_AddChoice(dia_godar_pickpocket,DIALOG_BACK,dia_godar_pickpocket_back);
        Info_AddChoice(dia_godar_pickpocket,DIALOG_PICKPOCKET,dia_godar_pickpocket_doit);
};
func void dia_godar_pickpocket_doit()
{
        b_beklauen();
        Info_ClearChoices(dia_godar_pickpocket);
};
func void dia_godar_pickpocket_back()
{
        Info_ClearChoices(dia_godar_pickpocket);
};
