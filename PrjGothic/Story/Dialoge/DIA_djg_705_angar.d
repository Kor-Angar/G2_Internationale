instance DIA_ANGARDJG_EXIT(C_INFO)
{
        npc = djg_705_angar;
        nr = 999;
        condition = dia_angardjg_exit_condition;
        information = dia_angardjg_exit_info;
        permanent = TRUE;
        description = DIALOG_ENDE;
};
func int dia_angardjg_exit_condition()
{
        return TRUE;
};
func void dia_angardjg_exit_info()
{
        AI_StopProcessInfos(self);
};
instance DIA_ANGARDJG_HALLO(C_INFO)
{
        npc = djg_705_angar;
        nr = 5;
        condition = dia_angardjg_hallo_condition;
        information = dia_angardjg_hallo_info;
        description = "� ���� ����?";
};
func int dia_angardjg_hallo_condition()
{
        return TRUE;
};
func void dia_angardjg_hallo_info()
{
        B_AI_Output(other,self,"DIA_AngarDJG_HALLO_15_00");       //� ���� ����? �� ��� �����. �� ��� ����������� � �������� ������.
        B_AI_Output(self,other,"DIA_AngarDJG_HALLO_04_01");       //(��������) ���� ���� ������ �������. � ������� ���� �����. �������� ������� ������ ���.
        B_AI_Output(self,other,"DIA_AngarDJG_HALLO_04_02");       //�������, �� ��� �������, ��� � ���� ���� ����. �� � ����� �� ����� ������.
        B_AI_Output(other,self,"DIA_AngarDJG_HALLO_15_03");       //��� � �����?
        B_AI_Output(self,other,"DIA_AngarDJG_HALLO_04_04");       //��. � ��� ����� ��� ��������� �����. ��� ���������� �������...
        b_logentry(TOPIC_DRAGONHUNTER,TOPIC_DRAGONHUNTER_description_124); // "� ����� ������ � ������ ��������."
};
func void b_sctellsangaraboutmadpsi()
{
        if(ANGAR_KNOWSMADPSI == FALSE)
        {
                B_AI_Output(other,self,"DIA_Angar_B_SCTellsAngarAboutMadPsi_15_00");      //�������� ������� ���� ���������� ����.
                B_AI_Output(other,self,"DIA_Angar_B_SCTellsAngarAboutMadPsi_15_01");      //���� ������ ������ �� ��������� ������ ��������� �����, �������� � ������ ����, � ������� ���, ��� ��������.
                B_AI_Output(self,other,"DIA_Angar_B_SCTellsAngarAboutMadPsi_04_02");      //� ��� �� ��������?
        };
};
func void b_sctellsangaraboutmadpsi2()
{
        if(ANGAR_KNOWSMADPSI == FALSE)
        {
                B_AI_Output(other,self,"DIA_Angar_B_SCTellsAngarAboutMadPsi2_15_00");     //������ ��� ������ ����� � ����� ���������� ������� ���.
                B_AI_Output(self,other,"DIA_Angar_B_SCTellsAngarAboutMadPsi2_04_01");     //���� ���������! � ������ � ��� ��� ����! �� ���� ������� ������ ������ �� ����������, �������.
                b_giveplayerxp(XP_ANGAR_KNOWSMADPSI);
                ANGAR_KNOWSMADPSI = TRUE;
        };
};
instance DIA_ANGAR_WIEKOMMSTDUHIERHER(C_INFO)
{
        npc = djg_705_angar;
        nr = 6;
        condition = dia_angar_wiekommstduhierher_condition;
        information = dia_angar_wiekommstduhierher_info;
        description = "��� �� �������� �����?";
};
func int dia_angar_wiekommstduhierher_condition()
{
        if(Npc_KnowsInfo(other,dia_angardjg_hallo))
        {
                return TRUE;
        };
};
func void dia_angar_wiekommstduhierher_info()
{
        B_AI_Output(other,self,"DIA_Angar_WIEKOMMSTDUHIERHER_15_00");     //��� �� �������� �����?
        B_AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_04_01");     //����� ��������� ����������� ������� � ��������� � �����. ����� ������ ����� ���-�� ������.
        B_AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_04_02");     //� ��������� ���� ������ ���, ���� ���������� �� ������� � �����. �� ��������� ����, ��� ���������. � �� ����.
        B_AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_04_03");     //� ��� ��� ����, � ����� ������� ������, ������� ��� �� ���� ������ ����. � ����� � ���, ���� �� ����� ���.
        Log_CreateTopic(TOPIC_ANGARSAMULETT,LOG_MISSION);
        Log_SetTopicStatus(TOPIC_ANGARSAMULETT,LOG_RUNNING);
        b_logentry(TOPIC_ANGARSAMULETT,TOPIC_ANGARSAMULETT_description_125); // "����� ������� ���� ������ � ������ � �������� �������� ����� ���."
        Info_AddChoice(dia_angar_wiekommstduhierher,DIALOG_BACK,dia_angar_wiekommstduhierher_gehen);
        Info_AddChoice(dia_angar_wiekommstduhierher,dia_angar_wiekommstduhierher_amulett_description,dia_angar_wiekommstduhierher_amulett); // "� ��� ������ �� ������� ���� ������?"
        if(SC_KNOWSMADPSI == TRUE)
        {
                Info_AddChoice(dia_angar_wiekommstduhierher,dia_angar_wiekommstduhierher_andere_description,dia_angar_wiekommstduhierher_andere); // "�������� ������� ���� ���������� ����."
        }
        else
        {
                Info_AddChoice(dia_angar_wiekommstduhierher,dia_angar_wiekommstduhierher_andere_description,dia_angar_wiekommstduhierher_andere); // "� ��� ��������� � ������� �� ��������� ������?"
        };
        if(DJG_ANGAR_SENTTOSTONES == FALSE)
        {
                Info_AddChoice(dia_angar_wiekommstduhierher,dia_angar_wiekommstduhierher_nun_description,dia_angar_wiekommstduhierher_nun); // "��� �� ������ ������ ������?"
        };
};
func void dia_angar_wiekommstduhierher_amulett()
{
        B_AI_Output(other,self,"DIA_Angar_WIEKOMMSTDUHIERHER_amulett_15_00");     //� ��� ������ �� ������� ���� ������?
        if(DJG_ANGAR_SENTTOSTONES == FALSE)
        {
                B_AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_amulett_04_01");     //���-�� �� ���, ������ ����� ����, ��� � ������� � �����.
                b_logentry(TOPIC_ANGARSAMULETT,TOPIC_ANGARSAMULETT_description_126); // "���� ������ ������ ���� ���-�� �� ���. ����� ���������� ����������� �� ��� ������."
        }
        else
        {
                B_AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_amulett_04_02");     //�� ������ ���� ���-�� ���.
                b_logentry(TOPIC_ANGARSAMULETT,TOPIC_ANGARSAMULETT_description_127); // "������ ��������� ����� �������� � ����� �� ��� ������ ��������."
        };
        B_AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_amulett_04_03");     //� ����������, ��� �� ��� �������. ��� ������ ���������� ������� ��� ����.
};
func void dia_angar_wiekommstduhierher_andere()
{
        if(SC_KNOWSMADPSI == TRUE)
        {
                b_sctellsangaraboutmadpsi();
        }
        else
        {
                B_AI_Output(other,self,"DIA_Angar_WIEKOMMSTDUHIERHER_andere_15_00");      //� ��� ��������� � ������� �� ��������� ������?
        };
        B_AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_andere_04_01");      //���������, ��� � �����, - ��� ��������� �������, ���������������� ��������������� ������.
        B_AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_andere_04_02");      //��� ������� ���������� �����. �� ����� �� �����, ������� �� ����. ���� �����... �� ���������� ��� ������.
        B_AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_andere_04_03");      //� ����� ����� ��� ���������, ��� �������� ��� �������� � ������� � ����, ���� ��������� ��������.
        B_AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_andere_04_04");      //� ������ � �� �� �����.
        if(SC_KNOWSMADPSI == TRUE)
        {
                b_sctellsangaraboutmadpsi2();
        };
};
func void dia_angar_wiekommstduhierher_nun()
{
        B_AI_Output(other,self,"DIA_Angar_WIEKOMMSTDUHIERHER_nun_15_00"); //� ��� �� ������ ������ ������?
        B_AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_01"); //� ������� ������� �������, � ����� �������� ������ ����� �������.
        B_AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_02"); //� ������ ���-�� � ��������.
        B_AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_03"); //����� �������, ��� � ������ �������� ������ ����� ������ - ��������� �� ���.
        B_AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_04"); //� ����� �������������� � ���.
        ANGAR_WILLDJGWERDEN = TRUE;
};
func void dia_angar_wiekommstduhierher_gehen()
{
        Info_ClearChoices(dia_angar_wiekommstduhierher);
};
instance DIA_ANGAR_SCTELLSANGARABOUTMADPSI2(C_INFO)
{
        npc = djg_705_angar;
        nr = 7;
        condition = dia_angar_sctellsangaraboutmadpsi2_condition;
        information = dia_angar_sctellsangaraboutmadpsi2_info;
        description = "�������� ������� ���� ���������� ����.";
};
func int dia_angar_sctellsangaraboutmadpsi2_condition()
{
        if((SC_KNOWSMADPSI == TRUE) && (ANGAR_KNOWSMADPSI == FALSE) && Npc_KnowsInfo(other,dia_angar_wiekommstduhierher))
        {
                return TRUE;
        };
};
func void dia_angar_sctellsangaraboutmadpsi2_info()
{
        b_sctellsangaraboutmadpsi();
        b_sctellsangaraboutmadpsi2();
};
instance DIA_ANGAR_FOUNDAMULETT(C_INFO)
{
        npc = djg_705_angar;
        nr = 7;
        condition = dia_angar_foundamulett_condition;
        information = dia_angar_foundamulett_info;
        description = "� ����� ���� ������.";
};
func int dia_angar_foundamulett_condition()
{
        if(Npc_HasItems(other,itam_mana_angar_mis) && Npc_KnowsInfo(other,dia_angar_wiekommstduhierher))
        {
                return TRUE;
        };
};
func void b_angarsamulettabgeben()
{
        B_AI_Output(other,self,"DIA_Angar_FOUNDAMULETT_15_00");   //� ����� ���� ������.
        B_AI_Output(self,other,"DIA_Angar_FOUNDAMULETT_04_01");   //�������. � �� �����, ��� ������ ������� �� ����� ���.
        b_giveinvitems(other,self,itam_mana_angar_mis,1);
        DJG_ANGARGOTAMULETT = TRUE;
        b_giveplayerxp(XP_ANGARDJGUNDEADMAGE);
};
func void dia_angar_foundamulett_info()
{
        b_angarsamulettabgeben();
        Info_AddChoice(dia_angar_foundamulett,dia_angar_foundamulett_besonders_description,dia_angar_foundamulett_besonders); // "� ��� �� ����� ���������?"
        Info_AddChoice(dia_angar_foundamulett,dia_angar_foundamulett_nun_description,dia_angar_foundamulett_nun); // "��� �� ���������� ������ ������?"
};
func void dia_angar_foundamulett_besonders()
{
        B_AI_Output(other,self,"DIA_Angar_FOUNDAMULETT_besonders_15_00"); //� ��� �� ����� ���������?
        B_AI_Output(self,other,"DIA_Angar_FOUNDAMULETT_besonders_04_01"); //��� �������.
        B_AI_Output(other,self,"DIA_Angar_FOUNDAMULETT_besonders_15_02"); //�������.
};
func void dia_angar_foundamulett_nun()
{
        B_AI_Output(other,self,"DIA_Angar_FOUNDAMULETT_nun_15_00");       //��� �� ���������� ������ ������?
        B_AI_Output(self,other,"DIA_Angar_FOUNDAMULETT_nun_04_01");       //���������� �� ���� ��������� ������.
        B_AI_Output(self,other,"DIA_Angar_FOUNDAMULETT_nun_04_02");       //����� ����, �� ��� ����������. ������.
        AI_StopProcessInfos(self);
        if((Npc_GetDistToWP(self,"OC_TO_MAGE") < 1000) == FALSE)
        {
                Npc_ExchangeRoutine(self,"LeavingOW");
        };
};
instance DIA_ANGAR_DJG_ANWERBEN(C_INFO)
{
        npc = djg_705_angar;
        nr = 8;
        condition = dia_angar_djg_anwerben_condition;
        information = dia_angar_djg_anwerben_info;
        description = "����� ����, � ����� ������ ���� ����� ������.";
};
func int dia_angar_djg_anwerben_condition()
{
        if(Npc_KnowsInfo(other,dia_angar_wiekommstduhierher) && (DJG_ANGARGOTAMULETT == FALSE))
        {
                return TRUE;
        };
};
func void dia_angar_djg_anwerben_info()
{
        B_AI_Output(other,self,"DIA_Angar_DJG_ANWERBEN_15_00");   //����� ����, � ����� ������ ���� ����� ������.
        B_AI_Output(self,other,"DIA_Angar_DJG_ANWERBEN_04_01");   //������ �� � ���. ������ ������� �� ��������.
        if(DJG_ANGAR_SENTTOSTONES == FALSE)
        {
                Info_AddChoice(dia_angar_djg_anwerben,dia_angar_djg_anwerben_gehen_description,dia_angar_djg_anwerben_gehen); // "� ������ ����."
                Info_AddChoice(dia_angar_djg_anwerben,dia_angar_djg_anwerben_wo_description,dia_angar_djg_anwerben_wo); // "��� �� ����������� ������?"
                Info_AddChoice(dia_angar_djg_anwerben,dia_angar_djg_anwerben_wann_description,dia_angar_djg_anwerben_wann); // "����� �� ������������� � ����?"
        };
        if(ANGAR_WILLDJGWERDEN == TRUE)
        {
                Info_AddChoice(dia_angar_djg_anwerben,dia_angar_djg_anwerben_djg_description,dia_angar_djg_anwerben_djg); // "��� ������ ��������� �� ��������?"
        };
};
func void dia_angar_djg_anwerben_djg()
{
        B_AI_Output(other,self,"DIA_Angar_DJG_ANWERBEN_DJG_15_00");       //��� ������ ��������� �� ��������?
        B_AI_Output(self,other,"DIA_Angar_DJG_ANWERBEN_DJG_04_01");       //� �������� � ���� �����. �����, �� ���������� ������� ����.
};
func void dia_angar_djg_anwerben_wann()
{
        B_AI_Output(other,self,"DIA_Angar_DJG_ANWERBEN_wann_15_00");      //����� �� ������������� � ����?
        B_AI_Output(self,other,"DIA_Angar_DJG_ANWERBEN_wann_04_01");      //��� �������, ��� �����.
};
func void dia_angar_djg_anwerben_wo()
{
        B_AI_Output(other,self,"DIA_Angar_DJG_ANWERBEN_wo_15_00");        //��� �� ����������� ������?
        B_AI_Output(self,other,"DIA_Angar_DJG_ANWERBEN_wo_04_01");        //� ����� �� ��, ����, ��� � ��� �������.
        B_AI_Output(self,other,"DIA_Angar_DJG_ANWERBEN_wo_04_02");        //��� ���� ����� � ������, ���������� ����� �������.
};
func void dia_angar_djg_anwerben_gehen()
{
        B_AI_Output(other,self,"DIA_Angar_DJG_ANWERBEN_gehen_15_00");     //��� ����� ����.
        B_AI_Output(self,other,"DIA_Angar_DJG_ANWERBEN_gehen_04_01");     //���� ���������.
        AI_StopProcessInfos(self);
};
instance DIA_ANGARDJG_WASMACHSTDU(C_INFO)
{
        npc = djg_705_angar;
        nr = 9;
        condition = dia_angardjg_wasmachstdu_condition;
        information = dia_angardjg_wasmachstdu_info;
        description = "���-�� �� ���?";
};
func int dia_angardjg_wasmachstdu_condition()
{
        if((Npc_GetDistToWP(self,"OW_DJG_WATCH_STONEHENGE_01") < 8000) && Npc_KnowsInfo(other,dia_angar_djg_anwerben) && (DJG_ANGARGOTAMULETT == FALSE))
        {
                return TRUE;
        };
};
func void dia_angardjg_wasmachstdu_info()
{
        B_AI_Output(other,self,"DIA_AngarDJG_WASMACHSTDU_15_00"); //���-�� �� ���?
        B_AI_Output(self,other,"DIA_AngarDJG_WASMACHSTDU_04_01"); //�� ������� ���? � ����� ������� �� ������ ������ �������� ����!
        B_AI_Output(other,self,"DIA_AngarDJG_WASMACHSTDU_15_02"); //��� �� ������ � ����? � ������ �� �����!
        B_AI_Output(self,other,"DIA_AngarDJG_WASMACHSTDU_04_03"); //��� ����� ��������� ������� � ������������. ������� ����� �������� ���� � ����� ����� ����.
        B_AI_Output(self,other,"DIA_AngarDJG_WASMACHSTDU_04_04"); //��� ��������� �����-�� ��������, ��� �������� ����� ����������� �� ����������� ����� ����.
        B_AI_Output(self,other,"DIA_AngarDJG_WASMACHSTDU_04_05"); //� ����� ������, ��� ��� ������ ��� ������� ���-�� �����.
        if(ANGAR_WILLDJGWERDEN == TRUE)
        {
                Info_AddChoice(dia_angardjg_wasmachstdu,dia_angardjg_wasmachstdu_djg_description,dia_angardjg_wasmachstdu_djg); // "�� ������� � ���������� �� ��������?"
        };
};
func void dia_angardjg_wasmachstdu_djg()
{
        B_AI_Output(other,self,"DIA_AngarDJG_WASMACHSTDU_DJG_15_00");     //�� ������� � ���������� �� ��������?
        B_AI_Output(self,other,"DIA_AngarDJG_WASMACHSTDU_DJG_04_01");     //��. �� � ������, ��� ��� ����� ��������, �������� ����, ��� ���� � ��� � �������� ������.
        B_AI_Output(self,other,"DIA_AngarDJG_WASMACHSTDU_DJG_04_02");     //� ��� ����� - ������ ����� ������� ����� �������. ��� ������ � ���� ������.
};
instance DIA_ANGARDJG_WHATSINTHERE(C_INFO)
{
        npc = djg_705_angar;
        nr = 10;
        condition = dia_angardjg_whatsinthere_condition;
        information = dia_angardjg_whatsinthere_info;
        description = "��� ���������� � ���� ������ � ������?";
};
func int dia_angardjg_whatsinthere_condition()
{
        if(Npc_KnowsInfo(other,dia_angardjg_wasmachstdu) && (DJG_ANGARGOTAMULETT == FALSE))
        {
                return TRUE;
        };
};
func void dia_angardjg_whatsinthere_info()
{
        B_AI_Output(other,self,"DIA_AngarDJG_WHATSINTHERE_15_00");        //��� ���������� � ���� ������ � ������?
        B_AI_Output(self,other,"DIA_AngarDJG_WHATSINTHERE_04_01");        //���-��, ��� �� ��������� ��� ������������ � �����!
        B_AI_Output(self,other,"DIA_AngarDJG_WHATSINTHERE_04_02");        //��� �������� ���������� ��������. � ����� ��� �����, �� ��� ������. �������������� ��������.
        B_AI_Output(self,other,"DIA_AngarDJG_WHATSINTHERE_04_03");        //�� ������ ����� ���������, � � ���� ���� �����������, ��� �� ���������� ��� ����� ������ � ��������� ��, ��� �����.
        b_logentry(TOPIC_DRAGONHUNTER,TOPIC_DRAGONHUNTER_description_128); // "� ����� ������ � ������ ��������."
};
instance DIA_ANGARDJG_WANTTOGOINTHERE(C_INFO)
{
        npc = djg_705_angar;
        nr = 11;
        condition = dia_angardjg_wanttogointhere_condition;
        information = dia_angardjg_wanttogointhere_info;
        description = "������ ������.";
};
func int dia_angardjg_wanttogointhere_condition()
{
        if(Npc_KnowsInfo(other,dia_angardjg_whatsinthere) && (DJG_ANGARGOTAMULETT == FALSE))
        {
                return TRUE;
        };
};
func void dia_angardjg_wanttogointhere_info()
{
        B_AI_Output(other,self,"DIA_AngarDJG_WANTTOGOINTHERE_15_00");     //������ ������.
        B_AI_Output(self,other,"DIA_AngarDJG_WANTTOGOINTHERE_04_01");     //� ��������. �� ����� ���� �����������.
        AI_StopProcessInfos(self);
        if(Npc_IsDead(skeletonmage_angar))
        {
                Npc_ExchangeRoutine(self,"Zwischenstop");
        }
        else
        {
                Npc_ExchangeRoutine(self,"Angriff");
                DJG_ANGARANGRIFF = TRUE;
        };
        self.aivar[AIV_PARTYMEMBER] = TRUE;
};
instance DIA_ANGARDJG_UNDEADMAGEDEAD(C_INFO)
{
        npc = djg_705_angar;
        nr = 13;
        condition = dia_angardjg_undeadmagedead_condition;
        information = dia_angardjg_undeadmagedead_info;
        important = TRUE;
};
func int dia_angardjg_undeadmagedead_condition()
{
        if((Npc_GetDistToWP(self,"OW_UNDEAD_DUNGEON_02") < 1000) && (DJG_ANGARANGRIFF == TRUE) && (DJG_ANGARGOTAMULETT == FALSE) && Npc_IsDead(skeletonmage_angar))
        {
                return TRUE;
        };
};
func void dia_angardjg_undeadmagedead_info()
{
        B_AI_Output(self,other,"DIA_AngarDJG_UndeadMageDead_04_00");      //(������ �����) ����� ������ ������ � ����������. � ������ ������� ������.
        AI_StopProcessInfos(self);
        self.aivar[AIV_PARTYMEMBER] = FALSE;
        Npc_ExchangeRoutine(self,"RunToEntrance");
};
instance DIA_ANGARDJG_UNDEADMAGECOMES(C_INFO)
{
        npc = djg_705_angar;
        nr = 13;
        condition = dia_angardjg_undeadmagecomes_condition;
        information = dia_angardjg_undeadmagecomes_info;
        important = TRUE;
};
func int dia_angardjg_undeadmagecomes_condition()
{
        if((Npc_GetDistToWP(self,"OW_PATH_3_13") < 500) && Npc_KnowsInfo(other,dia_angardjg_wanttogointhere) && (Npc_KnowsInfo(other,dia_angardjg_undeadmagedead) == FALSE) && (DJG_ANGARGOTAMULETT == FALSE) && Npc_IsDead(skeletonmage_angar))
        {
                return TRUE;
        };
};
func void dia_angardjg_undeadmagecomes_info()
{
        B_AI_Output(self,other,"DIA_AngarDJG_UNDEADMAGECOMES_04_00");     //(������) ���, �����! �� ������� ���?
        AI_StopProcessInfos(self);
        Npc_ExchangeRoutine(self,"GotoStonehendgeEntrance");
};
instance DIA_ANGAR_WASISTLOS(C_INFO)
{
        npc = djg_705_angar;
        nr = 14;
        condition = dia_angar_wasistlos_condition;
        information = dia_angar_wasistlos_info;
        description = "� ��� ����?";
};
func int dia_angar_wasistlos_condition()
{
        if((Npc_GetDistToWP(self,"OW_PATH_3_STONES") < 1000) && (DJG_ANGARGOTAMULETT == FALSE) && Npc_IsDead(skeletonmage_angar))
        {
                return TRUE;
        };
};
func void dia_angar_wasistlos_info()
{
        B_AI_Output(other,self,"DIA_Angar_WASISTLOS_15_00");      //� ��� ����?
        B_AI_Output(self,other,"DIA_Angar_WASISTLOS_04_01");      //� �� ���� ���� ������ � �����.
        B_AI_Output(self,other,"DIA_Angar_WASISTLOS_04_02");      //���-�� ������������ ���, ��� ��� �� ��������� ������ �����.
        B_AI_Output(self,other,"DIA_Angar_WASISTLOS_04_03");      //� �� ���� ��������� ���, ��...
        if(SC_KNOWSMADPSI == TRUE)
        {
                B_AI_Output(self,other,"DIA_Angar_WASISTLOS_04_04");      //� ������ ������� �� ���� ��������� ����� ��� ����� �������, ����� ���� ���� �� �� ������, ��� � ���� �������.
        }
        else
        {
                B_AI_Output(self,other,"DIA_Angar_WASISTLOS_04_05");      //������ ���, ����� � ���� ������ �� ����... ������� ���, � ���� ���������� �������, ��� � �������� ������ �����.
        };
        AI_StopProcessInfos(self);
        b_logentry(TOPIC_DRAGONHUNTER,TOPIC_DRAGONHUNTER_description_129); // "����� ������ ��� ����. ��-�� ���� ���� ������ � ���� ��������� ������� ��� �� ��������� ������ ����� �� �����."
        self.aivar[AIV_PARTYMEMBER] = FALSE;
        Npc_ExchangeRoutine(self,"LeavingOW");
};
instance DIA_ANGAR_WHYAREYOUHERE(C_INFO)
{
        npc = djg_705_angar;
        nr = 15;
        condition = dia_angar_whyareyouhere_condition;
        information = dia_angar_whyareyouhere_info;
        description = "�����? ��� �� ������� �����?";
};
func int dia_angar_whyareyouhere_condition()
{
        if(Npc_GetDistToWP(self,"OW_CAVALORN_01") < 1000)
        {
                return TRUE;
        };
};
func void dia_angar_whyareyouhere_info()
{
        B_AI_Output(other,self,"DIA_Angar_WHYAREYOUHERE_15_00");  //�����? ��� �� ������� �����?
        B_AI_Output(self,other,"DIA_Angar_WHYAREYOUHERE_04_01");  //� ��� � �������, ����� ���������� ��������� �� �����. � �� ���� ���������� �� ���.
        B_AI_Output(self,other,"DIA_Angar_WHYAREYOUHERE_04_02");  //� ������� �������, � ����� ����� ����� ������. �������� �� ������ �������!
        b_logentry(TOPIC_DRAGONHUNTER,TOPIC_DRAGONHUNTER_description_130); // "� �������� ������ ����� �� ������� � ������ ��������."
        b_giveplayerxp(XP_ANGARDJGAGAIN);
        AI_StopProcessInfos(self);
};
instance DIA_ANGAR_PERMKAP4(C_INFO)
{
        npc = djg_705_angar;
        condition = dia_angar_permkap4_condition;
        information = dia_angar_permkap4_info;
        permanent = TRUE;
        description = "�� ������������� ���������� ����?";
};
func int dia_angar_permkap4_condition()
{
        if(Npc_KnowsInfo(other,dia_angar_whyareyouhere))
        {
                return TRUE;
        };
};
func void dia_angar_permkap4_info()
{
        B_AI_Output(other,self,"DIA_Angar_PERMKAP4_15_00");       //�� ������������� ���������� ����?
        B_AI_Output(self,other,"DIA_Angar_PERMKAP4_04_01");       //�������. �� ������ ����. ��� ��������.
        AI_StopProcessInfos(self);
};
instance DIA_ANGAR_PICKPOCKET(C_INFO)
{
        npc = djg_705_angar;
        nr = 900;
        condition = dia_angar_pickpocket_condition;
        information = dia_angar_pickpocket_info;
        permanent = TRUE;
        description = PICKPOCKET_60;
};
func int dia_angar_pickpocket_condition()
{
        return c_beklauen(47,55);
};
func void dia_angar_pickpocket_info()
{
        Info_ClearChoices(dia_angar_pickpocket);
        Info_AddChoice(dia_angar_pickpocket,DIALOG_BACK,dia_angar_pickpocket_back);
        Info_AddChoice(dia_angar_pickpocket,DIALOG_PICKPOCKET,dia_angar_pickpocket_doit);
};
func void dia_angar_pickpocket_doit()
{
        b_beklauen();
        Info_ClearChoices(dia_angar_pickpocket);
};
func void dia_angar_pickpocket_back()
{
        Info_ClearChoices(dia_angar_pickpocket);
};
