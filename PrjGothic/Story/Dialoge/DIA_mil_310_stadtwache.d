instance DIA_MIL_310_STADTWACHE_EXIT(C_INFO)
{
        npc = mil_310_stadtwache;
        nr = 999;
        condition = dia_mil_310_stadtwache_exit_condition;
        information = dia_mil_310_stadtwache_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_mil_310_stadtwache_exit_condition()
{
        return TRUE;
};
func void dia_mil_310_stadtwache_exit_info()
{
        AI_StopProcessInfos(self);
};
const string MIL_310_CHECKPOINT = "NW_CITY_ENTRANCE_MAIN";
var int mil_310_personal_absolutionlevel;
instance DIA_MIL_310_STADTWACHE_FIRSTWARN(C_INFO)
{
        npc = mil_310_stadtwache;
        nr = 1;
        condition = dia_mil_310_stadtwache_firstwarn_condition;
        information = dia_mil_310_stadtwache_firstwarn_info;
        permanent = TRUE;
        important = TRUE;
};
func int dia_mil_310_stadtwache_firstwarn_condition()
{
        if(Npc_GetDistToWP(other,MIL_310_CHECKPOINT) <= 700)
        {
                Npc_SetRefuseTalk(self,5);
                return FALSE;
        };
        if((b_getgreatestpetzcrime(self) >= CRIME_ATTACK) && (b_getcurrentabsolutionlevel(self) == MIL_310_PERSONAL_ABSOLUTIONLEVEL))
        {
                self.aivar[AIV_PASSGATE] = FALSE;
        }
        else if(MIL_310_SCHONMALREINGELASSEN == TRUE)
        {
                self.aivar[AIV_PASSGATE] = TRUE;
        };
        if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_RefuseTalk(self) == FALSE))
        {
                return TRUE;
        };
};
func void dia_mil_310_stadtwache_firstwarn_info()
{
        var C_ITEM itm;
        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_00"); //����!
        if(b_getgreatestpetzcrime(self) >= CRIME_ATTACK)
        {
                B_AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_01"); //(��������) ��� ���?
                B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_02"); //�� ��� ������, ���!
                if(b_getgreatestpetzcrime(self) == CRIME_MURDER)
                {
                        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_03"); //�� �������������� �� �������� � ������!
                };
                if(b_getgreatestpetzcrime(self) == CRIME_THEFT)
                {
                        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_04"); //�� �� �������� ����� ������� �����!
                };
                if(b_getgreatestpetzcrime(self) == CRIME_ATTACK)
                {
                        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_05"); //��� �� ����� �������� � ������!
                };
                B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_06"); //� ���� �� ����, ��� �� ������ �������� ����?
        }
        else
        {
                itm = Npc_GetEquippedArmor(other);
                if((Npc_HasEquippedArmor(other) == FALSE) && (hero.guild == GIL_NONE))
                {
                        B_AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_07"); //���?
                        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_08"); //���� ���� ������!
                        B_AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_09"); //������?
                        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_10"); //�� ����� ����������, ��� ��, ���� ��������!
                        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_11"); //� ������ � ��� ������� ������� ������. ��� �� ����� ����, � ������� ��� �����.
                        Log_CreateTopic(TOPIC_CITY,LOG_MISSION);
                        Log_SetTopicStatus(TOPIC_CITY,LOG_RUNNING);
                        b_logentry(TOPIC_CITY,TOPIC_CITY_description_241); // "����� ��������� ��������� ��� ����� � ����� � ������ ��������� ��� ��� ����� � ���� ���� ������. �� ��� � ������ ����� �����-������ ������ ������."
                }
                else if((Hlp_IsItem(itm,itar_bau_l) == TRUE) || (Hlp_IsItem(itm,itar_bau_m) == TRUE))
                {
                        if(self.aivar[AIV_TALKEDTOPLAYER] == TRUE)
                        {
                                B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_12"); //��� ���� ����� �� ���� ���?
                                B_AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_13"); //���� ������ ������.
                                B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_14"); //�? � ���� ���� �� �� ���� ��� ���� ������������ �������, ����� ������� � �����?
                        }
                        else
                        {
                                B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_15"); //�� ���� �� ���������� � ����� �������? � ������� �� ����� ����!
                                B_AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_16"); //� ������� ������� �� �������.
                                B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_17"); //��� ���� ����� � ������?
                        };
                }
                else
                {
                        B_AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_18"); //(��������) ���?
                        if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
                        {
                                B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_19"); //����� �������� ����, � ������ �������� ������.
                                B_AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_20"); //�� ������ ���������� ����?
                                B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_21"); //�������, ���. �� ������ ���� ���������� ������.
                        }
                        else
                        {
                                B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_22"); //� ������ ����� ����������� ����. ������, � ���� ���� ������. ������ ��������.
                        };
                        self.aivar[AIV_PASSGATE] = TRUE;
                        stadtwache_333.aivar[AIV_PASSGATE] = TRUE;
                        MIL_310_SCHONMALREINGELASSEN = TRUE;
                        b_checklog();
                        AI_StopProcessInfos(self);
                };
        };
        other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,MIL_310_CHECKPOINT);
        self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_FIRSTWARNGIVEN;
};
instance DIA_MIL_310_STADTWACHE_SECONDWARN(C_INFO)
{
        npc = mil_310_stadtwache;
        nr = 2;
        condition = dia_mil_310_stadtwache_secondwarn_condition;
        information = dia_mil_310_stadtwache_secondwarn_info;
        permanent = TRUE;
        important = TRUE;
};
func int dia_mil_310_stadtwache_secondwarn_condition()
{
        if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_FIRSTWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,MIL_310_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
        {
                return TRUE;
        };
};
func void dia_mil_310_stadtwache_secondwarn_info()
{
        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_SecondWarn_07_00");        //������ ������. ��� ���� ��� - � � ������� ���� � �������!
        other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,MIL_310_CHECKPOINT);
        self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_SECONDWARNGIVEN;
        AI_StopProcessInfos(self);
};
instance DIA_MIL_310_STADTWACHE_ATTACK(C_INFO)
{
        npc = mil_310_stadtwache;
        nr = 3;
        condition = dia_mil_310_stadtwache_attack_condition;
        information = dia_mil_310_stadtwache_attack_info;
        permanent = TRUE;
        important = TRUE;
};
func int dia_mil_310_stadtwache_attack_condition()
{
        if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_SECONDWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,MIL_310_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
        {
                return TRUE;
        };
};
func void dia_mil_310_stadtwache_attack_info()
{
        other.aivar[AIV_LASTDISTTOWP] = 0;
        self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_NONE;
        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Attack_07_00");    //�� ��� ����������...
        AI_StopProcessInfos(self);
        b_attack(self,other,AR_GUARDSTOPSINTRUDER,0);
};
instance DIA_MIL_310_STADTWACHE_BRIBE(C_INFO)
{
        npc = mil_310_stadtwache;
        nr = 5;
        condition = dia_mil_310_stadtwache_bribe_condition;
        information = dia_mil_310_stadtwache_bribe_info;
        permanent = TRUE;
        description = "��� 100 �������. ������� ��� ������!";
};
func int dia_mil_310_stadtwache_bribe_condition()
{
        if(self.aivar[AIV_PASSGATE] == FALSE)
        {
                return TRUE;
        };
};
func void dia_mil_310_stadtwache_bribe_info()
{
        B_AI_Output(other,self,"DIA_Mil_310_Stadtwache_Bribe_15_00");     //��� 100 �������. ������� ��� ������!
        if(b_giveinvitems(other,self,itmi_gold,100))
        {
                B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Bribe_07_01");     //(�����) 100 ������� - ��� �������. �������, �������.
                if(b_getgreatestpetzcrime(self) >= CRIME_ATTACK)
                {
                        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Bribe_07_02");     //� ����� ��� � �����! ��� � � ��������� ��� ����� ������ � ���� 100 �������!
                };
                self.aivar[AIV_PASSGATE] = TRUE;
                stadtwache_333.aivar[AIV_PASSGATE] = TRUE;
                MIL_310_SCHONMALREINGELASSEN = TRUE;
                b_checklog();
                MIL_310_PERSONAL_ABSOLUTIONLEVEL = b_getcurrentabsolutionlevel(self) + 1;
        }
        else
        {
                B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Bribe_07_03");     //���?! ���?! � �� ���� ������. ����������!
        };
        AI_StopProcessInfos(self);
};
instance DIA_MIL_310_STADTWACHE_PASSIERSCHEIN(C_INFO)
{
        npc = mil_310_stadtwache;
        nr = 4;
        condition = dia_mil_310_stadtwache_passierschein_condition;
        information = dia_mil_310_stadtwache_passierschein_info;
        permanent = FALSE;
        description = "� ���� ���� �������!";
};
func int dia_mil_310_stadtwache_passierschein_condition()
{
        if(Npc_HasItems(other,itwr_passierschein) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK) && (MIL_310_SCHONMALREINGELASSEN == FALSE))
        {
                return TRUE;
        };
};
func void dia_mil_310_stadtwache_passierschein_info()
{
        B_AI_Output(other,self,"DIA_Mil_310_Stadtwache_Passierschein_15_00");     //� ���� ���� �������!
        if(Npc_HasEquippedArmor(other) == FALSE)
        {
                B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Passierschein_07_01");     //�� ��? � ���� �� ���� ���� ���� �������?
                B_AI_Output(other,self,"DIA_Mil_310_Stadtwache_Passierschein_15_02");     //��� �� ��������� ��� ������ ��� ���?
                B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Passierschein_07_03");     //�����, ���, ���� � �� ���������!
        }
        else
        {
                B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Passierschein_07_04");     //��� � �������. �������.
        };
        self.aivar[AIV_PASSGATE] = TRUE;
        stadtwache_333.aivar[AIV_PASSGATE] = TRUE;
        MIL_310_SCHONMALREINGELASSEN = TRUE;
        b_checklog();
        AI_StopProcessInfos(self);
};
instance DIA_MIL_310_STADTWACHE_ZUMSCHMIED(C_INFO)
{
        npc = mil_310_stadtwache;
        nr = 3;
        condition = dia_mil_310_stadtwache_zumschmied_condition;
        information = dia_mil_310_stadtwache_zumschmied_info;
        permanent = FALSE;
        description = "� ���� ��������� � ��������. �� ������ �������� ���-����� ������.";
};
func int dia_mil_310_stadtwache_zumschmied_condition()
{
        var C_ITEM itm;
        itm = Npc_GetEquippedArmor(other);
        if(((Hlp_IsItem(itm,itar_bau_l) == TRUE) || (Hlp_IsItem(itm,itar_bau_m) == TRUE)) && Npc_KnowsInfo(other,dia_maleth_tothecity) && (MIL_310_SCHONMALREINGELASSEN == FALSE))
        {
                return TRUE;
        };
};
func void dia_mil_310_stadtwache_zumschmied_info()
{
        B_AI_Output(other,self,"DIA_Mil_310_Stadtwache_ZumSchmied_15_00");        //� ���� ��������� � ��������. �� ������ �������� ���-����� ������.
        if(MIL_310_SCHEISSE_ERZAEHLT == TRUE)
        {
                B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_ZumSchmied_07_01");        //(���) ��? � ������ �� ��� ����� �� ������?
                B_AI_Output(other,self,"DIA_Mil_310_Stadtwache_ZumSchmied_15_02");        //��� ������ ���� ���������, ��� �� ������ �����������.
                B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_ZumSchmied_07_03");        //���?! ��� ��� �������� ����� �����, � � ������ ����, ��� � �������� �� ����� �������, ����� �����������!
        }
        else
        {
                B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_ZumSchmied_07_04");        //������, �� ������ ���������.
        };
        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_ZumSchmied_07_05");        //� ���� ������� �������, ����� ���, ����� ����� ������ ����� ����: �� ����� ������ � ���� �� ����! (������� ����)
        self.aivar[AIV_PASSGATE] = TRUE;
        stadtwache_333.aivar[AIV_PASSGATE] = TRUE;
        MIL_310_SCHONMALREINGELASSEN = TRUE;
        b_checklog();
        b_giveplayerxp(XP_AMBIENT);
        AI_StopProcessInfos(self);
};
instance DIA_MIL_310_STADTWACHE_MILIZWERDEN(C_INFO)
{
        npc = mil_310_stadtwache;
        nr = 2;
        condition = dia_mil_310_stadtwache_milizwerden_condition;
        information = dia_mil_310_stadtwache_milizwerden_info;
        permanent = FALSE;
        description = "� ������, ����� �������� � ���������!";
};
func int dia_mil_310_stadtwache_milizwerden_condition()
{
        if(MIL_310_SCHONMALREINGELASSEN == FALSE)
        {
                return TRUE;
        };
};
func void dia_mil_310_stadtwache_milizwerden_info()
{
        B_AI_Output(other,self,"DIA_Mil_310_Stadtwache_MilizWerden_15_00");       //� ������, ����� �������� � ���������!
        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_MilizWerden_07_01");       //�� �� ���?! �������� ���������� ��� ������ � ������ ����� - �����, ��� ������� �� ���.
        MIL_310_SCHEISSE_ERZAEHLT = TRUE;
};
instance DIA_MIL_310_STADTWACHE_PALADINE(C_INFO)
{
        npc = mil_310_stadtwache;
        nr = 1;
        condition = dia_mil_310_stadtwache_paladine_condition;
        information = dia_mil_310_stadtwache_paladine_info;
        permanent = FALSE;
        description = "��� ����� ������� ����� ���������!";
};
func int dia_mil_310_stadtwache_paladine_condition()
{
        if(MIL_310_SCHONMALREINGELASSEN == FALSE)
        {
                return TRUE;
        };
};
func void dia_mil_310_stadtwache_paladine_info()
{
        B_AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_15_00");  //��� ����� ������� ����� ���������! � ���� ������ ��������� ��� ����!
        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_07_01");  //��? � ��� ��� �� ������ ���������?
        MIL_310_SCHEISSE_ERZAEHLT = TRUE;
        Info_ClearChoices(dia_mil_310_stadtwache_paladine);
        Info_AddChoice(dia_mil_310_stadtwache_paladine,dia_mil_310_stadtwache_paladine_attacksoon_description,dia_mil_310_stadtwache_paladine_attacksoon); // "����� ����� ������������ ���������!"
        Info_AddChoice(dia_mil_310_stadtwache_paladine,dia_mil_310_stadtwache_paladine_evilarmy_description,dia_mil_310_stadtwache_paladine_evilarmy); // "���� ��� ���������� � ������ ��������!"
        Info_AddChoice(dia_mil_310_stadtwache_paladine,dia_mil_310_stadtwache_paladine_eyeinnos_description,dia_mil_310_stadtwache_paladine_eyeinnos); // "� ������ ����� �������� ���� ������!"
};
func void dia_mil_310_stadtwache_paladine_eyeinnos()
{
        B_AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_15_00"); //� ������, ����� �������� ���� ������!
        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_07_01"); //���? ������� �� ������ � ���. � ��� ��� �����?
        B_AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_15_02"); //��� ����� ������ ��������.
        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_07_03"); //�� �� ����� �� ������� ����������. � ���� ���� �����-������ ���������?
        if(!Npc_HasItems(other,itwr_passierschein) > 0)
        {
                B_AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_15_04"); //���!
                B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_07_05"); //����� �� ����� ��� ����� �������!
        };
        Info_ClearChoices(dia_mil_310_stadtwache_paladine);
};
func void dia_mil_310_stadtwache_paladine_evilarmy()
{
        B_AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_EvilArmy_15_00"); //���� ��� ���������� � ������ ��������!
        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_EvilArmy_07_01"); //� ������ ��������? �� ������ ������? �� ����� ��� �����?
        Info_ClearChoices(dia_mil_310_stadtwache_paladine);
        Info_AddChoice(dia_mil_310_stadtwache_paladine,dia_mil_310_stadtwache_paladine_nosomeone_description,dia_mil_310_stadtwache_paladine_nosomeone); // "��� �� ���� ������ ������� ������� ����� ��."
        Info_AddChoice(dia_mil_310_stadtwache_paladine,dia_mil_310_stadtwache_paladine_nodragons_description,dia_mil_310_stadtwache_paladine_nodragons); // "���. �� � ���� ��� �� ����� �������!"
        Info_AddChoice(dia_mil_310_stadtwache_paladine,dia_mil_310_stadtwache_paladine_yesdragons_description,dia_mil_310_stadtwache_paladine_yesdragons); // "��. � ��� � ������ ��������. � ����� ��� ���������� ��������!"
};
func void dia_mil_310_stadtwache_paladine_attacksoon()
{
        B_AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_AttackSoon_15_00");       //����� ����� ������������ ���������!
        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_AttackSoon_07_01");       //���? ����? �����? �� ����� �����?
        Info_ClearChoices(dia_mil_310_stadtwache_paladine);
        Info_AddChoice(dia_mil_310_stadtwache_paladine,dia_mil_310_stadtwache_paladine_nosomeone_description,dia_mil_310_stadtwache_paladine_nosomeone); // "��� �� ���� ������ ������� ������� ����� ��."
        Info_AddChoice(dia_mil_310_stadtwache_paladine,dia_mil_310_stadtwache_paladine_nodragons_description,dia_mil_310_stadtwache_paladine_nodragons); // "���. �� � ���� ��� �� ����� �������!"
        Info_AddChoice(dia_mil_310_stadtwache_paladine,dia_mil_310_stadtwache_paladine_yesdragons_description,dia_mil_310_stadtwache_paladine_yesdragons); // "��. � ��� � ������ ��������. � ����� ��� ���������� ��������!"
};
func void dia_mil_310_stadtwache_paladine_nodragons()
{
        B_AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_NoDragons_15_00");        //���. �� � ����, ��� �� ����� �������!
        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_NoDragons_07_01");        //�� �������! ��� ������� ������������� ��������� �����.
        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_NoDragons_07_02");        //� �� �����, ��� �� �������� ���� ������� ��� �������� ������� �� ���� ����� ������!
        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_NoDragons_07_03");        //����������!
        PLAYER_KNOWSLORDHAGEN = TRUE;
        AI_StopProcessInfos(self);
};
func void dia_mil_310_stadtwache_paladine_nosomeone()
{
        B_AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_NoSomeone_15_00");        //���, �� ���� ������ �������, ������� ����� ��.
        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_NoSomeone_07_01");        //(�����������) ��� ������ ����?
        Info_ClearChoices(dia_mil_310_stadtwache_paladine);
        Info_AddChoice(dia_mil_310_stadtwache_paladine,dia_mil_310_stadtwache_paladine_canttellyou_description,dia_mil_310_stadtwache_paladine_canttellyou); // "� �� ������ ������������ ���� �� ����."
        Info_AddChoice(dia_mil_310_stadtwache_paladine,dia_mil_310_stadtwache_paladine_apaladin_description,dia_mil_310_stadtwache_paladine_apaladin); // "�������."
        Info_AddChoice(dia_mil_310_stadtwache_paladine,dia_mil_310_stadtwache_paladine_amage_description,dia_mil_310_stadtwache_paladine_amage); // "���."
};
func void dia_mil_310_stadtwache_paladine_yesdragons()
{
        B_AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_YesDragons_15_00");       //��. � ��� � ������ ��������. � ����� ��� ���������� ��������!
        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_YesDragons_07_01");       //�� �����! ������ � ������ ������ � ����� ������. ����� �� ������� ���!
        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_YesDragons_07_02");       //�������� ������!
        AI_StopProcessInfos(self);
};
func void dia_mil_310_stadtwache_paladine_amage()
{
        B_AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_AMage_15_00");    //���.
        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_AMage_07_01");    //�� ������ ������� �� ����? ����� � ����, �������, ���� ������ � �������� ��������������?!
        B_AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_AMage_15_02");    //���.
        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_AMage_07_03");    //���? ���� ������ ���� ����� ��������� ������.
        B_AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_AMage_15_04");    //�� �� ���� ���.
        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_AMage_07_05");    //� �� ���� ����. ���� �� ��������� ���������, �� �����, ���������� ���� ������� ��� ����������!
        Info_ClearChoices(dia_mil_310_stadtwache_paladine);
        Info_AddChoice(dia_mil_310_stadtwache_paladine,dia_mil_310_stadtwache_paladine_onlypaladins_description,dia_mil_310_stadtwache_paladine_onlypaladins); // "� ���� �������� ��� ��������� ������ ���������!"
        Info_AddChoice(dia_mil_310_stadtwache_paladine,dia_mil_310_stadtwache_paladine_depechedragons_description,dia_mil_310_stadtwache_paladine_depechedragons); // "����� ��� ����������� �������!"
};
func void dia_mil_310_stadtwache_paladine_apaladin()
{
        B_AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_APaladin_15_00"); //�������.
        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_APaladin_07_01"); //��, ��� �������� - �������� �������� ������ � ������ ��������.
        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_APaladin_07_02"); //��� ��� ���� ���������, � � ������ � ����.
        Info_ClearChoices(dia_mil_310_stadtwache_paladine);
        Info_AddChoice(dia_mil_310_stadtwache_paladine,dia_mil_310_stadtwache_paladine_onlypaladins_description,dia_mil_310_stadtwache_paladine_onlypaladins); // "� ���� �������� ��� ��������� ������ ���������!"
        Info_AddChoice(dia_mil_310_stadtwache_paladine,dia_mil_310_stadtwache_paladine_depechedragons_description,dia_mil_310_stadtwache_paladine_depechedragons); // "����� ��� ����������� �������!"
};
func void dia_mil_310_stadtwache_paladine_canttellyou()
{
        B_AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_CantTellYou_15_00");      //� �� ������ ������������ ���� �� ����.
        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_CantTellYou_07_01");      //�� ������� ���, ��� �������! � ������ � ��������� ������.
        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_CantTellYou_07_02");      //�� ������ ���������� ��� ���. ����, ��� ������ ����?
};
func void dia_mil_310_stadtwache_paladine_depechedragons()
{
        B_AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_15_00");   //����� ��� ����������� �������!
        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_07_01");   //���? ��� �� ����� ���� �������. � � ���� �� ������� ����!
        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_07_02");   //���� �� �� ��������� ��� ������� ����� ������, �� �� ������� ���� �� ����������.
        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_07_03");   //����������!
        PLAYER_KNOWSLORDHAGEN = TRUE;
        AI_StopProcessInfos(self);
};
func void dia_mil_310_stadtwache_paladine_onlypaladins()
{
        B_AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins_15_00");     //� ���� �������� ��� ��������� ������ ���������!
        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins_07_01");     //��� �� ���������, ��� �������!
        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins_07_02");     //� �� �� ��� �� ������� ���� ���������� � ����� ������, ���� �� ���� ������, ��� �� �� ��������� ��� ����������� ����� �������.
        PLAYER_KNOWSLORDHAGEN = TRUE;
        Info_ClearChoices(dia_mil_310_stadtwache_paladine);
        Info_AddChoice(dia_mil_310_stadtwache_paladine,dia_mil_310_stadtwache_paladine_only2_description,dia_mil_310_stadtwache_paladine_only2); // "���. ��� ��������� ������������� ������ ���������."
        Info_AddChoice(dia_mil_310_stadtwache_paladine,dia_mil_310_stadtwache_paladine_depechedragons_description,dia_mil_310_stadtwache_paladine_depechedragons); // "����� ��� ����������� �������!"
};
func void dia_mil_310_stadtwache_paladine_only2()
{
        B_AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_Only2_15_00");    //���. ��� ��������� ������������� ������ ���������.
        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_Only2_07_01");    //����� ���� ���� ������������ �����, ���������.
        AI_StopProcessInfos(self);
};
instance DIA_MIL_310_STADTWACHE_PERM(C_INFO)
{
        npc = mil_310_stadtwache;
        nr = 5;
        condition = dia_mil_310_stadtwache_perm_condition;
        information = dia_mil_310_stadtwache_perm_info;
        permanent = TRUE;
        important = TRUE;
};
func int dia_mil_310_stadtwache_perm_condition()
{
        if((self.aivar[AIV_PASSGATE] == TRUE) && Npc_IsInState(self,zs_talk))
        {
                return TRUE;
        };
};
func void dia_mil_310_stadtwache_perm_info()
{
        B_AI_Output(self,other,"DIA_Mil_310_Stadtwache_PERM_07_00");      //�������!
        AI_StopProcessInfos(self);
};
