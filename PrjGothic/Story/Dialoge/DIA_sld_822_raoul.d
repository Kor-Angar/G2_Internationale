instance DIA_RAOUL_EXIT(C_INFO)
{
        npc = sld_822_raoul;
        nr = 999;
        condition = dia_raoul_exit_condition;
        information = dia_raoul_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_raoul_exit_condition()
{
        if(KAPITEL < 3)
        {
                return TRUE;
        };
};
func void dia_raoul_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_RAOUL_NOSENTENZA(C_INFO)
{
        npc = sld_822_raoul;
        nr = 1;
        condition = dia_raoul_nosentenza_condition;
        information = dia_raoul_nosentenza_info;
        permanent = FALSE;
        important = TRUE;
};
func int dia_raoul_nosentenza_condition()
{
        if(!Npc_KnowsInfo(other,dia_sentenza_hello) && (other.guild == GIL_NONE))
        {
                return TRUE;
        };
};
func void dia_raoul_nosentenza_info()
{
        B_AI_Output(self,other,"DIA_Raoul_NoSentenza_01_00");     //�������, ��������!
        B_AI_Output(self,other,"DIA_Raoul_NoSentenza_01_01");     //� �� �����, ����� �������� ��������� ����.
        if(Hlp_IsValidNpc(sentenza) && !c_npcisdown(sentenza))
        {
                B_AI_Output(self,other,"DIA_Raoul_NoSentenza_01_02");     //��������! ��� ����!
                B_AI_Output(self,other,"DIA_Raoul_NoSentenza_01_03");     //(�������� �������) ������� ����������, ������ �� ��������!
                B_AI_Output(self,other,"DIA_Raoul_NoSentenza_01_04");     //� ����� ���� ���� ���������� �������!
                b_attack(sentenza,other,AR_NONE,0);
        }
        else
        {
                B_AI_Output(self,other,"DIA_Raoul_NoSentenza_01_05");     //��� �� ��? �, �����, �� �����, ���� �������...
        };
        AI_StopProcessInfos(self);
};
instance DIA_RAOUL_HELLO(C_INFO)
{
        npc = sld_822_raoul;
        nr = 1;
        condition = dia_raoul_hello_condition;
        information = dia_raoul_hello_info;
        permanent = TRUE;
        important = TRUE;
};
func int dia_raoul_hello_condition()
{
        if((other.guild == GIL_NONE) && Npc_IsInState(self,zs_talk))
        {
                return TRUE;
        };
};
func void dia_raoul_hello_info()
{
        if(self.aivar[AIV_TALKEDTOPLAYER] == FALSE)
        {
                B_AI_Output(self,other,"DIA_Raoul_Hello_01_00");  //(��������) ���� ���� �����?
        }
        else
        {
                B_AI_Output(self,other,"DIA_Raoul_Hello_01_01");  //(�����������) ��� ���� ����� �� ���� ���?
        };
};
var int raoul_gesagt;
instance DIA_RAOUL_PERMNONE(C_INFO)
{
        npc = sld_822_raoul;
        nr = 1;
        condition = dia_raoul_permnone_condition;
        information = dia_raoul_permnone_info;
        permanent = TRUE;
        description = "� ���� ����������� �� ���� �����!";
};
func int dia_raoul_permnone_condition()
{
        if(other.guild == GIL_NONE)
        {
                return TRUE;
        };
};
func void dia_raoul_permnone_info()
{
        if(RAOUL_GESAGT == FALSE)
        {
                B_AI_Output(other,self,"DIA_Raoul_PERMNone_15_00");       //� ���� ����������� �� ���� �����!
                B_AI_Output(self,other,"DIA_Raoul_PERMNone_01_01");       //�� ������ � ������ �����. ��� �������. �� ������ �� � ����� ������ ������������ ����.
                B_AI_Output(self,other,"DIA_Raoul_PERMNone_01_02");       //���� �� ������ �������, �� ����������� �� ���� �����, �� ����� ������ ��������� �� ��� ���� �����.
                RAOUL_GESAGT = TRUE;
        }
        else
        {
                B_AI_Output(self,other,"DIA_Raoul_PERMNone_01_03");       //�����!
                AI_StopProcessInfos(self);
        };
};
instance DIA_RAOUL_WANNAJOIN(C_INFO)
{
        npc = sld_822_raoul;
        nr = 2;
        condition = dia_raoul_wannajoin_condition;
        information = dia_raoul_wannajoin_info;
        permanent = FALSE;
        description = "� ���� �������������� � ��!";
};
func int dia_raoul_wannajoin_condition()
{
        if(other.guild == GIL_NONE)
        {
                return TRUE;
        };
};
func void dia_raoul_wannajoin_info()
{
        B_AI_Output(other,self,"DIA_Raoul_WannaJoin_15_00");      //� ���� �������������� � ��!
        B_AI_Output(self,other,"DIA_Raoul_WannaJoin_01_01");      //���� �� ����� ���������� � ��� �� ����, ��� ����� ����� ����� �����������!
        B_AI_Output(other,self,"DIA_Raoul_WannaJoin_15_02");      //��� �� ������ ���� �������?
        B_AI_Output(self,other,"DIA_Raoul_WannaJoin_01_03");      //�� �����, ����� �� ������ ����� � ���� �������. ������ ���������� �������� ������� �������� - � ��� ���.
        B_AI_Output(self,other,"DIA_Raoul_WannaJoin_01_04");      //������� ������ �������, ��� ��������� - ��� ������ �������, �, ���� ������, �� ����.
};
instance DIA_RAOUL_ABOUTSYLVIO(C_INFO)
{
        npc = sld_822_raoul;
        nr = 2;
        condition = dia_raoul_aboutsylvio_condition;
        information = dia_raoul_aboutsylvio_info;
        permanent = FALSE;
        description = "��� ����� �������?";
};
func int dia_raoul_aboutsylvio_condition()
{
        if((RAOUL_GESAGT == TRUE) || Npc_KnowsInfo(other,dia_raoul_wannajoin))
        {
                return TRUE;
        };
};
func void dia_raoul_aboutsylvio_info()
{
        B_AI_Output(other,self,"DIA_Raoul_AboutSylvio_15_00");    //��� ����� �������?
        B_AI_Output(self,other,"DIA_Raoul_AboutSylvio_01_01");    //��� ��������� ������������, ���� ���� ��������� ��� ������. ���� �� ����������� ������� ���, ����� �� �������� ���� �������������� � ����� �����, ������ �� ����!
        B_AI_Output(self,other,"DIA_Raoul_AboutSylvio_01_02");    //���� �� ������ ����, �� �� ��������� ���� ��� ����, ����� ����� ����.
};
instance DIA_RAOUL_STIMME(C_INFO)
{
        npc = sld_822_raoul;
        nr = 2;
        condition = dia_raoul_stimme_condition;
        information = dia_raoul_stimme_info;
        permanent = FALSE;
        description = "� �� ����� ����� ���������. �� �� ����������?";
};
func int dia_raoul_stimme_condition()
{
        if(self.aivar[AIV_DEFEATEDBYPLAYER] == TRUE)
        {
                return TRUE;
        };
};
func void dia_raoul_stimme_info()
{
        B_AI_Output(other,self,"DIA_Raoul_Stimme_15_00"); //� �� ����� ����� ���������. �� �� ����������?
        B_AI_Output(self,other,"DIA_Raoul_Stimme_01_01"); //���, �����, ��� ������...
        Log_CreateTopic(TOPIC_SLDRESPEKT,LOG_MISSION);
        Log_SetTopicStatus(TOPIC_SLDRESPEKT,LOG_RUNNING);
        b_logentry(TOPIC_SLDRESPEKT,TOPIC_SLDRESPEKT_description_516); // "����� �� ��������� ������ ����� ���������� � ���� ���������."
};
instance DIA_RAOUL_DUELL(C_INFO)
{
        npc = sld_822_raoul;
        nr = 2;
        condition = dia_raoul_duell_condition;
        information = dia_raoul_duell_info;
        permanent = TRUE;
        description = "� �����, ���� ����� ���� �� �����...";
};
func int dia_raoul_duell_condition()
{
        if((RAOUL_GESAGT == TRUE) || Npc_KnowsInfo(other,dia_raoul_aboutsylvio) || Npc_KnowsInfo(other,dia_jarvis_missionko))
        {
                return TRUE;
        };
};
func void dia_raoul_duell_info()
{
        B_AI_Output(other,self,"DIA_Raoul_Duell_15_00");  //� �����, ���� ����� ���� �� �����...
        B_AI_Output(self,other,"DIA_Raoul_Duell_01_01");  //���?
        B_AI_Output(other,self,"DIA_Raoul_Duell_15_02");  //��� ������ ��, ��� ���� ������ �����...
        B_AI_Output(self,other,"DIA_Raoul_Duell_01_03");  //��-�����, � ��� � ����� ������� ������!
        AI_StopProcessInfos(self);
        b_attack(self,other,AR_NONE,1);
};
instance DIA_RAOUL_PERM(C_INFO)
{
        npc = sld_822_raoul;
        nr = 900;
        condition = dia_raoul_perm_condition;
        information = dia_raoul_perm_info;
        permanent = TRUE;
        description = "��� � �������?";
};
func int dia_raoul_perm_condition()
{
        if(other.guild != GIL_NONE)
        {
                return TRUE;
        };
};
func void dia_raoul_perm_info()
{
        B_AI_Output(other,self,"DIA_Raoul_PERM_15_00");   //��� � �������?
        if(MIS_RAOUL_KILLTROLLBLACK == LOG_RUNNING)
        {
                B_AI_Output(self,other,"DIA_Raoul_PERM_01_01");   //�� ������ �������. ��� � ������� ����� ������� ������.
        }
        else
        {
                B_AI_Output(self,other,"DIA_Raoul_PERM_01_02");   //�� ��������� ����������� �� ���? ������ �� ����!
                if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
                {
                        B_AI_Output(self,other,"DIA_Raoul_PERM_01_03");   //� �� �����, ��� �� ������ �� ����.
                };
        };
};
instance DIA_RAOUL_TROLL(C_INFO)
{
        npc = sld_822_raoul;
        nr = 2;
        condition = dia_raoul_troll_condition;
        information = dia_raoul_troll_info;
        important = TRUE;
};
func int dia_raoul_troll_condition()
{
        if(hero.guild != GIL_NONE)
        {
                return TRUE;
        };
};
func void dia_raoul_troll_info()
{
        B_AI_Output(self,other,"DIA_Raoul_TROLL_01_00");  //(�������) ������ ���������� �� ���!
        B_AI_Output(other,self,"DIA_Raoul_TROLL_15_01");  //���� ���� �����?
        if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
        {
                B_AI_Output(self,other,"DIA_Raoul_TROLL_01_02");  //�� ������������� � ��������� �����? ������ �� ��.
        };
        if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
        {
                B_AI_Output(self,other,"DIA_Raoul_TROLL_01_03");  //�� �����, ��� � ����� ������� ���� ������ �� ��, ��� �� ���� ����� �� ���.
        };
        if(hero.guild == GIL_KDF)
        {
                B_AI_Output(self,other,"DIA_Raoul_TROLL_01_04");  //������������ �� ���� �������� ����, ��?
        };
        B_AI_Output(self,other,"DIA_Raoul_TROLL_01_05");  //� ����� ���� ���� ����. �� �����, ��� �� ������, � ���� ���� ��������.
        B_AI_Output(self,other,"DIA_Raoul_TROLL_01_06");  //�� ���, ��� �� ������ ��������� ��������� ���������� � ������ ������.
        Info_ClearChoices(dia_raoul_troll);
        Info_AddChoice(dia_raoul_troll,dia_raoul_troll_weg_description,dia_raoul_troll_weg); // "� ������ ����."
        Info_AddChoice(dia_raoul_troll,dia_raoul_troll_rechnung_description,dia_raoul_troll_rechnung); // "� ��� ���� ��������?"
};
func void dia_raoul_troll_weg()
{
        B_AI_Output(other,self,"DIA_Raoul_TROLL_weg_15_00");      //� ������ ����.
        B_AI_Output(self,other,"DIA_Raoul_TROLL_weg_01_01");      //��, ����������.
        AI_StopProcessInfos(self);
};
func void dia_raoul_troll_rechnung()
{
        B_AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_15_00"); //� ��� ���� ��������?
        B_AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_01_01"); //� ���� ����� �����, ��� ��, ��������. �������� ������ �� �����, � ����� ������� �� ���� - � �����.
        B_AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_01_02"); //� �������� ���, ��� ��������� ��� �������� � ������� �������� ������ ������������ ������.
        B_AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_01_03"); //�� ����� ��� ����� � ����� ����� ������ ������. �� ���������, ��� ����� �������� ������� ������ ����� �����.
        B_AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_15_04"); //� ���?
        B_AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_01_05"); //(����������) ��� �� ������ ������� ���� '� ���'?
        B_AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_01_06"); //�� ���� ��� � ����� ����� ����� ������� ������, ������? �� ���� �� ������������� ����, ��������� ������ ��� �������?
        B_AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_01_07"); //���� �� ��������� � ��� ������� ������, ��� �������� ���� �� �����.
        Info_ClearChoices(dia_raoul_troll);
        Info_AddChoice(dia_raoul_troll,dia_raoul_troll_rechnung_hastrecht_description,dia_raoul_troll_rechnung_hastrecht); // "��� ��� �� ���������."
        if(Npc_IsDead(troll_black))
        {
                Info_AddChoice(dia_raoul_troll,dia_raoul_troll_rechnung_ich_description,dia_raoul_troll_rechnung_ich); // "� ��� ���� ������� ������."
        }
        else
        {
                Info_AddChoice(dia_raoul_troll,dia_raoul_troll_rechnung_noprob_description,dia_raoul_troll_rechnung_noprob); // "������� ������? ��� �������."
        };
};
func void b_raoul_blame()
{
        B_AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_00");   //�� ��������������, ��? � ������ ��� ��� �������� ���� ������. �� � ���� ���� ���� �������.
        B_AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_01");   //���� �� ����� ������� ����, ������ ���.
        B_AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_15_02");   //� ��� ��� � ����� �����?
        B_AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_03");   //������ ������. �����, � ���� ������� ��������� �� ���������.
        B_AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_15_04");   //�� ��� �� �����.
        B_AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_05");   //���. ������, � ������� ���� ����� ���� �����, ���� �� ��������� ��� ����� ������� ������. ��� ����?
        B_AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_15_06");   //��� �����.
        B_AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_07");   //����� ���� �� �����?
        Log_CreateTopic(TOPIC_KILLTROLLBLACK,LOG_MISSION);
        Log_SetTopicStatus(TOPIC_KILLTROLLBLACK,LOG_RUNNING);
        b_logentry(TOPIC_KILLTROLLBLACK,TOPIC_KILLTROLLBLACK_description_517); // "����� ����� � ������ ��� ����� ������� ������."
        MIS_RAOUL_KILLTROLLBLACK = LOG_RUNNING;
        Info_ClearChoices(dia_raoul_troll);
};
func void dia_raoul_troll_rechnung_hastrecht()
{
        B_AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_hastrecht_15_00");       //��� ��� �� ���������.
        B_AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_hastrecht_01_01");       //��, ��� ������.
        Info_ClearChoices(dia_raoul_troll);
};
func void dia_raoul_troll_rechnung_ich()
{
        B_AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_ich_15_00");     //� ��� ���� ������� ������.
        b_raoul_blame();
};
func void dia_raoul_troll_rechnung_noprob()
{
        B_AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_noProb_15_00");  //������� ������? ��� �������.
        b_raoul_blame();
};
instance DIA_RAOUL_TROPHYFUR(C_INFO)
{
        npc = sld_822_raoul;
        nr = 3;
        condition = dia_raoul_trophyfur_condition;
        information = dia_raoul_trophyfur_info;
        permanent = TRUE;
        description = "������� ����� ���, ��� ����� ����� � ������� ������.";
};
func int dia_raoul_trophyfur_condition()
{
        if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE) && (MIS_RAOUL_KILLTROLLBLACK == LOG_RUNNING))
        {
                return TRUE;
        };
};
func void dia_raoul_trophyfur_info()
{
        B_AI_Output(other,self,"DIA_Raoul_TrophyFur_15_00");      //������� ����� ���, ��� ����� ����� � ������� ������.
        if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_FUR))
        {
                B_AI_Output(self,other,"DIA_Raoul_TrophyFur_01_01");      //����� �������� ���� ���. ���� ����� ����������.
                B_AI_Output(self,other,"DIA_Raoul_TrophyFur_01_02");      //�� �������� ����� ����� � ������� ������ �� ������ �� ��� ���.
                B_AI_Output(self,other,"DIA_Raoul_TrophyFur_01_03");      //����� �������� � ���� ����� ����� ������. ����� ��� ��� ������?
        };
};
instance DIA_RAOUL_TROLLFELL(C_INFO)
{
        npc = sld_822_raoul;
        nr = 3;
        condition = dia_raoul_trollfell_condition;
        information = dia_raoul_trollfell_info;
        description = "� ������ ����� ������� ������.";
};
func int dia_raoul_trollfell_condition()
{
        if(Npc_HasItems(other,itat_trollblackfur) && Npc_KnowsInfo(other,dia_raoul_troll))
        {
                return TRUE;
        };
};
func void dia_raoul_trollfell_info()
{
        B_AI_Output(other,self,"DIA_Raoul_TROLLFELL_15_00");      //� ������ ����� ������� ������.
        B_AI_Output(self,other,"DIA_Raoul_TROLLFELL_01_01");      //����������. ������.
        b_giveinvitems(other,self,itat_trollblackfur,1);
        B_AI_Output(self,other,"DIA_Raoul_TROLLFELL_01_02");      //����������. ��� �� ������ �� ���?
        B_AI_Output(other,self,"DIA_Raoul_TROLLFELL_15_03");      //����� ��� ���, ��� � ���� ����.
        B_AI_Output(self,other,"DIA_Raoul_TROLLFELL_01_04");      //������. � ��� ���� 500 ������� ����� � ��� ������� �������� �����. ��� �������?
        Info_ClearChoices(dia_raoul_trollfell);
        Info_AddChoice(dia_raoul_trollfell,dia_raoul_trollfell_nein_description,dia_raoul_trollfell_nein); // "����� ������������."
        Info_AddChoice(dia_raoul_trollfell,dia_raoul_trollfell_ja_description,dia_raoul_trollfell_ja); // "������."
        MIS_RAOUL_KILLTROLLBLACK = LOG_SUCCESS;
        b_giveplayerxp(XP_RAOUL_KILLTROLLBLACK);
};
func void dia_raoul_trollfell_ja()
{
        B_AI_Output(other,self,"DIA_Raoul_TROLLFELL_ja_15_00");   //�������.
        B_AI_Output(self,other,"DIA_Raoul_TROLLFELL_ja_01_01");   //�������� ������.
        CreateInvItems(self,itpo_health_03,3);
        b_giveinvitems(self,other,itpo_health_03,3);
        CreateInvItems(self,itmi_gold,500);
        b_giveinvitems(self,other,itmi_gold,500);
        Info_ClearChoices(dia_raoul_trollfell);
};
func void dia_raoul_trollfell_nein()
{
        B_AI_Output(other,self,"DIA_Raoul_TROLLFELL_nein_15_00"); //����� ������������.
        B_AI_Output(self,other,"DIA_Raoul_TROLLFELL_nein_01_01"); //��� ������. � ��� ����� ������ ��� �����.
        B_AI_Output(self,other,"DIA_Raoul_TROLLFELL_nein_01_02"); //� �� ����� ����, ���� ����� ����� �����������.
        MIS_RAOUL_DOESNTPAYTROLLFUR = LOG_RUNNING;
        AI_StopProcessInfos(self);
};
instance DIA_RAOUL_FELLZURUECK(C_INFO)
{
        npc = sld_822_raoul;
        nr = 3;
        condition = dia_raoul_fellzurueck_condition;
        information = dia_raoul_fellzurueck_info;
        permanent = TRUE;
        description = "����� ��� ��� ����� ������� ������.";
};
func int dia_raoul_fellzurueck_condition()
{
        if((MIS_RAOUL_DOESNTPAYTROLLFUR == LOG_RUNNING) && Npc_HasItems(self,itat_trollblackfur))
        {
                return TRUE;
        };
};
func void dia_raoul_fellzurueck_info()
{
        B_AI_Output(other,self,"DIA_Raoul_FELLZURUECK_15_00");    //����� ��� ��� ����� ������� ������.
        B_AI_Output(self,other,"DIA_Raoul_FELLZURUECK_01_01");    //���.
        AI_StopProcessInfos(self);
};
instance DIA_RAOUL_GOTTROLLFURBACK(C_INFO)
{
        npc = sld_822_raoul;
        nr = 3;
        condition = dia_raoul_gottrollfurback_condition;
        information = dia_raoul_gottrollfurback_info;
        description = "������� ������ �� ������� �������� ����, �������?";
};
func int dia_raoul_gottrollfurback_condition()
{
        if((MIS_RAOUL_DOESNTPAYTROLLFUR == LOG_RUNNING) && (Npc_HasItems(self,itat_trollblackfur) == FALSE) && (self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST))
        {
                return TRUE;
        };
};
func void dia_raoul_gottrollfurback_info()
{
        B_AI_Output(other,self,"DIA_Raoul_GotTrollFurBack_15_00");        //������� ������ �� ������� �������� ����, �������?
        B_AI_Output(self,other,"DIA_Raoul_GotTrollFurBack_01_01");        //������. �� ������ ������� ������. ��� ��� ���������.
        MIS_RAOUL_DOESNTPAYTROLLFUR = LOG_SUCCESS;
        AI_StopProcessInfos(self);
};
instance DIA_RAOUL_KAP3_EXIT(C_INFO)
{
        npc = sld_822_raoul;
        nr = 999;
        condition = dia_raoul_kap3_exit_condition;
        information = dia_raoul_kap3_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_raoul_kap3_exit_condition()
{
        if(KAPITEL == 3)
        {
                return TRUE;
        };
};
func void dia_raoul_kap3_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_RAOUL_KAP4_EXIT(C_INFO)
{
        npc = sld_822_raoul;
        nr = 999;
        condition = dia_raoul_kap4_exit_condition;
        information = dia_raoul_kap4_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_raoul_kap4_exit_condition()
{
        if(KAPITEL == 4)
        {
                return TRUE;
        };
};
func void dia_raoul_kap4_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_RAOUL_KAP5_EXIT(C_INFO)
{
        npc = sld_822_raoul;
        nr = 999;
        condition = dia_raoul_kap5_exit_condition;
        information = dia_raoul_kap5_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_raoul_kap5_exit_condition()
{
        if(KAPITEL == 5)
        {
                return TRUE;
        };
};
func void dia_raoul_kap5_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_RAOUL_SHIP(C_INFO)
{
        npc = sld_822_raoul;
        nr = 2;
        condition = dia_raoul_ship_condition;
        information = dia_raoul_ship_info;
        description = "�� �� ��������� �� �� ���������� ������?";
};
func int dia_raoul_ship_condition()
{
        if((KAPITEL >= 5) && (MIS_SCKNOWSWAYTOIRDORATH == TRUE))
        {
                return TRUE;
        };
};
func void dia_raoul_ship_info()
{
        B_AI_Output(other,self,"DIA_Raoul_Ship_15_00");   //�� �� ��������� �� �� ���������� ������?
        B_AI_Output(self,other,"DIA_Raoul_Ship_01_01");   //��� �� ����������? �� ������ ��������� ������� ���������? (�������)
        B_AI_Output(other,self,"DIA_Raoul_Ship_15_02");   //� ��� ���� � ���?
        B_AI_Output(self,other,"DIA_Raoul_Ship_01_03");   //(��������) � ���� ������ ����� �������. ���, �������. ��� �� ��� ����.
        B_AI_Output(self,other,"DIA_Raoul_Ship_01_04");   //� �� ���� ������ �������� �������. ��� ��� �����, ��� ������������ ������, ����� ��� �� ��������.
        B_AI_Output(self,other,"DIA_Raoul_Ship_01_05");   //����� ����-������ ���.
        if(Npc_IsDead(torlof) == FALSE)
        {
                B_AI_Output(self,other,"DIA_Raoul_Ship_01_06");   //������ �������. �� ����� �� �����, ��������� � ����.
        };
};
instance DIA_RAOUL_KAP6_EXIT(C_INFO)
{
        npc = sld_822_raoul;
        nr = 999;
        condition = dia_raoul_kap6_exit_condition;
        information = dia_raoul_kap6_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_raoul_kap6_exit_condition()
{
        if(KAPITEL == 6)
        {
                return TRUE;
        };
};
func void dia_raoul_kap6_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_RAOUL_PICKPOCKET(C_INFO)
{
        npc = sld_822_raoul;
        nr = 900;
        condition = dia_raoul_pickpocket_condition;
        information = dia_raoul_pickpocket_info;
        permanent = TRUE;
        description = PICKPOCKET_60;
};
func int dia_raoul_pickpocket_condition()
{
        return c_beklauen(45,85);
};
func void dia_raoul_pickpocket_info()
{
        Info_ClearChoices(dia_raoul_pickpocket);
        Info_AddChoice(dia_raoul_pickpocket,DIALOG_BACK,dia_raoul_pickpocket_back);
        Info_AddChoice(dia_raoul_pickpocket,DIALOG_PICKPOCKET,dia_raoul_pickpocket_doit);
};
func void dia_raoul_pickpocket_doit()
{
        b_beklauen();
        Info_ClearChoices(dia_raoul_pickpocket);
};
func void dia_raoul_pickpocket_back()
{
        Info_ClearChoices(dia_raoul_pickpocket);
};
